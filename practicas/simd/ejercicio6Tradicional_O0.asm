
ejercicio6Tradicional_O0:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   0x2f92(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp *0x2f93(%rip)        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop

Disassembly of section .plt.got:

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp *0x2f9d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001060 <__stack_chk_fail@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp *0x2f5d(%rip)        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001070 <printf@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 55 2f 00 00 	bnd jmp *0x2f55(%rip)        # 3fd0 <printf@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001080 <_start>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	31 ed                	xor    %ebp,%ebp
    1086:	49 89 d1             	mov    %rdx,%r9
    1089:	5e                   	pop    %rsi
    108a:	48 89 e2             	mov    %rsp,%rdx
    108d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1091:	50                   	push   %rax
    1092:	54                   	push   %rsp
    1093:	45 31 c0             	xor    %r8d,%r8d
    1096:	31 c9                	xor    %ecx,%ecx
    1098:	48 8d 3d 31 01 00 00 	lea    0x131(%rip),%rdi        # 11d0 <main>
    109f:	ff 15 33 2f 00 00    	call   *0x2f33(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10a5:	f4                   	hlt    
    10a6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10ad:	00 00 00 

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 59 2f 00 00 	lea    0x2f59(%rip),%rdi        # 4010 <__TMC_END__>
    10b7:	48 8d 05 52 2f 00 00 	lea    0x2f52(%rip),%rax        # 4010 <__TMC_END__>
    10be:	48 39 f8             	cmp    %rdi,%rax
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 16 2f 00 00 	mov    0x2f16(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   %rax,%rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    *%rax
    10d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10d8:	c3                   	ret    
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 29 2f 00 00 	lea    0x2f29(%rip),%rdi        # 4010 <__TMC_END__>
    10e7:	48 8d 35 22 2f 00 00 	lea    0x2f22(%rip),%rsi        # 4010 <__TMC_END__>
    10ee:	48 29 fe             	sub    %rdi,%rsi
    10f1:	48 89 f0             	mov    %rsi,%rax
    10f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10f8:	48 c1 f8 03          	sar    $0x3,%rax
    10fc:	48 01 c6             	add    %rax,%rsi
    10ff:	48 d1 fe             	sar    %rsi
    1102:	74 14                	je     1118 <register_tm_clones+0x38>
    1104:	48 8b 05 e5 2e 00 00 	mov    0x2ee5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    110b:	48 85 c0             	test   %rax,%rax
    110e:	74 08                	je     1118 <register_tm_clones+0x38>
    1110:	ff e0                	jmp    *%rax
    1112:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1118:	c3                   	ret    
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <__do_global_dtors_aux>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	80 3d e5 2e 00 00 00 	cmpb   $0x0,0x2ee5(%rip)        # 4010 <__TMC_END__>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   %rbp
    112e:	48 83 3d c2 2e 00 00 	cmpq   $0x0,0x2ec2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1135:	00 
    1136:	48 89 e5             	mov    %rsp,%rbp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d c6 2e 00 00 	mov    0x2ec6(%rip),%rdi        # 4008 <__dso_handle>
    1142:	e8 09 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 bd 2e 00 00 01 	movb   $0x1,0x2ebd(%rip)        # 4010 <__TMC_END__>
    1153:	5d                   	pop    %rbp
    1154:	c3                   	ret    
    1155:	0f 1f 00             	nopl   (%rax)
    1158:	c3                   	ret    
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <maximo_tradicional>:
    1169:	f3 0f 1e fa          	endbr64 
    116d:	55                   	push   %rbp
    116e:	48 89 e5             	mov    %rsp,%rbp
    1171:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1175:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1179:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%rbp)
    1180:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
    1187:	00 
    1188:	eb 37                	jmp    11c1 <maximo_tradicional+0x58>
    118a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    118e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1195:	00 
    1196:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    119a:	48 01 d0             	add    %rdx,%rax
    119d:	8b 00                	mov    (%rax),%eax
    119f:	39 45 f4             	cmp    %eax,-0xc(%rbp)
    11a2:	7d 18                	jge    11bc <maximo_tradicional+0x53>
    11a4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11a8:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    11af:	00 
    11b0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11b4:	48 01 d0             	add    %rdx,%rax
    11b7:	8b 00                	mov    (%rax),%eax
    11b9:	89 45 f4             	mov    %eax,-0xc(%rbp)
    11bc:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
    11c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11c5:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    11c9:	72 bf                	jb     118a <maximo_tradicional+0x21>
    11cb:	8b 45 f4             	mov    -0xc(%rbp),%eax
    11ce:	5d                   	pop    %rbp
    11cf:	c3                   	ret    

00000000000011d0 <main>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	55                   	push   %rbp
    11d5:	48 89 e5             	mov    %rsp,%rbp
    11d8:	48 83 ec 40          	sub    $0x40,%rsp
    11dc:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    11e3:	00 00 
    11e5:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11e9:	31 c0                	xor    %eax,%eax
    11eb:	c7 45 d0 01 00 00 00 	movl   $0x1,-0x30(%rbp)
    11f2:	c7 45 d4 06 00 00 00 	movl   $0x6,-0x2c(%rbp)
    11f9:	c7 45 d8 04 00 00 00 	movl   $0x4,-0x28(%rbp)
    1200:	c7 45 dc 03 00 00 00 	movl   $0x3,-0x24(%rbp)
    1207:	c7 45 e0 0d 00 00 00 	movl   $0xd,-0x20(%rbp)
    120e:	c7 45 e4 07 00 00 00 	movl   $0x7,-0x1c(%rbp)
    1215:	c7 45 e8 08 00 00 00 	movl   $0x8,-0x18(%rbp)
    121c:	c7 45 ec 09 00 00 00 	movl   $0x9,-0x14(%rbp)
    1223:	c7 45 f0 0b 00 00 00 	movl   $0xb,-0x10(%rbp)
    122a:	48 c7 45 c8 09 00 00 	movq   $0x9,-0x38(%rbp)
    1231:	00 
    1232:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
    1236:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    123a:	48 89 d6             	mov    %rdx,%rsi
    123d:	48 89 c7             	mov    %rax,%rdi
    1240:	e8 24 ff ff ff       	call   1169 <maximo_tradicional>
    1245:	89 45 c4             	mov    %eax,-0x3c(%rbp)
    1248:	8b 45 c4             	mov    -0x3c(%rbp),%eax
    124b:	89 c6                	mov    %eax,%esi
    124d:	48 8d 05 b0 0d 00 00 	lea    0xdb0(%rip),%rax        # 2004 <_IO_stdin_used+0x4>
    1254:	48 89 c7             	mov    %rax,%rdi
    1257:	b8 00 00 00 00       	mov    $0x0,%eax
    125c:	e8 0f fe ff ff       	call   1070 <printf@plt>
    1261:	b8 00 00 00 00       	mov    $0x0,%eax
    1266:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    126a:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    1271:	00 00 
    1273:	74 05                	je     127a <main+0xaa>
    1275:	e8 e6 fd ff ff       	call   1060 <__stack_chk_fail@plt>
    127a:	c9                   	leave  
    127b:	c3                   	ret    

Disassembly of section .fini:

000000000000127c <_fini>:
    127c:	f3 0f 1e fa          	endbr64 
    1280:	48 83 ec 08          	sub    $0x8,%rsp
    1284:	48 83 c4 08          	add    $0x8,%rsp
    1288:	c3                   	ret    
