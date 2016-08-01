IFS=$'\n'
for x in `cat todo.txt`;
do echo "$x";
   ruby ./mercer_county_nj.rb "$x"
done
