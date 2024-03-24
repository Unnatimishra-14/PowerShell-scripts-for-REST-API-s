$AzureDevOpsPAT = "Mention your personal access token"
 $OrganizationName = "Mention your organization's name"
 $Project = "Mention the name of your project"
$WorkItemId = "Mention the work item ID"

 # Replace with the ID of the work item you want to update
 $UriOrganization = "https://dev.azure.com/$($OrganizationName)/"
 $UriWorkItem = $UriOrganization + $Project + "/_apis/wit/workitems/$($WorkItemId)?api-version=5.1"
 
# Construct a JSON Patch document for partial update
$JsonPatchDocument = @(
    @{
        op    = "test"
        path  = "/rev"
        value = "3"
    },
    @{
        op    = "replace"
        path  = "/fields/System.Title"
        value = "Patch test"
    }
) | ConvertTo-Json -Depth 10

$AzureDevOpsAuthenicationHeader = @{
    Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($AzureDevOpsPAT)"))
    "Content-Type" = "application/json-patch+json"
}

try {
    $response = Invoke-RestMethod -Uri $UriWorkItem -Method Patch -Headers $AzureDevOpsAuthenicationHeader -Body $JsonPatchDocument -ErrorAction Stop
    Write-Output "Work item title updated successfully."
    Write-Output $response
} catch {
    Write-Error "Error updating work item title: $_"
}
