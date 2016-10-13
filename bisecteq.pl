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
			my $low = 0;
			my $upp = 0;
			my $x= 0;
			my $f1= 0;

			for (my $i=0;$i<=10;$i++){
				$test =($a*($x[$i]**4))+ ($b*($x[$i]**3))+ ($c*($x[$i]**2))+ ($d*$x[$i])+$e;
				if ($test>-1){
					$upp= $x[$i];
					
					}
				else{			
					$low = $x[$i];
					}
				}
				
			$x = ($upp+$low)/2;
			$f= ($a*($x**4))+ ($b*($x**3))+ ($c*($x**2))+ ($d*$x)+$e;
			$iter=1;
			
			print"-------------------------------------------------------------------------\n";
			print "Upper\tLower\t Xn\t Xn^2\tERROR\n";
			print"-------------------------------------------------------------------------\n";
			print "$upp, $low, $x, $f\n";
			
			
			if ($f<0){
				$low= $x;
				
							
			}
			else{
				$upp = $x;
			
			}
			

			until($f1==$f){
				$f1 = $f;		
				$x = nlowmult(0.000000001,($upp+$low)/2);
				$f= nlowmult(0.000000001,($a*($x**4))+ ($b*($x**3))+ ($c*($x**2))+ ($d*$x)+$e);
				$iter+=1;
				
				

				
				if ($f<0){
					$low= $x;
										
				}
				else{
					$upp = $x;
				
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

