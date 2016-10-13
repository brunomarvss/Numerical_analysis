#PERL
#BABYLONIAN
#BRUNO

use warnings;
use Scalar::Util qw(looks_like_number);
use Math::Round 'nlowmult';

	
sub choice(){
		print"-------------------------------------------------\n";
		print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
		$ans= <>;
}	
	
do{
	print ("Enter Root: ");
	$n= <>;
	if (looks_like_number( $n)){
		if ($n <= 0) {
			print"-------------------------------------------------\n";
			print "ERROR: INPUT MUST NOT BE NEGATIVE OR ZERO\n";
			choice();
		}
		else{
			$r= nlowmult( 1, sqrt($n));
			$rr = $r**2;
			$rn = $r;
			$next = nlowmult(0.00000001,($rn+($n/$r))/2);
			$error =   nlowmult(0.00000001,($next**2)-$n);
			print"-------------------------------------------------\n";
			print "rn   r   r^2  rn+1 ERROR\n";
			print"-------------------------------------------------\n";
			print "$rn,  $r,  $rr,  $next,  $error \n";
			$iter = 1;


			until ($rn==$next){
				$rn=nlowmult(0.00000001,$next);
				$r=nlowmult(0.00000001,$next);
				$rr = $r**2;
				$next = nlowmult(0.00000001,($rn+($n/$r))/2);
				$error =   nlowmult(0.00000001,($next**2)-$n);
				print "$rn,  $r,  $rr,  $next,  $error \n";
				$iter +=1;
			}	

			print"-------------------------------------------------";
			print "\nNUMBER OF ITERATIONS: $iter\n";
			choice();
	}
	}
	else{
			print"-------------------------------------------------\n";
			print "ERROR: ENTER A POSITIVE NUMBER ONLY\n";
			choice();
		}
}
while ($ans==1);