local mpu6050 = {};

dev_addr = 0x68 --104
bus = 0

function mpu6050.init_I2C(sda, scl)
     c = i2c.setup(bus, sda, scl, i2c.SLOW)
     print(c)
end

function mpu6050.init_MPU(reg,val)  --(107) 0x6B / 0
     mpu6050.write_reg_MPU(reg,val)
end

function mpu6050.write_reg_MPU(reg,val)
     i2c.start(bus)
     i2c.address(bus, dev_addr, i2c.TRANSMITTER)
     i2c.write(bus, reg)
     i2c.write(bus, val)
     i2c.stop(bus)
end

function mpu6050.read_reg_MPU(reg)
     i2c.start(bus)
     i2c.address(bus, dev_addr, i2c.TRANSMITTER)
     i2c.write(bus, reg)
     i2c.stop(bus)
     i2c.start(bus)
     i2c.address(bus, dev_addr, i2c.RECEIVER)
     c=i2c.read(bus, 1)
     i2c.stop(bus)
     --print(string.byte(c, 1))
     return c
end

function mpu6050.read_MPU_raw()
     i2c.start(bus)
     i2c.address(bus, dev_addr, i2c.TRANSMITTER)
     i2c.write(bus, 59)
     i2c.stop(bus)
     i2c.start(bus)
     i2c.address(bus, dev_addr, i2c.RECEIVER)
     c=i2c.read(bus, 14)
     i2c.stop(bus)

     Ax=bit.lshift(string.byte(c, 1), 8) + string.byte(c, 2)
     Ay=bit.lshift(string.byte(c, 3), 8) + string.byte(c, 4)
     Az=bit.lshift(string.byte(c, 5), 8) + string.byte(c, 6)
     Gx=bit.lshift(string.byte(c, 9), 8) + string.byte(c, 10)
     Gy=bit.lshift(string.byte(c, 11), 8) + string.byte(c, 12)
     Gz=bit.lshift(string.byte(c, 13), 8) + string.byte(c, 14)

     print("Ax:"..Ax.."     Ay:"..Ay.."      Az:"..Az)
     print("Gx:"..Gx.."   Gy:"..Gy.."   Gz:"..Gz)
     --  print("\nTempH: "..string.byte(c, 7).." TempL: "..string.byte(c, 8).."\n")

     return c, Ax, Ay, Az, Gx, Gy, Gz
end

function mpu6050.status_MPU(dev_addr)
     i2c.start(bus)
     c=i2c.address(bus, dev_addr ,i2c.TRANSMITTER)
     i2c.stop(bus)
     if c==true then
          print(" Device found at address : "..string.format("0x%X",dev_addr))
     else print("Device not found !!")
     end
end

function mpu6050.check_MPU(dev_addr)
     print("")
     mpu6050.status_MPU(0x68)
     mpu6050.read_reg_MPU(117) --Register 117 – Who Am I - 0x75
     if string.byte(c, 1)==104 then print(" MPU6050 Device answered OK!")
     else print("  Check Device - MPU6050 NOT available!")
          return
     end
     mpu6050.read_reg_MPU(107) --Register 107 – Power Management 1-0x6b
     if string.byte(c, 1)==64 then print(" MPU6050 in SLEEP Mode !")
     else print(" MPU6050 in ACTIVE Mode !")
     end
end

return mpu6050
