import urllib

sample_list_file = open('sample_list.txt', 'r')
sample_list = []
for line in sample_list_file.readlines():
    line = line.replace('\n', '')
    sample_list.append(line)
sample_list_file.close()
# print sample_list

url_base = 'https://physionet.org/physiobank/database/mimic2cdb-ps/'
for sample in sample_list:
    url = url_base + sample + '/' + sample + '.txt'
    urllib.urlretrieve(url, sample + '.txt')