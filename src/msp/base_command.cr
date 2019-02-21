module MSP
  abstract struct BaseCommand
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

      end
    end

    def data
      {{ @type.instance_vars }}.compact
    end

    def self.subclasses
      {{ @type.subclasses }}
    end
  end
end
