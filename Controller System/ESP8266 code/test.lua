mpu6050 = dofile("MPU6050 interface.lua")
reg = dofile("MPU6050 register.lua")
sda, scl = 3, 4

mpu6050.init_I2C(sda, scl)
mpu6050.init_MPU(reg.PWR_MGMT_1,0)

mpu6050.check_MPU(0x68)

mpu6050.write_reg_MPU(28,0)
mpu6050.write_reg_MPU(27,0)
c = mpu6050.read_reg_MPU(28)
print(string.byte(c,1))
c = mpu6050.read_reg_MPU(27)
print(string.byte(c,1))

--convert 4 bit
function convert_2_complement(number, bitLength)
    if bit.isset(number,bitLength-1) then --check 4th bit of binary
        return bit.bor(bit.lshift(-1,bitLength),number)
    else
        return number
    end
end

count = 0
t = tmr.now()
data = mpu6050.read_MPU_raw()
    http.post("http://192.168.100.3:3210/sensor/test",
    'Content-Type: application/json\r\n',
    data, function() end)

print(tmr.now()-t)

