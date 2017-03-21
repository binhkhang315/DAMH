local service = {}

function service.convert(Ax,Ay,Ax,Gz,Gy,Gz)
    Ax = service.convertAccel(Ax)
    Ay = service.convertAccel(Ay)
    Az = service.convertAccel(Az)

    Gx = service.convertGyro(Gx)
    Gy = service.convertGyro(Gy)
    Gz = service.convertGyro(Gz)

    return Ax,Ay,Ax,Gx,Gy,Gz
end

function service.convertAccel(rawValue)
    return rawValue*16/65536 - 16
end

function service.convertGyro(rawValue)
    return rawValue*2000/65536 - 2000
end

return service