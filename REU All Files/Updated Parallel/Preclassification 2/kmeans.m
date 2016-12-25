function [label_im,vec_mean] = kmeans(im,no_of_cluster,varargin)
% IM input Image. NO_OF_CLUSTER is number of cluster.
% VARARGIN will define Colorspace if it is empty RGB colorspace will be
% choose for clustering, or if its not empty than L*a*b* Colorspace will be
% used for clustering the image.
% LABEL_IM out put clustered Image. VEC_MEAN are Centers of
% Corresponding Clusters.

[m,n,p] = size(im);

%% ================= For Gray Images ====================================
if p<3
    gray = im;
    
    minimum = min(gray(:));
    vector=double((gray(:)-minimum)+1);% 1
    vector = repmat(vector,[1,no_of_cluster]);
    vec_mean=(1:no_of_cluster).*max((vector))/(no_of_cluster+1);
    num = length(vector);
    itr = 0;
    % tic
    %================ for gray image ==========================
    while(true)
        itr = itr+1;
        old_mean=vec_mean;
        vec_mean = repmat(vec_mean,[num,1]);
        %     for i=1:length(label_vector)
        distance=(((vector-vec_mean)).^2);
        vec_mean(2:end,:)=[];
        [~,label_vector] = min(distance,[],2);
        % i=1:no_of_cluster;
        for i=1:no_of_cluster
            index=(label_vector==i);
            vec_mean(:,i)=sum(vector(index))/nnz(index);
        end
        if (vec_mean==old_mean | itr>25)% You can change it accordingly
            break;
        end
    end
    label_im = reshape(label_vector,size(gray));
else
    if isempty(varargin)
%% ============================== For RGB colorspace ==================
        im = double(im);
        
        red = im(:,:,1);
        green = im(:,:,2);
        blue = im(:,:,3);
        
        vecred= (red(:)-min(red(:))+1);
        vecgreen= (green(:)-min(green(:))+1);
        vecblue= (blue(:)-min(blue(:))+1);
        
        vecred = repmat(vecred,[1,no_of_cluster]);
        vecgreen = repmat(vecgreen,[1,no_of_cluster]);
        vecblue = repmat(vecblue,[1,no_of_cluster]);
        
        meanred1=(1:no_of_cluster).*max((vecred(:)))/(no_of_cluster+1);
        meangreen1=(1:no_of_cluster).*max((vecgreen(:)))/(no_of_cluster+1);
        meanblue1=(1:no_of_cluster).*max((vecblue(:)))/(no_of_cluster+1);
        
        
        num = length(vecred);
        itr = 0;
        while(true)
            
            itr = itr+1;
            oldred=meanred1;
            oldgreen=meangreen1;
            oldblue=meanblue1;
            
            meanred = repmat(meanred1,[num,1]);
            meangreen = repmat(meangreen1,[num,1]);
            meanblue = repmat(meanblue1,[num,1]);
            
            distred=(((vecred-meanred)).^2);
            distgreen=(((vecgreen-meangreen)).^2);
            distblue=(((vecblue-meanblue)).^2);
            
            clear meanred;clear meangreen;clear meanblue;
            
            distance = sqrt(distred+distgreen+distblue);
            
            [~,label_vector] = min(distance,[],2);
            
            for i=1:no_of_cluster
                index=(label_vector==i);
                %             meanred1(:,i)=ceil(sum(vecred(index))./nnz(index));
                %             meangreen1(:,i)=ceil(sum(vecgreen(index))./nnz(index));
                %             meanblue1(:,i)=ceil(sum(vecblue(index))./nnz(index));
                
                meanred1(:,i)=ceil(mean(vecred(index)));
                meangreen1(:,i)=ceil(mean(vecgreen(index)));
                meanblue1(:,i)=ceil(mean(vecblue(index)));
            end
            
            if ((meanred1==oldred & meangreen1==oldgreen & meanblue1==oldblue | itr>25))% You can change it accordingly
                break;
            end
        end
        
        label_im = reshape(label_vector,[m,n]);
        vec_mean = [meanred1;meangreen1;meanblue1];
        
    else
%% ================= For L*a*b* Color Space==============================
        cform = makecform('srgb2lab');
        lab = double(applycform(im,cform));
        tic
%         im = double(im);
        a = lab(:,:,2);
        b = lab(:,:,3);
        
        veca= (a(:)-min(a(:))+1);
        vecb= (b(:)-min(b(:))+1);
        
        
        veca = repmat(veca,[1,no_of_cluster]);
        vecb = repmat(vecb,[1,no_of_cluster]);
        
        meana1=(1:no_of_cluster).*max((veca(:)))/(no_of_cluster+1);
        meanb1=(1:no_of_cluster).*max((vecb(:)))/(no_of_cluster+1);
         
        num = length(veca);
        itr = 0;
        while(true)
            
            itr = itr+1;
            olda=meana1;
            oldb=meanb1;
            
            meana = repmat(meana1,[num,1]);
            meanb= repmat(meanb1,[num,1]);
            
            dista=(((veca-meana)).^2);
            distb=(((vecb-meanb)).^2);
            
            clear meana;clear meanb;
            
            distance = sqrt(dista+distb);
            
            [~,label_vector] = min(distance,[],2);
            
            for i=1:no_of_cluster
                index=(label_vector==i);
             
                meana1(:,i)=ceil(mean(veca(index)));
                meanb1(:,i)=ceil(mean(vecb(index)));
                
            end
            
            if ((meana1==olda & meanb1==oldb))% You can change it accordingly
                break;
            end
        end
        
        label_im = reshape(label_vector,[m,n]);
        vec_mean = [meana1;meanb1];
        toc
    end
    
end
end

