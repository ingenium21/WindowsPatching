function Get-WSUSEmailConfig {
    <#  
    .SYNOPSIS  
        Retrieves the email notification configuration from WSUS.
        
    .DESCRIPTION
        Retrieves the email notification configuration from WSUS.
        
    .PARAMETER SendTestEmail
        Optional switch that will send a test email to the configured email addresses    
            
    .NOTES  
        Name: Get-WSUSEmailConfig
        Author: Boe Prox
        DateCreated: 24SEPT2010 
               
    .LINK  
        https://learn-powershell.net
        
    .EXAMPLE 
     Get-WSUSEmailConfig 
     
     Description
    -----------
    This command will display the configuration of the email notifications.
    
    .EXAMPLE 
    Get-WSUSEmailConfig -SendTestEmail    

    Description
    -----------
    This command will send a test email to the address or addresses in the To field.
           
    #> 
    [cmdletbinding()]
        Param(                          
            [Parameter(
                Position = 0,
                ValueFromPipeline = $False)]
                [switch]$SendTestEmail                   
                )     
    Begin {              
        $email = $wsus.GetEmailNotificationConfiguration()    
    }
    Process {
        If ($PSBoundParameters['SendTestEmail']) {
            $email.SendTestEmail()
            Write-Host -fore Green "Test email sent."
        } Else {
            $email
        } 
    }   
} 