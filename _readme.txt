========================================================================
* 		   LISp-Miner system readme file		       *	
========================================================================

CONTENTS
////////////////////////////////////////////////////////////////////////

1) Preface
2) Downlaoad
3) Basics of installation
4) Setting-up data-metabase pair
5) List of files

1) PREFACE
////////////////////////////////////////////////////////////////////////

This file contains basic summary of download and installation instructions 
and what you will find in the each of LISp-Miner packages.

For detailed information please refer to the home page of the LISp-Miner
system at http://lispminer.vse.cz.

2) Download
////////////////////////////////////////////////////////////////////////

There is a basic all-in-one installation file LISp-Miner.Core.zip for download.

Another installation files contains some special LISp-Miner modules (as is LM 
Exec for executing LISp-Miner Control Language scripts or LM ReverseMiner for 
generating artificial data). Download them only if necessary.

3) Basics of installation
////////////////////////////////////////////////////////////////////////

You can install each module simply by extracting all the contents of the 
downloaded ZIP file into any directory on you hard disk drive, e.g. 
X:\LISp-Miner (maintaining the ZIP subdirectory structure). We recommend 
extracting all the LISp-Miner files into the same folder.

The main module of the LISp-Miner system is the LMWorkspace.exe. You can find 
this executable file in the main folder of the system, after downloading and 
extracting content of the LISp-Miner.Core.zip file.

4) Setting-up data-metabase pair
////////////////////////////////////////////////////////////////////////

You have to setup-up a so called data-metabase pair before you can analyze 
data. First, you need a database or a CSV (text) file with analyzed data. Put 
it in a suitable folder (e.g. X:\LISp-Miner\Data) and launch the 
LMWorkspace.exe module. Depending on the source data format choose either ‘New 
from TXT’, ‘New from MDB’ or ‘New from ODBC’ buttons. Than proceed with opened 
dialog boxes to import analyzed data and to create a metabase 
(user-metadata-file) for them. After a successful import, the LM Workspace 
main screen will open and you can start data analysis.

For details see http://lispminer.vse.cz/how/index.html.

5) List of files
////////////////////////////////////////////////////////////////////////

Main module:
------------

  LMWorkspace.exe
	The main LISp-Miner system user module. Integrates all the user-oriented
	features of the system.

LM Exec:
--------

	Module for executing LISp-Miner Control Language (LMCL) scripts.
	A separate download through the LM.Exec.zip file
	Uses Exec subfolder.
	For details see http://lispminer.vse.cz/lmcl

	Input parameters:
		/Input:<pathname>		... (O) path and filename of a LMCL script file to execute (automatically, unless /NoScriptStartAuto is specified)
		/ScriptParam:<Name>=<Value>	... (O) user-define script parameters. Accessible from the LMCL script through "lm.params" table
		/NoScriptStartAuto		... (O) waits for "Run" button to be pressed to start the script passed as /Input parameter
		/NoCheckPrimaryKeyUnique	... (O) disables an automatick check of each primary key (could be time-consumuning)
		/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
		/NoProgress			... (O) for run in the background -- no progress dialog is displayed
		/AppLog:<log_file>		... (O) alternative path and file name for logging

LM ReverseMiner:
----------------

	Module for generating artificial data.
	A separate download through the LM.ReverseMiner.zip file
	Uses ReverseMiner subfolder to store data.

Knowledge-EXplorer subsystem:
-----------------------------

	A separate download through the LM.KEx.zip file.
	
  KEXTask.exe
	Task definition and knowledge base generation phase.

  KEXResult.exe
	Interpretation (consultation) phase.

