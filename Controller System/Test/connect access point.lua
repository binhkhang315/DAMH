wifi.sta.disconnect()

station_cfg = {}
station_cfg.ssid = "TOTOLINK F2"
station_cfg.pwd = "0913442277"
if(wifi.sta.config(station_cfg))
    then print("connect success")
else
    print("connect fail")
end
