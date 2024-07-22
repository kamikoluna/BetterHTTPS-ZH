local module = {}

local PrivateNodes = {
    APIs = "zhpackage://"
}

--[[
    module:GetImage("https://docs.cu.bzh/reference/http")
  ]]
function module:GetImage(p)
    if type(p) ~= "string" then
        return error("The Https link should have Comma! (" .. "https://..." .. ")")
    end
    local const_result = nil
    HTTP:Get(url, function(res)
        if res.StatusCode ~= 200 then
            print("Image Cant Get Cause : Error " .. res.StatusCode)
            return
        end
        const_result = res.Body
    end)
    return const_result
end

--[[
    module:GetJSON("https://docs.cu.bzh/reference/http")
  ]]
function module:GetJSON(p)
    if type(p) ~= "string" then
        return error("The Https link should have Comma! (" .. "https://..." .. ")")
    end
    local const_result = nil
    HTTP:Get(url, function(res)
        if res.StatusCode ~= 200 then
          print("String Cant Get Cause : Error " .. res.StatusCode)
          return
        end
        -- body is [{"id": 289733, "name": "Mike", "age": 15}]
        const_result = JSON:Decode(res.Body)
    end)
    return const_result
end
-- NOT DONE YET DO NOT USE!
--[[
function module:GetAudio(p)
    if type(p) ~= "string" then
        return error("The Https link should have Comma! (" .. "https://..." .. ")")
    end
    if string.find(p, PrivateNodes.APIs) then
        return print("this result not done yet")
    end 


end]]
return module