& "D:/apps/ripgrep/_rg.ps1"
& "c:/apps/_fd.ps1"
& "c:/apps/_xh.ps1"
# $env:STARSHIP_CONFIG = "$scriptPath/starship.toml"
Invoke-Expression (&starship init powershell)

function hh {
  $hist_path = Get-PSReadLineOption | select -ExpandProperty HistorySavePath
  $command   = Get-Content $hist_path | Sort-Object | Get-Unique | fzf --height 50% --reverse
  if( ![string]::IsNullOrEmpty( $command ) ) {
    Write-Host "Invoking: " $command
    Invoke-Expression -Command $command
  }
}

function oo {
    $path = fzf --height 50% --reverse
    if( ![string]::IsNullOrEmpty( $path ) ) {
        $command = "code $path"
        Write-Host $command
        Invoke-Expression -Command $command
    }
}

function traffic {
    Invoke-RestMethod proxy.bolid.ru | rg shubo
}

function last_file {
    param(
        [string]$Path = "."
    )
    Get-ChildItem -Recurse -File -Path $Path |
        Sort-Object LastAccessTime -Descending |
        Select-Object -First 1 |
        %{ $_.FullName }
}

function tail {
    param(
        [string]$Path = [string]::Empty
    )
    if( [string]::IsNullOrEmpty( $Path ) ){
        $file = last_file -Path .
        Write-Host "tail last file: $file"
        Get-Content -Wait -Tail 15 $file
        return
    }
    if( Test-Path $Path ){
        $is_dir = (Get-Item $Path) -is [System.IO.DirectoryInfo]
        if( $is_dir ){
            $file = last_file -Path $Path
            Write-Host "tail last file: $file"
            Get-Content -Wait -Tail 15 $file
            return
        }
        Write-Host "tail file: $Path"
        Get-Content -Wait -Tail 15 $Path
    } else {
        Write-Host "Couldn't tail $Path"
        Start-Sleep 5
    }    
}

function olast {
    $path = last_file -Path $pwd.Path
    $command = "code $path"
    Write-Host $command
    Invoke-Expression -Command $command
}

function qq {
    param(
        [string]$Path = [string]::Empty
    )
    if( [string]::IsNullOrEmpty( $Path ) ){
        Write-Host "I can't open nothing!"
        return
    }
    $qt_root = 'c:/qt/5.7/msvc2015'
    if( [string]::IsNullOrEmpty($qt_root) )
    {
        Write-Host "You need to set environment qt_root which contains qt"
        return
    }
    $qmake = "$qt_root/bin/qmake.exe"
    $moc   = "$qt_root/bin/moc.exe"
    $inc   = "$qt_root/inclulde/"
    $lib   = "$qt_root/lib/"
    $args = @(
        $qmake
        "-tp vc $Path"
        "-recursive"
        "QMAKE_INCDIR_QT=$inc"
        "QMAKE_LIBDIR=$lib"
        "QMAKE_MOC=$moc"
        "QMAKE_QMAKE=$qmake"
    )
    $cmd = [string]::Join(" ", $args)
    Write-Host "Invoke: $cmd"
    $count_time = [DateTime]::Now
    Invoke-Expression $cmd
    $count_time = [DateTime]::Now - $count_time
    Write-Host "Completed in $count_time"
}
