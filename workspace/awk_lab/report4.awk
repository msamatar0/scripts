#!/usr/bin/awk -f

BEGIN{
  print "Report 4: Print the cheapest and most expensive of the cars:";
  cheap = 1;
}

$2 !~ /placeholder/ && $5 ~ /^[0-9]*$/{
  if(cheap){
    print "Cheapest Car:\n" $0;
    cheap = 0;
  }
  if(($5 + 0) > priciest){
    priciest = ($5 + 0);
    pline = $0;
  }
}

END{
  print "Most Expensive Car:\n" pline;
}
