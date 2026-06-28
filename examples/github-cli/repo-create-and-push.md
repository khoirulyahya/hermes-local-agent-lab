# GitHub CLI Repo Create and Push

```bash
gh auth status

git init
git branch -M main
git add .
git commit -m "Initial documentation"

gh repo create <GITHUB_REPO>   --public   --description "<DESCRIPTION>"   --source .   --remote origin   --push
```

Add topics:

```bash
gh repo edit <OWNER>/<GITHUB_REPO> --add-topic ai-agent --add-topic automation
```
