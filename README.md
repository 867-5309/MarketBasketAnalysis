## Goals
	
The goal of this analysis was to discover interesting relationships (or associations) between customer’s transactions and the item(s) they’ve purchased by conducting a market basket analysis. These associations can then be used to drive sales-oriented initiatives such as recommender systems like the ones used by Amazon and other eCommerce businesses. 
To help form a clearer picture of Electronidex's customer buying patterns, these questions will try to be answered:
  -	Are there any interesting patterns or item relationships within Electronidex's transactions?
  -	Would Blackwell benefit from selling any of Electronidex's items?
  -	Should Blackwell acquire Electronidex?
  -	If Blackwell does acquire Electronidex, do you have any recommendations for Blackwell? (Ex: cross-selling items, sale promotions, should they remove items, etc.)
 
## Context

The dataset consisted of the one month recorded transactions of Electronidex customers and their purchases. There were 9833 transactions recorded over 125 products. 
Most sold product categories/types are desktops, laptops and monitors. And if we go by specific products, we can see that the list of the most sold products is dominated by Apple products. Most sold item is an iMac and is followed by HP Laptop, CYBERPOWER Gamer Desktop, Apple Earpods, Apple MacBook Air and Lenovo Desktop computer.

<p align="center">
  <img src="https://github.com/867-5309/MarketBasketAnalysis/blob/master/Graphs/most%20sold.jpeg">
</p>    

If we look at the 1 item purchases, that list is dominated by Apple products as well. Four of the five most frequently sold items are Apple products. Most sold item is MacBook Air with 383 transactions. Second most sold item are Apple Earpods (156 transactions). They are followed by the iMac (121 transactions), CYBERPOWER gamer desktop (109) and the MacBook Pro (67).

<p align="center">
  <img src="https://github.com/867-5309/MarketBasketAnalysis/blob/master/Graphs/1%20item%20transaction.jpeg">
</p>    

Customers baskets consisted of 1 to 30 items. Number of transactions was falling with the growth of the size of the basket. One item transactions were most often (2000 ~ 20% of all transactions).  2-, 3- and 4-items transactions followed with roughly 40% of all transactions (4000). The rest of the purchases was spread across other basket sizes, but with evident fall of the transaction number with basket size growth. Purchases of 20 to 30 items in the basket were rare, and they appeared 45 times over a month period. 

## Methodology

For this research the market basket analysis technique was used with the apriori algorithm. The Apriori algorithm is helpful when working with large datasets and is used to uncover insights in transactional datasets. It is based on item frequency.

The Apriori algorithm assesses association rules which created using two types of measurements.
The first statistical measure is the Support measurement, which measures rules frequency within your transactional data. 
The second statistical measure is the Confidence measurement, which measures the accuracy of the rules. A rule that measures high in both support and confidence is known as a strong rule. Lift measures the importance of a rule by calculating the ratio between the rule’s confidence and support. A high value for lift strongly indicates that the rule is important. 

After inspecting the dataset it is obvious that most frequent item (iMac) appears in 25% of all transactions, and the rest of the items a lot less. So to catch as many relevant rules, the support measurement used in apriori algorithm was put at 0.004, with medium level of confidence at 0.3. The association rules accuired with these parameters were 966, with 2, 3, 4  and 5 items in the rule. The majority of rules were 3 items rules (667).

## Results and conclusions

#### Big and small buyers

Looking through the rules, it becomes obvious that Electronidex customers were not only private buyers. There are obvious indications for that statement.

First indication that they have retail customers is the size of the basket. If we compare it to the Blackwell’s customers who bought between 1 and 7 items, Electronidex customers buy from 1 to 30 items. Even if we said already that those large basket purchases were rare, they are still good business indicator.

Second indication that their customers are not dominately private customers is seen when we look more closely the rules. We can see that one of the most often rules that we encounter (has high support) is the baket with HP Laptop and an iMac (743). Rules that follow are also not typical purchases of small buyers. There are a lot of purchases with multiple desktops or laptops. 

#### Rules and association observations

As it was previously mentioned	the most sold item is an iMac. If we look through the rules that contain it, we can draw some conclusions. Customers who buy HP Laptop or Lenovo desktop computer or Cyberpower gamer desktop or Dell Desktop or ViewSonic monitor have higher tendency to buy the iMac. Those purchases can be labeled as big customer purchases. Small customer purchases that result in buying an iMac are more likely the ones that have 3 button mouse or an Apple magic keyboard or Microsoft Office Home and Student.

Second most sold item is the HP Laptop. If we look through those rules it is obvious that similar patters occur even here. HP Laptop is bought in combination with Lenovo, Dell and Acer desktops	when big customers make purchases and in combination with ViewSonic and other monitors (ASUS and LG) or Apple Magic keyboard in small customers purchases.

If we exclude the three most sold items, we get some not obvious rules which are also very relevant for businesses. Excluding the iMac, HP Laptop and CYBERPOWER gamer Desktop we get that customers who buy HP Black and Tri – color Ink, are very likely to buy ViewSonic monitor. Also customers who buy Apple earpods and ASUS chromebook are also very likely to buy ViewSonic monitor. Lenovo Desktop computer is more likely to be purchased if Apple magic keyboard or ASUS 2 monitor was purchased.

#### Recommendations

As we have already pointed out, Electonidex customers can be separated in two groups: big and small buyers (private and business). To properly use our findings, it would be advised that customers have their profiles. Recommendation system would work better if we know what kind of customer is our buyer. 

Also, it seems that Electronidex customers have higher buying power, because even if we exclude big buyers we still get that their most sold items are Apple products. Blackwell customers have lower buying power, but our online sales go up to 3000 USD which indicates that Blackwell could benefit with acquiring Electronidex. We could branch out a bit, spread our customer base, and attract more big buyers. Desktop and Laptops are not Blackwell most sold products, but with Electronidex customers they could become more popular.

As for marketing campaigns it would be advised to separate those for big and small customers. Big customers can get gratis gift products if they reach desired amount spent per transactions. Small customers can be offered discounts for buying suggested combinations of products. Of course, bigger inspection of customers buying patterns should be done if Blackwell acquires Electonidex.
