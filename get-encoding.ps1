# get-encoding.ps1
param([Parameter(ValueFromPipeline=$True)] $filename)
begin {
  # set .net current directoy
  [Environment]::CurrentDirectory = (pwd).path
}
process {
  $reader = [System.IO.StreamReader]::new($filename,
    [System.Text.Encoding]::default,$true)
  $peek = $reader.Peek()
  $encoding = $reader.currentencoding
  $reader.close()
  Write-Output $encoding.BodyName
}