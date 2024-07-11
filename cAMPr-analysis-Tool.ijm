run("Channels Tool...");
Stack.setDisplayMode("composite");
Stack.setActiveChannels("10");

waitForUser("Mark cells! ");

C = getImageID();
D = getTitle();
path = getInfo("image.directory") + "\\Processed";
run("RGB Color");
A = getTitle();
roiManager("Show None");
roiManager("Show All");
run("Flatten");

savetitel = "\\" + substring(D, 0, lengthOf(D)-4) + " - processed";
File.makeDirectory(path);
saveAs("Jpeg", path + savetitel);

B = getTitle();

selectWindow(A);
close(A);
selectWindow(B);
close(B);

selectImage(C);
roiManager("Show None");
roiManager("Show All");

Stack.getDimensions(width, height, channels, slices, frames)

run("Set Measurements...", "  mean redirect=None decimal=4");


for (i=0; i<roiManager("count");i++){
	run("Clear Results");
	roiManager("Select", i);

	Roi.getCoordinates(xpoints, ypoints);
	makeOval(xpoints[0]-2.5, ypoints[0]-2.5, 5, 5);
	
	Stack.setChannel(1);
	run("Measure");	
	
	if (channels==2){
		Stack.setChannel(2);
		run("Measure");
		}
	
	green = getResult("Mean", 0);
		
	name = "[Final Results]";
	name2 ="Final Results";
	f = name;
	if (isOpen(name2)){
	     //print(f, "\\Clear");
	    }
	else {
	    run("New... ", "name="+name+" type=Table");
	    print(f, "\\Clear");
	    print(f, "\\Headings: green");
	   }

		green = toString(green);
		green = replace(green, "\\.","\\,");

	print(f, green + "	");
	}

Stack.setChannel(1);



waitForUser("Delete content ROI-manager? ");

roiManager("Reset"); 
