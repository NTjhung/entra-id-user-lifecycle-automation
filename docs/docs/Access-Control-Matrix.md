# Access Control Matrix

## Purpose

This access control matrix shows how users are assigned access based on department and job role. This supports role-based access control and helps reduce unnecessary access.

## Department-Based Access

| Department | Security Group | Access Purpose |
|---|---|---|
| HR | SG-HR-Employees | Access to HR systems and employee information |
| Finance | SG-Finance-Employees | Access to finance systems and payment records |
| Sales | SG-Sales-Employees | Access to sales tools and customer records |
| IT | SG-IT-Admins | Access to IT administration tools |
| Contractors | SG-Contractors | Limited access to project resources |
| Executives | SG-Executives | Access to executive-level resources |

## Access Control Rules

1. Users should only receive access needed for their job role.
2. Access should be assigned through groups when possible.
3. Contractor access should be limited and reviewed regularly.
4. Finance, HR, and IT admin access should be reviewed more carefully.
5. Users changing departments should have old access removed.
6. Departing users should have all access removed during offboarding.

## Example User Access

| User | Department | Job Title | Assigned Group |
|---|---|---|---|
| Alice Johnson | HR | HR Manager | SG-HR-Employees |
| Brian Lee | Finance | Finance Analyst | SG-Finance-Employees |
| Carlos Ramirez | IT | Helpdesk Technician | SG-IT-Admins |
| Dana Smith | Contractors | Project Contractor | SG-Contractors |
| Emma Wilson | Sales | Sales Representative | SG-Sales-Employees |

## Least Privilege Notes

The principle of least privilege means users should only have the access required to perform their job. This reduces the risk of accidental misuse, unauthorized access, and audit findings.
