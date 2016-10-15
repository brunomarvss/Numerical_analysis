use warnings;
use Scalar::Util qw(looks_like_number);
use Math::Round 'nlowmult';


sub choice(){
		print"----------------------------------------------------------------------------------------------------\n";

		print "DO YOU WANT TO COMPUTE AGAIN? (Yes [1] | NO [0])\n";
		$ans= <>;
		system("cls");
		
}	
sub regula_falsi(){
do{
	print "\n\n**************REGULA FALSI*****************\n\n";
	print ("Enter the equation in the form of Ax^4+Bx^3+Cx^2+Dx+E: \n");
	print "Enter value for A: ";
	my $a = <>;
	if (looks_like_number( $a)&& $a !=0){
			print "Enter value for B: ";
			my $b = <>;
			if (looks_like_number( $b)){
				print "Enter value for C: ";
				my $c = <>;
				if (looks_like_number( $c)){
					print "Enter value for D: ";
					my $d = <>;
					if (looks_like_number( $d)){
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
								$eabs = abs($yn);
								print"----------------------------------------------------------------------------------------------\n";
								print " Xupper\t Yupper\t\t\tXlower\t\t\tYlower\t\t Xnext\t\t Ynext\t\tEabs\n";
								print"-----------------------------------------------------------------------------------------------\n\n";
								print "$upp, $pos, $low, $neg,  $xn, $yn , $eabs\n";
								
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
									$yn= nlowmult(0.000000001,($a*($xn**4))+ ($b*($xn**3))+ ($c*($xn**2))+ ($d*$xn)+$e);
									$iter+=1;
									$eabs = abs($yn);
									print "$upp, $pos, $low, $neg,  $xn, $yn , $eabs\n";

									if ($yn<0){
									$upp= $xn;
									$pos =$yn;
									}
									else{
										$low = $xn;
										$neg = $yn;
									}	
									}
									print"----------------------------------------------------------------------------------------------------\n";
									print "\nNUMBER OF ITERATIONS: $iter\n";
									choice();
									 $neg =0;
									 $pos =0;
									 $low = 0;
									 $upp = 0;
									 $ynn = 0;
									 $xn = 0;
									 $yn = 0;
									 $eabs = 0;
								  }  
								}
						else{
						
						print"-------------------------------------------------------------------------\n";
						print "ERROR: INPUT IN 'E' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
						choice();	
							}
						}
					else{
					
					print"-------------------------------------------------------------------------\n";
					print "ERROR: INPUT IN 'D' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
					choice();	
					}
				}
			else{
				
				print"-------------------------------------------------------------------------\n";
				print "ERROR: INPUT IN 'C' MUST  BE A POSITIVE OR NEGATIVE NUMBER\n";
				choice();	
				}
			}
			else{
				
				print"-------------------------------------------------------------------------\n";
				print "ERROR: INPUT IN 'B' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
				choice();	
				}
				}
	else{
					
		print"----------------------------------------------------------------------------------------------------\n";
		print "ERROR: INPUT IN 'A' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
		choice();
		}
}
while($ans==1);
main();		
	}
	
	
sub bisect_eq(){
do{
	print "\n\n**************BISECTION EQUATION*****************\n\n";
	print ("Enter the equation in the form of Ax^4+Bx^3+Cx^2+Dx+E: \n");
	print "Enter value for A: ";
	my $a = <>;
	if (looks_like_number( $a)&& $a !=0){
			print "Enter value for B: ";
			my $b = <>;
			if (looks_like_number( $b)){
				print "Enter value for C: ";
				my $c = <>;
				if (looks_like_number( $c)){
					print "Enter value for D: ";
					my $d = <>;
					if (looks_like_number( $d)){
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
						}
								}
						else{
						
						print"-------------------------------------------------------------------------\n";
						print "ERROR: INPUT IN 'E' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
						choice();	
							}
						}
					else{
					
					print"-------------------------------------------------------------------------\n";
					print "ERROR: INPUT IN 'D' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
					choice();	
					}
				}
				else{
					
					print"-------------------------------------------------------------------------\n";
					print "ERROR: INPUT IN 'C' MUST  BE A POSITIVE OR NEGATIVE NUMBER\n";
					choice();	
					}
				}
			else{
				
				print"-------------------------------------------------------------------------\n";
				print "ERROR: INPUT IN 'B' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
				choice();	
				}
			}
	else{
					
		print"----------------------------------------------------------------------------------------------------\n";
		print "ERROR: INPUT IN 'A' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
		choice();
		}
}
while($ans==1);
main();
}

