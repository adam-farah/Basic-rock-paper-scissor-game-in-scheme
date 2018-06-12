#|
Adam Farah : 

This is an example piece of code for demonstration of documentation and testing standards.
Ensure lang is R5RS to run.

Procedures involving basic arithmetic evaluations using BEDMAS
|#
(#%require (only racket/base random))

;Basic rock paper scissor game in scheme
;Input: Will be prompted as functions starts
;Output: Game info (score, wins, losses..ext)
(define (rps)
  (define (scoreTrack score)
    ;initual set up showing current stats and instructions
    (display "Current Score: ")
    (display score) (newline)
    (display "Coresponding attack numbers Rock = 0, Paper = 1, or Scissors = 2: ") (newline)


    ;user input
    ;if user enters invalid value it will not add anything to the score
    (define x (read)) ;read what has been entered
    (define (user x)
      (cond ((= x 0) (display "Rock")) ;check if it's the correct input
            ((= x 1) (display "Paper"))
            ((= x 2) (display "Scissors"))
            (else
             (display "N/A"))))

    (define (computerOpponent com) ;computer opponent
      (cond ((= com 0) (display "Rock")) ;it\s opetions
            ((= com 1) (display "Paper"))
            ((= com 2) (display "Scissors"))
            (else
             (display "N/A"))))

    (define com (random 2)) ;using random from range 0 - 2 to give
                            ;give the computer random attacks


;Display user and apponents moves
(display "You used: ")
(user x) (newline)

(display "Computer Oppenent used: ")
(computerOpponent com) (newline)


;;This is a display function for showing the user what happened in the round
;Input: none
;Output: displays info on the round
(define (displaycheck)
(cond
  ;all combinations of attacks and responses
  ;after user has ented value and the oppennet function has ran
  ((and (= x 0) (= com 0)) (display "It is a draw")) ;rock to rock
  ((and (= x 0) (= com 1)) (display "You lost the round!")) ;rock to paper
  ((and (= x 0) (= com 2)) (display "The round is yours!")) ;rock to scissors
  ((and (= x 1) (= com 1)) (display "It is a draw"))
  ((and (= x 1) (= com 2)) (display "You lost the round!"))
  ((and (= x 1) (= com 0)) (display "The round is yours!"))
  ((and (= x 2) (= com 2)) (display "It is a draw"))
  ((and (= x 2) (= com 0)) (display "You lost the round!"))
  ((and (= x 2) (= com 1)) (display "The round is yours!"))
  (else (display "Please enter in the corrent attack number"))))

(displaycheck)
(display "\n")
(display "\n")

;score check function
;input: none
;output: curent score point of the game
(define (check)
(cond
  ((and (= x 0) (= com 0)) (+ score 0)) ;tie
  ((and (= x 0) (= com 1)) (- score 1)) ;lose
  ((and (= x 0) (= com 2)) (+ score 1)) ;win
  ((and (= x 1) (= com 1)) (+ score 0))
  ((and (= x 1) (= com 2)) (- score 1))
  ((and (= x 1) (= com 0)) (+ score 1))
  ((and (= x 2) (= com 2)) (+ score 0))
  ((and (= x 2) (= com 0)) (- score 1))
  ((and (= x 2) (= com 1)) (+ score 1))
  (else
   (+ score 0))))

(scoreTrack (check)))
(scoreTrack 0))

;One game functions including nested functions that inlove
;michanics in the game all leading the the final check function



(rps)




;--------------------------------------
;Testing
;random scenario
#|
Current Score: 0
Coresponding attack numbers Rock = 0, Paper = 1, or Scissors = 2:
1
You used: Paper
Computer Oppenent used: Rock
The round is yours!
|#
