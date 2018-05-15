#!/usr/bin/awk -f

BEGIN{
  print "Report 2: For each brand, list all products by price > mileage > year";
  first = 1;
}

$2 !~ /placeholder/{
  if(first){
    brand = $1;
    print brand ":";
    first = 0;
  }
  if(brand == $1)
    print $2 " " $3 " " $4 " " $5;
  else{
    brand = $1;
    print "\n" brand ":";
    print $2 " " $3 " " $4 " " $5;
  }
}
