@echo off

if exist UUPs\*. del /s /q UUPs\*.
if exist UUPs\*.esd del /s /q UUPs\*.esd
if exist UUPs\*.wim del /s /q UUPs\*.wim
if exist UUPs\*.cab del /s /q UUPs\*.cab
if exist UUPs\*.msu del /s /q UUPs\*.msu
if exist UUPs\*.psf del /s /q UUPs\*.psf
if exist UUPs\*.*bundle del /s /q UUPs\*.*bundle
if exist UUPs\*.appx del /s /q UUPs\*.appx
if exist UUPs\*.msix del /s /q UUPs\*.msix
if exist UUPs\*.csv del /s /q UUPs\*.csv
if exist UUPs\*.aria2 del /s /q UUPs\*.aria2
if exist UUPs\Apps rd /s /q UUPs\Apps
exit /b