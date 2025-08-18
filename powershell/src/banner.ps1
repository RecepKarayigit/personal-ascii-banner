<#
.SYNOPSIS
    Horizontally aligns any number of ASCII art blocks while preserving leading spaces.

.DESCRIPTION
    This script allows you to define multiple ASCII art blocks.
    Each block is split into lines, padded to match its maximum width,
    and aligned horizontally with other blocks.
    Leading spaces are preserved for proper ASCII formatting.
#>
# cls
# -----------------------------
# Define ASCII art blocks
# -----------------------------
$logo=@"
⠀⠀⠀⣀⣀⣤⣴⣶⣶⣶⣦⡀⠀⠀⠀⠀
⠀⢠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀
⠀⣹⣿⣿⠿⠋⠙⠙⠙⠛⠛⢿⣿⣿⣿⡇
⢠⣿⣿⢃⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⡟
⢸⣿⡿⡆⠀⠀⠀⠀⠀⢀⡀⣀⠈⢻⣿⣿
⠐⣿⣿⣿⣿⣟⣷⡤⢴⣿⣿⣳⣿⠾⣿⡃
⠀⣿⣟⡟⠛⠃⢸⠇⠈⢎⠙⠃⡡⠀⡿⡕
⠀⢹⡧⡌⠁⠈⣯⣄⢀⡠⠻⡅⠀⢰⢣⠁
⠀⠀⠙⣽⡸⠻⣿⡛⣏⣓⡶⠛⠝⡈⠀⠀
⠀⠀⠀⢸⣵⡄⠂⠀⠄⠀⠀⣠⡾⡇⠀⠀
⠀⠀⠀⢰⡞⡿⣦⣀⣠⣠⡶⠏⠀⡇⠀⠀
⠀⠈⠈⠘⣯⠙⠌⠛⠋⠉⠀⠀⢀⡇⠀⠀
⠀⠀⠀⠀⣽⡄⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀
⠀⠀⠈⡀⣄⡏⠀⠀⠀⠀⠀⢠⠏⠃⠀⠀
⠀⠀⠀⠀⠉⠛⠓⠤⠠⠀⠁⠸⠈⠀⠀⠀
"@
$username="Recep Karayigit"
$LinkedinURL="https://www.linkedin.com/in/recep-karayigit/"
$GitHubURL="https://github.com/RecepKarayigit"

$figletUsername=figlet -f smkeyboard -c $username | Out-String
# $figletUsername=figlet -f block  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Cybermedium  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Georgia11  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Lockergnome  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Nancyj  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Speed  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f wetletter  -c "Recep Karayigit" | Out-String
# $figletUsername=figlet -f standard  "Recep Karayigit" | Out-String
# $figletUsername=figlet -f rowancap  "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Reverse  "Recep Karayigit" | Out-String
# $figletUsername=figlet -f Puffy  "Recep Karayigit" | Out-String
# $figletUsername=figlet -f larry3d  "Recep Karayigit" | Out-String
# $figletUsername=figlet -f henry3d  "Recep Karayigit" | Out-String

$DIVIDER="-" * 73
$VERTICAL_DIVIDER="   ||   "

$asciiArts = @(
@"
$logo
"@,
@"

$figletUsername
$DIVIDER
$DIVIDER

    Linkedin : $LinkedinURL
    Github   : $GitHubURL
"@
)

# -----------------------------
# Function to split ASCII art into lines and calculate max width
# -----------------------------
function Get-LinesAndMaxWidth {
    param([string]$asciiArt)

    # Split lines, preserve leading spaces
    $lines = $asciiArt -split "`r?`n"

    # Determine the maximum width of this ASCII art block
    $maxWidth = ($lines | ForEach-Object { $_.Length } | Measure-Object -Maximum).Maximum

    return @{ Lines = $lines; MaxWidth = $maxWidth }
}

# -----------------------------
# Process all ASCII arts
# -----------------------------
$processedArts = $asciiArts | ForEach-Object { Get-LinesAndMaxWidth $_ }

# -----------------------------
# Determine the maximum number of lines across all blocks
# -----------------------------
$maxLines = ($processedArts | ForEach-Object { $_.Lines.Length } | Measure-Object -Maximum).Maximum

# -----------------------------
# Function to pad lines to the maximum number of lines
# -----------------------------
function Pad-Lines {
    param (
        [string[]]$Lines,
        [int]$MaxLines
    )

    $padCount = $MaxLines - $Lines.Length
    if ($padCount -gt 0) {
        $Lines += (1..$padCount | ForEach-Object { "" })
    }
    return $Lines
}

# Pad all ASCII arts to have the same number of lines
foreach ($art in $processedArts) {
    $art.Lines = Pad-Lines $art.Lines $maxLines
}

# -----------------------------
# Horizontally combine all ASCII arts
# -----------------------------
$allText = ""
for ($i = 0; $i -lt $maxLines; $i++) {
    $line = ""
    foreach ($art in $processedArts) {
        # Trim right spaces and pad to max width
        $line += $art.Lines[$i].TrimEnd().PadRight($art.MaxWidth) + $VERTICAL_DIVIDER 
    }
    $allText += $line + "`n"
}
# Write-Host $allText
$allText | lolcat


