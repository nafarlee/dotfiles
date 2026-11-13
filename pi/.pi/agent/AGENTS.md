# Version control: prefer `jj` over `git`

Use Jujutsu (`jj`) instead of `git` for version control whenever feasible.

- Before running version-control commands, check for a `.jj` directory (e.g. `jj root`). If the repo is a plain Git repo with no `.jj`, do not run `jj git init --colocate` without asking the user first.
- Use `jj` equivalents for everyday work: `jj status`, `jj diff`, `jj log`, `jj show`, `jj describe`, `jj new`, `jj commit`, `jj squash`, `jj split`, `jj rebase`, `jj abandon`, `jj undo`, `jj op log`, `jj bookmark ...`, `jj git fetch`, `jj git push`.
- Remember jj semantics: the working copy is a commit (`@`), changes are snapshotted automatically, there is no staging area, and bookmarks do not move on their own.
- Do not use interactive commands that open an editor or diff tool. Pass messages with `-m`, and give file paths instead of using interactive split/squash.
- Fall back to `git` only when jj cannot do the task (for example, Git features jj does not support, or tools that require Git directly). Tell the user when you fall back.
- In colocated repos, do not mix mutating `git` commands with `jj` without a reason. Read-only `git` commands are fine when they are clearly more convenient.

# Commits: strongly prefer new commits over rewriting existing ones

Record work as new commits. Do not rewrite commits that already exist unless the user agrees.

- Before you edit files, check `@` with `jj log -r @` and `jj status`. If `@` is not an empty, undescribed commit that you made for the current change, run `jj new` first. Do not put new work into a commit that already has content or a description.
- An "existing commit" is any commit that you did not make during the current task, any commit that has a description or content from earlier work, and any commit that is on a remote. Treat pushed commits and commits in an open PR as existing, also when you made them.
- Put follow-up changes, fixes, and review responses in a new commit on top, for example `jj new <bookmark>`, then move the bookmark with `jj bookmark set <bookmark> -r @` (or `jj bookmark move`). Do not amend the earlier commit.
- These commands rewrite existing commits. Ask the user before you use them on an existing commit: `jj describe`, `jj squash`, `jj split`, `jj rebase`, `jj abandon`, `jj edit` with later file changes, `jj restore` into a commit other than `@`, `jj absorb`, `jj diffedit`, `jj duplicate`/`jj parallelize` when they replace commits, and `jj git push` when the bookmark moves sideways or backwards (a force push).
- If a rewrite seems more prudent, ask first. Examples: a fixup belongs in an earlier unpushed commit, the repository requires one commit for each PR, a commit message has an error, or a stack must be rebased onto a new `main`. Tell the user which commits change, why, and the alternative with a new commit. Then wait for an answer.
- If you rewrite a commit by accident, tell the user. Show the old and new commit IDs, and give the command to revert it (`jj undo` or `jj op restore <op-id>`).
