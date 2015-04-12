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

#! Open the header file and read the content
try:
  setupScript = open(args.infile,"r")
  source = setupScript.read()
  setupScript.close()

except:
  print("Error: could not read file %s" % args.infile)
  isOK = False

if isOK:
  platRE = re.compile(r"^\s*#define\s+MyAppArch\s+.+$", re.MULTILINE)
  oclRE = re.compile(r"^\s*#define\s+MyAppCLArch\s+.+$", re.MULTILINE)

  newPlat = "#define MyAppArch \"%s\"\n" % args.platform
  newOCL = "#define MyAppCLArch \"%s\"" % oclArch
  newScript = platRE.sub(newPlat, source)
  newScript = oclRE.sub(newOCL, newScript)

  #! Save the header file with the change
  try:
    setupScript = open(args.infile,"w")
    setupScript.write(newScript)
    setupScript.close()
  except:
    print("Error: could not write the header file %s" % args.infile)

