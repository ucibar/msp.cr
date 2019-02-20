module MSP::Set
  struct RawRC < MSP::Set::Command
    @@code = MSP::Code::SET_RAW_RC
    
    getter roll : UInt16,
    pitch : UInt16,
    yaw : UInt16,
    throttle : UInt16,
    aux1 : UInt16,
    aux2 : UInt16,
    aux3 : UInt16,
    aux4 : UInt16
    
    def initialize(@roll = 0_u16,
      @pitch = 0_u16,
      @yaw = 0_u16,
      @throttle = 0_u16,
      @aux1 = 0_u16,
      @aux2 = 0_u16,
      @aux3 = 0_u16,
      @aux4 = 0_u16)
    end
  end
end