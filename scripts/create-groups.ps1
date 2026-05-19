# Create Security Groups in Microsoft Entra ID
# Lab Project: Entra ID User Lifecycle Automation
# Purpose: Creates department-based security groups for IAM access assignment.

# Connect to Microsoft Graph
Connect-MgGraph -Scopes "Group.ReadWrite.All", "Directory.ReadWrite.All"

# List of lab security groups
$groups = @(
    "SG-HR-Employees",
    "SG-Finance-Employees",
    "SG-Sales-Employees",
    "SG-IT-Admins",
    "SG-Contractors",
    "SG-Executives",
    "SG-MFA-Required",
    "SG-AccessReview-Finance"
)

foreach ($groupName in $groups) {

    Write-Host "Processing group: $groupName"

    # Check if group already exists
    $existingGroup = Get-MgGroup -Filter "displayName eq '$groupName'" -ErrorAction SilentlyContinue

    if ($existingGroup) {
        Write-Host "Group already exists: $groupName" -ForegroundColor Yellow
    }
    else {
        New-MgGroup `
            -DisplayName $groupName `
            -MailEnabled:$false `
            -MailNickname $groupName.Replace("-", "").ToLower() `
            -SecurityEnabled:$true

        Write-Host "Created group: $groupName" -ForegroundColor Green
    }
}

Write-Host "Group creation process completed." -ForegroundColor Cyan
