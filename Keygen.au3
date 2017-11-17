#include <Array.au3>
$XOR = "76-117-99-97-76-85-67-65-80-67"
$Key = 5
$XORSplit = StringSplit($XOR, "-")
$ASCII = ""
_ArrayDisplay($XORSplit)
For $i = 1 to $XORSplit[0]
   $ASCII &= BitXOR($XORSplit[$i], $Key)
Next
ConsoleWrite($ASCII)