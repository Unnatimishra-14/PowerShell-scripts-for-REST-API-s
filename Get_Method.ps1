
$AzureDevOpsPAT = "Mention your personal access token"
 $OrganizationName = "Mention your organization's name"
 $Project = "Mention the name of your project"
 $AzureDevOpsAuthenicationHeader = @{Authorization = 'Basic ' + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$($AzureDevOpsPAT)")) 
 "Content-Type" = "application/json"}
 $UriOrga = "https://dev.azure.com/$($OrganizationName)/$($Project)/"
 $uriAccount = $UriOrga + "_apis/git/repositories?api-version=7.1"

 $Get_method= Invoke-RestMethod -Uri $uriAccount -Method get -Headers $AzureDevOpsAuthenicationHeader
 $Get_Method
