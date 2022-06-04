# gallery_maker
This simple script generates a gallery of 100 Images (10 by 10 Images) from a NFT Collection with 10,000 Images. It automatically converts, adds Labels and creates a montage.

Prerequirements:

sudo apt install imagemagick parallel -y

You also need the font if you decide to use the same font. Otherwise you have to comment the font option out or select a different font.

https://fonts.google.com/specimen/Philosopher

How to use:

Create a folder with your 10k NFTs in it.

Place gallery.sh and sold.txt in the same folder.

Files have to be named 1.png 2.png 3.png and so on. (This will add the Labels #1 #2 #3 and so on on each Image)
Hint: You can change format in the script if needed

sold.txt should contain the names of the NFTs you already sold. The files should be listed as labeled1.png labeled2.png labeled3.png and so on. This will add the Label "SOLD" in red. This is OPTIONAL.

Run "bash gallery.sh" and wait grab a coffee. This could take some time.

Final Result should be a gallery folder with 100 images in jpg format ready to be uploaded on a website.






If this tool was helpful, consider bying me a beer. Or a beer factory, I am not your supervisor!

XCH: xch1ac74hll6w0ldmrpx3eldhxdck6e4hfyhdw5z8dt8seanfldyj0sqfna064


You can also send XCH to my projects charity wallet:

XCH: xch18s8gy8du50dt2sdv23fn8yl9jrdqehx79gkqpadaauhq3aj23meqlj07tk

10% of every Income generated goes to St. Anna Childrens Cancer Research.
