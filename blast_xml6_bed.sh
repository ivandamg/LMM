
#!/bin/bash





# Script for transforming xml 6 blast format into .bed.
# Use: To load in IGV or R.


# V1. working specifing the name of file, but can make it automatically by calling the script with argument NAMEfile


#bed format: Name of chromosome	start end	name of sequence	length		orientation

# extract location
Z=$(cat blast_ComM_in_AYE.xml | cut -f2,9,10 )



# calculate length and orientation

A="$(cat blast_ComM_in_AYE.xml | cut -f9)"
B="$(cat blast_ComM_in_AYE.xml | cut -f10)"


if ( (($A-$B)) < 0); then C=$(echo $(($B -$A)) | sed 's/-//') ; else C=$(echo $(($A- $B)) | sed 's/-//') ; fi
# add to loop to take signs. if > 0 + 

if ( (($A-$B)) < 0); then D=$(echo "+"); else D=$(echo "-") ; fi


# add name of origin seq.

E=$(echo "blast_ComM_in_AYE.xml")

# add everything together. 


echo $Z $E $C $D > blast_ComM_in_AYE.bed
