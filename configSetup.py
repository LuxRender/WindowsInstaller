#! This script updates the Injnos setup script to change the architecture and support for
#! OpenCl. It is meant to be used as part of the automatic build system to build all the
#! different variants of LuxRender that are supported:
#!   - 64-bit with OpenCL
#!   - 64-bit without OpenCL
#!   - 32-bit with OpenCL
#!   - 32-bit without OpenCL
#! Usage example:
#!   python configSetup.py --platform x64 --ocl luxSetup.iss
#!
import re, argparse

argParser = argparse.ArgumentParser()
argParser.add_argument("infile", help="The name of the Inno Setup file to update")
argParser.add_argument("--platform", 
                       help="The CPU platform to use. Either x64 or x86")
argParser.add_argument("--ocl", action="store_true", default=False,
                       help="If specified, OpenCL support is added. If omitted, or entered as --no-ocl, OpenCL support is disabled.")
args = argParser.parse_args()

isOK = True
oclArch = "NoOpenCL"

if args.ocl:
	oclArch = "OpenCL"

#! Open the script file and read the content
try:
  setupScript = open(args.infile,"r")
  source = setupScript.read()
  setupScript.close()

except:
  print("Error: could not read file %s" % args.infile)
  isOK = False

if isOK:
  print("Configuring the Setup script for platform %s - %s" % (args.platform,oclArch))
  platRE = re.compile(r"^\s*#define\s+MyAppArch\s+.+$", re.MULTILINE)
  oclRE = re.compile(r"^\s*#define\s+MyAppCLArch\s+.+$", re.MULTILINE)

  newPlat = "#define MyAppArch \"%s\"\n" % args.platform
  newOCL = "#define MyAppCLArch \"%s\"" % oclArch
  newScript = platRE.sub(newPlat, source)
  newScript = oclRE.sub(newOCL, newScript)

  #! Save the script file with the change
  try:
    setupScript = open(args.infile,"w")
    setupScript.write(newScript)
    setupScript.close()
  except:
    print("Error: could not write the script file %s" % args.infile)

