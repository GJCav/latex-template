

"""
一个无聊的生成四则运算表达式的小程序
"""
from random import random, randint

toStrFunc = 0

class Node:
    _randMax = 100
    _numtype = 'num'
    _nodetype = 'node'

    type = None
    num = 0
    lson = None
    rson = None
    op = ''

    def __init__(self) -> None:
        self.type = self._numtype
        self.num = int(random() * self._randMax)
        self.op = '+-*/'[randint(0, 3)]

    def __str__(self) -> str:
        if self.type == self._numtype:
            return str(self.num)
        elif self.type == self._nodetype:
            global toStrFunc
            if toStrFunc == 1:
                return f'({str(self.lson)}{self.op}{self.rson})'

            exp = ''
            if self.lson.priority() < self.priority(): exp = f'({self.lson}){self.op}'
            else: exp = f'{self.lson}{self.op}'
            if self.rson.priority() < self.priority(): exp = f'{exp}({self.rson})'
            else: exp = f'{exp}{self.rson}'
            return exp
        else:
            return 'NULL NODE!!!'
    
    def expand(self):
        if self.type == self._numtype:
            self.type = self._nodetype
            self.lson = Node()
            self.rson = Node()
        return self

    def priority(self):
        if self.type == self._numtype: return 1000
        else:
            if self.op in '+-': return 10
            elif self.op in '*/': return 20


def dfs(h: Node, k: int):
    while k > 0:
        k -= 1
        h.expand()
        h = [h.lson, h.rson][randint(0, 1)]
    
   
for i in range(10):
    h = Node()
    dfs(h, 5)
    print(h)


