* Solving conflict by putting master branch modification in new commit at the end of feature branch (merge origin/master to local branch1 before merging origin/branch1 on origin/master)
	* git pull origin develop   // pull will fail merging origin/master branch in local branch1 due to conflict that we need to solve
	* (solve the conflict) git status / git diff / git add
	* git commit   // create commit for modifications that solve the conflict
	* git push origin HEAD   // push local branch1 to remote one and now, it is possible to merge origin/branch1 to origin/master

* Solving conflict by rebasing feature branch at the end of master branch modification (needs forcing push)   
	* git pull --rebase origin develop
	* (solve the conflict) git status / git diff / git add
	* git rebase --continue
	* git push --force-with-lease

* When solving conflict by rebase/force, the remote branch looks cleaner, but rebasing mechanism could cause solving local commit conflicts that are reverted in following commit, which is a wast of time. So it is recommended to use rebase for solving conflict only if local branch does not contain revert or cherry picking.
  
* If remote branch feature_branch becomes messy and we have the ability of forcing push:
	* create a patch file that contains all modification of feature_branch: git diff @~9..@ >> ../modif.patch (in this example we have 9 commits)
	* rename the branch locally: git branch -m feature_branch feature_branch_workspace
	* create a new branch with same name as old branch: git branch feature_branch
	* checkout the new branch: git checkout feature_branch
	* apply the patch on the new branch: git apply ../modif.patch (remove the messy parts and apply the conflicted part manually)
	* check and stage before commiting: git status / git diff / git add
	* commit all modification of old branch: git commit -m "express what was done in commits of old branch"
	* check before pushing: git diff @~1..@
	* push new branch to override the content of old branch in remote: git push -u origin feature_branch -f
	* check that remote branch becomes clean

* Deleting git refs that caused errors during git fetch:  
	git update-ref -d  'refs/remotes/origin/submodule/feature_branch'
	
* Get modification from remote branch:  
	git pull -p  : --prune Before fetching, remove any remote-tracking references that no longer exist on the remote  
	git fetch  
	git pull  

* Remove all modification in file.h:  
	git checkout -- file.h   

* Make local branch like the remote branch1:  
	git reset --hard origin/branch1 && git clean -fd --force  

* In case we have a new commit in one of the submodules:  
	git submodule update --init --recursive --force  
	
* In case of some modules have modified content or untracked content:  
	git submodule foreach --recursive git reset --hard && git submodule foreach --recursive git clean -fd --force
