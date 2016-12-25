First- 9% labels [50 250 100 1] batch 1000 iter 100 .1 learning rate
Second- 9% labels [50 250 200 1] batch 1000 iter 100
Third- 9% labels [50 250 200 100 1] batch 1000 iter 100

GBDN/BBDBN(bbdbn small step ratio of .01, indicated if file starts with smallsteps):
onehundred iter-600000,[50 250 200 100 1],100,100
six layers-100000,[50 250 200 100 50 1],100,50
smallsteps-100000,[50 250 200 100 1],1000,200
fourlayer-100000,[50 250 100 1],100,50
twohundred iter-100000,[50 250 200 100 1],100,200

BBDN norm (step ratio of .1)-
onehundred iter-600000,[50 250 200 100 1],100,100
six layers-100000,[50 250 200 100 50 1],100,50
smallsteps-100000,[50 250 200 100 1],1000,200
fourlayer-100000,[50 250 100 1],100,50
twohundred iter-100000,[50 250 200 100 1],100,200

10batchsar90000-90000,[50 250 200 100 1],10,50 iter
10batch20sar- 100000,[50 250 200 100 1],10,50 iter, every 20th label changed

smallbatch-100000,[50 250 200 100 1],25,50 iter, every 4th label changed
