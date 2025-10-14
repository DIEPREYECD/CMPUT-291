customers(cid, name, email)
products(pid, name, category, price, stock_count, descr)
creditCards(cno, holder_name, expiry)
orders(ono, odate, shipping_address)
orderlines(ono, lineNo, pid, qty, uprice, discount)
sessions(cid, sessionNo, start_time, end_time)
orderSessions(ono, cid, sessionNo)  --an order may be associated to a session
activities(cid, sessionNo, ts)
viewedProduct(cid, sessionNo, ts, pid) --ts is the timestamp
search(cid, sessionNo, ts, query)
add2cart(cid, sessionNo, ts, pid)
checkout(cid, sessionNo, ts)
payment(cid, sessionNo, ts, cno)