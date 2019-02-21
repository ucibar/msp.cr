module MSP::Get
  @[JSON::Serializable::Options(emit_nulls: true)]
  struct Attitude
    @@code = MSP::Code::ATTITUDE

    getter angx : Int16?,
      angy : Int16?,
      heading : Int16?

    def initialize(@angx = nil, @angy = nil, @heading = nil)
    end

    def self.from_slice(data : Bytes)
      self.new(
        MSP::ByteFormat.decode(Int16, data[0, 2]),
        MSP::ByteFormat.decode(Int16, data[2, 2]),
        MSP::ByteFormat.decode(Int16, data[4, 2])
      )
    end
  end
end
