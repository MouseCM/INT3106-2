abstract sig Entry {
	parent: lone Dir
}

sig File extends Entry {}

sig Dir extends Entry {}

one sig Root extends Dir {}

fact RootHasNoParent {
    no Root.parent
}

fact EveryNonRootEntryHasExactlyOneParent {
    all e: Entry - Root | one e.parent
}

fact NoDirectoryIsItsOwnParent {
    all d: Dir | d not in d.parent
}

fact NoTwoDirectoriesAreMutualParents {
    no disj d1, d2: Dir |
        d1 in d2.parent and d2 in d1.parent
}

assert EveryFileHasParent {
    all f: File | one f.parent
}


assert NoThreeDifferentDirectoriesCycle {
    no disj d1, d2, d3: Dir |
        d2 in d1.parent and
        d3 in d2.parent and
        d1 in d3.parent
}

assert EveryNonRootDirectoryHasRootAsParent {
    all d: Dir - Root | d.parent = Root
}

fact DirectoryParentRelationIsAcyclic {
    no d: Dir | d in d.^parent
}


check EveryFileHasParent for 4
check NoThreeDifferentDirectoriesCycle for 4
check EveryNonRootDirectoryHasRootAsParent for 4

check EveryFileHasParent for 5
check NoThreeDifferentDirectoriesCycle for 5
check EveryNonRootDirectoryHasRootAsParent for 5

check EveryFileHasParent for 6
check NoThreeDifferentDirectoriesCycle for 6
check EveryNonRootDirectoryHasRootAsParent for 6
