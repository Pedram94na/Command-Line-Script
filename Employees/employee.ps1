# This PowerShell script is for the 2nd Task of the third homework.
# I made and uploaded EmpInfo.txt
# Using EmpInfo.txt as a parameter, this PowerShell script will do the following:

#-----------------------------------------------------------------------------
#a) Give the workers who are working as barman (only the names), if none, write "NONE".
Write-Output ""

$file = Get-Content $args

Write-Output "Name of those who are working as barman:"

$barmanCheck = $false
foreach ($i in $file)
{
    if ($i.Split(",") -eq 'barman')
    {
        $i.Split(",")[0]
        
        $barmanCheck = $true
    }
}

if ($barmanCheck -eq $false)
{
    Write-Output "NONE"
}

#-----------------------------------------------------------------------------
#b) Who has at least 3 jobs? (list of names)
Write-Output ""

Write-Output "Name of the workers who have at least 3 jobs:"

$foundOne = $false
foreach ($i in $file)
{
    $length = $i.Split(",").Length

    for ($j = 1; $j -lt $length; $j++)
    {
        if ($j -eq 3)
        {
            $i.Split(",")[0]
            $foundOne = $true
        }
    }
}

if ($foundOne -eq $false)
{
    Write-Output "NONE"
}

#-----------------------------------------------------------------------------
#c) Read in a job type and give how many people are in that position.
Write-Output ""

$input = Read-Host "Enter a job type"
$count = 0

Write-Output "Number of people who work as a(n) $input :"
foreach ($i in $file)
{
    if ($i.Split(", ") -eq $input)
    {
        $count++
    }
}

Write-Output $count