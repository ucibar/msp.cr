module MSP::Get
  abstract struct Command < MSP::BaseCommand
    @@direction = MSP::FROM_MWC
  end
end
