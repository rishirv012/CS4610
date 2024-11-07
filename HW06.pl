/* *********** HW06 ***********

Student name: Kathleen O'Donovan, Rishi Vanga, James Daniel, Mary Ellen Schuster 
Student ID: i.e. zsx4ey, npd7af, pnh9yt, skg3cn
Collaborators and sources: TODO - specific websites and people consulted

Create a Prolog program that will solve the 64 Rooks problem (and
smaller versions) described below. Run your program against your own
specific queries. Include both the queries and the results of those
queries as comments in your file.

The "64 Rooks Problem": 
1.) You are given a chessboard (8 x 8 grid).
2.) You are given 64 rooks, each with a given color (you can think of
	these as red, blue, orange, etc.) and made of a certain material
	(you can think of these as wood, glass, steel, etc.).
3.) There are 8 unique colors and 8 unique materials, producing 64 unique
	combinations. Each of the 64 rooks is a unique combination of color
	and material. 
	- There are 8 groups of 8 rooks, each group is a different color
	- Within each group of 8, each rook is made of a unique material
4.) Place the 64 rooks on the chessboard such that no rook is able to
	attack (or check) a rook of the same color or of the same material.
5.) Rooks can only move horizontally or vertically. They can attack any
	other rook in the same row or column. They can not attack diagonally.



The 64 rooks could be described the following way:
		C1M1 C1M2 C1M3 ... C1M8
		C2M1 C2M2 C2M3 ... C2M8
		...
		C8M1 C8M2 C8M3 ... C8M8
		(note: not a legal solution, just a way to show rook labeling)

Here C stands for color and M stands for material. C1M3 signifies a
rook that is Color 1 and has Material 3. The colors are 1-8 and the
materials are 1-8. You may use a different representation than this as
long as you can clearly explain it.

Given this labeling scheme, C2M3 can not be in a row or column that
contains any C2 (C2M1, C2M2, etc.) or M3 (C1M3, C2M3, etc.) rooks.

As Prolog programs can be slow, begin by creating a program that can
solve this problem for a board of size 3 (3 x 3 grid with 9 rooks).
An example solution that it might find -
		C1M1 C2M3 C3M2
		C2M2 C3M1 C1M3
		C3M3 C1M2 C2M1

After solving for size 3, attempt to increase the size to 4, 5, 6, 7, and 8.

For each of these sizes, place in your comments the exact query needed
and the output from running that query. You may use different variable
names and-or labels than the ones shown above as long as you clearly
explain in your comments.

If some of these sizes can not be completed, explain why.

Submit your working Prolog program as a single .ml file named HW10.pl
If you get stuck, refer to the examples that we have covered:
- wolf, goat, cabbage
- 8-Queens
- n-Queens

You may want to solve this first with just one property, then start 
with that solution and add the second property.

Feel free to use the clpfd library, which we mentioned in class.
An example of the N-Queens problem that using the clpfd library can
be found at: https://swish.swi-prolog.org/example/clpfd_queens.pl
Swish also has other examples that may be useful.
*/

notRow(_,[]).
notRow(X/Y/C/M, X1/Y1/C1/M1) :-
    X =:= X1,
    Y =\= Y1,
    C =\= C1,
    M =\= M1.

notColumn(_,[]).
notColumn(X/Y/C/M, X1/Y1/C1/M1) :-
    Y =:= Y1,
    X =\= X1,
    C =\= C1,
    M =\= M1.    

nocheck(_, []).
nocheck(X/Y/C/M, [X1/Y1/C1/M1 | Rest]) :-
	(X =:= X1 -> notRow(X/Y/C/M, X1/Y1/C1/M1) ; true),
	(Y =:= Y1 -> notColumn(X/Y/C/M, X1/Y1/C1/M1) ; true),
	nocheck(X/Y/C/M, Rest).

legal([]).
legal([X/Y/C/M | Rest]) :-
	legal(Rest),
	member(X,[1,2,3,4,5,6,7,8]),
	member(Y,[1,2,3,4,5,6,7,8]),
    member(C,[1,2,3,4,5,6,7,8]),
    member(M,[1,2,3,4,5,6,7,8]),
	nocheck(X/Y/C/M, Rest).

/ 
Query: ninerooks(X).
Output: [1/3/1/1, 1/2/4/4, 1/1/3/3, 2/3/4/4, 2/2/1/1, 2/1/2/2, 3/3/3/3, 3/2/2/2, 3/1/1/1]
/
ninerooks(X) :-
X = [1/_/_/_,1/_/_/_,1/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_],
    legal(X).

/ 
Query: sixteenrooks(X).
Output: [1/4/1/1, 1/3/2/2, 1/2/3/3, 1/1/4/4, 2/4/2/2, 2/3/1/1, 2/2/4/4, 2/1/3/3, 3/4/3/3, 3/3/4/4, 3/2/1/1, 3/1/2/2, 4/4/4/4, 4/3/3/3, 4/2/2/2, 4/1/1/1]
/
sixteenrooks(X) :-
X = [1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,3/_/_/_,3/_/_/_, 3/_/_/_, 3/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_],
    legal(X).

