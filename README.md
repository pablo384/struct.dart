# struct
Dart library for packing and unpacking byte data using format strings

## Format Characters

| Format | C Type             | Dart type          | Standard size (bytes) |
|--------|--------------------|--------------------|-----------------------|
| x      | pad byte           | no value           |                       |
| b      | signed char        | int                | 1                     |
| B      | unsigned char      | int                | 1                     |
| h      | short              | int                | 2                     |
| H      | unsigned short     | int                | 2                     |
| i      | int                | int                | 4                     |
| I      | unsigned int       | int                | 4                     |
| l      | long               | int                | 4                     |
| L      | unsigned long      | int                | 4                     |
| f      | float              | double             | 4                     |
| d      | double             | double             | 8                     |
