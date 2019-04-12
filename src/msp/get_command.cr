module MSP::Get
  abstract struct Command < MSP::Command
    @@direction = MSP::FROM_MWC
  end
end
