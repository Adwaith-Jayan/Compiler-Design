#include <stdio.h>
#include <stdlib.h>

typedef struct ASTNODE{
   char op;
   struct ASTNODE* left;
   struct ASTNODE* right;
   int value;
}ASTNODE;

ASTNODE*  make_node(char op,ASTNODE* left, ASTNODE* right);
ASTNODE* make_leaf(int value);
void print_ast(ASTNODE* root);