Tools folder:
-------------

	LM SamePooler:
	--------------
	
		Manages batch solving of tasks in the background with parallel jobs as threads on multiple processor cores.
		Uses SamePooler subfolder to store temporary data.
	
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/TaskID:<TaskID>		... TaskID of the selected task
			/TaskName:<TaskName>		... Task.Name of the selected task
			/DataTableName:<DataTableName>	... Name of the database table the task should be based upon 
			/TaskGroupID:<TaskGroupID>	... TaskGroupID to run all the not solved tasks (from any GUHA procedure) within this group
			/RMCaseID:<RMCaseID>		... ReverseMiner CaseID to run all tasks in this case
			/BitStringCache:<file_name>	... (O) to read bitstrings from the file and not to connect to the analyzed data database at all
			/TaskCancel			... (O) to cancel task of given TaskID or name (if already running) or to remove it from queue
			/CancelAll			... (O) to cancel any running task and to empty the queue
			/ParallelThreadCountMax:n	... (O) maximal number of concurent parallel threads (default: 4). Could also be specified via the LM Workspace Misc settings
			/TimeOut:<sec>			... (O) time-out in seconds (approx.) after a task generation (excluding initialisation) is automatically interrupted
			/ShutdownDelaySec:<n>		... (O) number of seconds <0;86400> before the LM SamePooler server is shutted down after currently the last waiting task is solved (default: 10)
			/TimeMaxHours:<n>		... (O) maximal number of hours the server is running (to allow for periodical re-start) (default: 1)
			/Server				... (O) this instance becomes the server (the Task parameter is ignored)
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling
	
		To add a new task to the batch processing queue just
		specify either the TaskID or task name. 
		The TaskID has preference if both are specified.
		If a task name is specified, the /DataTableName must be specified also.
	
		To cancel a task both /TaskCancel parameter and a task identification must be present
	
		The /CancelAll parameter doesn't require any task identification and has precedence over /TaskCancel
	
		The first LM SamePooler to start becomes the server and while running it
		handles every other later launched LM SamePoolers requests to add a task to
		the queue. No two of the LM SamePooler, LM ProcPooler and LM GridPooler modules 
		could run simultaneously.
	
		If the "Server" parameter is specified, the TaskID/TaskName parameters are
		ignored and this instance of the LM SamePooler explicitly becomes
		the server (no other LM SamePooler must be already running).

	LM TaskPooler:
	--------------
	
		Manages batch solving of tasks in the background. Uses TaskPooler subfolder to store temporary data.
	
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/TaskID:<TaskID>		... TaskID of the selected task
			/TaskName:<TaskName>		... Name of the selected task
			/DataTableName:<DataTableName>	... Name of the database table the task should be based upon 
			/RMCaseID:<RMCaseID>		... ReverseMiner CaseID to run all tasks in this case
			/BitStringCache:<file_name>	... (O) to read bitstrings from the file and not to connect to the analyzed data database at all
			/TaskCancel			... (O) to cancel task of given TaskID or name (if already running) or to remove it from queue
			/CancelAll			... (O) to cancel any running task and to empty the queue
			/TimeOut:<sec>			... (O) time-out in seconds (approx.) after a task generation (excluding initialisation) is automatically interrupted
			/ShutdownDelaySec:<n>		... (O) number of seconds <0;86400> before the LM TaskPooler server is shutted down after currently the last waiting task is solved (default: 10)
			/TimeMaxHours:<n>		... (O) maximal number of hours the server is running (to allow for periodical re-start) (default: 1)
			/Server				... (O) this instance becomes the server (the Task parameter is ignored)
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling
	
		To add a new task to the batch processing queue just
		specify either the TaskID or task name. 
		The TaskID has preference if both are specified.
		If a task name is specified, the /DataTableName must be specified also.
	
		To cancel a task both /TaskCancel parameter and a task identification must be present
	
		The /CancelAll parameter doesn't require any task identification and has precedence over /TaskCancel
	
		The first LM TaskPooler to start becomes the server and while running it
		handles every other later launched LM TaskPoolers requests to add a task to
		the queue. No two of the LM SamePooler, LM ProcPooler and LM GridPooler modules 
		could run simultaneously.
	
		If the "Server" parameter is specified, the TaskID/TaskName parameters are
		ignored and this instance of the LM TaskPooler explicitly becomes
		the server (no other LM TaskPooler must be already running).
	
	LM ProcPooler:
	--------------
	
		Manages batch solving of tasks in the background with parallel jobs on multiple processor cores.
		Uses ProcPooler subfolder to store temporary data.
	
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/TaskID:<TaskID>		... TaskID of the selected task
			/TaskName:<TaskName>		... Task.Name of the selected task
			/DataTableName:<DataTableName>	... Name of the database table the task should be based upon 
			/TaskGroupID:<TaskGroupID>	... TaskGroupID to run all the not solved tasks (from any GUHA procedure) within this group
			/RMCaseID:<RMCaseID>		... ReverseMiner CaseID to run all tasks in this case
			/BitStringCache:<file_name>	... (O) to read bitstrings from the file and not to connect to the analyzed data database at all
			/TaskCancel			... (O) to cancel task of given TaskID or name (if already running) or to remove it from queue
			/CancelAll			... (O) to cancel any running task and to empty the queue
			/ParallelProcessCountMax:n	... (O) maximal number of concurent parallel processes (default: 4). Could also be specified via the LM Workspace Misc settings
			/TimeOut:<sec>			... (O) time-out in seconds (approx.) after a task generation (excluding initialisation) is automatically interrupted
			/ShutdownDelaySec:<n>		... (O) number of seconds <0;86400> before the LM ProcPooler server is shutted down after currently the last waiting task is solved (default: 10)
			/TimeMaxHours:<n>		... (O) maximal number of hours the server is running (to allow for periodical re-start) (default: 1)
			/Server				... (O) this instance becomes the server (the Task parameter is ignored)
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling
	
		To add a new task to the batch processing queue just
		specify either the TaskID or task name. 
		The TaskID has preference if both are specified.
		If a task name is specified, the /DataTableName must be specified also.
	
		To cancel a task both /TaskCancel parameter and a task identification must be present
	
		The /CancelAll parameter doesn't require any task identification and has precedence over /TaskCancel
	
		The first LM ProcPooler to start becomes the server and while running it
		handles every other later launched LM ProcPoolers requests to add a task to
		the queue. No two of the LM SamePooler, LM ProcPooler and LM GridPooler modules 
		could run simultaneously.
	
		If the "Server" parameter is specified, the TaskID/TaskName parameters are
		ignored and this instance of the LM ProcPooler explicitly becomes
		the server (no other LM ProcPooler must be already running).
	
	LM GridPooler:
	--------------
	
		Manages batch solving of tasks on the PC-Grid. The grid-connection must be properly setup.
		A separate download in the LM.GridPooler.zip file.
		Uses GridPooler subfolder to store temporary data.
		
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/TaskID:<TaskID>		... TaskID of the selected task
			/TaskName:<TaskName>		... Task.Name of the selected task
			/DataTableName:<DataTableName>	... Name of the database table the task should be based upon 
			/RMCaseID:<RMCaseID>		... ReverseMiner CaseID to run all tasks in this case
			/TaskCancel			... (O) to cancel task of given TaskID or name (if already running) or to remove it from queue
			/CancelAll			... (O) to cancel any running task and to empty the queue
			/GridBinariesPath:<Path>	... (O) an optional path to the PCGrid/Binaries directory (if not in a default location as subdirectory)
			/GridDataPath:<Path>		... (O) an optional path to the PCGrid/Data directory (if not in a default location as subdirectory)
			/TimeOut:<sec>			... (O) time-out in seconds (approx.) after a task generation (excluding initialisation) is automatically interrupted
			/ShutdownDelaySec:<n>		... (O) number of seconds <0;86400> before the LM GridPooler server is shutted down after currently the last waiting task is solved (default: 10)
			/TimeMaxHours:<n>		... (O) maximal number of hours the server is running (to allow for periodical re-start) (default: 1)
			/Server				... (O) this instance becomes the server (the Task parameter is ignored)
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling
	
		To add a new task to the batch processing queue just
		specify either the TaskID or task name. 
		The TaskID has preference if both are specified.
		If a task name is specified, the /DataTableName must be specified also.
	
		To cancel a task both /TaskCancel parameter and a task identification must be present
	
		The /CancelAll parameter doesn't require any task identification and has precedence over /TaskCancel
	
		The first LM GridPooler to start becomes the server and while running it
		handles every other later launched LM GridPoolers requests to add a task to
		the queue. No two of the LM SamePooler, LM ProcPooler and LM GridPooler modules 
		could run simultaneously.
	
		If the "Server" parameter is specified, the TaskID/TaskName parameters are
		ignored and this instance of the LM GridPooler explicitly becomes
		the server (no other LM GridPooler must be already running).

	Metabase Exporter:
	------------------
	
		Exports the metabase data (task, results...) into a text file (PMML, XML, HTML) 
		using template.
	
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/DataTableID:<DataTableID>	... ID of the selected database table
			/DataTableName:<DataTableName>	... Name of the selected database table
			/TaskID:<TaskID>		... TaskID of the selected task
			/TaskName:<TaskName>		... Task.Name of the selected task
			/BitStringCache:<file_name>	... (O) to read bitstrings from the file and not to connect to the analyzed data database at all
			/Survey				... special mode to export survey of tasks
			/Version			... special mode to export system version
			/Template:<template_file>	... path and name to the template file
			/Output:<output_file>		... path and name to the output file
			/Alias:<alias_file>		... (O) aliases for text strings (for PMML mainly)
			/NoAttributeDisctinctValues	... (O) to skip reading distinct values of attributes from metabase (if not needed afterwards for export)
			/DistinctValuesMax:<nnn>	... (O) maximal number of exported distinct values of DB columns (default: 1000)
			/NoConnectDB			... (O) do not try to connect to the analyzed data database (faster, if no connection needed)
			/NoEscapeSeq			... (O) to suppress substitution of XML special characters for escape-sequences (like: &gt, &amp etc.) (default: FALSE)
			/NoEscapeSeqUnicode		... (O) to suppress substitution of national characters for UNICODE escape-sequences (like: &Aacute, &Rcaron etc.) (default: FALSE)
			/ExportMBSchema:<filename>	... (O) to export metabase structure and basic data into a text file (default: LMMetabaseSchema.sql)
			/SQLPlatform:<platformname>	... (O) SQL-flavour parameter to tweak metabase structure SQL script syntax (supporter values: 'PostgreSQL', 'MSSQLServer')
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling
	
		Either the TaskID or task name have to be specifed for export the whole task. 
		The TaskID has preference if both are specified.
		If a task name is specified, the /DataTableName must be specified also.
	
		Either the DataTableID or matrix name have to be specified for export of the
		DataDictionary. The DataTableID has preference if both are specified.
	
		Full task export has preference over DataDictionary export if both
		task and matrix are specified.
	
		A special parameter /Survey could be specified to export just survey of tasks and their states. 
		The DSN parameter must be specified, but no TaskID nor DataTableID needs to be.
	
		A special parameter /Version could be specified to export just system variables (version, data-time...). 
		The DSN, TaskID and DataTableID parameters need not be specified.
	
		A special parameter /ExportMBSchema could be specified to export metabase structure into a SQL script.
		
	Metabase Importer:
	------------------
	
		Imports PMML file into the metabase (transformation dictionary, tasks) 
	
		Input parameters:
			/DSN:<data-source-name>		... data source name of metabase (if the data source name contains spaces, the whole /DSN parameter has to be enclosed in quotations mark, e.g. "/DSN:LM Barbora MB")
			/Input:<pmml_file>		... input PMML file with definitions
			/Alias:<alias_file>		... (O) aliases for text strings (the same as for export, reverse mapping)
			/NoCheckPrimaryKeyUnique	... (O) skip test of unique values in the database table primary key
			/Quiet				... (O) for run in the background -- no information dialog boxes shown and no user's interaction is expected (errors reported to the _AppLog.dat only)
			/NoProgress			... (O) for run in the background -- no progress dialog is displayed
			/AppLog:<log_file>		... (O) alternative path and file name for logging
			/TimeLog:<log_file>		... (O) path and file name for time profiling

Pooler folder:
--------------

	Running tasks in background functionality. 
	
	GridGen sub-folder: 
	-------------------
	 
	 	Parallel processing modules (only for an internal usage):
	 	
			  4ftGridGen.exe
			  KLGridGen.exe
			  CFGridGen.exe
			  SDCFGridGen.exe
			  SDKLGridGen.exe
			  SD4ftGridGen.exe
			  Ac4ftGridGen.exe
			  ETGridGen.exe
			  MCGridGen.exe
	
ImEx folder:
------------

	Import and export functionality. Templates for PMML, XML, HTML... text exports.

Maps folder:
------------

	Vector and raster images for geodata analysis.
	
DBCon folder:
-------------

	LMEmpty.mdb
		Empty metabase file used as a template for user-created metabases
	
	LMEmptyUS.mdb
		Empty metabase file used as a template for user-created metabases (for the U.S. regional settings)
	
	DBEmpty.mdb
		Empty database file
	
	DBBase.dsn
		A template for FileDSN ODBC connections
	
Help folder:
------------

	Directory with help files for modules

/////////////////////////////////////////////////////////////////////////////
Other notes:

(O) means an optional parameter

/////////////////////////////////////////////////////////////////////////////
