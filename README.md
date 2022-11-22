# SendVerificationEmailAction
Invocable Action to send verification email to Salesforce users who have not yet verified their email address.

# Overview
Salesforce requires that you use a verified email address to continue sending emails through Salesforce, such as sends to contacts or leads. Most users verify their email address as part of the sign-up process. However, some users continue to use email addresses that were created and verified before the current verification process was established.

# Solution
Invocable Action (+ Test Class) to be used in a Screen Flow (configured as a Login Flow) that will check if a User's email address is verified, and if not, will send them a verification email. Login Flow prevents Users from logging in until their email address is verified.

# Misc. Notes
To query TwoFactorMethodsInfo from Dev Console, etc., user (including Admins) will need to be assigned a Permission Set containing the "Manage Multi-Factor Authentication in API" permissions (under "System Permissions")
