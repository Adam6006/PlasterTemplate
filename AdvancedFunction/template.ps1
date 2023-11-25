<%
"function $PLASTER_PARAM_FunctionName {"
@'
<#
    .SYNOPSIS
        [Synopsis Here]

    .DESCRIPTION
        [Description Here]

    .EXAMPLE
        [Example of how to Run Script]

#>
'@
%>

<%
    if ($PLASTER_PARAM_ComputerName -eq 'Yes') {
        @'
    [CmdletBinding()]
    Param(
        [Parameter(
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            Position=0,
            HelpMessage='Enter the name of the computer you would like to target.')]
        [ValidateLength(3,30)]
        [string[]]
        $ComputerName
    )
'@
    }else{
        @'
    [CmdletBinding()]
    Param(

    )
'@
    }
%>
<%
    if ($PLASTER_PARAM_PipelineSupport -eq 'Yes') {
        @'

    BEGIN {
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] BEGIN SECTION STARTED"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] Starting:  $($MyInvocation.MyCommand)"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] Computer:  $env:COMPUTERNAME"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] User:      $($env:userdomain)\$($env:USERNAME)"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] Host:      $($host.Name)"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] PSVersion: $($PSVersionTable.PSVersion)"
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  BEGIN  ] BEGIN SECTION COMPLETED"
    } # BEGIN

    PROCESS {
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  PROCESS] PROCESS SECTION STARTED"
'@
    }
%>

<%
    if ($PLASTER_PARAM_ComputerName -eq 'Yes')
    {
        @'
        ForEach ($computer in $ComputerName) {

        } # ForEach
'@
    }
%>

<%
    if ($PLASTER_PARAM_PipelineSupport -eq 'Yes')
    {
        @'
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  PROCESS] PROCESS SECTION COMPLETED"
    } # PROCESS

    END {
        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  END    ] END SECTION STARTED"

        Write-Verbose "[$((Get-Date).TimeOfDay.ToString())  END    ] END SECTION COMPLETED"
    } # END

} # function
'@
    }
    else {
        @'
} # function
'@
    }
%>