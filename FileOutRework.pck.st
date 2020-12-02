'From Cuis 5.0 [latest update: #4384] on 2 December 2020 at 12:28:45 pm'!
'Description This package seeks to improve the FileOut behaviour of the system so it remembers where you last exported to and lets you quickly select a new destination.'!
!provides: 'FileOutRework' 1 10!
SystemOrganization addCategory: 'FileOutRework'!


!classDefinition: #FileOutReworkPackage category: 'FileOutRework'!
CodePackage subclass: #FileOutReworkPackage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileOutRework'!
!classDefinition: 'FileOutReworkPackage class' category: 'FileOutRework'!
FileOutReworkPackage class
	instanceVariableNames: ''!


!FileOutReworkPackage methodsFor: 'package installation' stamp: 'MJR 12/2/2020 12:13:37'!
postPackageInstall

	Transcript show: 'Installation of FileOutrework completed'.
	! !

!FileOutReworkPackage methodsFor: 'package installation' stamp: 'MJR 12/2/2020 12:13:20'!
prePackageInstall

	Transcript show: 'Installing FileOutrework'.
	Transcript show: 'Adding CurrentWorkDirectory class var to Utilities'.
	Utilities addClassVarName: 'CurrentWorkDirectory'.
	Transcript show: 'Succesfully addedclass var CurrentWorkDirectory to Utilities class'! !
FileOutReworkPackage prePackageInstall!
!classDefinition: #FileOutReworkPackage category: 'FileOutRework'!
CodePackage subclass: #FileOutReworkPackage
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'FileOutRework'!
!classDefinition: 'FileOutReworkPackage class' category: 'FileOutRework'!
FileOutReworkPackage class
	instanceVariableNames: ''!


!FileOutReworkPackage methodsFor: 'package installation' stamp: 'MJR 12/2/2020 12:13:37'!
postPackageInstall

	Transcript show: 'Installation of FileOutrework completed'.
	! !

!FileOutReworkPackage methodsFor: 'package installation' stamp: 'MJR 12/2/2020 12:13:20'!
prePackageInstall

	Transcript show: 'Installing FileOutrework'.
	Transcript show: 'Adding CurrentWorkDirectory class var to Utilities'.
	Utilities addClassVarName: 'CurrentWorkDirectory'.
	Transcript show: 'Succesfully addedclass var CurrentWorkDirectory to Utilities class'! !

!CodeProvider methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:47:56'!
fileOutMessageToCurrentWorkDirectory
	"Put a description of the selected message on a file"

	self selectedMessageName ifNotNil: [
		self selectedClassOrMetaClass fileOutMethodToCurrentWorkDirectory: self selectedMessageName]! !

!CodeProvider methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:30:28'!
fileOutMessageToNewDestination
	"Put a description of the selected message on a file"

	self selectedMessageName ifNotNil: [
		self selectedClassOrMetaClass fileOutMethodToNewDestination: self selectedMessageName]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:49:16'!
