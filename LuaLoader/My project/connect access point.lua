wifi.sta.disconnect()

station_cfg = {}
station_cfg.ssid = "HTC Khang"
station_cfg.pwd = "123456789"
if(wifi.sta.config(station_cfg))
    then print("connect success")
else
    print("connect fail")
end
