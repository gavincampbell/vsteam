function Get-VSTeamReleaseDefinition {
   [CmdletBinding(DefaultParameterSetName = 'List')]
   param(
      [Parameter(ParameterSetName = 'List')]
      [ValidateSet('environments', 'artifacts', 'none')]
      [string] $Expand = 'none',
      
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw', ValueFromPipelineByPropertyName = $true)]
      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson', ValueFromPipelineByPropertyName = $true)]
      [Parameter(Mandatory = $true, ParameterSetName = 'ByID', ValueFromPipelineByPropertyName = $true)]
      [Alias('ReleaseDefinitionID')]
      [int[]] $Id,

      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdJson')]
      [switch]$JSON,

      [Parameter(Mandatory = $true, ParameterSetName = 'ByIdRaw')]
      [switch]$raw
   )

   DynamicParam {
      _buildProjectNameDynamicParam
   }

   process {
      Write-Debug 'Get-VSTeamReleaseDefinition Process'

      # Bind the parameter to a friendly variable
      $ProjectName = $PSBoundParameters["ProjectName"]

      if ($id) {
         foreach ($item in $id) {
            $resp = _callAPI -subDomain vsrm -Area release -resource definitions -Version $([VSTeamVersions]::Release) -projectName $projectName -id $item

            if ($JSON.IsPresent) {
               $resp | ConvertTo-Json -Depth 99
            }
            else {
               if (-not $raw.IsPresent) {
                  $item = [VSTeamReleaseDefinition]::new($resp, $ProjectName)
                  
                  Write-Output $item
               }
               else {
                  Write-Output $resp
               }
            }
         }
      }
      else {
         $listurl = _buildRequestURI -subDomain vsrm -Area release -resource 'definitions' -Version $([VSTeamVersions]::Release) -projectName $ProjectName

         if ($expand -ne 'none') {
            $listurl += "&`$expand=$($expand)"
         }

         # Call the REST API
         $resp = _callAPI -url $listurl

         $objs = @()

         foreach ($item in $resp.value) {
            $objs += [VSTeamReleaseDefinition]::new($item, $ProjectName)
         }

         Write-Output $objs
      }
   }
}