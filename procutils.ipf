#pragma rtGlobals=1		// Use modern global access method.

// procutils - Utility functions to work with Igor procedure files (ipf)

#ifndef PROCUTILS_INCLUDE
#define PROCUTILS_INCLUDE

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

#endif
