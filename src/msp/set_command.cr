module MSP::Set
  abstract struct Command < MSP::Command
    @@direction = MSP::TO_MWC
  end
end
