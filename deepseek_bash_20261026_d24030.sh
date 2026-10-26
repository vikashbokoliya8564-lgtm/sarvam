cd ai-podcast-generator
git init
git check-ignore -v .env          # should print ".gitignore:…:.env"
git add .
git status                        # .env MUST NOT appear