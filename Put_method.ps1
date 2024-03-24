$AzureDevOpsPAT = "Mention your personal access token"
$OrganizationName = "Mention your organization's name"
$Project = "Mention the name of your project"
$WorkItemId = "112"  




$UriOrganization = "https://dev.azure.com/$($OrganizationName)/"
$UriWorkItem = $UriOrganization + $ProjectName + "/_apis/wit/workitems/$($WorkItemId)?api-version=5.1"


$UpdateBody = @{
    op    = "replace"
    path  = "/fields/System.Title"
    value = "New Title"
}
$JsonDocument = $UpdateBody | ConvertTo-Json -Depth 10



    $response = Invoke-RestMethod -Uri $UriWorkItem -Headers @{
            Authorization = "Basic {0}" -f [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($AzureDevOpsPAT)"))
            "Content-Type" = "application/json" 
        } -Method Put -Body $JsonDocument
    Write-Output $response



