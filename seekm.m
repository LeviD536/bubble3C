function [lm,im]=seekm(x,y,n)
lm=200;im=0;
for i=1:1:9
        l=sqrt((x(n)-x(i))^2+(y(n)-y(i))^2);
        if(l<lm&&l~=0&&im~=i)
            lm=l;
            im=i;
        end
end
