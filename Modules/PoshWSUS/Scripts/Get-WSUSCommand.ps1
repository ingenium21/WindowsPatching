function Get-WSUSCommand {
    <#  
    .SYNOPSIS  
        Lists all WSUS functions available from this module.
    .DESCRIPTION
        Lists all WSUS functions available from this module.    
    .NOTES  
        Name: Get-WSUSCommand
        Author: Boe Prox
        DateCreated: 18Oct2010 
               
    .LINK  
        https://learn-powershell.net
    .EXAMPLE 
    Get-WSUSCommands 

    Description
    -----------
    This command lists all of the available WSUS commands in the module.      
    #> 
    [cmdletbinding()]  
    Param () 

    #List all WSUS functions available
    Get-Command -Module PoshWSUS
}