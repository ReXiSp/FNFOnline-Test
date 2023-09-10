import os
import time

outputLua = "    -- fnf online icons fuck"

for f in os.listdir("./images/icons"):
    outputLua += '\n    -- makeLuaSprite("icon", "icons/' + os.path.splitext(os.path.basename(f))[0] + '")'

with open("./scripts/icondl.lua", "w+") as f:
    f.write(outputLua)
    f.close()

print(outputLua)

time.sleep(3)