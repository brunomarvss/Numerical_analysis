#PERL
#BISECTION EQ
#BRUNO
use warnings;
use Scalar::Util qw(looks_like_number);
use Math::Round 'nlowmult';

sub choice(){
		print"-------------------------------------------------------------------------\n";
		print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
		$ans= <>;
}	
	
do{
	print ("Enter the equation in the form of Ax^4+Bx^3+Cx^2+Dx+E: \n");
	print "Enter value for A: ";
	my $a = <>;
	print "Enter value for B: ";
	my $b = <>;
	print "Enter value for C: ";
	my $c = <>;
	print "Enter value for D: ";
	my $d = <>;
	print "Enter value for E: ";
	my $e = <>;
	
	$x = 1;
	$x1 = 0;
	$x2= -1;
	$x3= -2;
	
		$test1 =($a*($x**4))+ ($b*($x**3))+ ($c*($x**2))+ ($d*$x)+$e;
	$test2 =($a*($x1**4))+ ($b*($x1**3))+ ($c*($x1**2))+ ($d*$x1)+$e;
	$test3 =($a*($x2**4))+ ($b*($x2**3))+ ($c*($x2**2))+ ($d*$x2)+$e;
	$test4 =($a*($x3**4))+ ($b*($x3**3))+ ($c*($x3**2))+ ($d*$x3)+$e;
	
	 print "\n$test1\n";
	 print "\n$test2\n";
	 print "\n$test3\n";
	 print "\n$test4\n";
	 
	 #test inputs  2 -5 0 -2 4
}
while($ans==1);


