# git/github
function _fuzzy_branch() {
  git branch --all | rg -v remote | rg -v "\*" | rg -e ml -e main | awk '{print $1}' | fzf
}

function _pr_number() {
  gh pr list --head $(git rev-parse --abbrev-ref HEAD) --json number -q '.[0].number'
}

alias gtbc="git checkout -B"

export function gtbco() {
  if [ -z "$1" ]; then
    local branch=$(_fuzzy_branch)
  else
    local branch="$1"
  fi
  git checkout $branch
}

alias gqs="git add . && git commit --m 'qs'"

export function gtss() {
  # Push the current branch to the remote repository
  git push origin $(git rev-parse --abbrev-ref HEAD)
  local pr_exists=$(_pr_number)

  if [ -z "$pr_exists" ]; then
    # If no PR exists, create a new one
    gh pr create
  fi
}

export function gtbdl() {
  if [ -z "$1" ]; then
    local branch=$(_fuzzy_branch)
  else
    local branch="$1"
  fi

  # Check if a PR exists for the current branch
  PR_NUMBER=$(_pr_number)

  if [ -n "$PR_NUMBER" ]; then
    # Close the PR if it exists
    gh pr close "$PR_NUMBER" --delete-branch
  fi

  # # Check if the remote branch exists and delete it
  if git ls-remote --exit-code --heads origin "$branch"; then
    git push origin --delete "$branch"
  fi

  # Delete the local branch
  git checkout main
  git branch -D "$branch"
}

function gtrs {
  local branch=$(git branch --show-current)
  if [[ "$branch" != "main" ]]; then
    # Check if the branch has a closed or merged PR
    local pr_state=$(gh pr list --state merged --state closed --head "$branch" --json state -q '.[0].state')
    if [[ "$pr_state" == "CLOSED" || "$pr_state" == "MERGED" ]]; then
      echo "Deleting $branch"
      gtbdl $branch
    else
      git fetch origin main:main && git rebase main --update-refs
    fi
  fi
}

export function gtusr() {
  gtbco main
  git pull

  # Get a list of local branches
  local branches=$(git branch --format "%(refname:short)")

  echo "$branches" | while read -r branch; do
    if [[ "$branch" != "main" ]]; then
      # Check if the branch has a closed or merged PR
      local pr_state=$(gh pr list --state merged --state closed --head "$branch" --json state -q '.[0].state')
      echo $pr_state
      if [[ "$pr_state" == "CLOSED" || "$pr_state" == "MERGED" ]]; then
        echo "Deleting $branch"
        gtbdl $branch
      fi
    fi
  done
}

# TODO syncing
# TODO stack

