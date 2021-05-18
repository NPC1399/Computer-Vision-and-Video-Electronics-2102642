import cv2
import numpy as np
import math

#get the image,resize and convert to grayscale
img = cv2.resize(cv2.imread("coin_02.jpg"),(800,600))
gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)

#remove shadow : not use, the edge was removed too
kernel = np.ones((3,3),np.uint8) # create kernel for dilate
dilate = cv2.dilate(gray,kernel) # dilate
bg_img = cv2.medianBlur(dilate,21) # apply median blur
diff_img = 255-cv2.absdiff(gray,bg_img) # remove the shadow
#normalization to increase the edge intensity but not enough
norm_img = cv2.normalize(diff_img,None, alpha=0, beta=255, norm_type=cv2.NORM_MINMAX, dtype=cv2.CV_8UC1)

#apply gaussian blur then find the threshold to separate coin from background
blur = cv2.GaussianBlur(gray,(15,15),5)
_,thresh = cv2.threshold(blur,127,255,cv2.THRESH_BINARY_INV+cv2.THRESH_OTSU)

#use close operation to fill the object
kernel_closing = np.ones((3,3),np.uint8)
closing = cv2.morphologyEx(thresh,cv2.MORPH_CLOSE,kernel_closing)

#find the contour
result_img=closing.copy()
contours,hierachy=cv2.findContours(result_img,cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)

#get contour area and draw
cnt_area = []
for cnt in contours:
    cnt_area.append(cv2.contourArea(cnt))
    ellipse = cv2.fitEllipse(cnt)
    cv2.ellipse(img,ellipse,(0,255,0),2)


#K-mean
#select k center
k_center = [max(cnt_area),min(cnt_area)]
k_center.append((k_center[0]+k_center[1])/2)

#create cluster group
amax = []
amin = []
amid = []

again = 1 #update k center flag
i = 0

while again == 1:
    print("round "+str(i))
    again = 0
    amax = []
    amin = []
    amid = []

    #find (element-k) to select group
    for area in cnt_area:
        v = []
        v.append(abs(area-k_center[0])) #max
        v.append(abs(area-k_center[1])) #min
        v.append(abs(area-k_center[2])) #mid
        count = v.index(min(v))
        if count == 0:
            amax.append(area)
        elif count == 1:
            amin.append(area)
        else:
            amid.append(area)
    
    #find new k center by averaging the elements in each clusters and update
    #it fails in this stage
    if k_center[0] != sum(amax)/len(amax):
        k_center[0] = sum(amax)/len(amax)
        again = 1
    
    if k_center[1] != sum(amin)/len(amin):
        k_center[0] = sum(amin)/len(amin)
        again = 1
        
    if k_center[2] != sum(amid)/len(amid):
        k_center[0] = sum(amid)/len(amid)
        again = 1
    i=i+1


cv2.imshow("gray",gray)
cv2.imshow("dilate",dilate)
cv2.imshow("absolute different",cv2.absdiff(gray,bg_img))
cv2.imshow("non normalize",diff_img)
cv2.imshow("normalize",norm_img)
cv2.imshow("blur",blur)
cv2.imshow("thresh",thresh)
cv2.imshow("closing",closing)


print("amax")
for mem in amax:
    print(mem)
print("amin")
for mem in amin:
    print(mem)
print("amid")
for mem in amid:
    print(mem)

while True:
    k = cv2.waitKey(5)
    if k == ord('q'):
        break

