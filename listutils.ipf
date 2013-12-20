
#pragma rtGlobals=1		// Use modern global access method.

#ifndef LISTUTILS_INCLUDE
#define LISTUTILS_INCLUDE

Strconstant LISTSEP = ";"
Static Strconstant COMPACT_LDELIM_DEFAULT = "{"
Static Strconstant COMPACT_RDELIM_DEFAULT = "}"

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

Function/S List_removeItemByString(list_in, remove_str, [list_sep])
    String list_in
    String remove_str
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    Variable remove_idx = List_getItemIndex(list_in, remove_str, list_sep=list_sep)
    if (remove_idx == -1)
        return list_in
    endif
    return List_removeItemByIndex(list_in, remove_idx, list_sep=list_sep)
End

// Alias for List_getItemByIndex
Function/S List_getItem(list_in, get_idx, [list_sep])
    String list_in
    Variable get_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return List_getItemByIndex(list_in, get_idx, list_sep=list_sep)
End

// Alias for List_removeItemByIndex
Function/S List_removeItem(list_in, remove_idx, [list_sep])
    String list_in
    Variable remove_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return List_removeItemByIndex(list_in, remove_idx, list_sep=list_sep)
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

Function/S List_convertSeparator(list_in, orig_sep, [new_sep])
    String list_in
    String orig_sep
    String new_sep

    if (ParamIsDefault(new_sep))
        new_sep = LISTSEP
    endif

    Variable item_count = List_getLength(list_in, list_sep=orig_sep)
    Variable i
    String new_list = ""
    for (i=0; i<item_count; i+=1)
        String curr_item = List_getItemByIndex(list_in, i, list_sep=orig_sep)
        new_list = List_addItem(new_list, curr_item, list_sep=new_sep)
    endfor
    return new_list
End

Function/S List_extend(listA_in, listB_in)
    String listA_in, listB_in
    return listA_in + listB_in
End

Function/S List_unique(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    Variable item_count = List_getLength(list_in)
    Variable i

    String new_list = ""
    for (i=0; i<item_count; i+=1)
        String curr_item = List_getItemByIndex(list_in, i, list_sep=list_sep)
        if (!List_hasItem(new_list, curr_item))
            new_list = List_addItem(new_list, curr_item)
        endif
    endfor
    return new_list
End

Function/S List_reverse(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    Variable item_count = List_getLength(list_in)
    Variable i

    String new_list = ""
    for (i=item_count-1; i>=0; i-=1)
        new_list = List_addItem(new_list, List_getItem(list_in, i, list_sep=list_sep))
    endfor
    return new_list
End

// Return a sorted version (ascending alphabetic) of list `list_in`
Function/S List_sort(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return SortList(list_in, list_sep, 0)
End

Function/S List_sortNumeric(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    return SortList(list_in, list_sep, 2)
End

Function List_hasItem(list_in, test_item, [list_sep])
    String list_in
    String test_item
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    if (List_getItemIndex(list_in, test_item, list_sep=list_sep) != -1)
        return 1
    endif
    return 0
End

Function List_getItemIndex(list_in, test_item, [list_sep])
    String list_in
    String test_item
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    return WhichListItem(test_item, list_in, list_sep)
End

Function/S List_getSlice(list_in, start_idx, end_idx, [list_sep])
    String list_in
    Variable start_idx, end_idx
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    Variable orig_len = List_getLength(list_in, list_sep=list_sep)
    start_idx = max(start_idx, 0)
    end_idx = min(end_idx, orig_len-1)

    Variable i
    String new_list = ""
    for (i=start_idx; i<=end_idx; i+=1)
        new_list = List_addItem(new_list, List_getItem(list_in, i, list_sep=list_sep), list_sep=list_sep)
    endfor
    return new_list
End

Function/S List_compact(list_in, [list_sep, ldelim, rdelim])
    String list_in
    String list_sep
    String ldelim, rdelim

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    if (ParamIsDefault(ldelim))
        ldelim = COMPACT_LDELIM_DEFAULT
    endif
    if (ParamIsDefault(rdelim))
        rdelim = COMPACT_RDELIM_DEFAULT
    endif

    Variable prefix_len = List_findCommonPrefix(list_in, list_sep=list_sep)
    if (prefix_len == 0)
        return list_in
    endif

    String item = List_getItem(list_in, 0, list_sep=list_sep)
    String prefix = item[0,prefix_len-1]

    String compact_list = ""
    Variable i
    Variable list_len = List_getLength(list_in)
    for (i=0; i<list_len; i+=1)
        item = List_getItem(list_in, i, list_sep=list_sep)
        compact_list = List_addItem(compact_list, item[prefix_len,Inf], list_sep=list_sep)
    endfor
    return prefix + ldelim + compact_list + rdelim
End

Function/S List_expand(list_in, [list_sep, ldelim, rdelim])
    String list_in
    String list_sep
    String ldelim, rdelim

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif
    if (ParamIsDefault(ldelim))
        ldelim = COMPACT_LDELIM_DEFAULT
    endif
    if (ParamIsDefault(rdelim))
        rdelim = COMPACT_RDELIM_DEFAULT
    endif

    Variable ldelim_idx = strsearch(list_in, ldelim, 0)
    Variable rdelim_idx = String_searchBack(list_in, rdelim)
    if (ldelim_idx == -1 || rdelim_idx == -1)
        return list_in
    endif

    String prefix = list_in[0, ldelim_idx-1]
    String compact_list = list_in[ldelim_idx+1,rdelim_idx-1]

    Variable list_len = List_getLength(compact_list)
    Variable i
    String new_list = ""
    for (i=0; i<list_len; i+=1)
        new_list = List_addItem(new_list, prefix + List_getItem(compact_list, i))
    endfor
    return new_list
End

Static Function List_findCommonPrefix(list_in, [list_sep])
    String list_in
    String list_sep

    if (ParamIsDefault(list_sep))
        list_sep = LISTSEP
    endif

    Variable list_len = List_getLength(list_in)
    String l1 = List_getItem(list_in, 0)
    Variable prefix_len = strlen(l1)

    Variable i
    for (i=1; i<list_len; i+=1)
        String l2 = List_getItem(list_in, i)
        prefix_len = min(prefix_len, String_findCommonPrefix(l1, l2))
    endfor
    return prefix_len
End

#endif