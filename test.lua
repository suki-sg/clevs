
--Module Test

local module = {}

function module:Text()
    print("Text")
end

function Text:Say(Texto)
    print(Texto)
end


function module:Trap()
    prin("TRAP?")
end

function Trap:Place()
    print("PLACED TRAP")
end

function Trap:Sheriff()
    print("SHERIFF HAS BEEN TRAPPED")
end

return module
