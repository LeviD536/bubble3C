function [xn,yn]=locatexyC(x,y,n,lm,im,LMAX,LMIN,R,xc,yc)
  %get xn,yn
  xn=0;yn=0;  
  lnc=sqrt((x(n)-xc)^2+(y(n)-yc)^2);
  if(lm>LMIN&&lm<LMAX)  % not far or near
      if(lnc<(LMAX/2)/sin(pi/9))  %not far from group
         r=2*R*rand-R;
         theta=2*pi*rand-pi;
         k=tan(theta);
         if(k>0)
            xn=x(n)+r/sqrt(k^2+1);
            yn=y(n)+r/sqrt((1/k)^2+1);
         elseif(k<0)
            xn=x(n)+r/sqrt(k^2+1);
            yn=y(n)-r/sqrt((1/k)^2+1);
         else
            xn=x(n)+r;
            yn=y(n);
         end
      else          % a little far from group
         r=R*rand;
         theta=atan2(yc-y(n),xc-x(n));
         k=tan(theta);
         if(x(n)<xc)
            xn=x(n)+r/sqrt(k^2+1);
         elseif(x(n)>xc)
            xn=x(n)-r/sqrt(k^2+1);
         else
            xn=x(n);
         end
         if(k==0||y(n)==yc)
            yn=y(n);
         elseif(y(n)<yc)
            yn=y(n)+r/sqrt((1/k)^2+1);
         elseif(y(n)>yc)
            yn=y(n)-r/sqrt((1/k)^2+1);
         end           
      end
   elseif(lm<=LMIN)    %too near
        r=R*rand;
        theta=atan2(y(im)-y(n),x(im)-x(n));
        k=tan(theta);
        if(x(n)<x(im))
            xn=x(n)-r/sqrt(k^2+1);
        elseif(x(n)>x(im))
            xn=x(n)+r/sqrt(k^2+1);
        else
            xn=x(n);
        end
        if(k==0||y(n)==y(im))
            yn=y(n);
        elseif(y(n)<y(im))
            yn=y(n)-r/sqrt((1/k)^2+1);
        elseif(y(n)>y(im))
            yn=y(n)+r/sqrt((1/k)^2+1);
        end
    elseif(lm>=LMAX)   %too far
        r=R*rand;
        theta=atan2(y(im)-y(n),x(im)-x(n));
        k=tan(theta);
        if(x(n)<x(im))
            xn=x(n)+r/sqrt(k^2+1);
        elseif(x(n)>x(im))
            xn=x(n)-r/sqrt(k^2+1);
        else
            xn=x(n);
        end
        if(k==0||y(n)==y(im))
            yn=y(n);
        elseif(y(n)<y(im))
            yn=y(n)+r/sqrt((1/k)^2+1);
        elseif(y(n)>y(im))
            yn=y(n)-r/sqrt((1/k)^2+1);
        end  
   end

