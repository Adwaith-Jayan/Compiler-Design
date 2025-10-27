#include "ast.h"

ASTNODE* make_node(char op, ASTNODE* left, ASTNODE* right)
{
   ASTNODE* node= (ASTNODE*)malloc(sizeof(ASTNODE));
   node->op=op;
   node->left=left;
   node->right=right;
   node->value=0;

   return node;
}

ASTNODE* make_leaf(int value)
{
    ASTNODE* node=(ASTNODE*)malloc(sizeof(ASTNODE));

    node->value=value;
    node->left=NULL;
    node->right=NULL;
    node->op=0;

   return node;
}


void print_ast(ASTNODE* root)
{
   if(root->left) print_ast(root->left);
   if(root->right) print_ast(root->right);
   if(root->op)
      printf("%c ",root->op);
   else
      printf("%d ",root->value);
}

