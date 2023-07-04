import numpy as np
import matplotlib.pyplot as plt

import torch
import torchvision
import torchvision.transforms as T
from torch.utils.data import DataLoader

# transform = T.Compose([T.ToTensor()])
# traindata = torchvision.datasets.MNIST(root='./data', train=True,download=True,transform=transform)
# trainloader = DataLoader(traindata,batch_size = 64)

train_dataset = torchvision.datasets.MNIST(root='./data',
                                           train=True,
                                           transform=T.ToTensor(),
                                           download=True)

test_dataset = torchvision.datasets.MNIST(root='./data',
                                           train=False,
                                           transform=T.ToTensor(),
                                           download=True)

fig, label = train_dataset[0]
print(f'fig shape : {fig.size()}, label : {label}')

fig, axes = plt.subplots(1, 5)
for i in range(5):
    axes[i].imshow(train_dataset[i][0].view(-1, 28), cmap='gray')
    axes[i].axis("off")
# import matplotlib.pyplot as plt
# fig = plt.figure(figsize=(10,4))

# for i in range(10):
#     ax = fig.add_subplot(2,5,i+1)
#     ax.imshow(data[i,0])