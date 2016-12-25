function [IX2, ccc1, ccc2] = FCM(in)

IM=double(in);
[maxX,maxY]=size(IM);
IMM=cat(3,IM,IM);

%%%%%%%%%%%%%%%%
cc1=8;
cc2=250;


ttFcm=0;
while(ttFcm<15)
    ttFcm=ttFcm+1;
    
    c1=repmat(cc1,maxX,maxY);
    c2=repmat(cc2,maxX,maxY);
    if ttFcm==1
        test1=c1;test2=c2;
    end
    c=cat(3,c1,c2);
    
    ree=repmat(0.000001,maxX,maxY);
    ree1=cat(3,ree,ree);
    
    distance=IMM-c; %interchangeable
    distance=distance.*distance+ree1;
    
    daoShu=1./distance;
    
    daoShu2=daoShu(:,:,1)+daoShu(:,:,2);
    distance1=distance(:,:,1).*daoShu2;
    u1=1./distance1;
    distance2=distance(:,:,2).*daoShu2;
    u2=1./distance2;
    
    ccc1=sum(sum(u1.*u1.*IM))/sum(sum(u1.*u1));
    ccc2=sum(sum(u2.*u2.*IM))/sum(sum(u2.*u2));
    
    tmpMatrix=[abs(cc1-ccc1)/cc1,abs(cc2-ccc2)/cc2];
    pp=cat(3,u1,u2);    
    
    for i=1:maxX
        for j=1:maxY
            if max(pp(i,j,:))==u1(i,j)
                IX2(i,j)=1;
           
            else
                IX2(i,j)=2;
            end
        end
    end
    %%%%%%%%%%%%%%%
   if max(tmpMatrix)<0.0001
         break;
  else
         cc1=ccc1;
         cc2=ccc2;
        
  end

end
