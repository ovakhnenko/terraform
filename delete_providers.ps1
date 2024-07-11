Get-ChildItem -Path "c:\terraform\" -Include *.exe -Recurse | %{$_.FullName}
Get-ChildItem -Path "c:\terraform\tf" -Include *.exe -Recurse | %{Remove-Item $_ -Recurse -force}
Get-ChildItem -Path "c:\terraform\" -Include *.exe -Recurse | %{$_.FullName}
