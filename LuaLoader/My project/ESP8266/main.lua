mpu6050 = dofile("MPU6050 interface.lua");
reg = dofile("MPU6050 register.lua");
service = dofile("service.lua");

sda, scl = 3, 4

print(reg.PWR_MGMT_1)
mpu6050.init_I2C(sda, scl)
mpu6050.init_MPU(reg.PWR_MGMT_1,0)
mpu6050.init_MPU(reg.GYRO_CONFIG,0x18)
mpu6050.init_MPU(reg.ACCEL_CONFIG,0x18)

mpu6050.check_MPU(0x68)

c, Ax, Ay, Az, Gx, Gy, Gz = mpu6050.read_MPU_raw()  -- one shot
-- read data from MPU6050 every 1s
--tmr.alarm(0, 100, 1, function() mpu6050.read_MPU_raw() end)

--Ax,Ay,Az,Gx,Gy,Gz = service.convert(Ax,Ay,Az,Gx,Gy,Gz)

ok, json = pcall(cjson.encode, {Ax=Ax, Ay=Ay, Az=Az, Gx=Gx, Gy=Gy, Gz=Gz})
if ok then
  print(json)
else
  print("failed to encode!")
end

http.post('http://192.168.43.185',
  'Content-Type: application/json\r\n',
  json,
  function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
end)

--stop tmr when done
--tmr.stop(0)
