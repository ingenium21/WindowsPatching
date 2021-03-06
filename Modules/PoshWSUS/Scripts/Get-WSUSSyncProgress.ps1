function Get-WSUSSyncProgress {
    <#  
    .SYNOPSIS  
        Displays the current progress of a WSUS synchronization.
        
    .DESCRIPTION
        Displays the current progress of a WSUS synchronization.   
          
    .NOTES  
        Name: Get-WSUSSyncProgress
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
        
    .EXAMPLE
    Get-WSUSSyncProgress 

    Description
    -----------
    This command will show you the current status of the WSUS sync.
           
    #> 
    [cmdletbinding()]  
    Param ()
    Begin {    
        $sub = $wsus.GetSubscription()    
    }
    Process {
        #Gather all child servers in WSUS    
        $sub.GetSynchronizationProgress() 
    }   
}