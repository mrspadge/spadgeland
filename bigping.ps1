$servers = Get-Content C:\Scripts\machinestoping.txt
$collection = $()
foreach ($server in $servers)
{
	$status= @{ "ServerName" = $server; "TimeStamp" = (Get-Date -f s) }
	if (Test-Connection $server -Count 1 -ea 0 -Quiet)
	{
		$status["Results"] = "Up"
	}
	else
	{	
		$status["Results"] = "Down"
	}
	New-Object -TypeName PSObject -Property $Status -OutVariable serverStatus
	$collection += $serverStatus
}
$collection | Out-file C:\Scripts\BigPingClientStatus.txt
