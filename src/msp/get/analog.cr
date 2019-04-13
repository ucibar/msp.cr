module MSP::Get
  @[JSON::Serializable::Options(emit_nulls: true)]
  struct Analog < MSP::Get::Command
    @@code = MSP::Code::ANALOG

    getter vbat : UInt8?,
    intPowerMeterSum : UInt16?,
    rssi : UInt16?

    getter amperage : UInt16?

    def initialize(@vbat = nil, @intPowerMeterSum = nil, @rssi = nil, @amperage = nil)
    end

    def self.from_slice(data : Bytes)
      self.new(
        MSP::ByteFormat.decode(UInt8, data[0, 1]),
        MSP::ByteFormat.decode(UInt16, data[1, 2]),
        MSP::ByteFormat.decode(UInt16, data[3, 2]),
        MSP::ByteFormat.decode(UInt16, data[5, 2])
      )
    end
  end
end
