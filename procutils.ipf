#pragma rtGlobals=1		// Use modern global access method.

// procutils - Utility functions to work with Igor procedure files (ipf)

#ifndef PROCUTILS_INCLUDE
#define PROCUTILS_INCLUDE

#include "listutils"
#include "fileutils"

// Save the named procedure window to a file
Function Procedure_saveToFile(procedure_window, file_path)
    String procedure_window
    String file_path

    String procedure_text = Procedure_getAllText(procedure_window)
    Variable fref = File_openForWrite(file_path)
    File_writeString(fref, procedure_text)
    File_close(fref)
End

// Return the full contents of a procedure window
Function/S Procedure_getAllText(procedure_window)
    String procedure_window
    return ProcedureText("", 0, procedure_window)
End

Function/S Procedure_getIncludeList(procedure_window)
    String procedure_window

    String proc_text = Procedure_getAllText(procedure_window)
    String include_re = "^\\s*#include\\s*\"([^\"]+)\""

    String include_lines = GrepList(proc_text, include_re, 0, "\r")

    String include_list = ""
    Variable line_count = List_getLength(include_lines, list_sep="\r")
    Variable i
    for (i=0; i<line_count; i+=1)
        String curr_line = List_getItem(include_lines, i, list_sep="\r")
        String include_text
        SplitString/E=include_re curr_line, include_text
        include_list = List_addItem(include_list, include_text)
    endfor
    return include_list
End

#endif
