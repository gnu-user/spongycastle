#!/bin/bash 

# Package rename org.bouncycastle to org.strippedcastle    
for file in $(find -name bouncycastle)
do
    new_file=${file/bouncycastle/}strippedcastle
    mv $file $new_file
done

find -type f -name '*.java' | xargs sed -i s/bouncycastle/strippedcastle/g

# BC to SC for provider name
find bc* -type f | xargs sed -i s/\"BC\"/\"SC\"/g

# Rename 'bc' artifacts to 'sc'
rename s/^bc/sc/ *
find ant/ -name '*.xml' | xargs sed -i s/\>bc/\>sc/g

# Rename maven artifact 'names' to use Stripped rather than Bouncy
find ant/ -name '*.xml' | xargs sed -i s/\>Bouncy/\>Stripped/g
find ant/ -name '*.xml' | xargs sed -i s/Bouncy/Stripped/g
find ant/ -name '*.xml' | xargs sed -i s/bouncycastle/strippedcastle/g
    


