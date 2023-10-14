import cv2

haar_data = cv2.CascadeClassifier('data.xml')
capture = cv2.VideoCapture(0)
while True:
    flag, img = capture.read()
    if flag:
        faces = haar_data.detectMultiScale(img)
        for x, y, w, h in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 255), 4)
        cv2.imshow('Face Detection', img)
        if cv2.waitKey(2) == 27:
            break
capture.release()
cv2.destroyAllWindows()