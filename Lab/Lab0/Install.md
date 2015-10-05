#### How to obtain a linux license for Vivado
_Assumes pre-existing installation of Vivado_

1. (_Unsure if necessary_) Download the patch for V2015.2.1 
  * Download, unzip, cd to directory
  * Run ```./xsetup```
  * Follow instructions to install patch (should be straightforward)
  
2. Install and initialize computer's trusted-storage area (where activation authorizations are stored)
  * cd to Vivado install directory
  * Run command as sudo ```sudo ./bin/unwrapped/lnx64.o/install_fnp.sh```

3. Regenerate your request for a licence
  * From same Vivado install directory, run ```./bin/xlicsrvrmgr -cr request.xml reference="Some_unique_string"```
  * This will generate new .html and .xml files that you will use to get your license 
  
4. Use the request for your license
  * In the same directory where you generated your request.html and request.xml, run ```_yourfavbrowser_ request.html```
  * If that still didn't work, try generating a license through the Vivado GUI 
  * If everything worked , you can now follow the original instructions to complete the process. 
