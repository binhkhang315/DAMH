print("Check connection...\n")

function checkWifiStatus()
     status = wifi.sta.status()
     if (status==0) then
          print("STA_IDLE\n")
     elseif (status==1) then
          print("STA_CONNECTING\n")
     elseif (status==2) then
          print("STA_WRONGPWD\n")
     elseif (status==3) then
          print("STA_APNOTFOUND\n")
     elseif (status==4) then
          print("STA_FAIL\n")
     else
          print("STA_GOTIP")
     end
     return status
end

status = checkWifiStatus();

if (status~=5) then
     station_cfg={}
     station_cfg.ssid="Rovina coofee"
     station_cfg.pwd="23456789"
     station_cfg.save=true
     print("Connecting to access point"..station_cfg.ssid)
     if (wifi.sta.config(station_cfg)) then
          print("Connect success")
     else
          print("Check SSID and PASSWORD")
     end
     checkWifiStatus()
end
