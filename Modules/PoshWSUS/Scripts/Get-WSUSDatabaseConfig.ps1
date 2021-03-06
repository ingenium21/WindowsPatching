function Get-WSUSDatabaseConfig {
    <#  
    .SYNOPSIS  
        Displays the current WSUS database configuration.
    .DESCRIPTION
        Displays the current WSUS database configuration.
    .NOTES  
        Name: Get-WSUSDatabaseConfig
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE 
    Get-WSUSDatabaseConfig 

    Description
    -----------  
    This command will display the configuration information for the WSUS connection to a database.       
    #> 
    [cmdletbinding()]  
    Param () 
    Process {
        $wsus.GetDatabaseConfiguration()      
    }
} 