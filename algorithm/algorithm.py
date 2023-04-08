import cv2
from random import randint

#opencv dnn 
net = cv2.dnn.readNet("dnn_model/yolov4-tiny.weights", "dnn_model/yolov4-tiny.cfg")
model = cv2.dnn_DetectionModel(net)
model.setInputParams(size=(416, 416), scale=1/255)

#load class lists
classes = []
with open("dnn_model/classes.txt") as file_object:
    for class_name in file_object:
        classes.append(class_name.strip())

#initialise camera
cap = cv2.VideoCapture(0)
cap.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
#Full_HD = 1920x1080

box_colour = (200, 50 , 5)
object = randint(0, len(classes))  

while True:
    ret, frame = cap.read()
   
    (class_ids, scores, boxes) = model.detect(frame)
    for class_id, score, bbox in zip(class_ids, scores, boxes):
        if score >= 0.5 and object == class_id:
            x, y, w, h = bbox
            class_name = classes[class_id[0]]
            cv2.rectangle(frame, bbox, box_colour, 2)
            cv2.putText(frame, classes[class_id[0]], (bbox[0], bbox[1]-10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, box_colour, 2)

    cv2.imshow("frame", frame)
    cv2.waitKey(1)