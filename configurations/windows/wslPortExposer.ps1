# Prompt the user for input and validate it
Write-Host "This script sets up a port proxy for forwarding traffic to WSL."

# Get the protocol with TCP default
do {
    $protocol = Read-Host "Enter the protocol (tcp/udp) [default: tcp]"
    if ($protocol -eq '') {
        $protocol = 'tcp'
        break
    }
    if (-not ($protocol -match '^(tcp|udp)$')) {
        Write-Host "Invalid protocol. Please enter either 'tcp' or 'udp'." -ForegroundColor Red
    }
} while (-not ($protocol -match '^(tcp|udp)$'))


# Get the listening port
do {
    $listenPort = Read-Host "Enter the port you want to forward (listen port)"
    if (-not ($listenPort -match '^\d+$' -and [int]$listenPort -ge 1 -and [int]$listenPort -le 65535)) {
        Write-Host "Invalid port number. Please enter a valid port between 1 and 65535." -ForegroundColor Red
    }
} while (-not ($listenPort -match '^\d+$' -and [int]$listenPort -ge 1 -and [int]$listenPort -le 65535))

# Get the connecting port
do {
    $connectPort = Read-Host "Enter the port to connect to in WSL"
    if (-not ($connectPort -match '^\d+$' -and [int]$connectPort -ge 1 -and [int]$connectPort -le 65535)) {
        Write-Host "Invalid port number. Please enter a valid port between 1 and 65535." -ForegroundColor Red
    }
} while (-not ($connectPort -match '^\d+$' -and [int]$connectPort -ge 1 -and [int]$connectPort -le 65535))

# Retrieve the WSL IP address
$wslIP = wsl hostname -I | ForEach-Object { $_.Split(' ')[0] }
if (-not $wslIP) {
    Write-Host "Failed to retrieve the WSL IP address. Please ensure WSL is running." -ForegroundColor Red
    exit 1
}

Write-Host "WSL IP address detected: $wslIP"

# Confirm and execute the command
Write-Host "The following command will be executed:"
$command = "netsh interface portproxy add v4tov4 listenport=$listenPort listenaddress=0.0.0.0 connectport=$connectPort connectaddress=$wslIP protocol=$protocol"
Write-Host $command -ForegroundColor Yellow

$confirmation = Read-Host "Do you want to proceed? (yes/no)"
if ($confirmation -eq "yes") {
    Invoke-Expression $command
    Write-Host "Command executed successfully." -ForegroundColor Green
} else {
    Write-Host "Operation canceled by user." -ForegroundColor Red
}
