# C--- Compiler

I loved using lex and yacc with my graphics engine, so I decided that I would go one step further and write an entire mini language! This language is called C---, because it's just C but much crappier and with not as many features.

## Planned additions:
### (In order of when I plan to complete each)

- Basic variable definitions (int, char, double maybe, etc.)
	- I don't know if I want different base structures, maybe I will handle strings and things like that in seperate libraries
- Comments (/* comment text goes here \*/)
	- C++ style comments (// Comment text goes here) also sound good, I'll try to add them as well
- Expression evaluations (a + b * c ^ d)
	- + for addition, - for subtraction, * for multiplication, / for division, % for modulous, ^ for exponential
	- Parenthesis too!
- Boolean logic evaluation (a and b or c and not d xor e)
- Bitwise operations
	- & for and, | for or, ! for not, ~ for xor
	- Maybe I will also use the letter b. For example:
		- band for and, bor for or, bnot for not, bxor for xor, etc.
- Control statements (if/elif/else, while, for, etc.)
	- Maybe switch, iteration (i.e. in), or do while. I'm not sure
- Break, continue, and goto
- Functions
	- Basically C functions, but maybe without things like function pointers
- Pointers
	- I don't know if I want pointers or dynamic memory allocation, I'll think about this later
- Arrays
- Structures
	- Classes seem complicated, so I'll stick with C style structures
	- Maybe unions?