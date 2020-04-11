@echo This script generates LM Metabase database schema
@pause

..\Tools\LMMtbExporter.exe /ExportMBSchema /SQLPlatform:MSSQLServer
@pause
