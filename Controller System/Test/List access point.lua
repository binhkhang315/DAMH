--print access point list
function listAccessPoint(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end
wifi.sta.getap(listAccessPoint)