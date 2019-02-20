module MSP::Set
  abstract struct Command < MSP::BaseCommand
    @@direction = MSP::TO_MWC
  end
end
