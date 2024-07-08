# ImageJ-Scripts

CaMPARI-analysis-Tool (08/07/2024):
This ImageJ-script measures the ratio of the red fluorescent signal to green fluorescent signal in a CaMPARI-image. Analyzed images consist of three channels: 1) green fluorescence channel, 2) transmitted light channel and 3) red fluorescence channel. Before using the script, select “point tool” and activate “add to ROI Manager”. Starting the script, generates a composite image showing only the green and red fluorescence channel. Mark the ROI’s you want to analyze. After confirming this step, the script calculates the “red fluorescent signal to green fluorescent signal” ratio and creates the JPEG-file with the ROI’s in a specific folder. Finally, all specified ROIs are removed from the “ROI Manager”.
