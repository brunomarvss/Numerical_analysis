#PERL


print ("Enter value for Quadratic formula: \n");
print("Enter value for A = ");
$a= <>;
print("Enter value for B = ");
$b= <>;
print("Enter value for C = ");
$c= <>;

$testroot = ($b**2)-(4*$a*$c);



if ($testroot < 0) {
	print "ERROR: CAN'T TAKE SQRT OF NEGATIVE NUMBER\n";
} 
else {
	$root = sqrt($testroot);
	$quadpos = (-$b+$root)/2*$a;
	$quadneg = (-$b-$root)/2*$a;
	print "\n\nANS1:$quadpos";	
	print "\nANS2:$quadneg";
	print("\n\n");
}



