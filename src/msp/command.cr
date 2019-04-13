module MSP
  abstract struct Command
    macro inherited
      class_getter direction : Char
      macro inherited
        include JSON::Serializable
        @@direction = {{@type}}.direction
        class_getter code : MSP::Code

        def to_slice
          code_u8 = @@code.value.to_u8

          io = IO::Memory.new
          io.write (MSP::PREAMBLE + @@direction + '\u{0}').to_slice # '\u{0}' for Data Size
          io.write_byte code_u8 # MSP Code
          data.each { |dt| io.write_bytes(dt, MSP::ByteFormat) }
          io.write_byte 0_u8 # Checksum
          
          slice = io.to_slice
          data_size = (slice.size - MSP::SIZE_WITHOUT_DATA).to_u8
          checksum = data_size ^ code_u8
          slice.each(start: MSP::DATA_BEGIN_INDEX, count: data_size) { |dt| checksum ^= dt }
          slice[MSP::SIZE_BYTE_INDEX] = data_size.to_u8 # Set Data Size
          slice[slice.size-1] = checksum # Set Checksum
          slice
        end

        def self.from_slice(data : Bytes)
          raise "'from_slice' method not implemented for this MSP command."
        end
      end
    end

    def data
      {{ @type.instance_vars }}.compact
    end

    def self.from_slice(slice : Bytes)
      raise "Invalid MSP Command: Command not start with MSP preamble!" if (slice[0] != MSP::PREAMBLE[0].ord || slice[1] != MSP::PREAMBLE[1].ord)
      direction = self.subclasses.find { |subclass| subclass.direction === slice[MSP::SIZE_BYTE_INDEX - 1] }
      raise "Invalid MSP Command: Invalid MSP direction!" if direction.nil?
      command = direction.subclasses.find { |subclass| subclass.code.value == slice[MSP::CODE_BYTE_INDEX] }
      raise "Invalid MSP Command: Incalid Command Code!" if command.nil?
      command.from_slice slice[MSP::DATA_BEGIN_INDEX, slice.size - MSP::DATA_BEGIN_INDEX - 1]
    end

    def self.subclasses
      {{ @type.subclasses }}
    end
  end
end
