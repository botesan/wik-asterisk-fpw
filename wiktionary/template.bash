#!/bin/bash

sed -E -z 's/(found not replace template =)\s*/\1/g;' < log.txt | \
    grep -P '^found not replace template =.*{@.*@}' | \
    sed -E 's/found not replace template =\s*//g;s/[^{]*\{@([^:@}]+)((:|@)[^@\}]+)?@}[^{]*/\1\n/g;' | \
    grep . > notreplacetemplate.txt

sort < notreplacetemplate.txt | \
    uniq -c | \
    sort > uniq-notreplacetemplate.txt
