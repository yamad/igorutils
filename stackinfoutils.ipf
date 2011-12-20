#pragma rtGlobals=1

#ifndef STACKINFOUTILS_INCLUDE
#define STACKINFOUTILS_INCLUDE

#include "listutils"

Function/S Stack_getFull()
    String full_stack = GetRTStackInfo(3)
    return full_stack
End

Function/S Stack_getPartialNegativeIndex(neg_idx)
    // Return stack information with the last `neg_idx` items in the
    // stack removed.
    Variable neg_idx
    String stack_info = Stack_getFull()

    Variable i
    neg_idx += 2                // Remove the 2 calls to Stack_* functions
    for (i=0; i < neg_idx; i+=1)
        List_pop(stack_info)
    endfor
    return stack_info
End

Function Stack_getLength(full_stack)
    String full_stack
    return List_getLength(full_stack)
End

Function/S Stack_getRow(full_stack, row_idx)
    String full_stack
    Variable row_idx
    return List_getItemByIndex(full_stack, row_idx)
End

Function/S Stack_getLastRow(full_stack)
    String full_stack
    return List_getItemByIndex(full_stack, Stack_getLength(full_stack)-1)
End

Function/S StackRow_getFunctionName(stack_row)
    String stack_row
    return StringFromList(0, stack_row, ",")
End

Function/S StackRow_getFileName(stack_row)
    String stack_row
    return StringFromList(1, stack_row, ",")
End

Function StackRow_getLineNumber(stack_row)
    String stack_row
    String line_number = StringFromList(2, stack_row, ",")
    return str2num(line_number)
End

#endif