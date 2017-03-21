pin = 3
while 1 do
    gpio.write(pin, gpio.HIGH)
    tmr.delay(1000000) --wait 1s
    gpio.write(pin, gpio.LOW)
    tmr.delay(1000000) --wait 1s
end
