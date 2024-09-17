# Use the official Windows Server Core base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

LABEL maintainer="wingnut0310 <wingnut0310@gmail.com>"

# Install necessary features (like RDP and other server roles)
RUN powershell -Command \
    Add-WindowsFeature RDS-RD-Server

# Set RDP to be enabled
RUN powershell -Command \
    Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0

# Set Administrator password (change to a strong password)
RUN net user Administrator "root"

# Expose RDP port
EXPOSE 3389

# Start PowerShell session on container startup
CMD ["powershell"]
