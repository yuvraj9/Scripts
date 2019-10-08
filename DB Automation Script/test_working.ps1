#Parameters are defined all four of them are mandatory
[CmdletBinding()]
param(
  [Parameter(HelpMessage="UserID")]
  [String]$UserID= "admin",
  [Parameter(HelpMessage="Password")]
  [String]$Pass= "admin",
  [Parameter(HelpMessage="Name of the server")]
  [string]$ServerName= "server.aws.com",
  [Parameter(HelpMessage="New database name")]
  [string]$DBname= "mydb"
)

#Generating username from database name provided by the user

$Username=$DBname+"User"
$NewInstanceDetails = "Databasename=$DBname", "Username=$Username"

#To get random string for password

$char=[Char[]]"abcdefghijkmnpqrstuvwxyzABCEFGHJKLMNPQRSTUVWXYZ0123456789"
$password=($Char | Get-Random -Count 16) -Join ""
[string]$password=$password
$NewInstanceDetails += "Password=$password"

#This will connect to the database by using admin credentials and make the required database

try{
$ConnectionString = "Data Source=$ServerName;initial catalog=master;User ID=$UserID;password=$Pass;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30;"
Invoke-sqlcmd -ConnectionString $ConnectionString -QueryTimeout 1800 -Variable $NewInstanceDetails -inputFile "C:\db\autonew.sql"
Write-Host $password
}
catch {
  Write-Error $_.Exception.Message -ErrorAction Stop
}


