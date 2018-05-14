disp('���ڼ���ο�ģ��Ĳ���...')
for i=1:10
	fname = sprintf('%da.wav',i-1);
	x =  audioread(fname);
	[x1 x2] = vad(x);
	ref(i).mfcc = mfcc(x);
end

disp('���ڼ������ģ��Ĳ���...')
for i=1:10
	fname = sprintf('%db.wav',i-1);
	x = audioread(fname);
	[x1 x2] = vad(x);
	test(i).mfcc = mfcc(x);
end

disp('���ڽ���ģ��ƥ��...')
dist = zeros(10,10);
for i=1:10
for j=1:10
	dist(i,j) = dtw(test(i).mfcc, ref(j).mfcc);
end
end

disp('���ڼ���ƥ����...')
for i=1:10
	[d,j] = min(dist(i,:));
	fprintf('����ģ�� %d ��ʶ����Ϊ��%d\n', i, j);
end
dist

