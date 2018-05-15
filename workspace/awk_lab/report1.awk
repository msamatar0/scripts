#!/usr/bin/awk -f

BEGIN{
  print "Report 1: Calculate each brand's total entries.";
  count = 0;
  brand = "Honda";
}

$2 !~ /placeholder/{
  if(brand != $1){
    printf("There are %d %s cars\n", count, brand);
    count = 0;
    brand = $1;
  }
  else;
    count++;
}

END{
  printf("There are %d %s cars\n", count, brand);
}
