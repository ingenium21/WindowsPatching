function Get-WSUSClientPerUpdate {
    <#  
    .SYNOPSIS  
        Gets collection of clients for specified update based on groupname or defined computer scope
        
    .DESCRIPTION
        Gets collection of clients for specified update based on groupname or defined computer scope
        
    .PARAMETER Update
        Name of the update to collect data on.          
        
    .PARAMETER GroupName
        Name of the group to perform query against. Will default to all groups if not used. 
    
    .PARAMETER IncludeChildGroup
        Includes child groups if using GroupName parameter
    
    .PARAMETER ComputerScope 
        Collection of computers that can be used for query
        
    .NOTES  
        Name: Get-WSUSClientPerUpdate
        Author: Boe Prox
        DateCreated: 23NOV2011 
               
    .LINK  
        https://learn-powershell.net
        
    .EXAMPLE    

    #> 
    [cmdletbinding(
    	ConfirmImpact = 'low',
        DefaultParameterSetName = 'ComputerScope'
    )]
    Param(
        [Parameter(Position = 0, ParameterSetName = '',ValueFromPipeLine = $True)]
        [Object]$Update,
        [Parameter(Position = 1, ParameterSetName = 'ComputerScope')]
        [Microsoft.UpdateServices.Administration.ComputerTargetScope]$ComputerScope,        
        [Parameter(Position = 1, ParameterSetName = 'Group')]
        [string]$GroupName,
        [Parameter(Position = 2, ParameterSetName = 'Group')]   
        [Switch]$IncludeChildGroup                                                                                                 
    )
    Begin {                
        $ErrorActionPreference = 'stop'
        $hash = @{}
    }
    Process {
        If ($PSBoundParameters['Update'] -is [string] -OR $PSBoundParameters['Update'] -is [int]) {
            Write-Verbose "Getting update object from string"
            $hash['UpdateObject'] = Get-WSUSUpdate -Update $Update
        } ElseIf ($PSBoundParameters['Update'] -is [Microsoft.UpdateServices.Internal.BaseApi.Update]) {
            Write-Verbose "Getting update object from object"
            $hash['UpdateObject'] = $Update
        } Else {
            Write-Warning "No update specified!"
            Break
        }
        If ($PSBoundParameters['GroupName']) {
            Write-Verbose "Gathering data from specified group"
            $hash['GroupObject'] = Get-WSUSGroup -Name $GroupName
            ForEach ($Object in $hash['UpdateObject']) {
                Try {
                    If ($PSBoundParameters['IncludeChildGroup']) {
                        $Object.GetUpdateInstallationInfoPerComputerTarget($hash['GroupObject'],$True)
                    } Else {
                        $Object.GetUpdateInstallationInfoPerComputerTarget($hash['GroupObject'],$False)
                    }
                } Catch {
                    Write-Warning ("{0}" -f $_.Exception.Message)
                }
            }
        } ElseIf ($PSBoundParameters['ComputerScope']) {
            Write-Verbose "Gathering data from all clients"
            ForEach ($Object in $hash['UpdateObject']) {
                Try {            
                    $Object.GetUpdateInstallationInfoPerComputerTarget($ComputerScope)
                } Catch {
                    Write-Warning ("{0}" -f $_.Exception.Message)
                } 
            }           
            
        } Else {
            Write-Warning "No Group or ComputerScope object specified!"
        }
    }  
    End {
        $ErrorActionPreference = 'continue'    
    } 
}