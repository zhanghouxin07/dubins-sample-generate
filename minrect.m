 function[pbar]=minrect(p)
% close all;clear all;
% n=30;
% p=rand(n,2);

ind=convhull(p(:,1),p(:,2));
l=length(ind);

hull=p(ind,:);          %�����͹��

area=inf;
for i=2:l
    p1=hull(i-1,:);     %͹����������
    p2=hull(i,:);
   
    k1=(p1(2)-p2(2))/(p1(1)-p2(1));     %���������ֱ�ߣ���Ϊ���ε�һ����
    b1=p1(2)-k1*p1(1);
   
    d=abs(hull(:,1)*k1-hull(:,2)+b1)/sqrt(k1^2+1);  %����͹���ϵĵ㵽k1,b1ֱ�ߵľ���
    
    [h ind]=max(d);                     %�õ��������ĵ���룬��Ϊ�ߣ�ͬʱ�õ��õ�����
    b2=hull(ind,2)-k1*hull(ind,1);      %���k1,b1ֱ����Ե���һ��ƽ�б�k1,b2;
       
    k2=-1/k1;                           %����õ�ֱ�ߵĴ���б��
 
    b=hull(:,2)-k2*hull(:,1);           %��͹�����е㹹�ɵ�k2,bֱ��ϵ
    x1=-(b1-b)/(k1-k2);                 %͹�������е�������õĵ�һ���ߵ�ͶӰ
    y1=-(-b*k1+b1*k2)/(k1-k2);
   
    x2=-(b2-b)/(k1-k2);                 %͹�������е�������õĵڶ����ߵ�ͶӰ
    y2=-(-b*k1+b2*k2)/(k1-k2);
   
    [junk indmax1]=max(x1);             %ͶӰ�ڵ�һ������x�����������Сֵ
    [junk indmin1]=min(x1);
                                        
    [junk indmax2]=max(x2);             %ͶӰ�ڵڶ�������x�����������Сֵ
    [junk indmin2]=min(x2);
   
    w=sqrt((x1(indmax1)-x1(indmin1))^2+(y1(indmax1)-y1(indmin1))^2);    %���εĿ�

    if area>=h*w                        %ʹ�����С
        area=h*w;
        pbar=[x1(indmax1) y1(indmax1);  %�����ĸ��ǵ�
              x2(indmax2) y2(indmax2);        
              x2(indmin2) y2(indmin2);
              x1(indmin1) y1(indmin1)];            
    end
end
pbar(5,:)=pbar(1,:);

hold on;
plot(p(:,1),p(:,2),'.');
plot(pbar(:,1),pbar(:,2),'r')
axis equal;