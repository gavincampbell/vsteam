# Changelog

## 6.3.2

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/182) from [eosfor](https://github.com/eosfor) which included the following:

Invalidate cache on account change

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/181) from [Michael Erpenbeck](https://github.com/GitMje) which included the following:

Fixed typo in README.md file for better readability

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/179) from [Jim W](https://github.com/Seekatar) which included the following:

Add PSDrive support for memberships

- Memberships
  - Groups
    - Group1
  - Users
    - User1

## 6.3.1

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/178) from [Jim W](https://github.com/Seekatar) which included the following:

- Add-VSTeamMembership
- Remove-VSTeamMembership
- Get-VSTeamMembership
- Test-VSTeamMembership

## 6.3.0

Added support for the following:

- Update-VSTeamReleaseDefinition

Also added Raw and JSON support to the Get-VSTeamReleaseDefinition.
The shape of the object returned by Get-VSTeamReleaseDefinition was slightly changed.
Release definitions was added to the SHiPS provider.

## 6.2.9

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/176) from [Carlo Wahlstedt](https://github.com/carlowahlstedt) which included the following:

Updated help to refer to Add-VSTeamProfile instead of Set-VSTeamProfile

## 6.2.8

Added support for Get-VSTeamJobRequest. The provider was extended to show the Job Request under the Agent.

- Account
  - Agent Pools
    - Pool1
      - Agent1
        - JobRequest1

## 6.2.7

Added support for -Raw and -Json on Get-VSTeamBuildDefinition so the objects and/or JSON can be returned in Update-VSTeamBuildDefinition.

This was added so users can update Build variables from one stage to pass to the next.

```PowerShell
$b = Get-VSTeamBuildDefinition 12 -Raw
Add-VSTeamBuildDefinition -InFile $b
```

Also merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/170) from [Ignacio Galarza, Jr.](https://github.com/ignatz42) which included the following:

Added functions to deal with variable groups

- Added Add-VSTeamVariableGroup to add new variable groups.
- Added Get-VSTeamVariableGroup to get variable groups.
- Added Update-VSTeamVariableGroup to update variable groups
- Added Remove-VSTeamVariableGroup to remove variable groups

## 6.2.6

Added Update-VSTeamRelease.
Added support for -Raw and -Json on Get-VSTeamRelease so the objects and/or JSON can be returned in Update-VSTeamRelease.

This was added so users can update release variables from one stage to pass to the next.

```PowerShell
$r = Get-VSTeamRelease $(Release.ReleaseId) -Raw
$r.variables.DEPLOYMENT_CONFIG.value = "test123"
Update-VSTeamRelease $(Release.ReleaseId) -Release $r
```

See the help of Update-VSTeamRelease for more examples.

## 6.2.5

Polished the docs.

## 6.2.4

Added code to log error if -UseWindowsAuthentication is used to connect to Azure DevOps Services. -UseWindowsAuthentication is only for connecting to TFS or Azure DevOps Server.

## 6.2.3

Fixes issue [Get-VSTeamAccessControlList -IncludeExtendedInfo. Cannot convert value PSCustomObject to type Hashtable #159](https://github.com/DarqueWarrior/vsteam/issues/159)

## 6.2.2

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/158) from [Ryan](https://github.com/RPhay) which included the following:

Fixes issue [Get-VSTeamBuildDefinition fails #155](https://github.com/DarqueWarrior/vsteam/issues/155)

## 6.2.1

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/156) from [Daniel Sturm](https://github.com/danstur) which included the following:

Corrects error creating VSTeamBuildDefinitionProcessPhase object in later versions of Azure DevOps Server (TFS).

## 6.2.0

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/144) from [Michel Zehnder](https://github.com/MichelZ) which included the following:

Added functions to deal with Security
Note: Some of these are only supported in Azure DevOps (Online), not TFS and Azure DevOps Server due to unavailable APIs

- Added Get-VSTeamSecurityNamespace to retrieve security namespaces
- Added Add-VSTeamAccessControlEntry to add low level ACE's
- Added Get-VSTeamAccessControlList to retrieve ACL's
- Added Add-VSTeamAccessControlList to add ACL's
- Added Add-VSTeamWorkItemIterationPermission
- Added Get-VSTeamClassificationNode
- Added Get-VSTeamUser (see breaking changes below)
- Added Add-VSTeamWorkItemAreaPermission
- Added Add-VSTeamProjectPermission

**Breaking changes**:

- Renamed Get-VSTeamUser to Get-VSTeamUserEntitlement
- Renamed Add-VSTeamUser to Add-VSTeamUserEntitlement
- Renamed Update-VSTeamUser to Update-VSTeamUserEntitlement
- Added new Get-VSTeamUser cmdlet retrieving more data about the User itself

## 6.1.3

Fixed typos in Set-VSTeamAlias function.

## 6.1.2

Fixed issued with version 5.0 REST API JSON object for build definition. jobCancelTimeoutInMinutes appears to have moved to the build definition from the phase.

## 6.1.1

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/147) from [Joakim Bick](https://github.com/minimoe) which included the following:

Fix interacting with large GIT repositories without hitting integer overflow.

## 6.1.0

The AzD API now defaults to the 5.x versions.

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/140) from [Michel Zehnder](https://github.com/MichelZ) which included the following:

Added Get-VSTeamGroup to retrieve Groups
Added Get-VSTeamDescriptor to resolve ID's to Descriptors

**Breaking changes**:

Replaced the -Release parameter of Get-VSTeamOption with -SubDomain parameter so any domain can be used.

## 6.0.1

Fixing issue with mapping drive.

You can now use Set-VSTeamAccount with Invoke-Expression to switch accounts and map a drive on a single line. i.e.:

Set-VSTeamAccount -Profile Test -Drive t | iex

This will switch to the account in the Test profile and map a drive t: to the account.

## 6.0.0

Each function is now broken out into a separate file. The folder structure was changed with the core content moved into the Source folder. All the PSM1's were moved to PS1's files.  There is now a single PSM1 now.

**Breaking changes**:
All the aliases have been removed. If you want to use the old aliases run Set-VSTeamAlias. They were removed due to conflicts with other modules.

The VSTeamVersions class is no longer exported. To set versions you must use Set-VSTeamAPIVersion.

Parameters for Set-VSTeamAPIVersion have been changed. The Version parameter has been re-purposed to set the version of a single service. To set all the version for a particular version of TFS or AzD set use the Target parameter.

Add-VSTeamAccount has been changed to Set-VSTeamAccount the ata alias is now mapped to Set-VSTeamAccount. To use the alias you must run Set-VSTeamAlias.

Changing the PAT parameter to SecurePersonalAccessToken of Set-VSTeamAccount.

## 5.0.2

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/129) from [Adam Murray](https://github.com/muzzar78) which included the following:

- Added ParentId parameter to Add-VSTeamWorkItem to allow the parent work item to be set

## 5.0.1

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/128) from [Fifth Street Partners](https://github.com/fifthstreetpartners) which included the following:

- Added Get-VSTeamProcess
- Modified Add-VSTeamProcess to allow for any Process Template to be used

## 5.0.0

**Breaking changes**:
Project name is no longer a parameter to Get-VSTeamWorkItem

Added Update-VSTeamWorkItem. You can update the following:

- Title
- Description
- IterationPath
- AssignedTo

Exposed the following properties on work item type:

- Description
- IterationPath
- AssignedTo

Fixed bug where you could not add a work item if you only provided the title.
Fixed bug where you could not get a work item by id.

## 4.0.13

Updated readme to Azure DevOps and Azure DevOps Server.

Updated the help file to fix syntax errors on some of the functions.

## 4.0.12

Fixed bug where Get-VSTeamGitRepository was failing if you did not provide a project name.  Now you can run without a project and get all the repositories for the entire organization.

## 4.0.11

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/111) from [Brian Schmitt](https://github.com/brianschmitt) which included the following:

- Adding better error handling when response is null

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/108) from [Richard Diphoorn](https://github.com/rdtechie) which included the following:

- Added description, iteration path and assigned to, on Work items

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/110) from [Guillaume Pugnet](https://github.com/GPugnet) which included the following:

- Add-VSTeamExtension
- Get-VSTeamExtension
- Remove-VSTeamExtension
- Update-VSTeamExtension

## 4.0.10

Fixed bug where you could not add a build by build definition name.

## 4.0.9

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/102) from [Brian Schmitt](https://github.com/brianschmitt) which included the following:

- Get-VSTeamPullRequest
- Show-VSTeamPullRequest

## 4.0.8

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/93) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- replaced {accountname}.visualstudio.com with dev.azure.com/{accountname}

## 4.0.7

Setting the Top to 10,000 when searching by email in Update-VSTeamUser. If you have a large number of users you should use by ID instead of by email. This addresses issue [90](https://github.com/DarqueWarrior/vsteam/issues/90).

## 4.0.6

Fixed bug where you could not Tab complete the build definition name when calling Add-VSTeamBuild.

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/92) from [Olivier](https://github.com/hangar18rip) which included the following:

- Added the Demands property to the VSTeamBuildDefinition type

## 4.0.5

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/89) from [Guillaume Pugnet](https://github.com/GPugnet) which included the following:

- old license was not populated when updating a user by id

## 4.0.4

Fixed bug where the version would not be saved when storing account at User or Admin level. When you started a new PowerShell the account would load but the version would always be TFS2017.  Now it loads correctly.

## 4.0.3

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/84) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- converted VSTeamQueue from format/type to class

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/86) from [Denny](https://github.com/dvankleef) which included the following:

- Added update User. Currently only can update license type

## 4.0.2

Added Remove-VSTeamFeed

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/82) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- removed output of objects returned from API to avoid misleading outputs for consumers
- added GitRepository object to BuildDefinition
- had to add a [VSTeamProjectCache]::timestamp = -1 to VSTeamAccount constructor after experiencing blocking with New-PSDrive -Name V -PSProvider SHiPS -Root 'VSTeam#VSTeamAccount' -Verbose; Get-VSTeamBuildDefinition -ProjectName someProject

## 4.0.1

You can now list and add package management feeds.

Added Add-VSTeamNuGetEndpoint

## 4.0.0

**Breaking changes**:
The @VSTeamVersionTable was removed and replaced with a static VSTeamVersions class.  This allows the values to flow between the provider and the rest of the functions in the module.

Due to this breaking change _Get-VSTeamAPIVersion_ was added to review the current version being used.

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/77) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- Build Definition / Process / Phases / Steps are broken down into separate objects

