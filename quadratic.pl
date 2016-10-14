#PERL
#QUADRATIC
#BRUNO
use warnings;
use Scalar::Util qw(looks_like_number);
use Math::Round 'nlowmult';

sub error(){
	print"-------------------------------------------------\n";
	print "ERROR! INVALID INPUT!\n";
	print"-------------------------------------------------\n";
	print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
					$ans= <>;
	}
	
do{
	print ("Enter value for Quadratic formula: \n");
	print("Enter value for A = ");
	my $a= <>;
	if (looks_like_number( $a) && $a!=0){
			print("Enter value for B = ");
			$b= <>;
			if (looks_like_number( $b)){
				print("Enter value for C = ");
				$c=<>;
				print"-------------------------------------------------\n";
				if (looks_like_number( $c)&& $c!=0){
					$testroot = ($b**2)-(4*$a*$c);
					if ($testroot <= 0) {
						print "ERROR: CAN'T SOLVE NEGATIVE ROOT\n";
						print"-------------------------------------------------\n";
						print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
						$ans= <>;
						
					} 
					else {
						$root = sqrt($testroot);
						$quadpos =  nlowmult(0.000000001,(-$b+$root)/2*$a);
						$quadneg =  nlowmult(0.000000001,(-$b-$root)/2*$a);
						print "\n\nANS1:$quadpos";	
						print "\nANS2:$quadneg";
						print"\n-------------------------------------------------\n";
						print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
						$ans= <>;
					}			
				}
				else {
					error();
				}
			}
			else {
				error();
			}	
		}
	else {
		error();
	}
}

while ($ans==1);

