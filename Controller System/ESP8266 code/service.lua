local service = {}
--Function: conver n-bit 2’s complement value
--Input: number: number to convert, bitLength: n-bit 2's complement value
--Output: number after convert
function service.convert_2_complement(number, bitLength)
    if bit.isset(number,bitLength-1) then --check 4th bit of binary
        return bit.bor(bit.lshift(-1,bitLength),number)
    else
        return number
    end
end

function service.httpPost(url,data)
    url = "http://"..url
    ok, dataEncoded = pcall(cjson.encode, data)
    http.post(url,
    'Content-Type: application/json\r\n',
    dataEncoded,
    function(code, dataResponse)
        if (code<0) then
            return false
        else
            print(dataResponse)
            return true
        end
    end)
end

return service
