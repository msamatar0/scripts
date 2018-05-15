#!/usr/bin/awk -f

BEGIN{
  print "Report 3: Print cars whose prices are:\n< 15000\n> 20000 and < 65000\n< 100000";
  first = 1;
}

($5 + 0) < 15000 && $2 !~ /placeholder/ && $5 ~ /^[0-9]*$/{
  if(first){
    print "\nPrice < 15000:";
    first = 0;
  }
  print;
}

($5 + 0) > 20000 && ($5 + 0) < 65000 && $2 !~ /placeholder/ && $5 ~ /^[0-9]*$/{
  if(!first){
    print "\n20000 < Price < 65000:";
    first = 1;
  }
  print;
}

($5 + 0) > 100000 && $2 !~ /placeholder/ && $5 ~ /^[0-9]*$/{
  if(first){
    print "\nPrice > 100000:";
    first = 0;
  }
  print;
}
