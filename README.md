# FileOutRework

This smalltalk package adds functionality to all menus to allow you to select a destination to fileOut to (and save in the case of packages) and have the system remember where you last worked in.

The package modifies the system class browser, denotative object browser, code file browser, changeset browser, package browser and finally the filecodebrowser.
For compatability reasons the only methods that are overwritten are the menu constructors, everything else was done by adding new methods to make sure the package can't instantly break images in future base image updates.

This package is now considered feature complete.

## Install instructions

Simply drag the FileOutRework.pck.st file over the Squeak VM window running your current image of CUIS and click on Install package.
