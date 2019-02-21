module MSP::Set
  @[JSON::Serializable::Options(emit_nulls: true)]
  struct RawRC < MSP::Set::Command
    @@code = MSP::Code::SET_RAW_RC

    getter roll : UInt16?,
      pitch : UInt16?,
      throttle : UInt16?,
      yaw : UInt16?,
      aux1 : UInt16?,
      aux2 : UInt16?,
      aux3 : UInt16?,
      aux4 : UInt16?

    def initialize(@roll = nil,
                   @pitch = nil,
                   @yaw = nil,
                   @throttle = nil,
                   @aux1 = nil,
                   @aux2 = nil,
                   @aux3 = nil,
                   @aux4 = nil)
    end
  end
end
