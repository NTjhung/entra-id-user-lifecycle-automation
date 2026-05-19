# Create Users in Microsoft Entra ID from CSV
# Lab Project: Entra ID User Lifecycle Automation
# Purpose: Simulates onboarding users from an HR-provided CSV file.

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All"

# CSV file path
$csvPath = "../sample-data/sample-users.csv"

# Import users from CSV
$users = Import-Csv -Path $csvPath

# Temporary password for lab users
$tempPassword = "TempPassword123!"

foreach ($user in $users) {

    $displayName = "$($user.FirstName) $($user.LastName)"
    $mailNickname = "$($user.FirstName).$($user.LastName)".ToLower()
    $upn = $user.UserPrincipalName

    Write-Host "Processing user: $displayName"

    # Check if user already exists
    $existingUser = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ErrorAction SilentlyContinue

    if ($existingUser) {
        Write-Host "User already exists: $upn" -ForegroundColor Yellow
    }
    else {
        # Create password profile
        $passwordProfile = @{
            Password = $tempPassword
            ForceChangePasswordNextSignIn = $true
        }

        # Create user
        New-MgUser `
            -AccountEnabled:$true `
            -DisplayName $displayName `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -UserPrincipalName $upn `
            -MailNickname $mailNickname `
            -Department $user.Department `
            -JobTitle $user.JobTitle `
            -PasswordProfile $passwordProfile

        Write-Host "Created user: $upn" -ForegroundColor Green
    }
}

Write-Host "User creation process completed." -ForegroundColor Cyan