/ 
Query: twentyfiverooks(X).
Output: [1/5/1/1, 1/4/8/8, 1/3/7/7, 1/2/6/6, 1/1/5/5, 2/5/8/8, 2/4/1/1, 2/3/2/2, 2/2/3/3, 2/1/4/4, 3/5/7/7, 3/4/2/2, 3/3/1/1, 3/2/4/4, 3/1/3/3, 4/5/6/6, 4/4/3/3, 4/3/4/4, 4/2/1/1, 4/1/2/2, 5/5/5/5, 5/4/4/4, 5/3/3/3, 5/2/2/2, 5/1/1/1]
/
twentyfiverooks(X) :-
X = [1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_,2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_],
    legal(X).

/ 
Query: thirtysixrooks(X).
Output: [1/6/1/1, 1/5/2/2, 1/4/7/7, 1/3/8/8, 1/2/5/5, 1/1/6/6, 2/6/2/2, 2/5/1/1, 2/4/8/8, 2/3/7/7, 2/2/6/6, 2/1/5/5, 3/6/7/7, 3/5/8/8, 3/4/1/1, 3/3/2/2, 3/2/3/3, 3/1/4/4, 4/6/8/8, 4/5/7/7, 4/4/2/2, 4/3/1/1, 4/2/4/4, 4/1/3/3, 5/6/5/5, 5/5/6/6, 5/4/3/3, 5/3/4/4, 5/2/1/1, 5/1/2/2, 6/6/6/6, 6/5/5/5, 6/4/4/4, 6/3/3/3, 6/2/2/2, 6/1/1/1]
/
thirtysixrooks(X) :-
X = [1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_,  6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_],
    legal(X).

/ 
Query: fourtyninerooks(X).
Output: [1/7/1/1, 1/6/4/4, 1/5/3/3, 1/4/6/6, 1/3/5/5, 1/2/8/8, 1/1/7/7, 2/7/4/4, 2/6/1/1, 2/5/2/2, 2/4/7/7, 2/3/8/8, 2/2/5/5, 2/1/6/6, 3/7/3/3, 3/6/2/2, 3/5/1/1, 3/4/8/8, 3/3/7/7, 3/2/6/6, 3/1/5/5, 4/7/6/6, 4/6/7/7, 4/5/8/8, 4/4/1/1, 4/3/2/2, 4/2/3/3, 4/1/4/4, 5/7/5/5, 5/6/8/8, 5/5/7/7, 5/4/2/2, 5/3/1/1, 5/2/4/4, 5/1/3/3, 6/7/8/8, 6/6/5/5, 6/5/6/6, 6/4/3/3, 6/3/4/4, 6/2/1/1, 6/1/2/2, 7/7/7/7, 7/6/6/6, 7/5/5/5, 7/4/4/4, 7/3/3/3, 7/2/2/2, 7/1/1/1]
/
fourtyninerooks(X) :-
X = [1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 1/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 2/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_, 3/_/_/_,  4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 4/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 5/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 6/_/_/_, 7/_/_/_, 7/_/_/_, 7/_/_/_, 7/_/_/_, 7/_/_/_, 7/_/_/_, 7/_/_/_],
    legal(X).

/ 
Query: sixtyfourrooks(X).
Output: [1/8/1/1, 1/7/2/2, 1/6/3/3, 1/5/4/4, 1/4/5/5, 1/3/6/6, 1/2/7/7, 1/1/8/8, 2/8/2/2, 2/7/1/1, 2/6/4/4, 2/5/3/3, 2/4/6/6, 2/3/5/5, 2/2/8/8, 2/1/7/7, 3/8/3/3, 3/7/4/4, 3/6/1/1, 3/5/2/2, 3/4/7/7, 3/3/8/8, 3/2/5/5, 3/1/6/6, 4/8/4/4, 4/7/3/3, 4/6/2/2, 4/5/1/1, 4/4/8/8, 4/3/7/7, 4/2/6/6, 4/1/5/5, 5/8/5/5, 5/7/6/6, 5/6/7/7, 5/5/8/8, 5/4/1/1, 5/3/2/2, 5/2/3/3, 5/1/4/4, 6/8/6/6, 6/7/5/5, 6/6/8/8, 6/5/7/7, 6/4/2/2, 6/3/1/1, 6/2/4/4, 6/1/3/3, 7/8/7/7, 7/7/8/8, 7/6/5/5, 7/5/6/6, 7/4/3/3, 7/3/4/4, 7/2/1/1, 7/1/2/2, 8/8/8/8, 8/7/7/7, 8/6/6/6, 8/5/5/5, 8/4/4/4, 8/3/3/3, 8/2/2/2, 8/1/1/1]
/
sixtyfourrooks(X) :-
X = [1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,1/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,4/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,5/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,6/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,7/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_,8/_/_/_],
%X = [1/_/_/_,1/_/_/_,1/_/_/_,2/_/_/_,2/_/_/_,2/_/_/_,3/_/_/_,3/_/_/_,3/_/_/_],
    legal(X).
