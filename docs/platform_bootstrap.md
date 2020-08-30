# Platform bootstrap

To be able to use this platform some initial setup has to be done on Google Cloud and the other providers.

## Configuration files



## GCP Setup

Google Cloud is the main provider for the platform. It is used to store the terraform state.

Requirements:

* Make sure the account used for bootstrap has assigned the IAM Roles: `Organization Administrator`, `Folder Admin`
* An organisation configured (https://cloud.google.com/resource-manager/docs/creating-managing-organization)
* A billing account configured (https://cloud.google.com/billing/docs/how-to/manage-billing-account)
* A group for organisation administrators
* A group for billing administrators

Note: groups have to be created in the organisation admin panel (https://admin.google.com)

## AWS Setup (optional)

If you plan to use AWS as secondary provider you'll need to setup a IAM User with enough permissions.

Being this platform still in development we don't have a list of necessary permissions, assign the Administrator role to
the created user.

## Permissions configuration

Copy the file `local.env.example` to `local.env` and setup correct credentials.

Note how `GOOGLE_CREDENTIALS` is commented. It is not possible to create a Service Account in an organisation so we'll
use the web login flow using Google Cloud SDK for the initial setup.

After the first setup a service account with credentials will be created and `GOOGLE_CREDENTIALS` will be able to be
configured.
