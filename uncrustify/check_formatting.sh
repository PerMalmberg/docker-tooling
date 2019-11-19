#!/bin/sh

find /src -name "*.cpp" > /src/files_to_check.txt
find /src -name "*.hpp" >> /src/files_to_check.txt
find /src -name "*.c" >> /src/files_to_check.txt
find /src -name "*.h" >> /src/files_to_check.txt

/uncrustify --version
/uncrustify -c /cfg/uncrustify.cfg --check -F /src/files_to_check.txt
code=$?

if [ -f /src/files_to_check.txt ]; then
    rm /src/files_to_check.txt
fi

exit $code