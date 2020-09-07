import sys

def deep_get(_dict, keys, default=None):
    for key in keys:
        if isinstance(_dict, dict):
            _dict = _dict.get(key, default)
        else:
            return default
    return _dict   


my_dict = {"a":{"b":{"c":"d"}}}
ans = deep_get(my_dict, ['a', 'b', 'c'])
print(ans)
