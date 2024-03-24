$AzureDevOpsPAT = "Mention your personal access token"
$OrganizationName = "Mention your organization's name"
$Project = "Mention the name of your project"
$WorkItemType = "task"
$WorkItemTitle = "API_test"


$AzureDevOpsAuthenicationHeader = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($AzureDevOpsPAT)")) }
$UriOrganization = "https://dev.azure.com/$($OrganizationName)/"

$uri = $UriOrganization + $Project + "/_apis/wit/workitems/$" + $WorkItemType + "?api-version=5.1"
$body="[
  {
    `"op`": `"add`",
    `"path`": `"/fields/System.Title`",
    `"value`": `"$($WorkItemTitle)`"
  }
]"

Invoke-RestMethod -Uri $uri -Method POST -Headers $AzureDevOpsAuthenicationHeader -ContentType "application/json-patch+json" -Body $body