### Documentation
The documentation can be found in the docs.zip folder (https://github.com/IamCyBo/Graphical_Programming_CurveDriving/blob/RELEASE/docs.zip). In the subfolder videos you can watch a demonstration-video for every systemtest and some special events.
In the images folder you can find every image that is used in the docu.pdf. In the tables folder you can find our enfilled three-point-estimate excel-sheat also as pdf.
The display.ipynb file is a jupyter notebook in which the logged data from the track can be plotted via matplotlib.
### The Project
The whole project with every experiment is located in https://github.com/IamCyBo/Graphical_Programming_CurveDriving/blob/D9-merge/Projekt_KampTriebelZiller.zip
### The Experiments
The configured experiments should be in the .zip file mentioned in the project paragraph. If the experiment files cannot be imported with the Project.zip, they are provided again separately in an extra file (https://github.com/IamCyBo/Graphical_Programming_CurveDriving/blob/RELEASE/experiments.zip)
### Logger-setup
Before the Logger is used, it's important that the folder exists where the logger should create the file in. Or else the Experiment environment crashes.
### Multiple Control.bd files
We provide two control files (Control.bd; ControlAccel.bd), one that implements all mandatory requirements and one that also implements the lateral acceleration velocity control. We also provide two corresponding Apps that can be executed so that the user can decide whether to use the lateral acceleration function or not. We decided to do this because the documentation is far better readable when having both implementations since a lot was changed in the control file during implementation of the lateral acceleration velocity control.
### What needs to be imported
To get the project working you need to import Commons, EUnitSupport and SystemLib
