import xlrd
import numpy as np

op1 = []
op2 = []
op3 = []
r20 = []
b768 = []
s720_480 = []

data = xlrd.open_workbook("combi.xls")
table_main2 = data.sheet_by_name('2')
table_main3 = data.sheet_by_name('3')
table_main4 = data.sheet_by_name('4_2')
table_main5 = data.sheet_by_name('5')
table_r20 = data.sheet_by_name('r20')
table_r30 = data.sheet_by_name('r30')
table_r40 = data.sheet_by_name('r40')
table_b768 = data.sheet_by_name('b768')
table_b1024 = data.sheet_by_name('b1024')
table_b1536 = data.sheet_by_name('b1536')
table_s720_480 = data.sheet_by_name('720-480')
table_s1280_800 = data.sheet_by_name('1280-800')
table_s1920_1080 = data.sheet_by_name('1920-1080')

real_time2 = table_main2.col_values(2)
real_time3 = table_main3.col_values(2)
real_time4 = table_main4.col_values(2)
real_time5 = table_main5.col_values(2)
r20 = np.array(table_r20.col_values(1))
r30 = np.array(table_r30.col_values(1))
r40 = np.array(table_r40.col_values(1))
b768 = np.array(table_b768.col_values(1))
b1024 = np.array(table_b1024.col_values(1))
b1536 = np.array(table_b1536.col_values(1))
s720_480 = np.array(table_s720_480.col_values(1))
s1280_800 = np.array(table_s1280_800.col_values(1))
s1920_1080 = np.array(table_s1920_1080.col_values(1))


#################### combi2
for i in range(3159):
    op1.append(real_time2[3 * i])
    op2.append(real_time2[3 * i + 1])
    op3.append(real_time2[i * 3 + 2])
op1_np = np.array(op1)
op2_np = np.array(op2)
op3_np = np.array(op3)

op1_aver = sum((b768 + r20 - op1_np)/(b768 + r20)) / 3159
op2_aver = sum((b768 + s720_480 - op2_np)/(b768 + s720_480)) / 3159
op3_aver = sum((s720_480 + r20 - op3_np)/(s720_480 + r20)) / 3159

combi2_aver = (op1_aver + op2_aver + op3_aver)/3
print(combi2_aver)
print("combi2 average consuming time:",sum(op1_np+op2_np+op3_np)/3159/3,"s")

################## combi3
realtime3_np = np.array(real_time3)
aver = sum((b768 + r20 + s720_480 - realtime3_np)/(b768 + r20 +s720_480)) / 3159
print(aver)
print("combi3 average consuming time:",sum(realtime3_np)/3159,'s')
#################### combi4
op1 = []
op2 = []
op3 = []
for j in range(3159):
    op1.append(real_time4[3 * i])
    op2.append(real_time4[3 * i + 1])
    op3.append(real_time4[i * 3 + 2])
op1_np = np.array(op1)
op2_np = np.array(op2)
op3_np = np.array(op3)

op1_aver = sum((b768 + r20 + s720_480 +r30 - op1_np)/(b768 + r20 +s720_480 + r30)) / 3159
op2_aver = sum((b768 + s720_480 + r20 + s1280_800 - op2_np)/(b768 + s720_480 +r20 + s1280_800)) / 3159
op3_aver = sum((s720_480 + r20 + b768 +b1024 - op3_np)/(s720_480 + r20 + b768 + b1024)) / 3159

combi4_aver = (op1_aver + op2_aver + op3_aver)/3
print(combi4_aver)
print("combi4 average consuming time:",sum(op1_np+op2_np+op3_np)/3159/3,'s')
#################### combi5
op1 = []
op2 = []
op3 = []
for j in range(3159):
    op1.append(real_time5[3 * i])
    op2.append(real_time5[3 * i + 1])
    op3.append(real_time5[i * 3 + 2])
op1_np = np.array(op1)
op2_np = np.array(op2)
op3_np = np.array(op3)

op1_aver = sum((b768 + r20 + s720_480 +r30 +r40 - op1_np)/(b768 + r20 +s720_480 + r30 +r40)) / 3159
op2_aver = sum((b768 + s720_480 + r20 + s1280_800 +s1920_1080 - op2_np)/(b768 + s720_480 +r20 + s1280_800 + s1920_1080)) / 3159
op3_aver = sum((s720_480 + r20 + b768 +b1024 + b1536 - op3_np)/(s720_480 + r20 + b768 + b1024 +b1536)) / 3159

combi5_aver = (op1_aver + op2_aver + op3_aver)/3
print(combi5_aver)
print("combi5 average consuming time:",sum(op1_np+op2_np+op3_np)/3159/3,'s')
