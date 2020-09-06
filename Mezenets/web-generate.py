import fontforge

##
## THIS FILE IS A FONTFORGE SCRIPT THAT GENERATES WEB FONTS FAMILY
##
##

base_name = "MezenetsUnicode"
full_name  = "Mezenets Unicode"


fontforge.setPrefs ("AutoHint", False)
fontforge.setPrefs ("ClearInstrsBigChanges",False )
fontforge.setPrefs ( "CopyTTFInstrs",True )

## open up the font
font = fontforge.open(base_name + ".sfd")
font.head_optimized_for_cleartype = True

font.generate( base_name + ".otf", flags=( "opentype", "PfEd-colors", "PfEd-lookups", "dummy-dsig"), layer="Fore" )

font.em = 1024
font.generate( base_name + ".ttf", flags=( "opentype", "PfEd-colors", "PfEd-lookups", "dummy-dsig" ), layer="Fore" )
font.close()
