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
            # Checking if the detected object's score is greater than or equal to 0.5
            # and if the object matches the given class_id
            
            x, y, w, h = bbox
            # Extracting the x, y, width, and height values from the bounding box
            
            class_name = classes[class_id[0]]
            # Getting the class name corresponding to the class ID from the classes list
            
            cv2.rectangle(frame, bbox, box_colour, 2)
            # Drawing a rectangle around the object on the frame using the bounding box coordinates
            
            cv2.putText(frame, classes[class_id[0]], (bbox[0], bbox[1]-10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, box_colour, 2)
            # Putting the class name as text above the bounding box on the frame using OpenCV's putText function.
            # It takes the frame, class name, text position (bbox[0], bbox[1]-10), font type, font scale (0.5),
            # text color (box_colour), and text thickness (2) as parameters.


    cv2.imshow("frame", frame)
    cv2.waitKey(1)