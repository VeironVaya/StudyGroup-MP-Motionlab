1. Initializes a new Git repository in your current directory `git init`
2. Creates a local copy of a remote repository `git clone <repository-url>`
3. Adds a specific file to the staging area `git add <file>` 
4. Adds all modified, deleted, or new files to the staging area `git add .`
5. Creates a commit with the specified message `git commit -m "message`
6. Shows the status of your working directory and staging area `git status`
7. Lists all branches in your repository and highlights the current branch `git branch`
8. Creates a new branch `git branch <branch-name>`
9. Switches to the specified branch `git checkout <branch-name>`
10. Create and move to new branch `git checkout -b <branch-name>`
11. To delete branch (switch to another branch) and use `git branch --delete <branchname>` or `git branch -d <branchname>` 
12. Merges the specified branch into the current branch `git merge <branch-name>`
13. Downloads commits, files, and references from a remote repository but does not merge them into your local branch `git fetch`
14. Combines git fetch and git merge, fetching changes from a remote branch and merging them into the current branch `git pull <remote> <branch>` or just `git pull` on current branch
15. Pushes your changes to the specified branch of the remote repository `git push <remote> <branch>`
16. Removes the specified file from the staging area but leaves the working directory unchanged `git reset <file>`
17. Resets your working directory and staging area to match the last commit, discarding all changes `git reset --hard`
18. Discards changes in the working directory for the specified file `git checkout -- <file>`
19. Shows the commit history for the repository `git log`
20. Creates a new tag for the current commit `git tag <tag-name>`