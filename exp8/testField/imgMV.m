 function imgMV(motionVect,imgP,blk_center)
    subplot(233);
    imshow(uint8(imgP));
    title('运动矢量图');
    hold on 
    y=blk_center(1, : );%i 
    x=blk_center(2, : );%j 
    v=motionVect(1, : );%m 
    u=motionVect(2, : );%n 
    quiver(x,y,u,v,'red'); 
    hold on 
end 