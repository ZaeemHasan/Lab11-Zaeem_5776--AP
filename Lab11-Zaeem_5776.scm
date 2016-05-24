; reference for following functions:- (http://matt.might.net/articles/church-encodings-demo-in-scheme/)

(define true
  (lambda (a b)
    a
  )
)

(define false
  (lambda (a b)
    b
  )
)

(define ifelse 
	(lambda (p a b)
		(p a b)
	)
)

; reference for following functions:- (Sir's Slides)

(define AND
  (lambda (M N)
    (N (M true false) false)
  )
)

(define OR
  (lambda (M N)
    (N true (M true false))
  )
)

(define NOT
  (lambda (M)
    (M false true)
  )
)

(define SUB
  (lambda (a b)
    (pred b a)
  )
)

(define LEQ
  (lambda (a b)
    (IsZero (SUB a b)) 
  )
)

; following functions i.e. iszero, successor, and predecessor are in impure lamda calculus so that value can be calculated,reference of logic:- (Sir's Slides)

(define IsZero
  (lambda (a)
    (if(= a z)
    	true
    	false
    )
  )
)

(define succ
  (lambda (a b)
    (+ a b)
  )
)

(define pred
  (lambda (a b)
    (if (< (- b a) z)
       z
      (- b a)
    )
  )
)

; following functions are the converted code given by sir:-

(define z 0) ; vatiable whose value is zero, since we cannot directly use zero in functional programming
(define sum 0) ; variable for storing sum

(define aCompletelyUselessFunctionCreatedOnlyToMakeYourLifeMiserable
  (lambda (m n)
    (ifelse (OR (IsZero m) (LEQ m n)) 
    	(loopSUM sum n) 
    	(succ m n))
  )
)

(define loopSUM		; function in which our recursive forloop lies, logic reference:-(Sir's code, https://www.shido.info/lisp/scheme7_e.html) 
  (lambda (sum n)
    (define (loop n sum z)
      (if (zero? n)
        sum
        (loop (pred 1 n) (succ sum z) (succ z 1))
      )
    )
    (loop n sum z)
  )
)