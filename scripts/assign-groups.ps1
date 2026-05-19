# Assign Users to Security Groups
# Lab Project: Entra ID User Lifecycle Automation
# Purpose: Assigns users to groups based on the AccessGroup column in the CSV file.

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.Read.All", "Group.ReadWrite.All", "Directory.ReadWrite.All"

# CSV file path
$csvPath = "../sample-data/sample-users.csv"

# Import users from CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $upn = $user.UserPrincipalName
    $groupName = $user.AccessGroup

    Write-Host "Processing $upn for group $groupName"

    # Get user
    $entraUser = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ErrorAction SilentlyContinue

    # Get group
    $group = Get-MgGroup -Filter "displayName eq '$groupName'" -ErrorAction SilentlyContinue

    if (-not $entraUser) {
        Write-Host "User not found: $upn" -ForegroundColor Red
        continue
    }

    if (-not $group) {
        Write-Host "Group not found: $groupName" -ForegroundColor Red
        continue
    }

    # Add user to group
    New-MgGroupMember -GroupId $group.Id -DirectoryObjectId $entraUser.Id -ErrorAction SilentlyContinue

    Write-Host "Added $upn to $groupName" -ForegroundColor Green
}

Write-Host "Group assignment process completed." -ForegroundColor Cyan
