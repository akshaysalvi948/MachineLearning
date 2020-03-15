import pandas  as pd
from numpy import loadtxt
from xgboost import XGBClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

dataset = pd.read_csv('https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv',header=None)
dataset.head(2)

# split data into X and y
X = dataset.iloc[:,0:8]
Y = dataset.iloc[:,8]

# split data into train and test sets
seed = 7
test_size = 0.33
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=test_size, 
                                                    random_state=seed)

# fit model no training data
model = XGBClassifier(max_depth=10, learning_rate=0.000001, n_estimators=550)
model.fit(X_train, y_train)

# make predictions for test data
y_pred = model.predict(X_test)

#predictions = [round(value) for value in y_pred]
pd.crosstab(y_test,y_pred)

# make predictions for test data
y_pred = model.predict(X_test)
predictions = [round(value) for value in y_pred]

print(predictions)
accuracy = accuracy_score(y_test, predictions)
print(accuracy)
