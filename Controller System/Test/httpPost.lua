data = {Name = "Khang", MSSV = "41201577"}

ok, dataEncoded = pcall(cjson.encode,data)
if ok then
  print(dataEncoded)
else
  print("failed to encode!")
end

http.post('http://192.168.100.6',
  'Content-Type: application/json\r\n',
  dataEncoded,
  function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
end)
