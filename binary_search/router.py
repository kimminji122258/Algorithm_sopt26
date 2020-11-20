# 최대한 많은 곳에서 와이파이를 사용하려고 하기 때문에,
# 가장 인접한 두 공유기 사이의 거리를 가능한 크게해 설치하려고 한다.

# 집의 개수(N)와 공유기의 개수(C)를 입력받기
n, c = list(map(int, input().split(' ')))

# 전체 집의 좌표 정보를 입력받기
array = []
for _ in range(n):
  array.append(int(input()))
array.sort()

start = array[1] - array[0] # 가장 가까운 값
end = array[-1] - array[0] # 가장 먼 값
result = 0

while(start <= end):
  mid = (start+end) // 2 #mid는 가장 인접한 두 공유기 사이의 거리를 의미
  value = array[0]
  count = 1

  # 현재의 mid값을 이용해 공유기를 설치
  for i in range(1, n): #앞에서부터 차근차근 설치
    if array[i] >= value + mid:
      value = array[i]
      count += 1

    if count >= c:
      start = mid + 1
      result = mid #최적의 결과를 저장
    
    else: # C개 이상의 공유기를 설치할 수 없는 경우, 거리를 감소
      end = mid -1

print(result)