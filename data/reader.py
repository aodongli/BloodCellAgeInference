def is_req_item(item, rkeys):
    if('=' not in item):
        return False
    [key, val] = item.split('=')
    if(key in rkeys):
        return True
    else:
        return False

def extract_val(item, rkeys4val, rkeys4str):
    #print item
    [key, val] = item.split('=')
    if key in rkeys4str:
        return val
    else:
        val = ''.join(c for c in val if c.isdigit())
        return int(val)

def reader(sample_list, SRC_DIR):
    res = {}
    idx = 0
    rkeys = ['t0', 'id', 'v1']
    for sample in sample_list:
        sample_dat = []
        with open(SRC_DIR + sample + '.txt', 'r') as rf:
            for line in rf.readlines():
                line = line.replace('\n', '')
                items = line.split('\t')
                tmp = [sample]
                for item in items:
                    if is_req_item(item, rkeys):
                        #print sample
                        tmp.append(extract_val(item, ['id', 'v1'], ['t0']))
                sample_dat.append(tmp)
        res[idx] = sample_dat
        idx += 1
    return res

if __name__ == "__main__":
    # gather samples
    sample_list = []
    sample_list_file = open('sample_list.txt', 'r')
    for line in sample_list_file.readlines():
        line = line.replace('\n', '')
        sample_list.append(line)
    sample_list_file.close()

    SRC_DIR = 'proc_data/'

    result = reader(sample_list, SRC_DIR)
    print result[0]