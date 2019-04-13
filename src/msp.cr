require "json"
require "./msp/*"
require "./msp/get/*"
require "./msp/set/*"

module MSP
  VERSION = "0.1.0"
  # The general format of an MSP message is:
  # <preamble>,<direction>,<data-size>,<msp-code>,<data>,<checksum>
  PREAMBLE          = "$M"                 # MSP Message Preamble
  TO_MWC            = '<'                  # MSP Message To Multiwii Controller
  FROM_MWC          = '>'                  # MSP Message From Multiwii Controller
  SIZE_BYTE_INDEX   = 3                    # Byte Index Of 'data-size' Byte
  CODE_BYTE_INDEX   = 4                    # Byte Index of 'msp-code' Byte
  DATA_BEGIN_INDEX  = 5                    # Byte Index Of 'data' Begin
  SIZE_WITHOUT_DATA = DATA_BEGIN_INDEX + 1 # MSP Message Byte Size Without Data Bytes, '+ 1' Is Checksum Byte

  alias ByteFormat = IO::ByteFormat::LittleEndian
end
