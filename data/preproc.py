SRC_DIR = 'original_data/'
TRG_DIR = 'proc_data/'

# gather samples
sample_list = []
sample_list_file = open('sample_list.txt', 'r')
for line in sample_list_file.readlines():
    line = line.replace('\n', '')
    sample_list.append(line)
sample_list_file.close()

# gather necessary and related id
id_list = []
id_list_file = open('glucose_id.txt', 'r')
for line in id_list_file:
    line = line.replace('\n', '')
    id_list.append(line)
id_list_file.close()

# retrieve related measurements
def retrieve_req_lines(read_file, rid):
    # read_file: handle of file
    # rid: a list of request ids
    # return a list of request lines
    def dec_item(item):#, rkey, rvals):
        if('=' not in item):
            return False
        [key, val] = item.split('=')
        #if(key == rkey && (val in rvals)):
        if((key == 'id') and (val in rid)):
            return True
        else:
            return False
    res = []
    for line in read_file.readlines():
        line = line.replace('\n', '')
        items = line.split('\t')
        for item in items:
            if(dec_item(item)):
                res.append(line + '\n')
    return res

for sample in sample_list:
    with open(SRC_DIR + sample + '.txt', 'r') as rf:
        with open(TRG_DIR + sample + '.txt', 'wb') as wf:
            wf.writelines(retrieve_req_lines(rf, id_list))