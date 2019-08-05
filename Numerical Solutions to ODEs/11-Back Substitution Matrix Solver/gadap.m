function [int, abt] = gadap(a, b, f, p, tol)
% a,b: interval endpoints with a < b
% f: function handle f(x, p) to integrate (p for user parameters)
% tol: User-provided tolerance for integral accuracy
% int: Approximation to the integral
% abt: Endpoints and approximations 

q = 3;
w = [ 5, 8, 5 ] / 9;
x = [ -sqrt(3/5), 0, sqrt(3/5) ];

% integrate over [a,b]
m = 0.5 * ( a + b );
l = 0.5 * ( b - a );
int = 0.0;
for i = 1 : q
	int = int +  w( i ) * f( m + l * x( i ), p );
end
int = l * int;

n = 1;
abt( 1, 1 ) = a;
abt( 2, 1 ) = b;
abt( 3, 1 ) = int;

j = 0;
int = 0;
while(  j < n ) 
j = j + 1;

% subdivide [a,b] -> [al,bl] U [ar,br]
al = abt( 1, j );
br = abt( 2, j );
intab = abt( 3, j );

bl = 0.5 * ( al + br );
ar = bl;

%integrate over l
m = 0.5 * ( al + bl );
l = 0.5 * ( bl - al );
intl = 0.0;
for i = 1 : q
	intl = intl +  w( i ) * f( m + l * x( i ), p );
end
intl = l * intl;

%integrate over r
m = 0.5 * ( ar + br );
l = 0.5 * ( br - ar );
intr = 0.0;
for i = 1 : q
	intr = intr +  w( i ) * f( m + l * x( i ), p );
end
intr = l * intr;

%compare and decide
if( abs( intab - ( intl + intr ) ) > tol * abs( intab ) )
	n = n + 1;
	abt( 1, n ) = al;
	abt( 2, n ) = bl;
	abt( 3, n ) = intl;
	n = n + 1;
	abt( 1, n ) = ar;
	abt( 2, n ) = br;
	abt( 3, n ) = intr;
else
	%j;
	int = int + intab;
end
end

end
