* Installer for auto-detective O/S *
=========================================


## 작성자
+ 서비스대응팀 이장재 (cine0831@gmail.com)

## 최종수정일
+ 2019-04-05
  + v1.0

## 요구사항
+ 1) O/S 리스트 파일 - IAO.list
+ 2) 설치 대상 리스트 파일 - Target.list

## 설명
+ 시스템의 O/S 배포판 및 버전을 체크하여, 설치 대상 리스트에 정의한 내용에 따라 바이너리를
+ O/S의 버전에 맞게 설치하는 도구


## 리스트 예제
### 1) O/S 리스트
ex)
```
  OS_system_list=("CNT8:CentOS Linux release 8"
  "CNT7:CentOS Linux release 7"
  "CNT6:CentOS release 6"
  "CNT5:CentOS release 5"
  "CNT4:CentOS release 4"
  "FC3:Fedora Core release 3"
  "RHL9:Red Hat Linux release 9"
  "RHL7:Red Hat Linux release 7"
  "UT18:Ubuntu 18"
  "UT16:Ubuntu 16"
  "UT14:Ubuntu 14"
  "UT12:Ubuntu 12")
```

### 2) 설치 대상 리스트
ex)
```
  CNT4:/jjlee02/binary/redis-2.8.24_on_cnt4_64.tar:/jjlee02/
  CNT6:/jjlee02/binary/redis-2.8.24_on_cnt6_64.tar:/jjlee02/
  CNT7:/jjlee02/redis-2.8.24_on_cnt7_64.tar:/jjlee02/
  FC3:/jjlee02/redis-2.8.24_on_fc3_64.tar:/jjlee02/
  RHL9:/jjlee02/redis-2.8.24_on_rhl9_32.tar:/jjlee02/
  CNT4:/jjlee02/redis-5.0.4_on_cnt4_64.tar:/jjlee02/
  CNT6:/jjlee02/redis-5.0.4_on_cnt6_64.tar:/jjlee02/
  CNT7:/jjlee02/redis-5.0.4_on_cnt7_64.tar:/jjlee02/
```

## 사용방법

Usage:

     IAO.sh [options]

Options:

    -f
    -h

Examples:

    IAO.sh -f filename

Description:

    -f             target list for installing
    -h             display this help and exit
