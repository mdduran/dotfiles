#!/usr/bin/env bash

# languages to look up
langs="
golang
nodejs
javascript
typescript
cpp
c
lua
rust
python
bash
php
haskell
css
html
"
# CLTs to look up
util="
find
man
tldr
sed
awk
tr
cp
ls
grep
xargs
rg
ps
mv
kill
lsof
less
head
tail
tar
cp
rm
rename
jq
cat
ssh
cargo
git
git-worktree
git-status
git-commit
git-rebase
docker
docker-compose
stow
chmod
chown
"

languages=$(echo $langs | tr " " "\n")
core_utils=$(echo $util | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)
read -p "HEY HANDSOME! I NEED A QUERY: " query

if echo "$languages" | grep -qa $selected; then
    tmux split-window -p 40 -h bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less -R"
else
    tmux split-window -p 40 -h bash -c "curl cht.sh/$selected~$query | less -R"
fi

