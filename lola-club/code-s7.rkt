#lang racket
(require games/cards racket/gui racket/class racket/unit)

;; Layout width and height:
(define WIDTH 5)
(define HEIGHT 4)
(define MAX-MATCHES (/ (* WIDTH HEIGHT) 2))

;; Randomize
(random-seed (modulo (current-milliseconds) 10000))

;; Set up the table
(define t (make-table "Memory" (+ 2 WIDTH) (+ 1 HEIGHT)))
(send t show #t)
(send t set-double-click-action #f)

;; Get table width & height
(define w (send t table-width))
(define h (send t table-height))

;; Set up the cards
(define deck 
  (let ([cards (map (lambda (name value)
                      (let ([bm (make-object
                                 bitmap%
                                 (build-path
                                  (collection-path "games" "memory" "images")
                                  (format "~a.png" name)))])
                        (make-card bm #f 0 value)))
                    '("club" "heart" "spade" "diamond"
                      "happy" "unhappy" "fish" "two-fish" "jack" "star")
                    '(1 2 3 4 5 6 7 8 9 10))])
    (append cards (map (lambda (c) (send c copy)) cards))))
(for-each (lambda (card)
            (send card user-can-move #f)
            (send card user-can-flip #t))
          deck)

;; Card width & height
(define cw (send (car deck) card-width))
(define ch (send (car deck) card-height))

(define dx (/ cw (+ 2 WIDTH)))
(define dy (/ ch (+ 1 HEIGHT)))

(define match-x (- w cw dx))
(define match-y dy)

;; Put the cards on the table
(send t add-cards deck match-x match-y)

;; Setup
(define (setup)
  (set! deck (shuffle-list deck 7))
  (send t stack-cards deck)
  (send t move-cards deck 0 0
        (lambda (pos)
          (let ([i (modulo pos WIDTH)]
                [j (quotient pos WIDTH)])
            (values (+ dx (* i (+ cw dx)))
                    (+ dy (* j (+ ch dy))))))))

;; Number of matches found so far:
(define matches 0)

;; First card flipped, or #f if non flipped, yet
(define card-1 #f)

(define (flip-and-match c)
  (cond [(eq? c card-1)
         ;; Cancel first card
         (send t flip-card c)
         (set! card-1 #f)]
        [(not (send c face-down?))
         ;; Can't click a matched card, unless the game is over, 
         ;; in which case we reset the game
         (when (= matches MAX-MATCHES)
           (send t flip-cards deck)
           (set! matches 0)
           (setup))]
        [else
         ;; Flip over a card...
         (send t flip-card c)
         (send t card-to-front c)
         (cond [(not card-1)
                ;; That was the first card
                (set! card-1 c)]
               [(and (equal? (send card-1 get-value) (send c get-value))
                     (equal? (send card-1 get-suit) (send c get-suit)))
                ;; Match  
                (send t move-cards (list card-1 c) match-x match-y)
                (set! card-1 #f)
                (set! matches (add1 matches))]
               [else
                ;; Not a match
                (send t pause 0.5)
                (send t flip-cards (list card-1 c))
                (set! card-1 #f)])]))

(send t set-single-click-action flip-and-match)

;; Start the game:
(setup)
