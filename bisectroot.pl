#PERL
#BISECTION ROOT
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
	print ("Enter Root: ");
	$n= <>;
	if (looks_like_number( $n)){
		if ($n <= 0) {
			print"-------------------------------------------------------------------------\n";
			print "ERROR: INPUT MUST NOT BE NEGATIVE OR ZERO\n";
			choice();
		}
		else{
			$root= nlowmult( 1, sqrt($n));
			$xlow = $root;
			$xupp = $root +1;
			$xn22 = 0;
			$xn =  ($xupp+$xlow)/2;
			
			$xn2 = nlowmult(0.000000001,$xn**2);
			
			if ($xn2<$n){
				
				$xlow= nlowmult(0.000000001,$xn);
				}
			else{
				$xupp=nlowmult(0.000000001,$xn);
			}
				
				
			$iter=1;
			
			print"-------------------------------------------------------------------------\n";
			print "Upper\tLower\t Xn\t Xn^2\tERROR\n";
			print"-------------------------------------------------------------------------\n";
		
			
			until($xn2==$xn22){
				$xn22=nlowmult(0.000000001,$xn2);

				$xn =  ($xupp+$xlow)/2;
				$xn2 = nlowmult(0.000000001,$xn**2);
				$error = abs($n - $xn2);
				
				print "$xupp,  $xlow,  $xn,  $xn2,   $error    \n";
				$iter +=1;
			
				if ($xn2<$n){
					$xlow=nlowmult(0.000000001,$xn);
					}
				else{
					$xupp=nlowmult(0.000000001,$xn);
				}
				
				
			}

			print"-------------------------------------------------------------------------\n";
			print "\nNUMBER OF ITERATIONS: $iter\n";
			choice();
		}
	
	}
	else{
		print"-------------------------------------------------------------------------\n";
				print "ERROR: ENTER A POSITIVE NUMBER ONLY\n";
				choice();
			}
}
while($ans==1);