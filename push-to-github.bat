@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo === IBM AI Engineer - GitHub Push ===

if not exist .git (
    echo Git repo yok, baslatiyorum...
    git init
    echo.
)

echo Tum dosyalar ekleniyor...
git add -A

echo Commit yapiliyor...
git commit -m "IBM AI Engineer kurs dosyalari - toplu yukleme"

echo.
echo --- GitHub Repo URL gerekiyor ---
echo Eger henuz GitHub'da repo olusturmadiysaniz:
echo 1. https://github.com/new adresine gidin
echo 2. "IBM-ai-engineer" adinda yeni repo olusturun
echo 3. Olusan repo URL'ini (ornek: https://github.com/KULLANICI/IBM-ai-engineer.git) asagida girin
echo.

set /p REPO_URL="GitHub repo URL girin (veya Enter ile atla): "

if "%REPO_URL%"=="" (
    echo Remote eklenmedi. Daha sonra su komutla ekleyebilirsiniz:
    echo   git remote add origin GITHUB_URL
    echo   git branch -M main
    echo   git push -u origin main
    goto end
)

git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main

echo Push yapiliyor...
git push -u origin main

:end
echo.
echo Tamamlandi!
pause
