'From Cuis 5.0 [latest update: #4384] on 18 November 2020 at 12:09:24 pm'!
'Description This package seeks to improve the FileOut behaviour of the system as to be able to remember where you last filed out to and to give the option to file out to a new destination.'!
!provides: 'FileOutRework' 1 1!



!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:04:07'!
fileOutSystemCategoryToNewDestination
	"Print a description of each class in the selected category onto a file 
	whose name is the category name followed by .st."

	selectedSystemCategory
		ifNotNil: [ systemOrganizer fileOutCategoryToNewDestination: selectedSystemCategory ]! !

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:57:43'!
fileOutCategory: category
	"FileOut all the classes in the named system category."

	^self fileOutCategory: category askUserForDestination: false.! !

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:57:43'!
fileOutCategory: category askUserForDestination: aBoolean
	"FileOut all the classes in the named system category to an user defined location."

	(Utilities requestWorkDirectoryFileEntryfor: category askUser: aBoolean) writeStreamDo: [ :fileStream |
		self fileOutCategory: category on: fileStream initializing: true.
		Utilities updateWorkDirectoryFromFileStream: fileStream ].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:58:35'!
fileOutCategoryToNewDestination: category
	"FileOut all the classes in the named system category to an user defined location."

	^self fileOutCategory: category askUserForDestination: true.! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:29:37'!
currentWorkDirectory

	CurrentWorkDirectory ifNil: [		CurrentWorkDirectory _ DirectoryEntry smalltalkImageDirectory ].
	^CurrentWorkDirectory.! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:42:39'!
informSucessfullAction: anActionName
	
	(PopUpMenu 		labels:		'Ok') 	startUpWithCaption: anActionName,' was succesfull'.
	^anActionName, ' was succesfull.'.! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:07:37'!
requestWorkDirectoryFileEntryfor: anEntity askUser: aBoolean
	| fileEntry newFullFilePath |
	fileEntry := self currentWorkDirectory // (anEntity asFileName , '.st').
	aBoolean ifTrue: [newFullFilePath _ self request: 'Enter a new file name' initialAnswer: fileEntry asString.
				fileEntry := newFullFilePath asFileEntry.].
	^fileEntry! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:31:33'!
updateWorkDirectoryFromFileStream: aFileStream
	"I'm not sure i like this implementation, but i'm also not sure if there's a better cross-platform way to update the directory with the parent of the current fileStream target"
	CurrentWorkDirectory := DirectoryEntry withPathName: aFileStream fileEntry parent asString! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:06:27'!
systemCatSingletonMenuOptions

	^`{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'find class... (f)'.
				#selector 		-> 		#findClass.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		10.
				#label 			-> 		'browse all (B)'.
				#selector 		-> 		#browseAllClasses.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		20.
				#label 			-> 		'browse (b)'.
				#selector 		-> 		#openSystemCategoryBrowser.
				#icon 			-> 		#packageIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut (o)'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOut to new dir'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategoryToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		10.
				#label 			-> 		'update (u)'.
				#object 			-> 		#model.
				#selector 		-> 		#updateSystemCategories.
				#icon 			-> 		#updateIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		20.
				#label 			-> 		'rename... (R)'.
				#object 			-> 		#model.
				#selector 		-> 		#renameSystemCategory.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		30.
				#label 			-> 		'remove (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeSystemCategory.
				#icon 			-> 		#deleteIcon
			} asDictionary.
		}`.
	! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:06:57'!
systemCategoryMenuOptions

	^`{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'find class... (f)'.
				#selector 		-> 		#findClass.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		20.
				#label 			-> 		'recent classes... (r)'.
				#object 			-> 		#model.
				#selector 		-> 		#recent.
				#icon 			-> 		#clockIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		10.
				#label 			-> 		'browse all (B)'.
				#selector 		-> 		#browseAllClasses.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		20.
				#label 			-> 		'browse (b)'.
				#selector 		-> 		#openSystemCategoryBrowser.
				#icon 			-> 		#packageIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut (o)'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOut to new dir'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategoryToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		10.
				#label 			-> 		'reorganize'.
				#object 			-> 		#model.
				#selector 		-> 		#editSystemCategories.
				#icon 			-> 		#sendReceiveIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		20.
				#label 			-> 		'alphabetize (A)'.
				#object 			-> 		#model.
				#selector 		-> 		#alphabetizeSystemCategories.
				#icon 			-> 		#fontXGenericIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		10.
				#label 			-> 		'update (u)'.
				#object 			-> 		#model.
				#selector 		-> 		#updateSystemCategories.
				#icon 			-> 		#updateIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		20.
				#label 			-> 		'add item... (a)'.
				#object 			-> 		#model.
				#selector 		-> 		#addSystemCategory.
				#icon 			-> 		#newIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		30.
				#label 			-> 		'rename... (R)'.
				#object 			-> 		#model.
				#selector 		-> 		#renameSystemCategory.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		35.
				#label 			-> 		'move to... (m)'.
				#object 			-> 		#model.
				#selector 		-> 		#moveAllToOtherSystemCategory.
				#icon 			-> 		#saveAsIcon.
				#balloonText	-> 		'Move all classes in this category to another category'       
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		40.
				#label 			-> 		'remove (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeSystemCategory.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		10.
				#label 			-> 		'move to top'.
				#object 			-> 		#model.
				#selector 		-> 		#moveSystemCategoryTop.
				#icon 			-> 		#goTopIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		20.
				#label 			-> 		'move up'.
				#object 			-> 		#model.
				#selector 		-> 		#moveSystemCategoryUp.
				#icon 			-> 		#goUpIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		30.
				#label 			-> 		'move down'.
				#object 			-> 		#model.
				#selector 		-> 		#moveSystemCategoryDown.
				#icon 			-> 		#goDownIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		40.
				#label 			-> 		'move to bottom'.
				#object 			-> 		#model.
				#selector 		-> 		#moveSystemCategoryBottom.
				#icon 			-> 		#goBottomIcon
			} asDictionary.
			{
				#itemGroup 		-> 		70.
				#itemOrder 		-> 		10.
				#label 			-> 		'run tests (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runSystemCategoryTests.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
		}`.
	! !
