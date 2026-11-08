# -*- coding: utf-8 -*-
"""
Created on Sat Jun 22 23:26:07 2024
@author: mrmak
"""

import numpy as np
# Define the initial matrix Y with complex numbers
Y = np.array([[-9.8j, 0, 4j, 5j],[0, -8.3j, 2.5j, 5j],[4j, 2.5j, -14.5j, 8j],[5j, 5j, 8j, -18j]], dtype=complex)
print("Main Matrix:")
print(Y)
# Prompt the user for the number of reduction steps
n = int(input("Enter the number of reduction steps: "))
s = Y.shape[0]  # Initial size of the matrix
for p in range(n):
    # Apply reduction
    for k in range(s):
        for j in range(s):
            if k != s - 1 and j != s - 1:  # Avoid modifying the last row and column
                Y[k, j] = Y[k, j] - ((Y[k, s - 1] * Y[s - 1, j]) / Y[s - 1, s - 1])
    # Display intermediate matrix after applying the equations
    print("Using equations, intermediate matrix:")
    print(Y)
    # Copy the reduced matrix to a new matrix
    X = Y[:s-1, :s-1]
    # Update Y and the size s
    Y = X
    s -= 1
    # Display the output after reduction
    print(f"Output after reduction step {p + 1}:")
    print(Y)
