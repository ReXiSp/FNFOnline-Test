import math
import sys
import os
import glob
import xml.etree.ElementTree as ET

# def resize(xml_list, xml_var, factor):
    # if xml_list.get(xml_var) is not None:
        # xml_list.set(xml_var, str(math.floor(int(xml_list.get(xml_var)) * factor)))

# def setsize(xml_list, xml_var, size):
    # if xml_list.get(xml_var) is not None:
        # xml_list.set(xml_var, str(size))

def formatname(s):

    str = s
    # str.replace("arrowLEFT", "A")
    # str.replace("arrowDOWN", "B")
    # str.replace("arrowUP", "C")
    # str.replace("arrowRIGHT", "D")
    # print(str)
    str = str.replace("down confirm", "B confirm")
    str = str.replace("down press", "B press")
    str = str.replace("blue hold piece", "B hold")
    str = str.replace("blue hold end", "B tail")
    str = str.replace("blue", "B")
    str = str.replace("up confirm", "C confirm")
    str = str.replace("up press", "C press")
    str = str.replace("green hold piece", "C hold")
    str = str.replace("green hold end", "C tail")
    str = str.replace("green", "C")
    str = str.replace("left confirm", "A confirm")
    str = str.replace("left press", "A press")
    str = str.replace("purple hold piece", "A hold")
    str = str.replace("pruple end hold", "A tail")
    str = str.replace("purple", "A")
    str = str.replace("right confirm", "D confirm")
    str = str.replace("right press", "D press")
    str = str.replace("red hold piece", "D hold")
    str = str.replace("red hold end", "D tail")
    str = str.replace("red", "D")
    # print(str)

    return str

for file in glob.glob("*"):
    # print(file)
    if file.endswith(".xml"):
        xml_tree = ET.parse(file)
        xml_root = xml_tree.getroot()

        xml_vars = [
            'x', 'y', 'width', 'height',
            'frameX', 'frameY', 'frameWidth', 'frameHeight'
        ]

        # realfactor = input("please write factor for width: ")
        # factor = float(realfactor) # Change this to desired resize factor

        # realfactor2 = input("please write factor for height: ")
        # factor2 = float(realfactor2) # Change this to desired resize factor

        for SubTexture in xml_root.findall('SubTexture'):
            # for xml_var in xml_vars:
                # resize(SubTexture, xml_var, factor)
            # setsize(SubTexture, "frameWidth", factor)
            # setsize(SubTexture, "frameHeight", factor2)
            if SubTexture.get("name") is not None:
                name = SubTexture.get("name")
                name = formatname(name)
                SubTexture.set("name", name)

        # print(sys.argv[1] + " file resized to " + realfactor)
        xml_tree.write(file)