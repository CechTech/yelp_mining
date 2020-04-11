@echo This script generates LM Metabase database schema
@pause

..\Tools\LMMtbExporter.exe /ExportMBSchema /SQLPlatform:PostgreSQL
@pause
