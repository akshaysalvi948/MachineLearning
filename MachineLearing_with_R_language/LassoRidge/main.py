from sklearn.linear_model import Ridge
import sklearn.linear_model as lm
import pandas as pd
from sklearn.metrics import r2_score

infile = pd.read_csv("mtcars.csv")

infile

X = infile.drop(['mpg'],axis=1,inplace=False)
Y = infile['mpg']

alphas = [0.00001,0.0001,0.001,0.01,0.1,1,10,100,1e3,1e4,2e4,5e4,8e4,1e5,1e6,1e7,1e8]
ridgecv = lm.RidgeCV(alphas = alphas, scoring = 'neg_mean_squared_error',normalize = True)
ridgecv.fit(X,Y)
ridgecv.alpha_

clf = Ridge(alpha=1,copy_X=True,fit_intercept=True,max_iter=None,
           normalize=True ,random_state=None,solver='auto',tol=0.001)
clf.fit(X,Y)

pred1 = clf.predict(X)
r2_score(Y,pred1)

pd.Series(X.columns,index=clf.coef_)

alphas = [0.00001,0.0001,0.001,0.01,0.1,1,10,100,1e3,1e4,2e4,5e4,8e4,1e5,1e6,1e7,1e8]
lassocv = lm.LassoCV(alphas = alphas,normalize = True,cv=10,\
                    max_iter = 100000)
lassocv.fit(X,Y)
lassocv.alpha_

clf = lm.Lasso(max_iter = 10000 , normalize = True)
clf.set_params(alpha=lassocv.alpha_)
clf.fit(X,Y)
pred1 = clf.predict(X)
print(r2_score(Y,pred1),clf.coef_,clf.intercept_)
pd.Series(clf.coef_,x.columns)