fileOutClassToCurrentWorkDirectory
	"Print a description of the selected class onto a file whose name is the 
	category name followed by .st inside the current work directory."

	selectedClassName ifNotNil: [ self selectedClass fileOutToCurrentWorkDirectory ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:35:41'!
fileOutClassToNewDestination
	"Print a description of the selected class onto a file whose name is the 
	category name followed by .st."

	selectedClassName ifNotNil: [ self selectedClass fileOutToNewDestination ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:49:45'!
fileOutMessageCategoriesToCurrentWorkDirectory

	selectedMessageCategory ifNotNil: [
		self selectedClassOrMetaClass fileOutCategoryToCurrentWorkDirectory:
			self selectedMessageCategoryName ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:04:57'!
fileOutMessageCategoriesToNewDestination

	selectedMessageCategory ifNotNil: [
		self selectedClassOrMetaClass fileOutCategoryToNewDestination:
			self selectedMessageCategoryName ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:50:39'!
fileOutSystemCategoryToCurrentWorkDirectory
	"Print a description of each class in the selected category onto a file 
	inside the current work directory 	whose name is the category name followed by .st."

	selectedSystemCategory
		ifNotNil: [ systemOrganizer fileOutCategoryToCurrentWorkDirectory: selectedSystemCategory ]! !

!Browser methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 12:04:07'!
fileOutSystemCategoryToNewDestination
	"Print a description of each class in the selected category onto a file 
	whose name is the category name followed by .st."

	selectedSystemCategory
		ifNotNil: [ systemOrganizer fileOutCategoryToNewDestination: selectedSystemCategory ]! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:42:02'!
fileOutClassToCurrentWorkDirectory

	self selectedClass fileOutToCurrentWorkDirectory! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:08:40'!
fileOutClassToNewDestination

	self selectedClass fileOutToNewDestination! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:42:17'!
fileOutMessageCategoriesToCurrentWorkDirectory

	self selectedClassOrMetaClass fileOutCategoryToCurrentWorkDirectory: self selectedMessageCategoryName! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:09:23'!
fileOutMessageCategoriesToNewDestination

	self selectedClassOrMetaClass fileOutCategoryToNewDestination: self selectedMessageCategoryName! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:42:34'!
fileOutMessageToCurrentWorkDirectory

	self selectedMessageName ifNil: [^self].
	self selectedClassOrMetaClass fileOutMethodToCurrentWorkDirectory: self selectedMessageName! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:09:03'!
fileOutMessageToNewDestination

	self selectedMessageName ifNil: [^self].
	self selectedClassOrMetaClass fileOutMethodToNewDestination: self selectedMessageName! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:42:47'!
fileOutToCurrentWorkDirectory

	caseCodeSource fileOutToCurrentWorkDirectory! !

!CodeFileBrowser methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:08:19'!
fileOutToNewDestination

	caseCodeSource fileOutToNewDestination! !

!ChangeList methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:59:09'!
fileOutCurrentVersionsOfSelectionsToNewDestination
	(Utilities requestWorkDirectoryFileEntryfor: 'Filename.st' askUser: true) writeStreamDo: [ :stream |
			stream timeStamp.
			self currentVersionsOfSelections do: [ :methodRef |
				methodRef actualClass
					printMethodChunk: methodRef methodSymbol
					withPreamble: true
					on: stream
					moveSource: false
					toFile: 0 ].
			Utilities updateWorkDirectoryFromFileStream: stream].
		
	^Utilities informSucessfullAction: 'FileOut'! !

!ChangeList methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:59:22'!
fileOutSelectionsToNewDestination
	(Utilities requestWorkDirectoryFileEntryfor: 'Filename.st' askUser: true)  writeStreamDo: [ :stream |
			stream timeStamp.
			listSelections with: changeList do: [ :selected :item |
				selected ifTrue: [ item fileOutOn: stream ]].
			Utilities updateWorkDirectoryFromFileStream: stream].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!ChangeSorter methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:21:17'!
fileOutToNewDestinationAndKeep
	"File out the current change set."

	myChangeSet fileOutToNewDestination.
	self update! !

!ChangeSorter methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:20:48'!
fileOutToNewDestinationAndRemove
	"File out the current change set."

	myChangeSet fileOutToNewDestination.
	self removePrompting: false.

	self showChangeSet: ChangeSet changeSetForBaseSystem.
	self update! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 20:18:35'!
fileOutCategory: catName askUserForDestination: aBoolean
	"FileOut the named category to an user defined destination"

	(Utilities requestWorkDirectoryFileEntryfor: (self name , '-' , catName,'.st') askUser: aBoolean)  
			writeStreamDo: [ :fileStream |
						fileStream timeStamp.
						self fileOutCategory: catName on: fileStream moveSource: false toFile: 0.
						Utilities updateWorkDirectoryFromFileStream: fileStream].
					
	^Utilities informSucessfullAction: 'FileOut'! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:45:43'!
fileOutCategoryToCurrentWorkDirectory: catName
	"FileOut the named category to the current work directory"

	^self fileOutCategory: catName askUserForDestination: false. ! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:02:48'!
fileOutCategoryToNewDestination: catName
	"FileOut the named category to an user defined destination"

	^self fileOutCategory: catName askUserForDestination: true. ! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 20:19:26'!
fileOutMethod: selector askUserForDestination: aBoolean
	"Write source code of a single method on a file.  Make up a name for the file."

	| nameBody |
	(selector == #Comment) ifTrue: [^ self inform: 'Sorry, cannot file out class comment in isolation.'].
	(self includesSelector: selector) ifFalse: [^ self error: 'Selector ', selector asString, ' not found'].
	nameBody _ self name , '-' , (selector copyReplaceAll: ':' with: '').
	(Utilities requestWorkDirectoryFileEntryfor: (nameBody,'.st') askUser: aBoolean) 
			 writeStreamDo: [ :fileStream |
						fileStream timeStamp.
						self printMethodChunk: selector withPreamble: true
						on: fileStream moveSource: false toFile: 0.
						 Utilities updateWorkDirectoryFromFileStream: fileStream].
					
	^Utilities informSucessfullAction: 'FileOut'.! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:46:45'!
fileOutMethodToCurrentWorkDirectory: selector
	"Write source code of a single method on a file in the current work directory.  Make up a name for the file."

	^self fileOutMethod: selector askUserForDestination: false.! !

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 17:24:36'!
fileOutMethodToNewDestination: selector
	"Write source code of a single method on a file.  Make up a name for the file and ask the user for a destination."

	^self fileOutMethod: selector askUserForDestination: true.! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 20:17:48'!
fileOutAndAskUserForNewDestination: aBoolean
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	(Utilities requestWorkDirectoryFileEntryfor: (self name, '.st') askUser: aBoolean) writeStreamDo: 
			[ :stream |
			stream timeStamp.
			self sharedPools size > 0 ifTrue: [
				self shouldFileOutPools
					ifTrue: [ self fileOutSharedPoolsOn: stream ]].
			self fileOutOn: stream moveSource: false toFile: 0.
			Utilities updateWorkDirectoryFromFileStream: stream ].
		
	^Utilities informSucessfullAction: 'FileOut'! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:40:19'!
fileOutToCurrentWorkDirectory
	"File a description of the receiver onto a new file whose base name is the name of the receiver to the current work directory."

	^self fileOutAndAskUserForNewDestination: false.! !

!Class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 16:33:47'!
fileOutToNewDestination
	"File a description of the receiver onto a new file whose base name is the name of the receiver while asking the user for a new destination."

	^self fileOutAndAskUserForNewDestination: true.! !

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 20:14:28'!
fileOutCategory: category askUserForDestination: aBoolean
	"FileOut all the classes in the named system category to an user defined location."

	(Utilities requestWorkDirectoryFileEntryfor: (category asString, '.st') askUser: aBoolean) writeStreamDo: [ :fileStream |
		self fileOutCategory: category on: fileStream initializing: true.
		Utilities updateWorkDirectoryFromFileStream: fileStream ].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:48:22'!
fileOutCategoryToCurrentWorkDirectory: category
	"FileOut all the classes in the named system category to the current work directory."

	^self fileOutCategory: category askUserForDestination: false.! !

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

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 20:17:00'!
requestWorkDirectoryFileEntryfor: aPotentialFileName askUser: aBoolean
	| fileEntry newFullFilePath |
	fileEntry := self currentWorkDirectory // aPotentialFileName asString asFileName.
	aBoolean ifTrue: [newFullFilePath _ self request: 'Enter a new file name' 
									initialAnswer: fileEntry asString
									orCancel: [^self error: 'Please close this to abort operation'].
				fileEntry := newFullFilePath asFileEntry.].
	^fileEntry! !

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:31:33'!
updateWorkDirectoryFromFileStream: aFileStream
	"I'm not sure i like this implementation, but i'm also not sure if there's a better cross-platform way to update the directory with the parent of the current fileStream target"
	CurrentWorkDirectory := DirectoryEntry withPathName: aFileStream fileEntry parent asString! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:53:22'!
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
				#selector 		-> 		#fileOutClassToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOutTo'.
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

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:53:30'!
messageCategoryMenuOptions

	^`{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut (o)'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageCategoriesToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOutTo'.
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

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:53:43'!
messageListMenuOptions
	
	^`{
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		10.
				#label 			-> 		'what to show...'.
				#selector 		-> 		#offerWhatToShowMenu.
				#icon 			-> 		#preferencesIcon
			} asDictionary.
			{
				#itemGroup 		-> 		10.
				#itemOrder 		-> 		20.
				#label 			-> 		'toggle break on entry'.
				#object 			-> 		#model.
				#selector 		-> 		#toggleBreakOnEntry.
				#icon 			-> 		#debugIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		10.
				#label 			-> 		'browse full (b)'.
				#selector 		-> 		#browseMethodFull.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		20.
				#label 			-> 		'browse hierarchy (h)'.
				#selector 		-> 		#browseHierarchy.
				#icon 			-> 		#goTopIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		30.
				#label 			-> 		'browse method (O)'.
				#selector 		-> 		#openSingleMessageBrowser.
				#icon 			-> 		#scriptIcon
			} asDictionary.
			{
				#itemGroup 		-> 		20.
				#itemOrder 		-> 		40.
				#label 			-> 		'browse protocol (p)'.
				#selector 		-> 		#browseFullProtocol.
				#icon 			-> 		#spreadsheetIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		10.
				#label 			-> 		'fileOut'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOutTo'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		20.
				#label 			-> 		'inspect CompiledMethod'.
				#object 			-> 		#model.
				#selector 		-> 		#inspectCompiledMethod.
				#icon 			-> 		#exploreIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		10.
				#label 			-> 		'senders of... (n)'.
				#selector 		-> 		#browseSendersOfMessages.
				#icon 			-> 		#mailForwardIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		20.
				#label 			-> 		'implementors of... (m)'.
				#selector 		-> 		#browseMessages.
				#icon 			-> 		#developmentIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		30.
				#label 			-> 		'inheritance (i)'.
				#selector 		-> 		#methodHierarchy.
				#icon 			-> 		#goDownIcon
			} asDictionary.
			{
				#itemGroup 		-> 		40.
				#itemOrder 		-> 		40.
				#label 			-> 		'versions (v)'.
				#selector 		-> 		#browseVersions.
				#icon 			-> 		#clockIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		10.
				#label 			-> 		'inst var refs...'.
				#selector 		-> 		#browseInstVarRefs.
				#icon 			-> 		#instanceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		20.
				#label 			-> 		'inst var defs...'.
				#selector 		-> 		#browseInstVarDefs.
				#icon 			-> 		#instanceIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		30.
				#label 			-> 		'class var refs...'.
				#selector 		-> 		#browseClassVarRefs.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		40.
				#label 			-> 		'class variables'.
				#selector 		-> 		#browseClassVariables.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		50.
				#itemOrder 		-> 		50.
				#label 			-> 		'class refs (N)'.
				#selector 		-> 		#browseClassRefs.
				#icon 			-> 		#classIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		10.
				#label 			-> 		'remove method (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeMessage.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		20.
				#label 			-> 		'run test (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runMethodTest.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		60.
				#itemOrder 		-> 		30.
				#label 			-> 		'debug test (r)'.
				#object 			-> 		#model.
				#selector 		-> 		#debugMethodTest.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
			{
				#itemGroup 		-> 		70.
				#itemOrder 		-> 		10.
				#label 			-> 		'more...'.
				#selector 		-> 		#openMessageListMenu2.
				#icon 			-> 		#listAddIcon
			} asDictionary.
		}`.
	! !

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:53:57'!
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
				#selector 		-> 		#fileOutSystemCategoryToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOutTo'.
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

!BrowserWindow class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:54:07'!
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
				#selector 		-> 		#fileOutSystemCategoryToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#itemGroup 		-> 		30.
				#itemOrder 		-> 		15.
				#label 			-> 		'fileOutTo'.
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

!CodeFileBrowserWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:44:09'!
classListMenu
	| aMenu itemColl |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Class List'.
	itemColl _ OrderedCollection new.
	itemColl addAll:
		{
			{#label -> 'definition'. #object -> #model. #selector -> #editClass. #icon -> #editFindReplaceIcon} asDictionary. 
			{#label -> 'comment'. #object -> #model. #selector -> #editComment. #icon -> #editFindReplaceIcon} asDictionary. 
			nil
		}.
	self model baseCodeSource isLiveSmalltalkImage ifTrue: [
		itemColl addAll:
			{
				{#label -> 'browse full (b)'. #selector -> #browseMethodFull. #icon -> #editFindReplaceIcon} asDictionary. 
				{#label -> 'class refs (N)'. #selector -> #browseClassRefs. #icon -> #classIcon} asDictionary. 
				nil. 
				{#label -> 'fileIn'. #object -> #model. #selector -> #fileInClass. #icon -> #updateIcon} asDictionary
			} ].
	itemColl addAll:
		{
			{#label -> 'fileOut'. #object -> #model. #selector -> #fileOutClassToCurrentWorkDirectory. #icon -> #fileOutIcon} asDictionary. 
			{#label -> 'fileOutTo'. #object -> #model. #selector -> #fileOutClassToNewDestination. #icon -> #fileOutIcon} asDictionary. 
			nil. 
			{#label -> 'rename...'. #object -> #model. #selector -> #renameClass. #icon -> #saveAsIcon} asDictionary. 
			{#label -> 'remove'. #object -> #model. #selector -> #removeClass. #icon -> #listRemoveIcon} asDictionary. 
			nil. 
			{#label -> 'remove existing'. #object -> #model. #selector -> #removeUnmodifiedCategories. #icon -> #deleteIcon} asDictionary
		}.
	aMenu addItemsFromDictionaries: itemColl.
	^ aMenu.! !

!CodeFileBrowserWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:55:31'!
codeFileListMenu
	| aMenu itemColl |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Code File'.
	itemColl _ OrderedCollection new.
	itemColl addAll:
		{
			{#label -> 'find class... (f)'. #selector -> #findClass} asDictionary. 
			nil
		}.
	self model baseCodeSource isLiveSmalltalkImage ifTrue: [
		itemColl add:
			{#label -> 'fileIn'. #object -> #model. #selector -> #fileIn} asDictionary ].
	itemColl add:
		{#label -> 'fileOut'. #object -> #model. #selector -> #fileOutToNewDestination} asDictionary.
	self model caseCodeSource isLiveSmalltalkImage ifFalse: [
		itemColl add:
			{#label -> 'remove existing'. #object -> #model. #selector -> #removeUnmodifiedClasses} asDictionary ].
	aMenu addItemsFromDictionaries: itemColl.
	^ aMenu.! !

!CodeFileBrowserWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:47:36'!
messageCategoryMenu
	| aMenu itemColl |
	aMenu _ MenuMorph new defaultTarget: model.
	"All the options are for the model."
	aMenu addTitle: 'Message Category'.
	itemColl _ OrderedCollection new.
	self model baseCodeSource isLiveSmalltalkImage ifTrue: [
		itemColl add:
			{#label -> 'fileIn'. #selector -> #fileInMessageCategories. #icon -> #updateIcon} asDictionary ].
	itemColl addAll:
		{
			{#label -> 'fileOut'. #selector -> #fileOutMessageCategoriesToCurrentWorkDirectory. #icon -> #fileOutIcon} asDictionary. 
			{#label -> 'fileOutTo'. #selector -> #fileOutMessageCategoriesToNewDestination. #icon -> #fileOutIcon} asDictionary. 
			nil. 
			{#label -> 'reorganize'. #selector -> #editMessageCategories. #icon -> #sendReceiveIcon} asDictionary. 
			nil. 
			{#label -> 'add item...'. #selector -> #addCategory. #icon -> #newIcon} asDictionary. 
			nil. 
			{#label -> 'rename...'. #selector -> #renameCategory. #icon -> #saveAsIcon} asDictionary. 
			{#label -> 'remove'. #selector -> #removeMessageCategory. #icon -> #listRemoveIcon} asDictionary
		}.
	self model caseCodeSource isLiveSmalltalkImage ifFalse: [
		itemColl addAll:
			{
				nil. 
				{#label -> 'remove existing'. #selector -> #removeUnmodifiedMethods. #icon -> #deleteIcon} asDictionary
			} ].
	aMenu addItemsFromDictionaries: itemColl.
	^ aMenu.! !

!CodeFileBrowserWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:47:58'!
messageListMenu
	| aMenu itemColl |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Message List'.
	itemColl _ OrderedCollection new.
	self model baseCodeSource isLiveSmalltalkImage ifTrue: [
		itemColl add:
			{#label -> 'fileIn'. #object -> #model. #selector -> #fileInMessage. #icon -> #updateIcon} asDictionary ].
	itemColl addAll:
		{
			{#label -> 'fileOut'. #object -> #model. #selector -> #fileOutMessageToCurrentWorkDirectory. #icon -> #fileOutIcon} asDictionary. 
			{#label -> 'fileOutTo'. #object -> #model. #selector -> #fileOutMessageToNewDestination. #icon -> #fileOutIcon} asDictionary. 
			nil
		}.
	self model baseCodeSource isLiveSmalltalkImage ifTrue: [
		itemColl addAll:
			{
				{#label -> 'senders (n)'. #selector -> #browseSenders. #icon -> #mailForwardIcon} asDictionary. 
				{#label -> 'implementors (m)'. #selector -> #browseImplementors. #icon -> #developmentIcon} asDictionary. 
				{#label -> 'method inheritance (h)'. #selector -> #methodHierarchy. #icon -> #goDownIcon} asDictionary. 
				{#label -> 'versions (v)'. #selector -> #browseVersions. #icon -> #clockIcon} asDictionary
			} ].
	itemColl addAll:
		{
			nil. 
			{#label -> 'remove method (x)'. #object -> #model. #selector -> #removeMessage. #icon -> #deleteIcon} asDictionary
		}.
	aMenu addItemsFromDictionaries: itemColl.
	^ aMenu.! !

!DenotativeObjectBrowserWindow methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:50:48'!
messageListMenu
	"Answer the message-list menu"
	"Changed by emm to include menu-item for breakpoints"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Message List'.
	aMenu
		addItemsFromDictionaries: `{
			{
				#label 			-> 		'fileOut (o)'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#label 			-> 		'fileOutTo'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'senders of... (n)'.
				#selector 		-> 		#browseSendersOfSelectedSelector.
				#icon 			-> 		#mailForwardIcon
			} asDictionary.
			{
				#label 			-> 		'implementors of... (m)'.
				#selector 		-> 		#browseImplementorsOfSelectedSelector.
				#icon 			-> 		#developmentIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'rename (R)'.
				#selector 		-> 		#renameSelector.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#label 			-> 		'remove (x)'.
				#selector 		-> 		#removeMessage.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			{				 
				#label 			-> 		'versions (v)'.
				#selector 		-> 		#browseVersions.
				#icon 			-> 		#clockIcon
			} asDictionary.
			nil.		
			{
				#label 			-> 		'change category...'.
				#object 			-> 		#model.
				#selector 		-> 		#changeCategory.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#label 			-> 		'show category'.
				#object 			-> 		#model.
				#selector 		-> 		#showHomeCategory.
				#icon 			-> 		#helpIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'send (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runMethodTest.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
			{
				#label 			-> 		'send and inspect (e)'.
				#object 			-> 		#model.
				#selector 		-> 		#sendAndInspect.
				#icon 			-> 		#inspectIcon
			} asDictionary.
			{
				#label 			-> 		'debug (r)'.
				#object 			-> 		#model.
				#selector 		-> 		#debugMethodTest.
				#icon 			-> 		#debugIcon
			} asDictionary.
			{
				#label 			-> 		'debug and inspect (q)'.
				#object 			-> 		#model.
				#selector 		-> 		#debugAndInspect.
				#icon 			-> 		#debugIcon
			} asDictionary.
		}`.
	^ aMenu! !

!DenotativeObjectBrowserWindow methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:50:58'!
systemCategoryMenu

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Categories'.
	aMenu
		addItemsFromDictionaries: `{
			{
				#label 			-> 		'find object... (f)'.
				#selector 		-> 		#findClass.
				#icon 			-> 		#findIcon
			} asDictionary.
			{
				#label 			-> 		'recent objects... (r)'.
				#object 			-> 		#model.
				#selector 		-> 		#recent.
				#icon 			-> 		#clockIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'fileOut'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategoryToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#label 			-> 		'fileOutTo'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSystemCategoryToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#label 			-> 		'fileIn'.
				#object 			-> 		#model.
				#selector 		-> 		#fileInSystemCategory.
				#icon 			-> 		#scriptIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'rename...'.
				#object 			-> 		#model.
				#selector 		-> 		#renameSystemCategory.
				#icon 			-> 		#saveAsIcon
			} asDictionary.
			{
				#label 			-> 		'remove (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeSystemCategory.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'Run tests (t)'.
				#object 			-> 		#model.
				#selector 		-> 		#runSystemCategoryTests.
				#icon 			-> 		#weatherFewCloudsIcon
			} asDictionary.
		}`.
	^aMenu! !

!ChangeListWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:19:36'!
listMenu
	"Fill aMenu up so that it comprises the primary changelist-browser menu"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'Change List'.
	aMenu addStayUpIcons.
	aMenu
		addItemsFromDictionaries: `{
			{
				#label 			-> 		'fileIn selections'.
				#object 			-> 		#model.
				#selector 		-> 		#fileInSelections.
				#balloonText 	-> 		'import the selected items into the image'.
			} asDictionary.
			{
				#label 			-> 		'fileOut selections...	'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutSelectionsToNewDestination.
				#balloonText 	-> 		'create a new file containing the selected items'.
			} asDictionary.
			{
				#label 			-> 		'fileOut current version of selections...'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutCurrentVersionsOfSelectionsToNewDestination.
				#balloonText 	-> 		'create a new file containing the current (in-image) counterparts of the selected methods'.
			} asDictionary.
			nil.
			{
				#label 			-> 		'compare to current'.
				#object 			-> 		#model.
				#selector 		-> 		#compareToCurrentVersion.
				#balloonText 	-> 		'open a separate window which shows the text differences between the on-file version and the in-image version.'.
			} asDictionary.
			{
				#label 			-> 		'toggle diffing (D)'.
				#object 			-> 		#model.
				#selector 		-> 		#toggleDiffing.
				#balloonText 	-> 		'start or stop showing diffs in the code pane.'.
			} asDictionary.
			nil.
			{
				#label 			-> 		'select new methods'.
				#object 			-> 		#model.
				#selector 		-> 		#selectNewMethods.
				#balloonText 	-> 		'select methods in the file that do not currently exist in the image'.
			} asDictionary.
			{
				#label 			-> 		'select changes for absent classes'.
				#object 			-> 		#model.
				#selector 		-> 		#selectAllForAbsentClasses.
				#balloonText 	-> 		'select methods in the file for classes that are not defined in the image'.
			} asDictionary.
			{
				#label 			-> 		'select all changes for this class'.
				#object 			-> 		#model.
				#selector 		-> 		#selectAllForThisClass.
				#balloonText 	-> 		'select all methods in the file that belong to the currently-selected class'.
			} asDictionary.
			{
				#label 			-> 		'select unchanged methods'.
				#object 			-> 		#model.
				#selector 		-> 		#selectUnchangedMethods.
				#balloonText 	-> 		'select methods in the file whose in-image versions are the same as their in-file counterparts'.
			} asDictionary.
			{
				#label 			-> 		'select methods equivalent to current'.
				#object 			-> 		#model.
				#selector 		-> 		#selectEquivalentMethods.
				#balloonText 	-> 		'select methods in the file whose in-image versions have the same behavior as their in-file counterparts'.
			} asDictionary.
			{
				#label 			-> 		'select methods older than current'.
				#object 			-> 		#model.
				#selector 		-> 		#selectMethodsOlderThanCurrent.
				#balloonText 	-> 		'select methods in the file that are older than the one currently in the image'.
			} asDictionary.
			{
				#label 			-> 		'select removals of sent methods'.
				#object 			-> 		#model.
				#selector 		-> 		#selectRemovalsOfSent.
				#balloonText 	-> 		'select all method removals of methods that have some sender in the image'.
			} asDictionary.
			nil.
			{
				#label 			-> 		'select all (a)'.
				#object 			-> 		#model.
				#selector 		-> 		#selectAll.
				#balloonText 	-> 		'select all the items in the list'.
			} asDictionary.
			{
				#label 			-> 		'deselect all'.
				#object 			-> 		#model.
				#selector 		-> 		#deselectAll.
				#balloonText 	-> 		'deselect all the items in the list'.
			} asDictionary.
			{
				#label 			-> 		'invert selections'.
				#object 			-> 		#model.
				#selector 		-> 		#invertSelections.
				#balloonText 	-> 		'select every item that is not currently selected, and deselect every item that *is* currently selected'.
			} asDictionary.
			nil.
			{
				#label 			-> 		'browse class and method'.
				#selector 		-> 		#browseMethodFull.
				#balloonText 	-> 		'open a full browser showing the selected method'.
			} asDictionary.
			{
				#label 			-> 		'browse all versions of single selection'.
				#selector 		-> 		#browseVersions.
				#balloonText 	-> 		'open a version browser showing the versions of the currently selected method'.
			} asDictionary.
			{
				#label 			-> 		'browse current versions of selections'.
				#selector 		-> 		#browseCurrentVersionsOfSelections.
				#balloonText 	-> 		'open a message-list browser showing the current (in-image) counterparts of the selected methods'.
			} asDictionary.
			{
				#label 			-> 		'destroy current methods of selections'.
				#object 			-> 		#model.
				#selector 		-> 		#destroyCurrentCodeOfSelections.
				#balloonText 	-> 		'remove (*destroy*) the in-image counterparts of all selected methods'.
			} asDictionary.
			nil.
			{
				#label 			-> 		'remove doIts'.
				#object 			-> 		#model.
				#selector 		-> 		#removeDoIts.
				#balloonText 	-> 		'remove all items that are doIts rather than definitions'.
			} asDictionary.
			{
				#label 			-> 		'remove older versions'.
				#object 			-> 		#model.
				#selector 		-> 		#removeOlderMethodVersions.
				#balloonText 	-> 		'remove all but the most recent versions of methods in the list'.
			} asDictionary.
			{
				#label 			-> 		'remove up-to-date versions'.
				#object 			-> 		#model.
				#selector 		-> 		#removeUpToDate.
				#balloonText 	-> 		'remove all items whose code is the same as the counterpart in-image code'.
			} asDictionary.
			{
				#label 			-> 		'remove empty class comments'.
				#object 			-> 		#model.
				#selector 		-> 		#removeEmptyClassComments.
				#balloonText 	-> 		'remove all empty class comments'.
			} asDictionary.
			{
				#label 			-> 		'remove selected items'.
				#object 			-> 		#model.
				#selector 		-> 		#removeSelections.
				#balloonText 	-> 		'remove the selected items from the change-list'.
			} asDictionary.
			{
				#label 			-> 		'remove unselected items'.
				#object 			-> 		#model.
				#selector 		-> 		#removeNonSelections.
				#balloonText 	-> 		'remove all the items not currently selected from the change-list'.
			} asDictionary.
		}`.
	^ aMenu! !

!ChangeSorterWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:21:57'!
changeSetListKey: aChar from: view
	"Respond to a Command key.  I am a model with a listView that has a list of changeSets."

	aChar == $D ifTrue: [^ model toggleDiffing]. 
	aChar == $o ifTrue: [^ model fileOutToNewDestinationAndRemove].
	aChar == $k ifTrue: [^ model fileOutToNewDestinationAndKeep].
	aChar == $r ifTrue: [^ model rename].
	aChar == $x ifTrue: [^ model remove].

	^ self messageListKey: aChar from: view! !

!ChangeSorterWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:22:37'!
changeSetMenu
	"Set up aMenu to hold commands for the change-set-list pane.  This could be for a single or double changeSorter"

	| aMenu isForBaseSystem |
	isForBaseSystem _ model changeSet isForBaseSystem.
	aMenu _ MenuMorph new defaultTarget: model.
	aMenu addTitle: 'Change Set'.
	aMenu addStayUpIcons.

	aMenu add: 'File out and remove (o)' 			action: #fileOutToNewDestinationAndRemove 	icon: #fileOutIcon 	enabled: isForBaseSystem.
	aMenu add: 'File out and keep (k)' 				action: #fileOutToNewDestinationAndKeep 		icon: #fileOutIcon.
	aMenu addLine.

	aMenu add: 'Rename change set (r)' 			action: #rename 					icon: #saveAsIcon 	enabled: isForBaseSystem.
	aMenu add: 'Destroy change set (x)' 			action: #remove 					icon: #warningIcon 	enabled: isForBaseSystem.
	aMenu addLine.
	model currentCanHavePreambleAndPostscript ifTrue: [
		aMenu addLine.
		model currentHasPreamble
			ifTrue: [
				aMenu add: 'Edit preamble (p)' 		action: #addPreamble 			icon: #textEditorIcon.
				aMenu add: 'Remove preamble' 	action: #removePreamble 		icon: #listRemoveIcon ]
			ifFalse: [
				aMenu add: 'Add preamble (p)' 	action: #addPreamble 			icon: #listAddIcon ].
		model currentHasPostscript
			ifTrue: [
				aMenu add: 'Edit postscript...' 		action: #editPostscript 			icon: #textEditorIcon .
				aMenu add: 'Remove postscript' 	action: #removePostscript 		icon: #listRemoveIcon ]
			ifFalse: [
				aMenu add: 'Add postscript...' 		action: #editPostscript 			icon: #listAddIcon ].
	].
	aMenu addLine.

	"CONFLICTS SECTION"
	(aMenu add: 'conflicts with other change sets' 	target: self 	action: #browseMethodConflicts 	icon: #emblemImportantIcon)
		setBalloonText: 'Browse all methods that occur both in this change set and in at least one other change set.'.
	aMenu addLine.

	"CHECKS SECTION"
	(aMenu add: 'trim history' 						action: #trimHistory 				icon: #clockIcon 		enabled: isForBaseSystem)
		setBalloonText: ' Drops any methods added and then removed, as well as renaming and reorganization of newly-added classes. ',
				'NOTE: can cause confusion if later filed in over an earlier version of these changes'.

	(aMenu add: 'view affected class categories' action: #viewAffectedClassCategories icon: #packageIcon)
		setBalloonText: ' Show class categories affected by any contained change'.

	^ aMenu! !

!ChangeSorterWindow methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:23:49'!
messageMenu
	"Fill aMenu with items appropriate for the message list; could be for a single or double changeSorter"

	| aMenu |
	aMenu _ MenuMorph new defaultTarget: self.
	aMenu addTitle: 'message list'.
	aMenu addStayUpIcons.
	aMenu 
		addItemsFromDictionaries: `{
			{
				#label 			-> 		'delete method from changeSet (d)'.
				#object 			-> 		#model.
				#selector 		-> 		#forget.
				#icon 			-> 		#warningIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'remove method from system (x)'.
				#object 			-> 		#model.
				#selector 		-> 		#removeMessage.
				#icon 			-> 		#deleteIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'browse full (b)'.
				#selector 		-> 		#browseMethodFull.
				#icon 			-> 		#editFindReplaceIcon
			} asDictionary.
			{
				#label 			-> 		'browse hierarchy (h)'.
				#selector 		-> 		#browseHierarchy.
				#icon 			-> 		#goTopIcon
			} asDictionary.
			{
				#label 			-> 		'browse method (O)'.
				#selector 		-> 		#openSingleMessageBrowser.
				#icon 			-> 		#scriptIcon
			} asDictionary.
			{
				#label 			-> 		'browse protocol (p)'.
				#selector 		-> 		#browseFullProtocol.
				#icon 			-> 		#spreadsheetIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'fileOut'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToCurrentWorkDirectory.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			{
				#label 			-> 		'fileOutTo'.
				#object 			-> 		#model.
				#selector 		-> 		#fileOutMessageToNewDestination.
				#icon 			-> 		#fileOutIcon
			} asDictionary.
			nil.
			{
				#label 			-> 		'senders of... (n)'.
				#selector 		-> 		#browseSendersOfMessages.
				#icon 			-> 		#mailForwardIcon
			} asDictionary.
			{
				#label 			-> 		'implementors of... (m)'.
				#selector 		-> 		#browseMessages.
				#icon 			-> 		#developmentIcon
			} asDictionary.
			{
				#label 			-> 		'inheritance (i)'.
				#selector 		-> 		#methodHierarchy.
				#icon 			-> 		#goDownIcon
			} asDictionary.
			{
				#label 			-> 		'versions (v)'.
				#selector 		-> 		#browseVersions.
				#icon 			-> 		#clockIcon
			} asDictionary.
		}`.
	^ aMenu! !

!ChangeSet methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:26:07'!
fileOutToNewDestination
	"File out the receiver, to a file whose name is a function of the  
	change-set name and either of the date & time or chosen to have a  
	unique numeric tag, depending on the preference  
	'changeSetVersionNumbers'"
	| slips nameToUse |
	nameToUse _ self name.
	nameToUse _ nameToUse copyReplaceAll: 'AuthorName' with: Utilities authorName asUnaccented asCamelCase.
	nameToUse _ Preferences changeSetVersionNumbers
				ifTrue: [
					DirectoryEntry currentDirectory
						nextNameFor: nameToUse coda: '-', Utilities authorInitials
						extension: 'cs.st' ]
				ifFalse: [ (nameToUse , '.' , Utilities dateTimeSuffix , '.cs.st') asFileName ].
		
	(Utilities requestWorkDirectoryFileEntryfor: nameToUse askUser: true) writeStreamDo: [ :stream |
		stream timeStamp.
		self fileOutPreambleOn: stream.
		self fileOutOn: stream.
		self fileOutPostscriptOn: stream.
		Utilities updateWorkDirectoryFromFileStream: stream].
	
	self hasUnsavedChanges: false.
	Preferences checkForSlips
		ifFalse: [^ self].
	slips _ self checkForSlips.
	(slips size > 0
			and: [(PopUpMenu withCaption: 'Methods in this fileOut have halts
or references to the Transcript
or other ''slips'' in them.
Would you like to browse them?' chooseFrom: 'Ignore\Browse slips')
					= 2])
		ifTrue: [ Smalltalk browseMessageList: slips name: 'Possible slips in ' , name ]! !

!CodeFile methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 11:59:39'!
fileOutToNewDestination
	(Utilities requestWorkDirectoryFileEntryfor: 'Filename.st' askUser: true) writeStreamDo: [ :stream | 
			sourceSystem isEmpty
				ifFalse: [ stream nextChunkPut: sourceSystem printString; newLine ].
			self fileOutOn: stream.
			stream newLine; newLine.
			classes do: [ :cls |
				cls needsInitialize
					ifTrue: [ stream newLine; nextChunkPut: cls name,' initialize']].
			stream newLine.
			Utilities updateWorkDirectoryFromFileStream: stream ].
		
	^Utilities informSucessfullAction: 'FileOut'! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:03:46'!
fileOutAndAskUserForDestination: aBoolean

	(Utilities requestWorkDirectoryFileEntryfor: (self name, '.st') askUser: aBoolean) writeStreamDo: [ :stream |
		self fileOutOn: stream.
		self needsInitialize ifTrue: [
			stream newLine; nextChunkPut: self name,' initialize' ].
		Utilities updateWorkDirectoryFromFileStream: stream].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:00:34'!
fileOutCategory: categoryName askUser: aBoolean

	(Utilities requestWorkDirectoryFileEntryfor: (self name,'-',categoryName,'.st') askUser: aBoolean) writeStreamDo: [ :f |
		self fileOutMethods: (self organization listAtCategoryNamed: categoryName) on: f.
		Utilities updateWorkDirectoryFromFileStream: f].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:01:09'!
fileOutCategoryToCurrentWorkDirectory: categoryName

	^self fileOutCategory: categoryName askUser: false! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:01:24'!
fileOutCategoryToNewDestination: categoryName

	^self fileOutCategory: categoryName askUser: true! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:01:47'!
fileOutMethod: selector askUser: aBoolean

	(Utilities requestWorkDirectoryFileEntryfor: (name,'-', selector asFileName, '.st')  askUser: aBoolean) writeStreamDo: [ :f |
		self fileOutMethods: (Array with: selector) on: f.
		Utilities updateWorkDirectoryFromFileStream: f].
	
	^Utilities informSucessfullAction: 'FileOut'! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:02:09'!
fileOutMethodToCurrentWorkDirectory: selector

	^self fileOutMethod: selector askUser: false! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:02:34'!
fileOutMethodToNewDestination: selector

	^self fileOutMethod: selector askUser: true! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:04:00'!
fileOutToCurrentWorkDirectory

	^self fileOutAndAskUserForDestination: false! !

!PseudoClass methodsFor: '*FileOutRework' stamp: 'MJR 12/2/2020 12:04:13'!
fileOutToNewDestination
	
	^self fileOutAndAskUserForDestination: true! !
FileOutReworkPackage postPackageInstall!
