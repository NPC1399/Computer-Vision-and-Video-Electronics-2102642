"""
fix update new center -> In old version,  I forgot to change center index  (save center[0] by average[0] to average[2]) that why center of cluster[0] has alway changed.
Test with coin_02 ot coin_0.
coin_02, coin_03, coin_04 : the model has incorrectly responded because the shadow. coin_03 has 2 coin that was placed nearly threshold of these coins are connected. 
That why the model see them as 1 coin.
coin_05 is a image without shadow. But the image has over-brightness so the threshold of some coin was gone in this model. 

Edit : Phumiphat Charoentananuwat (19/05/21)
"""
import cv2
import numpy as np

#get the image,resize and convert to grayscale
img = cv2.resize(cv2.imread("coin_05.jpg"),(800,600))
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
pos = []

for cnt in contours:
    cnt_area.append(cv2.contourArea(cnt))
    x,y,w,h = cv2.boundingRect(cnt)
    pos.append((x,y))


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
    if k_center[0] != sum(amax)/len(amax):
        k_center[0] = sum(amax)/len(amax)
        again = 1
    
    if k_center[1] != sum(amin)/len(amin):
        k_center[1] = sum(amin)/len(amin)
        again = 1
        
    if k_center[2] != sum(amid)/len(amid):
        k_center[2] = sum(amid)/len(amid)
        again = 1
    i=i+1

# get index in contour
ind = 0
inmax = []
inmin = []
inmid = []
for area in cnt_area:
    if area in amax:
        inmax.append(ind)
    elif area in amin:
        inmin.append(ind)
    else:
        inmid.append(ind)
    ind += 1

#max text
for index in inmax:
    cv2.putText(img,"T",pos[index],cv2.FONT_HERSHEY_SIMPLEX,4,(255,0,0),2,cv2.LINE_AA)

#min text
for index in inmin:
    cv2.putText(img,"O",pos[index],cv2.FONT_HERSHEY_SIMPLEX,4,(0,255,0),2,cv2.LINE_AA)

#mid text
for index in inmid:
    cv2.putText(img,"5",pos[index],cv2.FONT_HERSHEY_SIMPLEX,4,(0,0,255),2,cv2.LINE_AA)



cv2.imshow("gray",gray)
cv2.imshow("dilate",dilate)
cv2.imshow("absolute different",cv2.absdiff(gray,bg_img))
cv2.imshow("non normalize",diff_img)
cv2.imshow("normalize",norm_img)
cv2.imshow("blur",blur)
cv2.imshow("thresh",thresh)
cv2.imshow("closing",closing)
cv2.imshow("img",img)


while True:
    k = cv2.waitKey(5)
    if k == ord('q'):
        break

