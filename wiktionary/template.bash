#!/bin/bash

grep -P '{@.*@}' log.txt | \
    sed -E 's/[^{]*\{@([^:@}]+)((:|@)[^@\}]+)?@}[^{]*/\1\n/g;' | \
    grep . > notreplacetemplate.txt

sort < notreplacetemplate.txt | \
    uniq -c | \
    sort > uniq-notreplacetemplate.txt

grep -P '{@context@' log.txt | \
    sed -E 's/^[^{]*\{@([^:@}]+)@//;s/@}.*/|/;s/lang=[a-zA-Z]+//;s/\|\|/|/;s/^\|//;s/\|$//;s/\|/\t/g;' | \
    sort | uniq -c | \
    sort > uniq-notreplacecontext.txt
