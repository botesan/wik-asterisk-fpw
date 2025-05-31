#!/bin/bash

grep -P '^found not replace template = .*<@.*@>' < log.txt | sed -E 's/found not replace template = //g;s/[^<]*<@([^:@>]+)((:|@)[^@]+)?@>[^<]*/\1\n/g;' | grep . > notreplacetemplate.txt 
sort < notreplacetemplate.txt | uniq -c | sort > uniq-notreplacetemplate.txt
