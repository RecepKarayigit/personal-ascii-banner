# 🎨 Personal ASCII Banner

This repository contains a custom PowerShell script that generates a **personal ASCII art banner** using **Figlet** and **lolcat**.
It allows horizontal alignment of multiple ASCII art blocks while preserving spacing and formatting, making it perfect for CLI banners and personal branding.

---

## 📜 Script Overview

Key elements included in the script:

- **Logo Block** → Custom ASCII art logo
- **Username Block** → Generated with `figlet`
- **Divider Lines** → Visually separate sections
- **Contact Information** → LinkedIn & GitHub links
- **Horizontal Alignment** → Ensures all blocks are aligned side by side

Example snippet from the script:

```powershell
$logo = @"$VERTICAL_DIVIDER="   ||   "
  <your ASCII logo here>
"@

$username   = "Recep Karayigit"
$LinkedinURL = "https://www.linkedin.com/in/recep-karayigit/"
$GitHubURL   = "https://github.com/RecepKarayigit"

$figletUsername = figlet -f smkeyboard -c $username | Out-String
$DIVIDER = "-" * 73
$VERTICAL_DIVIDER="   ||   "
```

---

## 🚀 Features

- ✅ Customizable ASCII logo and text
- ✅ Horizontal alignment of multiple ASCII art blocks
- ✅ Preserves leading spaces for proper ASCII formatting
- ✅ Divider and structured layout for readability
- ✅ Colored output using [lolcat](https://github.com/busyloop/lolcat)
- ✅ Ready to use as a personal or professional CLI banner

---

## 📸 Example Output

Run the script:

```powershell
pwsh ./banner.ps1
```

Example result:

```
[figlet-smkeyboard](sample\images\smkeyboard.png)
[figlet-block](sample\images\figlet-block.png)
[figlet-Cybermedium](sample\images\figlet-Cybermedium.png)
[figlet-Georgia11](sample\images\figlet-Georgia11.png)
[figlet-henry3d](sample\images\figlet-henry3d.png)
[figlet-larry3d](sample\images\figlet-larry3d.png)
[figlet-Lockergnome](sample\images\figlet-Lockergnome.png)
[figlet-Nancyj](sample\images\figlet-Nancyj.png)
[figlet-puffy](sample\images\figlet-puffy.png)
[figlet-reverse](sample\images\figlet-reverse.png)
[figlet-rowancap](sample\images\figlet-rowancap.png)
[figlet-Speed](sample\images\figlet-Speed.png)
[figlet-standard](sample\images\figlet-standard.png)
[figlet-wetletter](sample\images\figlet-wetletter.png)
```

## 🔧 Requirements

- [PowerShell 7+](https://learn.microsoft.com/powershell/)
- [Figlet](http://www.figlet.org/)
- [lolcat](https://github.com/busyloop/lolcat)

### Install Figlet (Windows example with Scoop)

```powershell
scoop install figlet
```

### Install lolcat

```powershell
gem install lolcat
```

### For Additional fonts

- Download https://github.com/xero/figlet-fonts.git and paste it into %USERPROFILE%\scoop\apps\figlet\current\fonts

---

## ▶️ Usage

Run the script from PowerShell:

```powershell
pwsh ./banner.ps1
```

You can customize the ASCII art text or fonts by editing the `$figletUsername` variable inside the script.

---

## 🎨 Creating Your Own ASCII Art

You can generate custom ASCII art with online tools and paste it into the script:

- [Dot Art Generator](https://emojicombos.com/dot-art-generator)
- [Image to ASCII Converter](https://www.asciiart.eu/image-to-ascii)

Simply copy the output from these tools and insert it into the `$logo` variable or `$asciiArts` array.

---

## ⚡ Make It Your Default PowerShell Startup Banner

If you want this banner to appear every time you open PowerShell:

1. Find your PowerShell profile path:

   ```powershell
   $PROFILE
   ```

2. Open the profile file (create if it doesn’t exist):

   ```powershell
   notepad $PROFILE
   ```

3. Add this line at the end:

   ```powershell
   pwsh "<path-to-your-repo>\\banner.ps1"
   ```

4. Save and restart PowerShell — your ASCII banner will now show up by default.

---

## 🧑‍💻 Author

**Recep Karayigit**

- 🌐 [LinkedIn](https://www.linkedin.com/in/recep-karayigit/)
- 💻 [GitHub](https://github.com/RecepKarayigit)

---

## 📜 License

This project is licensed under the MIT License.
