'From Cuis 5.0 [latest update: #4384] on 18 November 2020 at 5:08:58 pm'!
'Description This package seeks to improve the FileOut behaviour of the system as to be able to remember where you last filed out to and to give the option to file out to a new destination.'!
!provides: 'FileOutRework' 1 4!



!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:35:41'!
fileOutClassToNewDestination
	"Print a description of the selected class onto a file whose name is the 
	category name followed by .st."

	selectedClassName ifNotNil: [ self selectedClass fileOutToNewDestination ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:04:57'!
fileOutMessageCategoriesToNewDestination

	selectedMessageCategory ifNotNil: [
		self selectedClassOrMetaClass fileOutCategoryToNewDestination:
			self selectedMessageCategoryName ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:04:07'!
fileOutSystemCategoryToNewDestination
	"Print a description of each class in the selected category onto a file 
	whose name is the category name followed by .st."

	selectedSystemCategory
		ifNotNil: [ systemOrganizer fileOutCategoryToNewDestination: selectedSystemCategory ]! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:02:48'!
fileOutCategory: catName
	"FileOut the named category"

	^self fileOutCategory: catName askUserForDestination: false.! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:08:32'!
fileOutCategory: catName askUserForDestination: aBoolean
	"FileOut the named category to an user defined destination"

	(Utilities requestWorkDirectoryFileEntryfor: (self name , '-' , catName) askUser: aBoolean)  
			writeStreamDo: [ :fileStream |
						fileStream timeStamp.
						self fileOutCategory: catName on: fileStream moveSource: false toFile: 0.
						Utilities updateWorkDirectoryFromFileStream: fileStream]! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:02:48'!
fileOutCategoryToNewDestination: catName
	"FileOut the named category to an user defined destination"

	^self fileOutCategory: catName askUserForDestination: true. ! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:32:52'!
fileOut
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	^self fileOutAndAskUserForNewDestination: false.! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:58:22'!
fileOutAndAskUserForNewDestination: aBoolean
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	(Utilities requestWorkDirectoryFileEntryfor: self askUser: aBoolean) writeStreamDo: 
			[ :stream |
			stream timeStamp.
			self sharedPools size > 0 ifTrue: [
				self shouldFileOutPools
					ifTrue: [ self fileOutSharedPoolsOn: stream ]].
			self fileOutOn: stream moveSource: false toFile: 0.
			Utilities updateWorkDirectoryFromFileStream: stream ]! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:33:47'!
fileOutToNewDestination
	"File a description of the receiver onto a new file whose base name is the name of the receiver while asking the user for a new destination."

	^self fileOutAndAskUserForNewDestination: true.! !

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

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:53:29'!
requestWorkDirectoryFileEntryfor: anEntity askUser: aBoolean
	| fileEntry newFullFilePath |
	fileEntry := self currentWorkDirectory // (anEntity asString asFileName , '.st').
	aBoolean ifTrue: [newFullFilePath _ self request: 'Enter a new file name' initialAnswer: fileEntry asString.
				fileEntry := newFullFilePath asFileEntry.].
	^fileEntry! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:31:33'!
updateWorkDirectoryFromFileStream: aFileStream
	"I'm not sure i like this implementation, but i'm also not sure if there's a better cross-platform way to update the directory with the parent of the current fileStream target"
	CurrentWorkDirectory := DirectoryEntry withPathName: aFileStream fileEntry parent asString! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:38:08'!
classListMenuOptions

	^ `{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'browse full (b)'.
				#selector 		-> 		#browseMethodFull.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		20.
				#label 			-> 		'browse hierarchy (h)'.
				#selector 		-> 		#browseHierarchy.
				#icon 			-> 		#goTopIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		30.
				#label 			-> 		'browse protocol (p)'.
				#selector 		-> 		#browseFullProtocol.
				#icon 			-> 		#spreadsheetIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutClass.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOut to new directory'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutClassToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		5.
				#label 			-> 		'show classes hierarchically'.
				#object 			-> 		#model.
				#selector 		-> 		#enableListClassesHierarchically.
				#icon 			-> 		#goTopIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		6.
				#label 			-> 		'show classes alphabetically'.
				#object 			-> 		#model.
				#selector 		-> 		#enableListClassesAlphabetically.
				#icon 			-> 		#sendReceiveIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		10.
				#label 			-> 		'show hierarchy'.
				#object 			-> 		#model.
				#selector 		-> 		#hierarchy.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		20.
				#label 			-> 		'show definition'.
				#object 			-> 		#model.
				#selector 		-> 		#editClass.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		30.
				#label 			-> 		'show comment'.
				#object 			-> 		#model.
				#selector 		-> 		#editComment.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		10.
				#label 			-> 		'inst var refs...'.
				#selector 		-> 		#browseInstVarRefs.
				#icon 			-> 		#instanceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		20.
				#label 			-> 		'inst var defs...'.
				#selector 		-> 		#browseInstVarDefs.
				#icon 			-> 		#instanceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		10.
				#label 			-> 		'class var refs...'.
				#selector 		-> 		#browseClassVarRefs.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		20.
				#label 			-> 		'class vars'.
				#selector 		-> 		#browseClassVariables.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		30.
				#label 			-> 		'class refs (N)'.
				#selector 		-> 		#browseClassRefs.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		10.
				#label 			-> 		'rename class... (R)'.
				#object 			-> 		#model.
				#selector 		-> 		#renameClass.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		20.
				#label 			-> 		'copy class...'.
				#object 			-> 		#model.
				#selector 		-> 		#copyClass.
				#icon 			-> 		#copyIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		30.
				#label 			-> 		'remove class (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeClass.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			{
				#itemGroup 		-> 		70.
				#itemOrder 		-> 		10.
				#label 			-> 		'run tests (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runClassTests.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		70.
				#itemOrder 		-> 		20.
				#label 			-> 		'more...'.
				#selector 		-> 		#offerClassListMenu2.
				#icon 			-> 		#listAddIcon
			} asDictionary.
		}`.
	! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:06:05'!
messageCategoryMenuOptions

	^`{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut (o)'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageCategories.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOut to new destination'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageCategoriesToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		10.
				#label 			-> 		'reorganize (r)'.
				#object 			-> 		#model.
				#selector 		-> 		#editMessageCategories.
				#icon 			-> 		#sendReceiveIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		20.
				#label 			-> 		'alphabetize (a)'.
				#object 			-> 		#model.
				#selector 		-> 		#alphabetizeMessageCategories.
				#icon 			-> 		#fontXGenericIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		30.
				#label 			-> 		'remove empty categories (e)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeEmptyCategories.
				#icon 			-> 		#listRemoveIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		40.
				#label 			-> 		'categorize all uncategorized (c)'.
				#object 			-> 		#model.
				#selector 		-> 		#categorizeAllUncategorizedMethods.
				#icon 			-> 		#packageIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		50.
				#label 			-> 		'new category... (n)'.
				#object 			-> 		#model.
				#selector 		-> 		#addCategory.
				#icon 			-> 		#newIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		10.
				#label 			-> 		'rename... (R)'.
				#object 			-> 		#model.
				#selector 		-> 		#renameCategory.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		20.
				#label 			-> 		'remove (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeMessageCategory.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		10.
				#label 			-> 		'run tests (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runMessageCategoryTests.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
		}`.
	! !

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
