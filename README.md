# FloralDET

A mobile application to detect following 17 categories of flowers and get description about them.

Alpine sea holly,
Balloon flower,
Bluebell,
Buttercup,
Cowslip,
Crane Flower,
Crocus,
Daffodil,
Daisy,
Dandelion,
Hibiscus,
Pansy,
Passion,
Rose,
Snowdrop,
Sunflower,
Tigerlily.

# Implementation
 A Convolutional Neural Network was trained using transfer learning. 
27 different models were created by varying architectures (MobileNetV2,MobileNet & MobileNetV3), optimizers (Adagrad, Adam & RMSprop) and batch sizes. The optimal model was the selected for deployment. An app was created using Flutter. The weight and labels were deployed to the app. One can select images both from a gallery or a camera. The code for training the model is named "FloralDET.ipynb" in the above code section.SQLite was used to make the database containing detailed information about all the 17 flowers.

## How to install the app ##

1. Install Flutter and android studio.
2. Install all dependencies related to it.
3. Clone the project to a folder.
4. Open the project in command line.
5. Run an emulator or plug a real device.
6. Run 'flutter run' in command line.


## The App

https://user-images.githubusercontent.com/68723052/141268918-c1b52b74-b1d5-486a-808e-11ee368b8906.mov

Touching the prediction text will bring up a bottom sheet that gives detailed information about that particular flower as shown in this video.


## Images of 17 Flowers it can detect

![asds](https://user-images.githubusercontent.com/68723052/123532858-a4e7f880-d730-11eb-9359-bf37be5828f2.PNG)



