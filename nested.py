import sys
check_val = sys.argv[1]


def recursive_items(dictionary):
    for key, value in dictionary.items():
        if type(value) is dict:
            keys.append(str(key))
            yield from recursive_items(value)
        else:
            yield (key, value)

my_dict = {"a":{"b":{"c":"d"}}} 

for k,v in my_dict.items():
  keys = []
  keys.append(str(k))
  for key, value in recursive_items(v):
    # print(key, value)
    keys.append(str(key))
  if check_val in keys:
    print(value)
  else:
    pass