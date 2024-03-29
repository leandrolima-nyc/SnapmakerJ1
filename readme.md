# Snapmaker J1 config files for [PrusaSlicer](https://help.prusa3d.com/category/prusaslicer_204)
> ⚠️  You need to have [Prusa Slicer 2.6 alpha 3 or a newer](https://github.com/prusa3d/PrusaSlicer/tags) version installed

This is a remix of [Dylan @macdylan and McGybeer @McGybeer from the community](https://forum.snapmaker.com/t/great-sharing-prusaslicer-profiles-by-dylan-and-mcgybeer/28796).  

Unfortunately, that profile didn't have the capability to detect whether the second extruder was being used or not. This made it difficult to set the appropriate pre-heat settings for nozzle and bed temperature, as well as prime the extruder(s).

However, a new variable called "is_extruder_used" has been introduced in PrusaSlicer 2.6_alpha3, which now enables us to detect whether the second extruder is being used and adjust the settings accordingly.

As a result, I have updated the gcode to consider all possible scenarios for both single and dual extruder use. 

In addition, I have also made some adjustments to the printer settings that will help to enhance the print quality and minimize any potential issues that may arise during the printing process. Overall, these changes will ensure a smoother and more efficient printing experience.

The package also includes Printer Settings and Print profile from Dylan/McGybeer, which can be used for comparison purposes. You are free to remove any components that you do not need. The appropriate profiles are preselected by default and are ready for printing.

> 🪄 As long as your project uses a single extruder, you can select mirror, copy, or backup after loading the gcode on the printer.

> ⛔️  Before you proceed, remove all references to Snapmaker or J1 from the PrintSettings, Filament Setting, and Printer Settings to avoid any remnants from the previous configuration imports.


## [🎁 Coupon Codes](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/readme.md#coupon-and-discount-codes) 🛍️

## Instructions for importing Profile

### Download
[**PrusaSlicer 2.6.0-alpha3 or a newer version**](https://github.com/prusa3d/PrusaSlicer/tags)

[**Prusa Slicer bundled profile.ini**](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/PrusaProfile/SnapmakerJ1-PrusaSlicer_Config_Bundle%28by%20ne0%29.ini)

[**J1 Bed Texture.svg**](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/PrusaProfile/j1-texture.svg) by Googliola <br />
[**J1 Bed Shape.stl**](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/PrusaProfile/druckbett_j1.stl) by Druckbett


### How to Import a Prusaslicer Profile

On Prusaslicer, click File > Import > Import Config, and select the **.ini** file.

<img width="354" alt="import" src="https://user-images.githubusercontent.com/70433062/226761610-97e16bf2-c6ef-444f-88a1-b817042a7893.png">

### Configuration

Click Printer Settings (Expert) > General. 
In the Firmware section, specify the following settings:

<img width="600" alt="Firmware Settings" src="https://user-images.githubusercontent.com/70433062/228440309-9b502ebc-336e-4eb2-a4ef-66149bc066d7.png">

Under Size and Coordinates > Bed Shape > Texture, upload the [**J1 Bed Texture.svg**](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/PrusaProfile/j1-texture.svg) <br />
Under Size and Coordinates > Bed Shape > Model, upload the [**J1 Bed Shape.stl**](https://github.com/leandrolima-nyc/SnapmakerJ1/blob/main/PrusaProfile/druckbett_j1.stl)

<p>
<img width="400" alt="Bed Texture Settings" src="https://user-images.githubusercontent.com/70433062/235709902-00bfd27d-fcec-47f7-979a-00ccdae52acf.png" hspace="20" > <img width="435" alt="Bed Texture" src="https://user-images.githubusercontent.com/70433062/235707900-01e46c4f-e59f-464b-98b5-fa08d3f3842c.png" hspace="10" >
</p>




### 🚀 SAVE PRINTER SETTINGS ‼️
It was brought to my attention that PrusaSlicer might prompt you to save changes to the print profile but doesn't save printer settings. 
To avoid any confusion, it's important to manually save it before you close the application.

<img width="600" alt="Save Profile" src="https://user-images.githubusercontent.com/70433062/229342500-414158e9-4279-4fae-96cc-7ef340e4db86.png">
<img width="500" alt="Save Profile" src="https://user-images.githubusercontent.com/70433062/229342904-a0bce5ec-f117-42d2-9224-5b2055e0aae4.png">

### 📌 Optionals 
There are certain personal preferences that you can disable if you wish. To do so, follow these steps:
```
1.  Click on "Printer Settings (Expert)"
2.  Go to "Custom G-code"
3.  Click on the "Start G-Code Input Box"
4.  Change "{if 1 == 1}" to "{if 1 == 0}"
```
<img width="500" alt="Optional Settings" src="https://user-images.githubusercontent.com/70433062/229344557-d3a90362-1355-4426-9ba7-011db8cb2fad.png">


# Smfix Program by Dylan

This [smfix program](https://github.com/macdylan/Snapmaker2Slic3rPostProcessor) can help quickly **load the printing information** (including the image and parameters) of G-code files generated by Prusaslicer **on the Touchscreen**, effective even for large files.

### Download the corresponding zip file for your OS.

[**smfix-file**](https://github.com/macdylan/Snapmaker2Slic3rPostProcessor/releases)
<br />

### Instructions

Unzip the file into a path that contains no space. For example: <br />
**windows**		$ *D:\smfix\smfix-win64.exe*<br />
**Mac**				$ *~/Applications/PrusaSlicer/smfix-darwin-arm64*

>You may have to change the permission for in terminal with the following command: <br />
chmod 755 *~/Applications/PrusaSlicer/smfix-darwin-arm64*<br /><br />
To ensure that the path is correct, you can use drag and drop into PrusaSlicer post-processing. Similarly, when setting permissions, type “chmod 755” in the terminal and drag the file into the terminal. To verify that the permission is set correctly just type
```ls -l [file]``` and it should show
```-rwxr-xr-x@ [file]```

On Prusaslicer, click **Print Settings (Expert)** > **Output Options**, and enter the path above into the Post-processing scripts input box.

> ‼️ Please keep in mind that each print profile must be updated to include the new path.

<img width="800" alt="Print Settings" src="https://user-images.githubusercontent.com/70433062/226758407-d1010d49-ba40-414b-9730-8d36d182c3d7.png">

Click **Custom G-code**, and make sure you have the following G-code into the **End G-code input** box.

    ;
    ; DON'T REMOVE these lines if you're using the smfix
    ; min_x = [first_layer_print_min_0]
    ; min_y = [first_layer_print_min_1]
    ; max_x = [first_layer_print_max_0]
    ; max_y = [first_layer_print_max_1]
    ; max_z = [max_layer_z]
    ;


> ⚠️ The above G-code is important and necessary for the Copy and Mirror modes.  If missing or not added correctly, there are chances that extruders will hit the bed due to wrong orientation calculations.

<br /> <br />
# J1 auto-upload by [@kanocz](https://github.com/kanocz)

After saving the gcode file to a local folder, it will be automatically uploaded to the J1. You can access it by selecting it from the list of files displayed on the J1's screen. 
> ⚠ Please note that if you are already on the file list display when you export/upload the gcode, you will need to return to the home screen and re-enter the list of files to refresh the list.

### Download the corresponding file for your OS
[**J1 Upload file**](https://github.com/kanocz/j1upload/releases)

### Instructions

Place the file into a path that contains no space. For example: <br />
**windows**		$ *D:\smfix\j1upload-win64.exe*<br />
**Mac**			$ *~/Applications/PrusaSlicer/j1upload-darwin-arm64*

>You may have to change the permission for in terminal with the following command: <br />
chmod 755 *~/Applications/PrusaSlicer/j1upload-darwin-arm64*<br /><br />
To ensure that the path is correct, you can use drag and drop into PrusaSlicer post-processing. Similarly, when setting permissions, type “chmod 755” in the terminal and drag the file into the terminal. To verify that the permission is set correctly just type
```ls -l [file]``` and it should show
```-rwxr-xr-x@ [file]```

On Prusaslicer, click **Print Settings (Expert)** > **Output Options**, and enter the path above into the Post-processing scripts input box.

> ‼️ Please keep in mind that each print profile must be updated to include the new path.

<img width="800" alt="Print Settings - Post-Processing Scripts" src="https://user-images.githubusercontent.com/70433062/227600453-fc0d071a-64e8-4ff9-ad9e-e7c2ea06d089.png">


# Multiple extruder

PrusaSlicer does not store the purging setting on the bundle profile. Therefore, you'll need to make the adjustment manually to ensure it is set correctly.
> ⚠️ Make sure to enable the wipe tower in Print Settings > Multiple Extruder. <br />
<img width="500" alt="Print Settings / Multiple Extruder / Wipe Tower" src="https://user-images.githubusercontent.com/70433062/228439301-8e2780f2-d863-414f-9d56-07c60ce89689.png">

Although there is no scientific explanation behind it, the community recommends 5 ㎣ as a best practice for dual color printing.

> 💡 Keep in mind that you have the freedom to drag and position the tower wherever you prefer on the print bed. <br />
<img width="500" alt="Purge Settings" src="https://user-images.githubusercontent.com/70433062/228437183-76af166a-0a64-49bb-b9b5-6b5324239f30.png">

# Coupon and discount codes
I've received some requests for Snapmaker discounts, and I'd be glad to share them with you. Just wanted to let you know that unfortunately the coupons cannot be combined. However, you can still make multiple purchases to take advantage of the different discounts available. And if you run into any issues with the codes, don't hesitate to contact. I hope this helps you save some money on your purchase!

**Printer $100 off**<br />
🇪🇺 [EU 10% OFF](https://bit.ly/snapEU10OFF)<br />
🇺🇸 [US 10% OFF](https://bit.ly/snapUS10OFF)<br />
🌎 [Global 10% OFF](https://bit.ly/snap10OFF)<br />

**Filament 15%**<br />
```3DFILAMENTS15```<br />

**Accessories 20%**<br />
```J1SAVE20```<br />

**Sitewide 25USD**<br />
```DMSAVE25```<br />





