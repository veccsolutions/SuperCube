# This requires that openscad is in the environment path

$scads = Get-ChildItem -Path ./printable -Filter *.scad
remove-item ./printable/*.stl

foreach ($scad in $scads) {
    # $scad | select *
    $name = $scad.Name.Substring(0, $scad.Name.LastIndexOf('.'))
    Write-Host "Building" $scad.Name
    Start-Process -Wait -Path openscad.exe -ArgumentList @( ".\printable\${name}.scad", "-o", ".\printable\${name}.stl") -NoNewWindow
}
