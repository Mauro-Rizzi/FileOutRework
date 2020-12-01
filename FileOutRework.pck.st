'From Cuis 5.0 [latest update: #4384] on 1 December 2020 at 8:00:40 pm'!
'Description This package seeks to improve the FileOut behaviour of the system so it remembers where you last exported to and lets you quickly select a new destination.'!
!provides: 'FileOutRework' 1 7!



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

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:57:59'!
fileOutCategory: catName askUserForDestination: aBoolean
	"FileOut the named category to an user defined destination"

	(Utilities requestWorkDirectoryFileEntryfor: (self name , '-' , catName) askUser: aBoolean)  
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

!ClassDescription methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:58:10'!
fileOutMethod: selector askUserForDestination: aBoolean
	"Write source code of a single method on a file.  Make up a name for the file."

	| nameBody |
	(selector == #Comment) ifTrue: [^ self inform: 'Sorry, cannot file out class comment in isolation.'].
	(self includesSelector: selector) ifFalse: [^ self error: 'Selector ', selector asString, ' not found'].
	nameBody _ self name , '-' , (selector copyReplaceAll: ':' with: '').
	(Utilities requestWorkDirectoryFileEntryfor: nameBody askUser: aBoolean) 
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

!Class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:57:13'!
fileOutAndAskUserForNewDestination: aBoolean
	"File a description of the receiver onto a new file whose base name is the name of the receiver."

	(Utilities requestWorkDirectoryFileEntryfor: self askUser: aBoolean) writeStreamDo: 
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

!SystemOrganizer methodsFor: '*FileOutRework' stamp: 'MR 11/18/2020 11:57:43'!
fileOutCategory: category askUserForDestination: aBoolean
	"FileOut all the classes in the named system category to an user defined location."

	(Utilities requestWorkDirectoryFileEntryfor: category askUser: aBoolean) writeStreamDo: [ :fileStream |
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

!Utilities class methodsFor: '*FileOutRework' stamp: 'MR 12/1/2020 19:52:27'!
requestWorkDirectoryFileEntryfor: anEntity askUser: aBoolean
	| fileEntry newFullFilePath |
	fileEntry := self currentWorkDirectory // (anEntity asString asFileName , '.st').
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
