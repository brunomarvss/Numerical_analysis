#PERL
#REGULA_FALSI
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
	if (looks_like_number( $a)){
			print "Enter value for B: ";
			my $b = <>;
			print "Enter value for C: ";
			my $c = <>;
			print "Enter value for D: ";
			my $d = <>;
			print "Enter value for E: ";
			my $e = <>;
			
	
			my @x= (-5,-4,-3,-2,-1,0,1,2,3,4,5);
			my $neg =0;
			my $pos =0;
			my $low = 0;
			my $upp = 0;
			my $ynn = 0;

			for (my $i=0;$i<=10;$i++){
				$test =($a*($x[$i]**4))+ ($b*($x[$i]**3))+ ($c*($x[$i]**2))+ ($d*$x[$i])+$e;
				#print "\n$test\n";
				if ($test>-1){
					$pos = $test;	
					$upp = $x[$i];
					}
				else{
					
					$neg = $test;			
					$low= $x[$i];
					}
				}
				
			my $xn = nlowmult(0.000000001,($upp-($pos*($upp-$low))/($pos-$neg))) ;	
			$yn= ($a*($xn**4))+ ($b*($xn**3))+ ($c*($xn**2))+ ($d*$xn)+$e;
			$iter=1;
			
			print"-------------------------------------------------------------------------\n";
			print " Xu\t   Xl\t   Yu\t  Yl\t Xn\t Yn\n";
			print"-------------------------------------------------------------------------\n\n";
			print "$upp, $low, $pos,
			 $neg,  $xn, $yn\n";
			
			if ($yn<0){
				$upp= $xn;
				$pos =$yn;
				
				
			}
			else{
				$low = $xn;
				$neg = $yn;
			}
			

			until($ynn==$yn){
				$ynn = $yn;		
				my $xn = nlowmult(0.000000001,($upp-($pos*($upp-$low))/($pos-$neg))) ;	
				$yn= ($a*($xn**4))+ ($b*($xn**3))+ ($c*($xn**2))+ ($d*$xn)+$e;
				$iter+=1;
				print "$upp, $low, $pos, $neg, $xn, $yn \n";

				if ($yn<0){
				$upp= $xn;
				$pos =$yn;
				
				
				}
				else{
					$low = $xn;
					$neg = $yn;
				}

				
				}
				print"-------------------------------------------------";
				print "\nNUMBER OF ITERATIONS: $iter\n";
				choice();
		}
		else{
			
			print"-------------------------------------------------------------------------\n";
			print "ERROR: INPUT MUST NOT BE NEGATIVE OR ZERO\n";
			choice();
			}
}
while($ans==1);
