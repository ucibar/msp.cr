module MSP
  enum Code
    IDENT = 100
    STATUS
    RAW_IMU
    SERVO
    MOTOR
    RC
    RAW_GPS
    COMP_GPS
    ATTITUDE
    ALTITUDE
    ANALOG
    RC_TUNING
    PID
    BOX
    MISC
    MOTOR_PINS
    BOXNAMES
    PIDNAMES
    WP
    BOXIDS
    SERVO_CONF
    SET_RAW_RC = 200
    SET_RAW_GPS
    SET_PID
    SET_BOX
    SET_RC_TUNING
    ACC_CALIBRATION
    MAG_CALIBRATION
    SET_MISC
    RESET_CONF
    SET_WP
    SELECT_SETTING
    SET_HEAD
    SET_SERVO_CONF
    SET_MOTOR = 214
    BIND = 240
    EEPROM_WRITE = 250
  end
end