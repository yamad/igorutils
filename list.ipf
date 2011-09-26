#pragma rtGlobals=1		// Use modern global access method.

#pragma hide=1

#ifndef LISTUTILS_INCLUDE
#define LISTUTILS_INCLUDE

Static Strconstant LISTSEP = ";"

Function List_getLength(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return ItemsInList(list_in, list_sep)
End

Function/S List_addItem(list_in, new_item, [list_sep])
    String list_in
    String new_item
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return AddListItem(new_item, list_in, list_sep, Inf)
End

Function/S List_insertItem(list_in, new_item, insert_idx, [list_sep])
    // Returns a list with the given item inserted at the given
    // index `insert_idx`
    String list_in
    String new_item
    Variable insert_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return AddListItem(new_item, list_in, list_sep, insert_idx)
End

Function/S List_getItemByIndex(list_in, get_idx, [list_sep])
    String list_in
    Variable get_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return StringFromList(get_idx, list_in, list_sep)
End

Function/S List_removeItemByIndex(list_in, remove_idx, [list_sep])
    String list_in
    Variable remove_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif    
    return RemoveListItem(remove_idx, list_in, list_sep)
End

// Returns the last item of the list and removes it from the input list
Function/S List_pop(list_in, [list_sep])
    String &list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif    

    Variable last_idx = List_getLength(list_in, list_sep=list_sep) - 1
    String popped = List_getItemByIndex(list_in, last_idx, list_sep=list_sep)
    list_in = List_removeItemByIndex(list_in, last_idx, list_sep=list_sep)
    return popped
End

#endif