```PowerShell
(Get-VSTeamBuildDefinition -ProjectName MyProject -Id 42).Process
(Get-VSTeamBuildDefinition -ProjectName MyProject -Id 42).Process.Phases
(Get-VSTeamBuildDefinition -ProjectName MyProject -Id 42).Process.Phases[0].Steps
(Get-VSTeamBuildDefinition -ProjectName MyProject -Id 42).Process.Phases[0].Steps[0]
```

## 3.0.7

Removed some common code and took dependency on Trackyon.Utils that did the same things.

## 3.0.6

Added Update-VSTeamProfile to allow easy updating of the PAT for each profile.

## 3.0.5

Merged [Pull Request 70](https://github.com/DarqueWarrior/vsteam/pull/70) and [Pull Request 72](https://github.com/DarqueWarrior/vsteam/pull/72) from [Geert van der Cruijsen](https://github.com/Geertvdc) which included the following:

- Added a function to remove vsts agents from a pool by calling Remove-Agent or Remove-VSTeamAgent
- Disable & Enable agents in pool

Add [Pull Request 70](https://github.com/DarqueWarrior/vsteam/pull/71) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- Integration tests for Build Definitions

## 3.0.4

The ProjectName dynamic parameter that enables Tab Complete of project names was getting called approximately 20 times when tab completing a function name. To reduce the number of calls a rudimentary cache was put in place.

## 3.0.3

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/66) from [Kai Walter](https://github.com/KaiWalter) which included the following:

- Updated integration tests to account for the new hosted agent pool.

Also added Pool and Agent to the Provider so you can now navigate pools and agents with Get-ChildItem (ls, dir).

Account

- Agent Pools
  - Pool1
    - Agent1
- Project1
- Project2
  - Builds
    - Build1
    - Build2
  - Releases
    - Release1
      - Environment 1
        - Attempt 1
          - Task1
          - Task2
          - Task3
    - Release2
  - Teams
    - Team1
    - Team2
  - Repositories
    - Repository1
      - Ref1
      - Ref2

## 3.0.2

Added Get-VSTeamGitRef to retrieve the branches for adding Pull Request support in the future.

Also added Git Repositories and Git Refs to the Provider so you can now navigate repositories and refs with Get-ChildItem (ls, dir).

Account

- Project1
- Project2
  - Builds
    - Build1
    - Build2
  - Releases
    - Release1
      - Environment 1
        - Attempt 1
          - Task1
          - Task2
          - Task3
    - Release2
  - Teams
    - Team1
    - Team2
  - Repositories
    - Repository1
      - Ref1
      - Ref2

Polished the classes defined for the provider. Also updated some of the functions to return the same classes as the provider.  The classes all have a hidden _internalObj property that contains the raw object returned from the REST API call. Not all the properties of the object are exposed via properties of the class. This property will provide access to them if you need them.

Updated the format.ps1xml files to show more data when the provider is used and to format the provider output to be more consistent with a normal file system. The + and . modes were replaced with d----- and ----- for directories and leafs.

Added a lot of new tests that pushed th code coverage to 99.69%.

## 3.0.1

Huge review of the docs and added support for bearer auth.

Bearer auth will allow you to use the OAuth token created by VSTS during your build and release and not have to create a PAT. Just check the 'Allow scripts to access OAuth token' option on your phase. Then you can add an account by using the -UseBearerToken switch and passing in the $(System.AccessToken) variable.

```PowerShell
Set-VSTeamAccount -Account mydemos -Token $(System.AccessToken) -UseBearerToken
```

The token is scoped to only allow access to the account running the build or release. To access other accounts you will have to use a personal access token.

## 3.0.0

There is a breaking change with calls to Add-VSTeamKubernetesEndpoint. The acceptUntrustedCerts and generatePfx parameters have been changed from boolean to switch. So any calls that contained:

```powershell
-acceptUntrustedCerts $true -generatePfx $true
```

can be replaced with:

```powershell
-acceptUntrustedCerts -generatePfx
```

There is no need to pass $true.  For calls where you passed $false simply remove the parameter from the call.

This release also contains functions to add a work item and query the work item types. You can not edit the work items yet.

```powershell
Add-VSTeamWorkItem -ProjectName test -WorkItemType Task -Title Test
```

Additional change in this release include more unit tests which resulted in much higher code coverage.

## 2.1.14

- Started adding support for work items.
  - List work item types
  - Get a single work item type

## 2.1.13

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/50) from [Markus Blaschke](https://github.com/mblaschke) which included the following:

- Added functions for handling of service endpoints:
  - Add-VSTeamKubernetesEndpoint
  - Add-VSTeamServiceEndpoint
  - Update-VSTeamServiceEndpoint

## 2.1.12

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/51) from [Steve Croxford](https://github.com/CodedBeard) which included the following:

- Added support for creating service fabric endpoints.

## 2.1.11

Updated the delete confirmation message for Remove-VSTeamUser to show the user name and email instead of ID.

## 2.1.10

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/46) from [Michal Karpinski](https://github.com/karpis) which included the following:

- Added -SourceBranch parameter to Add-VSTeamBuild

## 2.1.9

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/44) from [Michal Karpinski](https://github.com/karpis) which included the following:

- Added functions for querying TFVC branches:
  - Get-VSTeamTfvcRootBranch
  - Get-VSTeamTfvcBranch

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/45) from [Michal Karpinski](https://github.com/karpis) which included the following:

- Added ability to pass parameters when queueing builds

## 2.1.8

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/38) from [Jeffrey Opdam](https://github.com/jeffrey-opdam) which included the following:

- Added support for assigner to be a group, when requesting approvals for a group

## 2.1.7

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/42) from [Michal Karpinski](https://github.com/karpis) which included the following:

- Added a function for updating an existing build definition from an input json file

## 2.1.6

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/39) from [Francisco Cabral](https://github.com/franciscocabral) which included the following:

- Fix GET Approval filter by release ids

## 2.1.5

Fixed issue [#40](https://github.com/DarqueWarrior/vsteam/issues/40) so adding a SonarQube or AzureRM Service Endpoint returns the endpoint.

## 2.1.4

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/37) from [David Roberts](https://github.com/davidroberts63) which included the following:

- Add functions to get/edit code policies

## 2.1.3

Added support for Service Endpoint Types
Updated the ValidateSet for StatusFilter of Approvals

## 2.1.2

Fixed issue [#36](https://github.com/DarqueWarrior/vsteam/issues/36) so all git repositories are returned when you do not provide an project.

## 2.1.1

Removed the External Module Dependencies so SHiPS is installed with the module.

## 2.1.0

Lots of code refactoring and clean up.

Replaced Add-VSTeamReleaseEnvironment with Set-VSTeamEnvironmentStatus.

## 2.0.2

Pushed VSTeamVersionTable to global scope.

Added ReleaseId to release

Added Add-VSTeamUser

Added Invoke-VSTeamRequest. You can now call any REST API supported by TFS2017, TFS2018 or VSTS.

## 2.0.1

The module now has a dependency on SHiPS for PSDrive support.

You must be running 6.0.0-rc or later on Mac and Linux.
You must be running 5.1.16299.64 or later on Windows.

Added drive support created by [Stefan Stranger](https://github.com/stefanstranger). You can now use the -Drive parameter of Set-VSTeamAccount to mount a PSDrive to your account.

You can now tab complete your profiles.

## 1.0.5

Added support for Profiles. Now you can store different accounts and PATS as a profile using Add-VSTeamProfile. Then you can call Set-VSTeamAccount with the -Profile parameter and the PAT will be read from the profile. This prevents you having to remember the PAT to switch between accounts. Profiles also store the API version to use with the account.

Added $Global:VSTeamVersionTable so you can experiment with different versions of the VSTS/TFS APIs. The variable contains the following:

- 'Build'           = '3.0'
- 'Release'         = '3.0-preview'
- 'Core'            = '3.0'
- 'Git'             = '3.0'
- 'DistributedTask' = '3.0-preview'

You can update the version so try new versions of APIs. See Set-VSTeamAPIVersion.

## 1.0.4

Added support for Show-VSTeam that opens the configured TFS or VSTS in default browser.

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/26) from [Michel Perfetti](https://github.com/miiitch) which included the following:

- Remove deadlock when endpoint creation failed

## 1.0.3

Explicit export of alias
Fixed typo in help
Fixed typo in export of function
Changed projectName dynamic parameter to return projects in any state instead of just well-formed.

## 1.0.2

Added Show-VSTeam* functions

Fixed ReleaseDefinition functions not recognized bug

## 1.0.1

Renamed from Team to VSTeam. An alias for every function with it's original name is provided.

## 0.1.34

Added support to queue a build by ID using the Add-VSTeamBuild function. The Add-VSTeamBuild function also fully qualifies the names of build definitions when you tab complete from command line.

I added new full name extended property to build definition type.

Added support so you can update a project by ID as well as by Name.

## 0.1.33

The variable to test if you are on Mac OS changed from IsOSX to IsMacOS. Because I have Set-StrictMode -Version Latest trying to access a variable that is not set will crash.

## 0.1.32

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/16) from [Fergal](https://github.com/ObsidianPhoenix) which included the following:

- Added Support for Build Tags
- Added the ability to update KeepForever, and the Build Number
- Added the ability to pull artifact data from the build

## 0.1.31

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/17) from [Kees Verhaar](https://github.com/KeesV) which included the following:

- Add ProjectName as a property on team member so it can be used further down the pipeline

## 0.1.30

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/15) from [Kees Verhaar](https://github.com/KeesV) which included the following:

- Add support for teams

## 0.1.29

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/12) from [Andy Neillans](https://github.com/aneillans) which included the following:

- Fixed for on-premise URLS being incorrectly classed as VSTS accounts
- Fixed for projects validation if you have more than 100 projects

## 0.1.28

Added ID to approval default output

## 0.1.27

Clearing code analysis warnings

## 0.1.26

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/10) from [Roberto Peña](https://github.com/eulesv) which included the following:

- Adding a regular expression to validate VSTS account

## 0.1.25

- Moved -Expand parameter of Get-VSTeamRelease to all parameter sets.

## 0.1.24

- Added support so you can start a release from a Git commit

## 0.1.23

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/8) from [Michel Perfetti](https://github.com/miiitch) which included the following:

- Support for the [SonarQube extension](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarqube)

## 0.1.22

- Fixed bug in Set-VSTeamDefaultProject on Mac and Linux

## 0.1.21

- Added Get-VSTeamBuildLog that returns the logs of the provided build

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/6)from [Michel Perfetti](https://github.com/miiitch) which included the following:

- Added serviceEndpoint parameters to Add-VSTeamAzureRMServiceEndpoint cmdlet: if the serviceEndPoint parameters are not specified, the Automatic mode is used
- The _trackProgress function was changed too to reflect the return code of the api [endpoints](https://www.visualstudio.com/en-us/docs/integrate/api/endpoints/endpoints)
- The URL in the payload changed to [https://management.azure.com](https://management.azure.com)

## 0.1.19

Removed test folder from module

## 0.1.18

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/5) from [Christopher Mank](https://github.com/ChristopherMank) which included the following:

- Created new function in the release module named 'Add-VSTeamReleaseEnvironment'. New function deploys an environment from an existing release.

## 0.1.16

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/4) from [Andy Neillans](https://github.com/aneillans) which included the following:

- Bug fix for broken PAT code handling.

## 0.1.15

Merged [Pull Request](https://github.com/DarqueWarrior/vsteam/pull/3) from [Andy Neillans](https://github.com/aneillans) which included the following:

- Corrected typos in help files.
- Refactored location of common methods.
- Implemented using DefaultCredentials when using TFS.  This removes the need to create a PAT.

## 0.1.14

Initial Open Source release
