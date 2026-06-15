# Side Effects

After having run a Shopware migration (say from Shopware 5 to Shopware 6), sometimes "funny" thinsgs happen. Products are not visible in the storefront, or they are displayed but can't purchased. Things like this - I call them "side effects".

### max\_purchase = 0 in Shopware 5

max\_purchase = 0 is a valid setting in Shopware 5 for articles and simply means that a customer can purchase a number of items of a product limited only by available stock.

However, after migration, max\_purchase = 0 in Shopware 6 means that a customer cannot purchase even a single item of this product.

As a result, you will see `ProductOutOfStockError` errors ("The product \<name> is no longer available") in your logs when trying to a add the product to the cart. In the storefront on the product detail page you will note that the product cannot be added to the cart at all (the 'Add-to-basket' button is hidden).

To solve this problem with a quick fix, run this SQL after migration (as always, backup your DB before):

```sql
UPDATE product SET max_purchase = NULL WHERE max_purchase = 0;
```
