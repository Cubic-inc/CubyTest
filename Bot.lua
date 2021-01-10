coroutine.wrap(function()
    
print("STARTING...")

local Start = require("StartUp")()

local Client = _G.Client
local Format = _G.Format

--Client:waitFor("ready")


Client:on("allReady", function()


    local Modules = {

        Moderation = {
            Main = require("./Modules/Moderation.lua"),
            Commands = {
                require("./Commands/Moderation.lua")
            }
        },

        OwnerHandler = {
            Main = require("./Modules/Owner.lua"),
            Commands = {
                require("./Commands/Owner.lua")
            }
        },

        Commands = {
            Main = require("./Modules/Commands.lua"),
            Commands = {
                require("./Commands/Commands.lua")
            }
        },

        Logger = {
            Main = require("./Modules/Logger.lua"),
            Commands = {
                
            }
        },

        BumpBonker = {
            Main = require("./Modules/BumpBonker.lua"),
            Commands = {
                
            }
        },

        Leveling = {
            Main = require("./Modules/Leveling.lua"),
            Commands = {
                
            }
        },

        Website = {
            Main = require("./Modules/Website.lua"),
            Commands = {
                
            }
        }

    }

    print()

    for i, v in pairs(Modules) do
        print(Format("Trying to start Module: '%s'", tostring(i)))
        v.Main()
        print(Format("Started Main: '%s' Function: '%s'", tostring(i), tostring(v.Main)))

        print("Checking command modules...")

        for b, n in pairs(v.Commands) do
            print("Starting: " .. b)
            n()
            print("Done")
        end

        print(Format("Started Module: '%s'", tostring(i)))
        print()

    end



end)

end)()