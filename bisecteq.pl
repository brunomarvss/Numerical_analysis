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
	if (looks_like_number( $a) && $a != 0){
			print "Enter value for B: ";
			my $b = <>;
			print "Enter value for C: ";
			my $c = <>;
			print "Enter value for D: ";
			my $d = <>;
			print "Enter value for E: ";
			my $e = <>;
			if (looks_like_number( $e) && $e !=0){
				
				if(($a>0 && $b>0 && $c>0 && $d>0 && $e>0) || ($a<0 && $b<0 && $c<0 && $d<0 && $e<0)){
					print"-------------------------------------------------------------------------\n";
					print "ERROR: INPUT MUST NOT BE ALL POSITIVE/NEGATIVE NUMBER\n";
					choice();
				}
				else{
			
				
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
						$x2= $x**2;
						$f= ($a*($x**4))+ ($b*($x**3))+ ($c*($x**2))+ ($d*$x)+$e;
						$eabs=abs($f);
						$iter=1;
						
						print"-------------------------------------------------------------------------\n";
						print "# Upper\tLower\t Xn\t Xn^2\tf(x)\tEabs\n";
						print"-------------------------------------------------------------------------\n";
						print "$iter) $upp | $low | $x | $x2 | $f | $eabs\n";
						
						
						if ($f<0){
							$low= $x;
							
										
						}
						else{
							$upp = $x;
						
						}
						

						until($f1==$f){
							$f1 = $f;		
							$x = nlowmult(0.000000001,($upp+$low)/2);
							$x2= $x**2;
							$f= nlowmult(0.000000001,($a*($x**4))+ ($b*($x**3))+ ($c*($x**2))+ ($d*$x)+$e);
							$eabs=abs($f);
							$iter+=1;
							
							
							
							print "$iter) $upp | $low | $x | $x2 | $f | $eabs\n";

							
							if ($f<0){
								$low= $x;
													
							}
							else{
								$upp = $x;
							
							}

							
						}
							print"--------------------------------------------------------------------------";
							print "\nNUMBER OF ITERATIONS: $iter\n";
							choice();
							 $low = 0;
							$upp = 0;
							$x= 0;
							$f1= 0;
							$x = 0;
							$x2= 0;
							$f= 0;
							$eabs=0;
							$iter=0;
			}					}
			else{
			
			print"-------------------------------------------------------------------------\n";
			print "ERROR: INPUT IN 'E' MUST NOT BE EQUAL TO ZERO\n";
			choice();
			
			}
		}
		
		
		else{
			
			print"-------------------------------------------------------------------------\n";
			print "ERROR: INPUT IN 'A' MUST NOT BE EQUAL TO ZERO\n";
			choice();
			
			}
}
while($ans==1);


