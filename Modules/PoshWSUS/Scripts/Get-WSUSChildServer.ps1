function Get-WSUSChildServer {
    <#  
    .SYNOPSIS  
        Retrieves all WSUS child servers.
    .DESCRIPTION
        Retrieves all WSUS child servers.
    .NOTES  
        Name: Get-WSUSChildServer
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE  
    Get-WSUSChildServer

    Description
    ----------- 
    This command will display all of the Child WSUS servers.
           
    #> 
    [cmdletbinding()]  
    Param ()
    Process { 
        #Gather all child servers in WSUS    
        $wsus.GetChildServers()
    }
}