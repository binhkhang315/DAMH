local publicClass = {}

function publicClass.printString(string)
     print(string)
end

function publicClass.a()
     x = 2
     y = 3
     return x,y
end

return publicClass
