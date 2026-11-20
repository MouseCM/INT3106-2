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

