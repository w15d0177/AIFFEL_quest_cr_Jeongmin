import tensorflow as tf
import tensorflow_datasets as tfds
from tensorflow.keras.applications.vgg19 import preprocess_input
from tensorflow.keras.preprocessing import image
from tensorflow.keras.applications.imagenet_utils import decode_predictions
from PIL import Image
import numpy as np
import os

def load_model():
    model_path = os.path.expanduser('./flower_vgg19.h5')
    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model file not found: {model_path}")
    model = tf.keras.models.load_model(model_path)
    return model

async def prediction_model(model):
    img_path = os.path.expanduser('./sample_data/sunflower.jpg')
    if not os.path.exists(img_path):
        raise FileNotFoundError(f"Image file not found: {img_path}")
    
    img = Image.open(img_path)
    target_size = 224
    img = img.resize((target_size, target_size))

    np_img = image.img_to_array(img)
    img_batch = np.expand_dims(np_img, axis=0)
    pre_processed = preprocess_input(img_batch)
    
    _, metadata = tfds.load(
        'tf_flowers',
        with_info=True
    )
    
    y_scores = model.predict(pre_processed)
    y_preds = np.argmax(y_scores, axis=1)
    result = {"Flower": metadata.features['label'].int2str(y_preds[0]), "Score": str(int(np.max(y_scores) * 100)) + "%"}
    return result