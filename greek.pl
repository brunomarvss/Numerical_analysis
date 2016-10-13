#PERL
#GREEK
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
			$k= nlowmult( 1, sqrt($n));
			$sn=0;
			$sn1=1;
			$r2= 0;
			$sn2=nlowmult(0.00000001,(2*($k*$sn1))+(($n-$k**2)*$sn));
			$r = nlowmult(0.00000001,($sn2/$sn1)-$k);
			$rr = $r**2;
			$error =  nlowmult(0.00000001,($r**2)-$n);
			print"-------------------------------------------------------------------------\n";
			print "s[n]  s[n+1]  s[n+2]  r  r^2  ERROR\n";
			print"-------------------------------------------------------------------------\n";
			print "$sn,   $sn1,   $sn2,   $r,   $rr,   $error   \n";
			$iter=1;
			
			until($r==$r2){
				$r2=$r;
				$sn=$sn1;
				$sn1=$sn2;
				
				$sn2=nlowmult(0.00000001,(2*($k*$sn1))+(($n-$k**2)*$sn));
				$r = nlowmult(0.00000001,($sn2/$sn1)-$k);
				$rr = $r**2;
				$error =  nlowmult(0.00000001,($r**2)-$n);
				print "$sn,   $sn1,   $sn2,   $r,  $rr,   $error   \n";
				$iter +=1;
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