sub greek(){
		
do{
	print "\n\n**************GREEK*****************\n\n";
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
			$eabs =  abs(nlowmult(0.00000001,($r**2)-$n));
			$erel =  nlowmult(0.00000001,($r**2-$n)/$r**2);
			$iter=1;
			print"-------------------------------------------------------------------------\n";
			print "#  k  s[n] s[n+1] s[n+2]  r \t\t r^2\t\t  eabs \t \terel\n";
			print"-------------------------------------------------------------------------\n";
			print "$iter) $k | $sn | $sn1 | $sn2 | $r | $rr | $eabs | $erel   \n";
			
			
			until($r==$r2){
				$r2=$r;
				$sn=$sn1;
				$sn1=$sn2;
				
				$sn2=nlowmult(0.00000001,(2*($k*$sn1))+(($n-$k**2)*$sn));
				$r = nlowmult(0.00000001,($sn2/$sn1)-$k);
				$rr = $r**2;
				$eabs =  abs(nlowmult(0.00000001,($r**2)-$n));
				$erel =  nlowmult(0.00000001,($r**2-$n)/$r**2);
				$iter +=1;
				print "$iter) $k | $sn | $sn1 | $sn2 | $r | $rr | $eabs | $erel   \n";
				
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
main();	
	}

sub quadratic(){
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
					print"----------------------------------------------------------------------------------------------------\n";
					print "ERROR: INPUT IN 'C' MUST BE A POSITIVE OR NEGATIVE NUMBER AND NOT EQUAL TO ZERO\n";
					choice();
				}
			}
			else {
				print"----------------------------------------------------------------------------------------------------\n";
				print "ERROR: INPUT IN 'B' MUST BE A POSITIVE OR NEGATIVE NUMBER\n";
				choice();
			}	
		}
	else {
		print"----------------------------------------------------------------------------------------------------\n";
		print "ERROR: INPUT IN 'A' MUST BE A POSITIVE OR NEGATIVE NUMBER AND NOT EQUAL TO ZERO\n";
		choice();
	}
}

while ($ans==1);	
main();
	}


sub babylonian(){
do{
	print "\n\n**************BABYLONIAN*****************\n\n";
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
			$eabs =  abs( nlowmult(0.00000001,($next**2)-$n));
			$erel =  nlowmult(0.00000001,($n-$rr)/$rr);
			$iter = 1;
			print"--------------------------------------------------------------------------------------\n";
			print "#\trn \t  r\t\t   r^2\t\t  rn+1\t\t   eabs\t\terel\n";
			print"--------------------------------------------------------------------------------------\n";
			print "$iter) $rn | $r |  $rr |  $next |  $eabs | $erel \n";
			


			until ($rn==$next){
				$rn=nlowmult(0.00000001,$next);
				$r=nlowmult(0.00000001,$next);
				$rr = $r**2;
				$next = nlowmult(0.00000001,($rn+($n/$r))/2);
				$eabs =   abs(nlowmult(0.00000001,($next**2)-$n));
				$erel =  nlowmult(0.00000001,($n-$rr)/$rr);
				$iter +=1;
				print "$iter) $rn | $r |  $rr |  $next |  $eabs | $erel \n";
			}	

			print"-----------------------------------------------------------";
			print "\nNUMBER OF ITERATIONS: $iter\n";
			choice();
	}
	}
	else{
			print"-----------------------------------------------------------\n";
			print "ERROR: ENTER A POSITIVE NUMBER ONLY\n";
			choice();
		}
}
while ($ans==1);	
main();
}

sub bisect_root(){
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
				
				
			
			
			print"-------------------------------------------------------------------------\n";
			print "# Upper\tLower\t Xn\t Xn^2\t Eabs \t Erel\n";
			print"-------------------------------------------------------------------------\n";
			
			
			
			until($xn2==$xn22){
				$xn22=nlowmult(0.000000001,$xn2);

				$xn =  ($xupp+$xlow)/2;
				$xn2 = nlowmult(0.000000001,$xn**2);
				$eabs= abs($n - $xn2);
				$erel = nlowmult(0.000000001,($xn2-$n)/$xn2);
				$iter +=1;
				print "$iter)$xupp,  $xlow,  $xn,  $xn2,   $eabs, $erel    \n";
				
			
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
main();	

	}





sub main(){
	
	print("\n\n******METHOD MENU*******\n\n\n[1]Quadratic\n[2]Greek\n[3]Babylonian \n[4]Bisection Root\n[5]Bisection Equation\n[6]Regula Falsi\n[7++]Exit\n\n\nEnter your choice:");
	
	$inp=<>;
	system("cls");
		if (looks_like_number( $inp)){
			if ($inp==1){
				quadratic();
			}
			elsif($inp==2){
				greek();
			}
			elsif($inp==3){
				babylonian();
			}
			elsif($inp==4){
				bisect_root();
			}
			elsif($inp==5){
				bisect_eq();
			}
			elsif($inp==6){
				regula_falsi();
			}
			elsif($inp>=7 or $inp==0){ 
				print"PROGRAM WILL EXIT.. THANKS!\n\n";
				exit 1;
				
			}
			}
			
		else{
			print "ERROR: INVALID INPUT, PROGRAM WILL TERMINATE\n\n";
		}
}	




main();

	