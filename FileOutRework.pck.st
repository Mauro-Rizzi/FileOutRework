'From Cuis 5.0 [latest update: #4384] on 18 November 2020 at 11:37:45 am'!
'Description This package seeks to improve the FileOut behaviour of the system as to be able to remember where you last filed out to and to give the option to file out to a new destination.'!
!provides: 'FileOutRework' 1 0!



!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:33:50'!
fileOutCategory: category
	"FileOut all the classes in the named system category."

	Utilities currentWorkDirectory // (category asFileName , '.st') writeStreamDo: [ :fileStream |
		self fileOutCategory: category on: fileStream initializing: true.
		Utilities updateWorkDirectoryFromFileStream: fileStream ]! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:29:37'!
currentWorkDirectory

	CurrentWorkDirectory ifNil: [		CurrentWorkDirectory _ DirectoryEntry smalltalkImageDirectory ].
	^CurrentWorkDirectory.! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:31:33'!
updateWorkDirectoryFromFileStream: aFileStream
	"I'm not sure i like this implementation, but i'm also not sure if there's a better cross-platform way to update the directory with the parent of the current fileStream target"
	CurrentWorkDirectory := DirectoryEntry withPathName: aFileStream fileEntry parent asString! !
