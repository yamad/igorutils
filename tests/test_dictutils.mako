## import "IgorUnit"

#include "dictutils"

${TEST("Dict_addItem", "adds_a_string")}
  String dict = ""
  dict = Dict_addItem(dict, "key", "value")
  ${STRINGS_EQUAL("\"key:value;\"", "dict")}
${END_TEST()}

${TEST("Dict_getItem", "gets_a_string")}
  String dict = "key:value;"
  String val_res = Dict_getItem(dict, "key")
  ${STRINGS_EQUAL("\"value\"", "val_res")}
${END_TEST()}
