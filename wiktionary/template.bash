#!/bin/bash

grep -P '{@.*@}' log.txt | \
    sed -E 's/[^{]*\{@([^:@}]+)((:|@)[^@\}]+)?@}[^{]*/\1\n/g;' | \
    grep . > notreplacetemplate.txt

sort < notreplacetemplate.txt | \
    uniq -c | \
    sort > uniq-notreplacetemplate.txt
