# Joiner-Mover-Leaver Runbook

## Purpose

This runbook documents a basic Joiner-Mover-Leaver identity lifecycle process. IAM teams use this type of process to manage user access from onboarding through termination.

## Joiner Process

A joiner is a new employee or contractor who needs access.

### Steps

1. Receive new user request from HR or hiring manager.
2. Confirm user's name, department, job title, manager, and start date.
3. Create the user account in Microsoft Entra ID.
4. Assign the user to the correct department-based security group.
5. Assign required application access.
6. Require MFA registration.
7. Document account creation in the ticket.
8. Save evidence if required for audit.

### Example

Alice Johnson joins the HR department as an HR Manager. She is assigned to the `SG-HR-Employees` group.

---

## Mover Process

A mover is an existing user who changes job roles, departments, or responsibilities.

### Steps

1. Receive role change request from HR or manager.
2. Confirm the user's new department and job title.
3. Review current group memberships.
4. Add the user to new required groups.
5. Remove old access that is no longer needed.
6. Confirm access changes with the manager.
7. Document the change in the ticket.
8. Save evidence if required for audit.

### Example

A user moves from Sales to Finance. The user should be removed from `SG-Sales-Employees` and added to `SG-Finance-Employees`.

---

## Leaver Process

A leaver is a user who leaves the organization.

### Steps

1. Confirm termination with HR or manager.
2. Disable the Microsoft Entra ID account.
3. Revoke active sessions.
4. Reset the user's password.
5. Remove the user from all security groups.
6. Remove application access.
7. Remove privileged roles if assigned.
8. Document all completed actions in the ticket.
9. Save evidence for audit.

### Example

Dana Smith leaves the company. The account is disabled, sessions are revoked, and the user is removed from `SG-Contractors`.

---

## IAM Control Goals

- Reduce manual access errors
- Remove unnecessary access
- Support least privilege
- Improve audit readiness
- Standardize onboarding and offboarding
- Create repeatable IAM processes
