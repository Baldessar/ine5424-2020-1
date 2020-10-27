
hello:     file format elf32-littleriscv


Disassembly of section .init:

80000000 <_vector_table>:
80000000:	0800006f          	j	80000080 <_start>
80000004:	0001                	nop
80000006:	0001                	nop
80000008:	0001                	nop
8000000a:	0001                	nop
8000000c:	0001                	nop
8000000e:	0001                	nop
80000010:	0001                	nop
80000012:	0001                	nop
80000014:	0001                	nop
80000016:	0001                	nop
80000018:	0001                	nop
8000001a:	0001                	nop
8000001c:	0001                	nop
8000001e:	0001                	nop
80000020:	0001                	nop
80000022:	0001                	nop
80000024:	0001                	nop
80000026:	0001                	nop
80000028:	0001                	nop
8000002a:	0001                	nop
8000002c:	0001                	nop
8000002e:	0001                	nop
80000030:	0001                	nop
80000032:	0001                	nop
80000034:	0001                	nop
80000036:	0001                	nop
80000038:	0001                	nop
8000003a:	0001                	nop
8000003c:	0001                	nop
8000003e:	0001                	nop
80000040:	0001                	nop
80000042:	0001                	nop

80000044 <_init>:
80000044:	800037b7          	lui	a5,0x80003
80000048:	fe47a783          	lw	a5,-28(a5) # 80002fe4 <__boot_stack__+0xf8002fe4>
8000004c:	577d                	li	a4,-1
8000004e:	02e78863          	beq	a5,a4,8000007e <_init+0x3a>
80000052:	1141                	addi	sp,sp,-16
80000054:	c606                	sw	ra,12(sp)
80000056:	c422                	sw	s0,8(sp)
80000058:	c226                	sw	s1,4(sp)
8000005a:	80003437          	lui	s0,0x80003
8000005e:	fe440413          	addi	s0,s0,-28 # 80002fe4 <__boot_stack__+0xf8002fe4>
80000062:	54fd                	li	s1,-1
80000064:	a031                	j	80000070 <_init+0x2c>
80000066:	9782                	jalr	a5
80000068:	1471                	addi	s0,s0,-4
8000006a:	401c                	lw	a5,0(s0)
8000006c:	00978463          	beq	a5,s1,80000074 <_init+0x30>
80000070:	f87d                	bnez	s0,80000066 <_init+0x22>
80000072:	bfdd                	j	80000068 <_init+0x24>
80000074:	40b2                	lw	ra,12(sp)
80000076:	4422                	lw	s0,8(sp)
80000078:	4492                	lw	s1,4(sp)
8000007a:	0141                	addi	sp,sp,16
8000007c:	8082                	ret
8000007e:	8082                	ret

Disassembly of section .text:

80000080 <_start>:
80000080:	f14022f3          	csrr	t0,mhartid
80000084:	06029663          	bnez	t0,800000f0 <__epos_app_entry+0x10>
80000088:	08000117          	auipc	sp,0x8000
8000008c:	f7810113          	addi	sp,sp,-136 # 88000000 <__boot_stack__>
80000090:	00003197          	auipc	gp,0x3
80000094:	77018193          	addi	gp,gp,1904 # 80003800 <__global_pointer$>
80000098:	00003517          	auipc	a0,0x3
8000009c:	f6850513          	addi	a0,a0,-152 # 80003000 <initialized.0>
800000a0:	92418593          	addi	a1,gp,-1756 # 80003124 <_end>
800000a4:	00b57863          	bgeu	a0,a1,800000b4 <_start+0x34>
800000a8:	00052023          	sw	zero,0(a0)
800000ac:	00450513          	addi	a0,a0,4
800000b0:	feb56ce3          	bltu	a0,a1,800000a8 <_start+0x28>
800000b4:	00000397          	auipc	t2,0x0
800000b8:	f4c38393          	addi	t2,t2,-180 # 80000000 <_vector_table>
800000bc:	00000317          	auipc	t1,0x0
800000c0:	f8830313          	addi	t1,t1,-120 # 80000044 <_init>
800000c4:	34131073          	csrw	mepc,t1
800000c8:	00000097          	auipc	ra,0x0
800000cc:	02808093          	addi	ra,ra,40 # 800000f0 <__epos_app_entry+0x10>
800000d0:	30200073          	mret
800000d4:	00000013          	nop
800000d8:	00000013          	nop
800000dc:	00000013          	nop

800000e0 <__epos_app_entry>:
800000e0:	03c000ef          	jal	ra,8000011c <main>
800000e4:	00012503          	lw	a0,0(sp)
800000e8:	6a8010ef          	jal	ra,80001790 <_fini>
800000ec:	560000ef          	jal	ra,8000064c <_exit>
800000f0:	10500073          	wfi
800000f4:	ffdff06f          	j	800000f0 <__epos_app_entry+0x10>
	...

80000104 <_GLOBAL__sub_I__ZN4EPOS1S10init_firstE>:
80000104:	1141                	addi	sp,sp,-16
80000106:	c606                	sw	ra,12(sp)
80000108:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
8000010c:	47dc                	lw	a5,12(a5)
8000010e:	439c                	lw	a5,0(a5)
80000110:	43c8                	lw	a0,4(a5)
80000112:	32c010ef          	jal	ra,8000143e <_ZNVK4EPOS1S3CPU7Context4loadEv>
80000116:	40b2                	lw	ra,12(sp)
80000118:	0141                	addi	sp,sp,16
8000011a:	8082                	ret

8000011c <main>:
8000011c:	1141                	addi	sp,sp,-16
8000011e:	c606                	sw	ra,12(sp)
80000120:	80001537          	lui	a0,0x80001
80000124:	7d050513          	addi	a0,a0,2000 # 800017d0 <__boot_stack__+0xf80017d0>
80000128:	2b2d                	jal	80000662 <_print>
8000012a:	80001537          	lui	a0,0x80001
8000012e:	7e050513          	addi	a0,a0,2016 # 800017e0 <__boot_stack__+0xf80017e0>
80000132:	2b05                	jal	80000662 <_print>
80000134:	800037b7          	lui	a5,0x80003
80000138:	4729                	li	a4,10
8000013a:	00e7a223          	sw	a4,4(a5) # 80003004 <__boot_stack__+0xf8003004>
8000013e:	4501                	li	a0,0
80000140:	40b2                	lw	ra,12(sp)
80000142:	0141                	addi	sp,sp,16
80000144:	8082                	ret

80000146 <_GLOBAL__sub_I_cout>:
80000146:	800037b7          	lui	a5,0x80003
8000014a:	00478793          	addi	a5,a5,4 # 80003004 <__boot_stack__+0xf8003004>
8000014e:	4729                	li	a4,10
80000150:	c398                	sw	a4,0(a5)
80000152:	00078223          	sb	zero,4(a5)
80000156:	8082                	ret

80000158 <_GLOBAL__sub_I__ZN4EPOS1S11Application8_preheapE>:
80000158:	81418793          	addi	a5,gp,-2028 # 80003014 <_ZN4EPOS4coutE>
8000015c:	4729                	li	a4,10
8000015e:	c398                	sw	a4,0(a5)
80000160:	00078223          	sb	zero,4(a5)
80000164:	800037b7          	lui	a5,0x80003
80000168:	00c78793          	addi	a5,a5,12 # 8000300c <__boot_stack__+0xf800300c>
8000016c:	c398                	sw	a4,0(a5)
8000016e:	00078223          	sb	zero,4(a5)
80000172:	8082                	ret

80000174 <_ZN4EPOS1S16Init_ApplicationC1Ev>:
80000174:	9181a783          	lw	a5,-1768(gp) # 80003118 <_ZN4EPOS1S3MMU5_freeE+0x4>
80000178:	1e078363          	beqz	a5,8000035e <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1ea>
8000017c:	43d4                	lw	a3,4(a5)
8000017e:	1e068063          	beqz	a3,8000035e <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1ea>
80000182:	1101                	addi	sp,sp,-32
80000184:	ce06                	sw	ra,28(sp)
80000186:	cc22                	sw	s0,24(sp)
80000188:	ca26                	sw	s1,20(sp)
8000018a:	c84a                	sw	s2,16(sp)
8000018c:	c64e                	sw	s3,12(sp)
8000018e:	c452                	sw	s4,8(sp)
80000190:	c256                	sw	s5,4(sp)
80000192:	c05a                	sw	s6,0(sp)
80000194:	91418413          	addi	s0,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000198:	493d                	li	s2,15
8000019a:	4985                	li	s3,1
8000019c:	82418493          	addi	s1,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
800001a0:	80001b37          	lui	s6,0x80001
800001a4:	80001ab7          	lui	s5,0x80001
800001a8:	a269                	j	80000332 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1be>
800001aa:	4018                	lw	a4,0(s0)
800001ac:	01370c63          	beq	a4,s3,800001c4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x50>
800001b0:	478c                	lw	a1,8(a5)
800001b2:	cd95                	beqz	a1,800001ee <_ZN4EPOS1S16Init_ApplicationC1Ev+0x7a>
800001b4:	47d0                	lw	a2,12(a5)
800001b6:	ce21                	beqz	a2,8000020e <_ZN4EPOS1S16Init_ApplicationC1Ev+0x9a>
800001b8:	c5d0                	sw	a2,12(a1)
800001ba:	478c                	lw	a1,8(a5)
800001bc:	c60c                	sw	a1,8(a2)
800001be:	177d                	addi	a4,a4,-1
800001c0:	c018                	sw	a4,0(s0)
800001c2:	aaa1                	j	8000031a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
800001c4:	00042223          	sw	zero,4(s0)
800001c8:	00042423          	sw	zero,8(s0)
800001cc:	00042023          	sw	zero,0(s0)
800001d0:	4398                	lw	a4,0(a5)
800001d2:	43dc                	lw	a5,4(a5)
800001d4:	97ba                	add	a5,a5,a4
800001d6:	14079663          	bnez	a5,80000322 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1ae>
800001da:	40f2                	lw	ra,28(sp)
800001dc:	4462                	lw	s0,24(sp)
800001de:	44d2                	lw	s1,20(sp)
800001e0:	4942                	lw	s2,16(sp)
800001e2:	49b2                	lw	s3,12(sp)
800001e4:	4a22                	lw	s4,8(sp)
800001e6:	4a92                	lw	s5,4(sp)
800001e8:	4b02                	lw	s6,0(sp)
800001ea:	6105                	addi	sp,sp,32
800001ec:	8082                	ret
800001ee:	12070663          	beqz	a4,8000031a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
800001f2:	4050                	lw	a2,4(s0)
800001f4:	4650                	lw	a2,12(a2)
800001f6:	c050                	sw	a2,4(s0)
800001f8:	00062423          	sw	zero,8(a2)
800001fc:	177d                	addi	a4,a4,-1
800001fe:	c018                	sw	a4,0(s0)
80000200:	4398                	lw	a4,0(a5)
80000202:	43dc                	lw	a5,4(a5)
80000204:	97ba                	add	a5,a5,a4
80000206:	10079e63          	bnez	a5,80000322 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1ae>
8000020a:	405c                	lw	a5,4(s0)
8000020c:	a205                	j	8000032c <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b8>
8000020e:	10070663          	beqz	a4,8000031a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
80000212:	4410                	lw	a2,8(s0)
80000214:	4610                	lw	a2,8(a2)
80000216:	c410                	sw	a2,8(s0)
80000218:	00062623          	sw	zero,12(a2)
8000021c:	177d                	addi	a4,a4,-1
8000021e:	c018                	sw	a4,0(s0)
80000220:	a8ed                	j	8000031a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1a6>
80000222:	883e                	mv	a6,a5
80000224:	c39c                	sw	a5,0(a5)
80000226:	c3d4                	sw	a3,4(a5)
80000228:	0007a423          	sw	zero,8(a5)
8000022c:	0007a623          	sw	zero,12(a5)
80000230:	4558                	lw	a4,12(a0)
80000232:	96ba                	add	a3,a3,a4
80000234:	c554                	sw	a3,12(a0)
80000236:	438c                	lw	a1,0(a5)
80000238:	43d0                	lw	a2,4(a5)
8000023a:	962e                	add	a2,a2,a1
8000023c:	415c                	lw	a5,4(a0)
8000023e:	c3f1                	beqz	a5,80000302 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x18e>
80000240:	873e                	mv	a4,a5
80000242:	4314                	lw	a3,0(a4)
80000244:	00d60463          	beq	a2,a3,8000024c <_ZN4EPOS1S16Init_ApplicationC1Ev+0xd8>
80000248:	4758                	lw	a4,12(a4)
8000024a:	ff65                	bnez	a4,80000242 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xce>
8000024c:	4394                	lw	a3,0(a5)
8000024e:	43d0                	lw	a2,4(a5)
80000250:	96b2                	add	a3,a3,a2
80000252:	06d58d63          	beq	a1,a3,800002cc <_ZN4EPOS1S16Init_ApplicationC1Ev+0x158>
80000256:	47dc                	lw	a5,12(a5)
80000258:	fbf5                	bnez	a5,8000024c <_ZN4EPOS1S16Init_ApplicationC1Ev+0xd8>
8000025a:	411c                	lw	a5,0(a0)
8000025c:	cf99                	beqz	a5,8000027a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x106>
8000025e:	451c                	lw	a5,8(a0)
80000260:	0107a623          	sw	a6,12(a5)
80000264:	451c                	lw	a5,8(a0)
80000266:	00f82423          	sw	a5,8(a6)
8000026a:	00082623          	sw	zero,12(a6)
8000026e:	01052423          	sw	a6,8(a0)
80000272:	411c                	lw	a5,0(a0)
80000274:	0785                	addi	a5,a5,1
80000276:	c11c                	sw	a5,0(a0)
80000278:	a821                	j	80000290 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x11c>
8000027a:	00082423          	sw	zero,8(a6)
8000027e:	00082623          	sw	zero,12(a6)
80000282:	01052223          	sw	a6,4(a0)
80000286:	01052423          	sw	a6,8(a0)
8000028a:	411c                	lw	a5,0(a0)
8000028c:	0785                	addi	a5,a5,1
8000028e:	c11c                	sw	a5,0(a0)
80000290:	4781                	li	a5,0
80000292:	ef15                	bnez	a4,800002ce <_ZN4EPOS1S16Init_ApplicationC1Ev+0x15a>
80000294:	a849                	j	80000326 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b2>
80000296:	00052223          	sw	zero,4(a0)
8000029a:	00052423          	sw	zero,8(a0)
8000029e:	00052023          	sw	zero,0(a0)
800002a2:	a889                	j	800002f4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x180>
800002a4:	caa1                	beqz	a3,800002f4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x180>
800002a6:	4158                	lw	a4,4(a0)
800002a8:	4758                	lw	a4,12(a4)
800002aa:	c158                	sw	a4,4(a0)
800002ac:	00072423          	sw	zero,8(a4)
800002b0:	4118                	lw	a4,0(a0)
800002b2:	177d                	addi	a4,a4,-1
800002b4:	c118                	sw	a4,0(a0)
800002b6:	a83d                	j	800002f4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x180>
800002b8:	ce95                	beqz	a3,800002f4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x180>
800002ba:	4518                	lw	a4,8(a0)
800002bc:	4718                	lw	a4,8(a4)
800002be:	c518                	sw	a4,8(a0)
800002c0:	00072623          	sw	zero,12(a4)
800002c4:	4118                	lw	a4,0(a0)
800002c6:	177d                	addi	a4,a4,-1
800002c8:	c118                	sw	a4,0(a0)
800002ca:	a02d                	j	800002f4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x180>
800002cc:	c70d                	beqz	a4,800002f6 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x182>
800002ce:	00482683          	lw	a3,4(a6)
800002d2:	4350                	lw	a2,4(a4)
800002d4:	96b2                	add	a3,a3,a2
800002d6:	00d82223          	sw	a3,4(a6)
800002da:	4114                	lw	a3,0(a0)
800002dc:	fb368de3          	beq	a3,s3,80000296 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x122>
800002e0:	470c                	lw	a1,8(a4)
800002e2:	d1e9                	beqz	a1,800002a4 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x130>
800002e4:	4750                	lw	a2,12(a4)
800002e6:	da69                	beqz	a2,800002b8 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x144>
800002e8:	c5d0                	sw	a2,12(a1)
800002ea:	4718                	lw	a4,8(a4)
800002ec:	c618                	sw	a4,8(a2)
800002ee:	4118                	lw	a4,0(a0)
800002f0:	177d                	addi	a4,a4,-1
800002f2:	c118                	sw	a4,0(a0)
800002f4:	cb8d                	beqz	a5,80000326 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b2>
800002f6:	43d8                	lw	a4,4(a5)
800002f8:	00482683          	lw	a3,4(a6)
800002fc:	9736                	add	a4,a4,a3
800002fe:	c3d8                	sw	a4,4(a5)
80000300:	a01d                	j	80000326 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b2>
80000302:	873e                	mv	a4,a5
80000304:	bf99                	j	8000025a <_ZN4EPOS1S16Init_ApplicationC1Ev+0xe6>
80000306:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
8000030a:	8f15                	sub	a4,a4,a3
8000030c:	c3d8                	sw	a4,4(a5)
8000030e:	4458                	lw	a4,12(s0)
80000310:	8f15                	sub	a4,a4,a3
80000312:	c458                	sw	a4,12(s0)
80000314:	43d8                	lw	a4,4(a5)
80000316:	e8070ae3          	beqz	a4,800001aa <_ZN4EPOS1S16Init_ApplicationC1Ev+0x36>
8000031a:	4398                	lw	a4,0(a5)
8000031c:	43dc                	lw	a5,4(a5)
8000031e:	97ba                	add	a5,a5,a4
80000320:	c399                	beqz	a5,80000326 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b2>
80000322:	f0d960e3          	bltu	s2,a3,80000222 <_ZN4EPOS1S16Init_ApplicationC1Ev+0xae>
80000326:	405c                	lw	a5,4(s0)
80000328:	ea0789e3          	beqz	a5,800001da <_ZN4EPOS1S16Init_ApplicationC1Ev+0x66>
8000032c:	43d4                	lw	a3,4(a5)
8000032e:	ea0686e3          	beqz	a3,800001da <_ZN4EPOS1S16Init_ApplicationC1Ev+0x66>
80000332:	405c                	lw	a5,4(s0)
80000334:	cb91                	beqz	a5,80000348 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1d4>
80000336:	00468613          	addi	a2,a3,4
8000033a:	43d8                	lw	a4,4(a5)
8000033c:	fcc775e3          	bgeu	a4,a2,80000306 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x192>
80000340:	fcd703e3          	beq	a4,a3,80000306 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x192>
80000344:	47dc                	lw	a5,12(a5)
80000346:	fbf5                	bnez	a5,8000033a <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1c6>
80000348:	01348223          	sb	s3,4(s1)
8000034c:	7e4b0513          	addi	a0,s6,2020 # 800017e4 <__boot_stack__+0xf80017e4>
80000350:	2e09                	jal	80000662 <_print>
80000352:	7e0a8513          	addi	a0,s5,2016 # 800017e0 <__boot_stack__+0xf80017e0>
80000356:	2631                	jal	80000662 <_print>
80000358:	47a9                	li	a5,10
8000035a:	c09c                	sw	a5,0(s1)
8000035c:	b7e9                	j	80000326 <_ZN4EPOS1S16Init_ApplicationC1Ev+0x1b2>
8000035e:	8082                	ret

80000360 <_GLOBAL__sub_I__end>:
80000360:	1141                	addi	sp,sp,-16
80000362:	c606                	sw	ra,12(sp)
80000364:	81c18513          	addi	a0,gp,-2020 # 8000301c <_ZN4EPOS1S16init_applicationE>
80000368:	3531                	jal	80000174 <_ZN4EPOS1S16Init_ApplicationC1Ev>
8000036a:	40b2                	lw	ra,12(sp)
8000036c:	0141                	addi	sp,sp,16
8000036e:	8082                	ret

80000370 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>:
80000370:	455c                	lw	a5,12(a0)
80000372:	41d8                	lw	a4,4(a1)
80000374:	97ba                	add	a5,a5,a4
80000376:	c55c                	sw	a5,12(a0)
80000378:	0006a023          	sw	zero,0(a3)
8000037c:	00062023          	sw	zero,0(a2)
80000380:	0005a303          	lw	t1,0(a1)
80000384:	0045a883          	lw	a7,4(a1)
80000388:	989a                	add	a7,a7,t1
8000038a:	415c                	lw	a5,4(a0)
8000038c:	c3cd                	beqz	a5,8000042e <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xbe>
8000038e:	873e                	mv	a4,a5
80000390:	00072803          	lw	a6,0(a4)
80000394:	01088463          	beq	a7,a6,8000039c <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
80000398:	4758                	lw	a4,12(a4)
8000039a:	fb7d                	bnez	a4,80000390 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x20>
8000039c:	0007a803          	lw	a6,0(a5)
800003a0:	0047a883          	lw	a7,4(a5)
800003a4:	9846                	add	a6,a6,a7
800003a6:	09030663          	beq	t1,a6,80000432 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc2>
800003aa:	47dc                	lw	a5,12(a5)
800003ac:	fbe5                	bnez	a5,8000039c <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x2c>
800003ae:	411c                	lw	a5,0(a0)
800003b0:	cf81                	beqz	a5,800003c8 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x58>
800003b2:	451c                	lw	a5,8(a0)
800003b4:	c7cc                	sw	a1,12(a5)
800003b6:	451c                	lw	a5,8(a0)
800003b8:	c59c                	sw	a5,8(a1)
800003ba:	0005a623          	sw	zero,12(a1)
800003be:	c50c                	sw	a1,8(a0)
800003c0:	411c                	lw	a5,0(a0)
800003c2:	0785                	addi	a5,a5,1
800003c4:	c11c                	sw	a5,0(a0)
800003c6:	a811                	j	800003da <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x6a>
800003c8:	0005a423          	sw	zero,8(a1)
800003cc:	0005a623          	sw	zero,12(a1)
800003d0:	c14c                	sw	a1,4(a0)
800003d2:	c50c                	sw	a1,8(a0)
800003d4:	411c                	lw	a5,0(a0)
800003d6:	0785                	addi	a5,a5,1
800003d8:	c11c                	sw	a5,0(a0)
800003da:	4781                	li	a5,0
800003dc:	ef21                	bnez	a4,80000434 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0xc4>
800003de:	8082                	ret
800003e0:	00052223          	sw	zero,4(a0)
800003e4:	00052423          	sw	zero,8(a0)
800003e8:	00052023          	sw	zero,0(a0)
800003ec:	a059                	j	80000472 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800003ee:	08080263          	beqz	a6,80000472 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
800003f2:	00452803          	lw	a6,4(a0)
800003f6:	00c82803          	lw	a6,12(a6)
800003fa:	01052223          	sw	a6,4(a0)
800003fe:	00082423          	sw	zero,8(a6)
80000402:	00052803          	lw	a6,0(a0)
80000406:	187d                	addi	a6,a6,-1
80000408:	01052023          	sw	a6,0(a0)
8000040c:	a09d                	j	80000472 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
8000040e:	06080263          	beqz	a6,80000472 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
80000412:	00852803          	lw	a6,8(a0)
80000416:	00882803          	lw	a6,8(a6)
8000041a:	01052423          	sw	a6,8(a0)
8000041e:	00082623          	sw	zero,12(a6)
80000422:	00052803          	lw	a6,0(a0)
80000426:	187d                	addi	a6,a6,-1
80000428:	01052023          	sw	a6,0(a0)
8000042c:	a099                	j	80000472 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x102>
8000042e:	873e                	mv	a4,a5
80000430:	bfbd                	j	800003ae <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x3e>
80000432:	c331                	beqz	a4,80000476 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x106>
80000434:	0045a803          	lw	a6,4(a1)
80000438:	00472883          	lw	a7,4(a4)
8000043c:	9846                	add	a6,a6,a7
8000043e:	0105a223          	sw	a6,4(a1)
80000442:	00052803          	lw	a6,0(a0)
80000446:	4885                	li	a7,1
80000448:	f9180ce3          	beq	a6,a7,800003e0 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x70>
8000044c:	00872303          	lw	t1,8(a4)
80000450:	f8030fe3          	beqz	t1,800003ee <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x7e>
80000454:	00c72883          	lw	a7,12(a4)
80000458:	fa088be3          	beqz	a7,8000040e <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x9e>
8000045c:	01132623          	sw	a7,12(t1)
80000460:	00872803          	lw	a6,8(a4)
80000464:	0108a423          	sw	a6,8(a7)
80000468:	00052803          	lw	a6,0(a0)
8000046c:	187d                	addi	a6,a6,-1
8000046e:	01052023          	sw	a6,0(a0)
80000472:	c218                	sw	a4,0(a2)
80000474:	c799                	beqz	a5,80000482 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_+0x112>
80000476:	43d8                	lw	a4,4(a5)
80000478:	41d0                	lw	a2,4(a1)
8000047a:	9732                	add	a4,a4,a2
8000047c:	c3d8                	sw	a4,4(a5)
8000047e:	c28c                	sw	a1,0(a3)
80000480:	8082                	ret
80000482:	8082                	ret

80000484 <_ZN4EPOS1S11Init_SystemC1Ev>:
80000484:	1101                	addi	sp,sp,-32
80000486:	ce06                	sw	ra,28(sp)
80000488:	cc22                	sw	s0,24(sp)
8000048a:	0c5000ef          	jal	ra,80000d4e <_ZN4EPOS1S3CPU4initEv>
8000048e:	9181a783          	lw	a5,-1768(gp) # 80003118 <_ZN4EPOS1S3MMU5_freeE+0x4>
80000492:	cf81                	beqz	a5,800004aa <_ZN4EPOS1S11Init_SystemC1Ev+0x26>
80000494:	000446b7          	lui	a3,0x44
80000498:	00368613          	addi	a2,a3,3 # 44003 <NUM_GP_REGS+0x43fe3>
8000049c:	43d8                	lw	a4,4(a5)
8000049e:	0ce66963          	bltu	a2,a4,80000570 <_ZN4EPOS1S11Init_SystemC1Ev+0xec>
800004a2:	0cd70763          	beq	a4,a3,80000570 <_ZN4EPOS1S11Init_SystemC1Ev+0xec>
800004a6:	47dc                	lw	a5,12(a5)
800004a8:	fbf5                	bnez	a5,8000049c <_ZN4EPOS1S11Init_SystemC1Ev+0x18>
800004aa:	82418413          	addi	s0,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
800004ae:	4785                	li	a5,1
800004b0:	00f40223          	sb	a5,4(s0)
800004b4:	80001537          	lui	a0,0x80001
800004b8:	7e450513          	addi	a0,a0,2020 # 800017e4 <__boot_stack__+0xf80017e4>
800004bc:	225d                	jal	80000662 <_print>
800004be:	80001537          	lui	a0,0x80001
800004c2:	7e050513          	addi	a0,a0,2016 # 800017e0 <__boot_stack__+0xf80017e0>
800004c6:	2a71                	jal	80000662 <_print>
800004c8:	47a9                	li	a5,10
800004ca:	c01c                	sw	a5,0(s0)
800004cc:	86818793          	addi	a5,gp,-1944 # 80003068 <_ZN4EPOS1S6System8_preheapE>
800004d0:	00078023          	sb	zero,0(a5)
800004d4:	000780a3          	sb	zero,1(a5)
800004d8:	00078123          	sb	zero,2(a5)
800004dc:	000781a3          	sb	zero,3(a5)
800004e0:	00078223          	sb	zero,4(a5)
800004e4:	000782a3          	sb	zero,5(a5)
800004e8:	00078323          	sb	zero,6(a5)
800004ec:	000783a3          	sb	zero,7(a5)
800004f0:	00078423          	sb	zero,8(a5)
800004f4:	000784a3          	sb	zero,9(a5)
800004f8:	00078523          	sb	zero,10(a5)
800004fc:	000785a3          	sb	zero,11(a5)
80000500:	00078623          	sb	zero,12(a5)
80000504:	000786a3          	sb	zero,13(a5)
80000508:	00078723          	sb	zero,14(a5)
8000050c:	000787a3          	sb	zero,15(a5)
80000510:	a8f1                	j	800005ec <_ZN4EPOS1S11Init_SystemC1Ev+0x168>
80000512:	9141a703          	lw	a4,-1772(gp) # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000516:	4685                	li	a3,1
80000518:	00d70d63          	beq	a4,a3,80000532 <_ZN4EPOS1S11Init_SystemC1Ev+0xae>
8000051c:	4790                	lw	a2,8(a5)
8000051e:	c21d                	beqz	a2,80000544 <_ZN4EPOS1S11Init_SystemC1Ev+0xc0>
80000520:	47d4                	lw	a3,12(a5)
80000522:	ce85                	beqz	a3,8000055a <_ZN4EPOS1S11Init_SystemC1Ev+0xd6>
80000524:	c654                	sw	a3,12(a2)
80000526:	4790                	lw	a2,8(a5)
80000528:	c690                	sw	a2,8(a3)
8000052a:	177d                	addi	a4,a4,-1
8000052c:	90e1aa23          	sw	a4,-1772(gp) # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000530:	a899                	j	80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
80000532:	91418713          	addi	a4,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000536:	00072223          	sw	zero,4(a4)
8000053a:	00072423          	sw	zero,8(a4)
8000053e:	00072023          	sw	zero,0(a4)
80000542:	a091                	j	80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
80000544:	c329                	beqz	a4,80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
80000546:	91418693          	addi	a3,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
8000054a:	42d0                	lw	a2,4(a3)
8000054c:	4650                	lw	a2,12(a2)
8000054e:	c2d0                	sw	a2,4(a3)
80000550:	00062423          	sw	zero,8(a2)
80000554:	177d                	addi	a4,a4,-1
80000556:	c298                	sw	a4,0(a3)
80000558:	a03d                	j	80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
8000055a:	c715                	beqz	a4,80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
8000055c:	91418693          	addi	a3,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000560:	4690                	lw	a2,8(a3)
80000562:	4610                	lw	a2,8(a2)
80000564:	c690                	sw	a2,8(a3)
80000566:	00062623          	sw	zero,12(a2)
8000056a:	177d                	addi	a4,a4,-1
8000056c:	c298                	sw	a4,0(a3)
8000056e:	a821                	j	80000586 <_ZN4EPOS1S11Init_SystemC1Ev+0x102>
80000570:	fffbc637          	lui	a2,0xfffbc
80000574:	9732                	add	a4,a4,a2
80000576:	c3d8                	sw	a4,4(a5)
80000578:	91418713          	addi	a4,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
8000057c:	4754                	lw	a3,12(a4)
8000057e:	96b2                	add	a3,a3,a2
80000580:	c754                	sw	a3,12(a4)
80000582:	43d8                	lw	a4,4(a5)
80000584:	d759                	beqz	a4,80000512 <_ZN4EPOS1S11Init_SystemC1Ev+0x8e>
80000586:	438c                	lw	a1,0(a5)
80000588:	43dc                	lw	a5,4(a5)
8000058a:	95be                	add	a1,a1,a5
8000058c:	86818793          	addi	a5,gp,-1944 # 80003068 <_ZN4EPOS1S6System8_preheapE>
80000590:	00078023          	sb	zero,0(a5)
80000594:	000780a3          	sb	zero,1(a5)
80000598:	00078123          	sb	zero,2(a5)
8000059c:	000781a3          	sb	zero,3(a5)
800005a0:	00078223          	sb	zero,4(a5)
800005a4:	000782a3          	sb	zero,5(a5)
800005a8:	00078323          	sb	zero,6(a5)
800005ac:	000783a3          	sb	zero,7(a5)
800005b0:	00078423          	sb	zero,8(a5)
800005b4:	000784a3          	sb	zero,9(a5)
800005b8:	00078523          	sb	zero,10(a5)
800005bc:	000785a3          	sb	zero,11(a5)
800005c0:	00078623          	sb	zero,12(a5)
800005c4:	000786a3          	sb	zero,13(a5)
800005c8:	00078723          	sb	zero,14(a5)
800005cc:	000787a3          	sb	zero,15(a5)
800005d0:	cd91                	beqz	a1,800005ec <_ZN4EPOS1S11Init_SystemC1Ev+0x168>
800005d2:	c18c                	sw	a1,0(a1)
800005d4:	000447b7          	lui	a5,0x44
800005d8:	c1dc                	sw	a5,4(a1)
800005da:	0005a423          	sw	zero,8(a1)
800005de:	0005a623          	sw	zero,12(a1)
800005e2:	0074                	addi	a3,sp,12
800005e4:	0030                	addi	a2,sp,8
800005e6:	86818513          	addi	a0,gp,-1944 # 80003068 <_ZN4EPOS1S6System8_preheapE>
800005ea:	3359                	jal	80000370 <_ZN4EPOS1S1U13Grouping_ListIcNS1_13List_Elements22Doubly_Linked_GroupingIcEEE14insert_mergingEPS5_PS7_S8_>
800005ec:	86818793          	addi	a5,gp,-1944 # 80003068 <_ZN4EPOS1S6System8_preheapE>
800005f0:	82f1aa23          	sw	a5,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
800005f4:	16f000ef          	jal	ra,80000f62 <_ZN4EPOS1S7Machine4initEv>
800005f8:	185000ef          	jal	ra,80000f7c <_ZN4EPOS1S6System4initEv>
800005fc:	8401a023          	sw	zero,-1984(gp) # 80003040 <_ZN4EPOS1S1U6Random5_seedE>
80000600:	40f2                	lw	ra,28(sp)
80000602:	4462                	lw	s0,24(sp)
80000604:	6105                	addi	sp,sp,32
80000606:	8082                	ret

80000608 <_GLOBAL__sub_I__ZN4EPOS1S11init_systemE>:
80000608:	1141                	addi	sp,sp,-16
8000060a:	c606                	sw	ra,12(sp)
8000060c:	82018513          	addi	a0,gp,-2016 # 80003020 <_ZN4EPOS1S11init_systemE>
80000610:	3d95                	jal	80000484 <_ZN4EPOS1S11Init_SystemC1Ev>
80000612:	40b2                	lw	ra,12(sp)
80000614:	0141                	addi	sp,sp,16
80000616:	8082                	ret

80000618 <_GLOBAL__sub_I__ZN4EPOS1S7__entryE>:
80000618:	1141                	addi	sp,sp,-16
8000061a:	c606                	sw	ra,12(sp)
8000061c:	557d                	li	a0,-1
8000061e:	131000ef          	jal	ra,80000f4e <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>
80000622:	82c18793          	addi	a5,gp,-2004 # 8000302c <_ZN4EPOS1S4koutE>
80000626:	4729                	li	a4,10
80000628:	c398                	sw	a4,0(a5)
8000062a:	00078223          	sb	zero,4(a5) # 44004 <NUM_GP_REGS+0x43fe4>
8000062e:	82418793          	addi	a5,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
80000632:	c398                	sw	a4,0(a5)
80000634:	00078223          	sb	zero,4(a5)
80000638:	40b2                	lw	ra,12(sp)
8000063a:	0141                	addi	sp,sp,16
8000063c:	8082                	ret

8000063e <_panic>:
8000063e:	1141                	addi	sp,sp,-16
80000640:	c606                	sw	ra,12(sp)
80000642:	521000ef          	jal	ra,80001362 <_ZN4EPOS1S7Machine5panicEv>
80000646:	40b2                	lw	ra,12(sp)
80000648:	0141                	addi	sp,sp,16
8000064a:	8082                	ret

8000064c <_exit>:
8000064c:	1141                	addi	sp,sp,-16
8000064e:	c606                	sw	ra,12(sp)
80000650:	29a1                	jal	80000aa8 <_ZN4EPOS1S6Thread4exitEi>
80000652:	a001                	j	80000652 <_exit+0x6>

80000654 <__exit>:
80000654:	1141                	addi	sp,sp,-16
80000656:	c606                	sw	ra,12(sp)
80000658:	852a                	mv	a0,a0
8000065a:	21b9                	jal	80000aa8 <_ZN4EPOS1S6Thread4exitEi>
8000065c:	40b2                	lw	ra,12(sp)
8000065e:	0141                	addi	sp,sp,16
80000660:	8082                	ret

80000662 <_print>:
80000662:	00054783          	lbu	a5,0(a0)
80000666:	c7b5                	beqz	a5,800006d2 <_print+0x70>
80000668:	45a5                	li	a1,9
8000066a:	100006b7          	lui	a3,0x10000
8000066e:	4629                	li	a2,10
80000670:	04f00e13          	li	t3,79
80000674:	4335                	li	t1,13
80000676:	a819                	j	8000068c <_print+0x2a>
80000678:	00b68023          	sb	a1,0(a3) # 10000000 <NUM_GP_REGS+0xfffffe0>
8000067c:	85c1a783          	lw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
80000680:	07a1                	addi	a5,a5,8
80000682:	84f1ae23          	sw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
80000686:	00054783          	lbu	a5,0(a0)
8000068a:	c7a1                	beqz	a5,800006d2 <_print+0x70>
8000068c:	0505                	addi	a0,a0,1
8000068e:	feb785e3          	beq	a5,a1,80000678 <_print+0x16>
80000692:	00c79e63          	bne	a5,a2,800006ae <_print+0x4c>
80000696:	00668023          	sb	t1,0(a3)
8000069a:	00c68023          	sb	a2,0(a3)
8000069e:	8401ae23          	sw	zero,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800006a2:	8581a783          	lw	a5,-1960(gp) # 80003058 <_ZN4EPOS1S14Serial_Display5_lineE>
800006a6:	0785                	addi	a5,a5,1
800006a8:	84f1ac23          	sw	a5,-1960(gp) # 80003058 <_ZN4EPOS1S14Serial_Display5_lineE>
800006ac:	bfe9                	j	80000686 <_print+0x24>
800006ae:	85c1a803          	lw	a6,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800006b2:	0805                	addi	a6,a6,1
800006b4:	8501ae23          	sw	a6,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800006b8:	00f68023          	sb	a5,0(a3)
800006bc:	85c1a783          	lw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800006c0:	fcfe53e3          	bge	t3,a5,80000686 <_print+0x24>
800006c4:	00668023          	sb	t1,0(a3)
800006c8:	00c68023          	sb	a2,0(a3)
800006cc:	8401ae23          	sw	zero,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800006d0:	bf5d                	j	80000686 <_print+0x24>
800006d2:	8082                	ret

800006d4 <_GLOBAL__sub_I__panic>:
800006d4:	83818793          	addi	a5,gp,-1992 # 80003038 <_ZL10_heap_spin>
800006d8:	0007a023          	sw	zero,0(a5)
800006dc:	0007a223          	sw	zero,4(a5)
800006e0:	8082                	ret

800006e2 <_ZN4EPOS1S6Thread20constructor_prologueEj>:
800006e2:	1141                	addi	sp,sp,-16
800006e4:	c606                	sw	ra,12(sp)
800006e6:	c422                	sw	s0,8(sp)
800006e8:	842a                	mv	s0,a0
800006ea:	84818793          	addi	a5,gp,-1976 # 80003048 <_ZN4EPOS1S6Thread13_thread_countE>
800006ee:	4398                	lw	a4,0(a5)
800006f0:	0705                	addi	a4,a4,1
800006f2:	c398                	sw	a4,0(a5)
800006f4:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800006f8:	47d8                	lw	a4,12(a5)
800006fa:	01450613          	addi	a2,a0,20
800006fe:	47dc                	lw	a5,12(a5)
80000700:	cfbd                	beqz	a5,8000077e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x9c>
80000702:	8781a503          	lw	a0,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000706:	ed01                	bnez	a0,8000071e <_ZN4EPOS1S6Thread20constructor_prologueEj+0x3c>
80000708:	00042e23          	sw	zero,28(s0)
8000070c:	02042023          	sw	zero,32(s0)
80000710:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000714:	c3d0                	sw	a2,4(a5)
80000716:	c790                	sw	a2,8(a5)
80000718:	4705                	li	a4,1
8000071a:	c398                	sw	a4,0(a5)
8000071c:	a0a5                	j	80000784 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xa2>
8000071e:	87c1a803          	lw	a6,-1924(gp) # 8000307c <_ZN4EPOS1S6Thread10_schedulerE+0x4>
80000722:	87c2                	mv	a5,a6
80000724:	a011                	j	80000728 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x46>
80000726:	87ba                	mv	a5,a4
80000728:	43d4                	lw	a3,4(a5)
8000072a:	4c18                	lw	a4,24(s0)
8000072c:	00d74463          	blt	a4,a3,80000734 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x52>
80000730:	47d8                	lw	a4,12(a5)
80000732:	fb75                	bnez	a4,80000726 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x44>
80000734:	43d4                	lw	a3,4(a5)
80000736:	4c18                	lw	a4,24(s0)
80000738:	00d75c63          	bge	a4,a3,80000750 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x6e>
8000073c:	4798                	lw	a4,8(a5)
8000073e:	c705                	beqz	a4,80000766 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x84>
80000740:	c750                	sw	a2,12(a4)
80000742:	c790                	sw	a2,8(a5)
80000744:	cc58                	sw	a4,28(s0)
80000746:	d01c                	sw	a5,32(s0)
80000748:	0505                	addi	a0,a0,1
8000074a:	86a1ac23          	sw	a0,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
8000074e:	a81d                	j	80000784 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xa2>
80000750:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000754:	4798                	lw	a4,8(a5)
80000756:	c750                	sw	a2,12(a4)
80000758:	cc58                	sw	a4,28(s0)
8000075a:	02042023          	sw	zero,32(s0)
8000075e:	c790                	sw	a2,8(a5)
80000760:	0505                	addi	a0,a0,1
80000762:	c388                	sw	a0,0(a5)
80000764:	a005                	j	80000784 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xa2>
80000766:	00042e23          	sw	zero,28(s0)
8000076a:	03042023          	sw	a6,32(s0)
8000076e:	00c82423          	sw	a2,8(a6)
80000772:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000776:	c3d0                	sw	a2,4(a5)
80000778:	0505                	addi	a0,a0,1
8000077a:	c388                	sw	a0,0(a5)
8000077c:	a021                	j	80000784 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xa2>
8000077e:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000782:	c7d0                	sw	a2,12(a5)
80000784:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
80000788:	c5d1                	beqz	a1,80000814 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x132>
8000078a:	0035f793          	andi	a5,a1,3
8000078e:	c789                	beqz	a5,80000798 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xb6>
80000790:	0585                	addi	a1,a1,1
80000792:	0035f793          	andi	a5,a1,3
80000796:	ffed                	bnez	a5,80000790 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xae>
80000798:	0591                	addi	a1,a1,4
8000079a:	47c1                	li	a5,16
8000079c:	00f5f363          	bgeu	a1,a5,800007a2 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc0>
800007a0:	45c1                	li	a1,16
800007a2:	415c                	lw	a5,4(a0)
800007a4:	cb91                	beqz	a5,800007b8 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xd6>
800007a6:	01058693          	addi	a3,a1,16
800007aa:	43d8                	lw	a4,4(a5)
800007ac:	06d77663          	bgeu	a4,a3,80000818 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x136>
800007b0:	06e58463          	beq	a1,a4,80000818 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x136>
800007b4:	47dc                	lw	a5,12(a5)
800007b6:	fbf5                	bnez	a5,800007aa <_ZN4EPOS1S6Thread20constructor_prologueEj+0xc8>
800007b8:	73f000ef          	jal	ra,800016f6 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
800007bc:	4701                	li	a4,0
800007be:	a895                	j	80000832 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x150>
800007c0:	4118                	lw	a4,0(a0)
800007c2:	4685                	li	a3,1
800007c4:	00d70d63          	beq	a4,a3,800007de <_ZN4EPOS1S6Thread20constructor_prologueEj+0xfc>
800007c8:	4790                	lw	a2,8(a5)
800007ca:	c20d                	beqz	a2,800007ec <_ZN4EPOS1S6Thread20constructor_prologueEj+0x10a>
800007cc:	47d4                	lw	a3,12(a5)
800007ce:	ca8d                	beqz	a3,80000800 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x11e>
800007d0:	c654                	sw	a3,12(a2)
800007d2:	4798                	lw	a4,8(a5)
800007d4:	c698                	sw	a4,8(a3)
800007d6:	4118                	lw	a4,0(a0)
800007d8:	177d                	addi	a4,a4,-1
800007da:	c118                	sw	a4,0(a0)
800007dc:	a0a9                	j	80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
800007de:	00052223          	sw	zero,4(a0)
800007e2:	00052423          	sw	zero,8(a0)
800007e6:	00052023          	sw	zero,0(a0)
800007ea:	a835                	j	80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
800007ec:	cf0d                	beqz	a4,80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
800007ee:	4158                	lw	a4,4(a0)
800007f0:	4758                	lw	a4,12(a4)
800007f2:	c158                	sw	a4,4(a0)
800007f4:	00072423          	sw	zero,8(a4)
800007f8:	4118                	lw	a4,0(a0)
800007fa:	177d                	addi	a4,a4,-1
800007fc:	c118                	sw	a4,0(a0)
800007fe:	a025                	j	80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
80000800:	c31d                	beqz	a4,80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
80000802:	4518                	lw	a4,8(a0)
80000804:	4718                	lw	a4,8(a4)
80000806:	c518                	sw	a4,8(a0)
80000808:	00072623          	sw	zero,12(a4)
8000080c:	4118                	lw	a4,0(a0)
8000080e:	177d                	addi	a4,a4,-1
80000810:	c118                	sw	a4,0(a0)
80000812:	a811                	j	80000826 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x144>
80000814:	4701                	li	a4,0
80000816:	a831                	j	80000832 <_ZN4EPOS1S6Thread20constructor_prologueEj+0x150>
80000818:	8f0d                	sub	a4,a4,a1
8000081a:	c3d8                	sw	a4,4(a5)
8000081c:	4558                	lw	a4,12(a0)
8000081e:	8f0d                	sub	a4,a4,a1
80000820:	c558                	sw	a4,12(a0)
80000822:	43d8                	lw	a4,4(a5)
80000824:	df51                	beqz	a4,800007c0 <_ZN4EPOS1S6Thread20constructor_prologueEj+0xde>
80000826:	4398                	lw	a4,0(a5)
80000828:	43dc                	lw	a5,4(a5)
8000082a:	97ba                	add	a5,a5,a4
8000082c:	00478713          	addi	a4,a5,4
80000830:	c38c                	sw	a1,0(a5)
80000832:	c018                	sw	a4,0(s0)
80000834:	40b2                	lw	ra,12(sp)
80000836:	4422                	lw	s0,8(sp)
80000838:	0141                	addi	sp,sp,16
8000083a:	8082                	ret

8000083c <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>:
8000083c:	c611                	beqz	a2,80000848 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0xc>
8000083e:	84c1a783          	lw	a5,-1972(gp) # 8000304c <_ZN4EPOS1S6Thread6_timerE>
80000842:	43d8                	lw	a4,4(a5)
80000844:	47d4                	lw	a3,12(a5)
80000846:	c7d8                	sw	a4,12(a5)
80000848:	02b50363          	beq	a0,a1,8000086e <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x32>
8000084c:	1141                	addi	sp,sp,-16
8000084e:	c606                	sw	ra,12(sp)
80000850:	451c                	lw	a5,8(a0)
80000852:	e399                	bnez	a5,80000858 <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b+0x1c>
80000854:	4785                	li	a5,1
80000856:	c51c                	sw	a5,8(a0)
80000858:	0005a423          	sw	zero,8(a1)
8000085c:	415c                	lw	a5,4(a0)
8000085e:	41dc                	lw	a5,4(a1)
80000860:	41cc                	lw	a1,4(a1)
80000862:	0511                	addi	a0,a0,4
80000864:	67b000ef          	jal	ra,800016de <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>
80000868:	40b2                	lw	ra,12(sp)
8000086a:	0141                	addi	sp,sp,16
8000086c:	8082                	ret
8000086e:	8082                	ret

80000870 <_ZN4EPOS1S6Thread10rescheduleEv>:
80000870:	1141                	addi	sp,sp,-16
80000872:	c606                	sw	ra,12(sp)
80000874:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000878:	47d8                	lw	a4,12(a5)
8000087a:	4308                	lw	a0,0(a4)
8000087c:	47d8                	lw	a4,12(a5)
8000087e:	438c                	lw	a1,0(a5)
80000880:	e991                	bnez	a1,80000894 <_ZN4EPOS1S6Thread10rescheduleEv+0x24>
80000882:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000886:	47dc                	lw	a5,12(a5)
80000888:	4605                	li	a2,1
8000088a:	438c                	lw	a1,0(a5)
8000088c:	3f45                	jal	8000083c <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
8000088e:	40b2                	lw	ra,12(sp)
80000890:	0141                	addi	sp,sp,16
80000892:	8082                	ret
80000894:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000898:	47d0                	lw	a2,12(a5)
8000089a:	0047a803          	lw	a6,4(a5)
8000089e:	87c2                	mv	a5,a6
800008a0:	a011                	j	800008a4 <_ZN4EPOS1S6Thread10rescheduleEv+0x34>
800008a2:	87ba                	mv	a5,a4
800008a4:	43d4                	lw	a3,4(a5)
800008a6:	4258                	lw	a4,4(a2)
800008a8:	00d74463          	blt	a4,a3,800008b0 <_ZN4EPOS1S6Thread10rescheduleEv+0x40>
800008ac:	47d8                	lw	a4,12(a5)
800008ae:	fb75                	bnez	a4,800008a2 <_ZN4EPOS1S6Thread10rescheduleEv+0x32>
800008b0:	43d4                	lw	a3,4(a5)
800008b2:	4258                	lw	a4,4(a2)
800008b4:	02d75c63          	bge	a4,a3,800008ec <_ZN4EPOS1S6Thread10rescheduleEv+0x7c>
800008b8:	4798                	lw	a4,8(a5)
800008ba:	c721                	beqz	a4,80000902 <_ZN4EPOS1S6Thread10rescheduleEv+0x92>
800008bc:	c750                	sw	a2,12(a4)
800008be:	c790                	sw	a2,8(a5)
800008c0:	c618                	sw	a4,8(a2)
800008c2:	c65c                	sw	a5,12(a2)
800008c4:	0585                	addi	a1,a1,1
800008c6:	86b1ac23          	sw	a1,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800008ca:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800008ce:	43d4                	lw	a3,4(a5)
800008d0:	4398                	lw	a4,0(a5)
800008d2:	c721                	beqz	a4,8000091a <_ZN4EPOS1S6Thread10rescheduleEv+0xaa>
800008d4:	46d0                	lw	a2,12(a3)
800008d6:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800008da:	c3d0                	sw	a2,4(a5)
800008dc:	00062423          	sw	zero,8(a2) # fffbc008 <__boot_stack__+0x77fbc008>
800008e0:	177d                	addi	a4,a4,-1
800008e2:	c398                	sw	a4,0(a5)
800008e4:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800008e8:	c7d4                	sw	a3,12(a5)
800008ea:	bf61                	j	80000882 <_ZN4EPOS1S6Thread10rescheduleEv+0x12>
800008ec:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800008f0:	4798                	lw	a4,8(a5)
800008f2:	c750                	sw	a2,12(a4)
800008f4:	c618                	sw	a4,8(a2)
800008f6:	00062623          	sw	zero,12(a2)
800008fa:	c790                	sw	a2,8(a5)
800008fc:	0585                	addi	a1,a1,1
800008fe:	c38c                	sw	a1,0(a5)
80000900:	b7e9                	j	800008ca <_ZN4EPOS1S6Thread10rescheduleEv+0x5a>
80000902:	00062423          	sw	zero,8(a2)
80000906:	01062623          	sw	a6,12(a2)
8000090a:	00c82423          	sw	a2,8(a6)
8000090e:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000912:	c3d0                	sw	a2,4(a5)
80000914:	0585                	addi	a1,a1,1
80000916:	c38c                	sw	a1,0(a5)
80000918:	bf4d                	j	800008ca <_ZN4EPOS1S6Thread10rescheduleEv+0x5a>
8000091a:	4681                	li	a3,0
8000091c:	b7e1                	j	800008e4 <_ZN4EPOS1S6Thread10rescheduleEv+0x74>

8000091e <_ZN4EPOS1S6Thread11time_slicerEj>:
8000091e:	1141                	addi	sp,sp,-16
80000920:	c606                	sw	ra,12(sp)
80000922:	37b9                	jal	80000870 <_ZN4EPOS1S6Thread10rescheduleEv>
80000924:	40b2                	lw	ra,12(sp)
80000926:	0141                	addi	sp,sp,16
80000928:	8082                	ret

8000092a <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>:
8000092a:	715d                	addi	sp,sp,-80
8000092c:	c686                	sw	ra,76(sp)
8000092e:	c4a2                	sw	s0,72(sp)
80000930:	c2a6                	sw	s1,68(sp)
80000932:	c0ca                	sw	s2,64(sp)
80000934:	842a                	mv	s0,a0
80000936:	415c                	lw	a5,4(a0)
80000938:	4518                	lw	a4,8(a0)
8000093a:	478d                	li	a5,3
8000093c:	02f70663          	beq	a4,a5,80000968 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x3e>
80000940:	4518                	lw	a4,8(a0)
80000942:	4791                	li	a5,4
80000944:	02f70263          	beq	a4,a5,80000968 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x3e>
80000948:	4418                	lw	a4,8(s0)
8000094a:	4785                	li	a5,1
8000094c:	00f70463          	beq	a4,a5,80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000950:	441c                	lw	a5,8(s0)
80000952:	ebc9                	bnez	a5,800009e4 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0xba>
80000954:	4418                	lw	a4,8(s0)
80000956:	4785                	li	a5,1
80000958:	12f70f63          	beq	a4,a5,80000a96 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x16c>
8000095c:	40b6                	lw	ra,76(sp)
8000095e:	4426                	lw	s0,72(sp)
80000960:	4496                	lw	s1,68(sp)
80000962:	4906                	lw	s2,64(sp)
80000964:	6161                	addi	sp,sp,80
80000966:	8082                	ret
80000968:	82418493          	addi	s1,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
8000096c:	4785                	li	a5,1
8000096e:	00f48223          	sb	a5,4(s1)
80000972:	80002537          	lui	a0,0x80002
80000976:	82450513          	addi	a0,a0,-2012 # 80001824 <__boot_stack__+0xf8001824>
8000097a:	31e5                	jal	80000662 <_print>
8000097c:	80002537          	lui	a0,0x80002
80000980:	83850513          	addi	a0,a0,-1992 # 80001838 <__boot_stack__+0xf8001838>
80000984:	39f9                	jal	80000662 <_print>
80000986:	80002537          	lui	a0,0x80002
8000098a:	86850513          	addi	a0,a0,-1944 # 80001868 <__boot_stack__+0xf8001868>
8000098e:	39d1                	jal	80000662 <_print>
80000990:	80002537          	lui	a0,0x80002
80000994:	87450513          	addi	a0,a0,-1932 # 80001874 <__boot_stack__+0xf8001874>
80000998:	31e9                	jal	80000662 <_print>
8000099a:	80002537          	lui	a0,0x80002
8000099e:	8c050513          	addi	a0,a0,-1856 # 800018c0 <__boot_stack__+0xf80018c0>
800009a2:	31c1                	jal	80000662 <_print>
800009a4:	80002537          	lui	a0,0x80002
800009a8:	8c850513          	addi	a0,a0,-1848 # 800018c8 <__boot_stack__+0xf80018c8>
800009ac:	395d                	jal	80000662 <_print>
800009ae:	80002537          	lui	a0,0x80002
800009b2:	8d450513          	addi	a0,a0,-1836 # 800018d4 <__boot_stack__+0xf80018d4>
800009b6:	3175                	jal	80000662 <_print>
800009b8:	4681                	li	a3,0
800009ba:	860a                	mv	a2,sp
800009bc:	02a00593          	li	a1,42
800009c0:	82418513          	addi	a0,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
800009c4:	541000ef          	jal	ra,80001704 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
800009c8:	009c                	addi	a5,sp,64
800009ca:	953e                	add	a0,a0,a5
800009cc:	fc050023          	sb	zero,-64(a0)
800009d0:	850a                	mv	a0,sp
800009d2:	3941                	jal	80000662 <_print>
800009d4:	80001537          	lui	a0,0x80001
800009d8:	7e050513          	addi	a0,a0,2016 # 800017e0 <__boot_stack__+0xf80017e0>
800009dc:	3159                	jal	80000662 <_print>
800009de:	47a9                	li	a5,10
800009e0:	c09c                	sw	a5,0(s1)
800009e2:	b79d                	j	80000948 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x1e>
800009e4:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800009e8:	47d8                	lw	a4,12(a5)
800009ea:	47d8                	lw	a4,12(a5)
800009ec:	01440793          	addi	a5,s0,20
800009f0:	02f70363          	beq	a4,a5,80000a16 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0xec>
800009f4:	8781a783          	lw	a5,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
800009f8:	4705                	li	a4,1
800009fa:	04e78d63          	beq	a5,a4,80000a54 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x12a>
800009fe:	4c58                	lw	a4,28(s0)
80000a00:	c33d                	beqz	a4,80000a66 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x13c>
80000a02:	5014                	lw	a3,32(s0)
80000a04:	cead                	beqz	a3,80000a7e <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x154>
80000a06:	c754                	sw	a3,12(a4)
80000a08:	5018                	lw	a4,32(s0)
80000a0a:	4c54                	lw	a3,28(s0)
80000a0c:	c714                	sw	a3,8(a4)
80000a0e:	17fd                	addi	a5,a5,-1
80000a10:	86f1ac23          	sw	a5,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a14:	b781                	j	80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a16:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a1a:	43d8                	lw	a4,4(a5)
80000a1c:	439c                	lw	a5,0(a5)
80000a1e:	cb8d                	beqz	a5,80000a50 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x126>
80000a20:	4685                	li	a3,1
80000a22:	00d78e63          	beq	a5,a3,80000a3e <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x114>
80000a26:	4750                	lw	a2,12(a4)
80000a28:	87818693          	addi	a3,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a2c:	c2d0                	sw	a2,4(a3)
80000a2e:	00062423          	sw	zero,8(a2)
80000a32:	17fd                	addi	a5,a5,-1
80000a34:	c29c                	sw	a5,0(a3)
80000a36:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a3a:	c7d8                	sw	a4,12(a5)
80000a3c:	bf21                	j	80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a3e:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a42:	0007a223          	sw	zero,4(a5)
80000a46:	0007a423          	sw	zero,8(a5)
80000a4a:	0007a023          	sw	zero,0(a5)
80000a4e:	b7e5                	j	80000a36 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x10c>
80000a50:	4701                	li	a4,0
80000a52:	b7d5                	j	80000a36 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x10c>
80000a54:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a58:	0007a223          	sw	zero,4(a5)
80000a5c:	0007a423          	sw	zero,8(a5)
80000a60:	0007a023          	sw	zero,0(a5)
80000a64:	bdc5                	j	80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a66:	ee0787e3          	beqz	a5,80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a6a:	87818713          	addi	a4,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a6e:	4354                	lw	a3,4(a4)
80000a70:	46d4                	lw	a3,12(a3)
80000a72:	c354                	sw	a3,4(a4)
80000a74:	0006a423          	sw	zero,8(a3)
80000a78:	17fd                	addi	a5,a5,-1
80000a7a:	c31c                	sw	a5,0(a4)
80000a7c:	bde1                	j	80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a7e:	ec078be3          	beqz	a5,80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a82:	87818713          	addi	a4,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000a86:	4714                	lw	a3,8(a4)
80000a88:	4694                	lw	a3,8(a3)
80000a8a:	c714                	sw	a3,8(a4)
80000a8c:	0006a623          	sw	zero,12(a3)
80000a90:	17fd                	addi	a5,a5,-1
80000a92:	c31c                	sw	a5,0(a4)
80000a94:	b5c1                	j	80000954 <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x2a>
80000a96:	4c18                	lw	a4,24(s0)
80000a98:	800007b7          	lui	a5,0x80000
80000a9c:	fff7c793          	not	a5,a5
80000aa0:	eaf70ee3          	beq	a4,a5,8000095c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x32>
80000aa4:	33f1                	jal	80000870 <_ZN4EPOS1S6Thread10rescheduleEv>
80000aa6:	bd5d                	j	8000095c <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj+0x32>

80000aa8 <_ZN4EPOS1S6Thread4exitEi>:
80000aa8:	1141                	addi	sp,sp,-16
80000aaa:	c606                	sw	ra,12(sp)
80000aac:	872a                	mv	a4,a0
80000aae:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000ab2:	47d4                	lw	a3,12(a5)
80000ab4:	47d4                	lw	a3,12(a5)
80000ab6:	4288                	lw	a0,0(a3)
80000ab8:	47d4                	lw	a3,12(a5)
80000aba:	47d4                	lw	a3,12(a5)
80000abc:	01450793          	addi	a5,a0,20
80000ac0:	06f68963          	beq	a3,a5,80000b32 <_ZN4EPOS1S6Thread4exitEi+0x8a>
80000ac4:	8781a783          	lw	a5,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000ac8:	4685                	li	a3,1
80000aca:	0ad78363          	beq	a5,a3,80000b70 <_ZN4EPOS1S6Thread4exitEi+0xc8>
80000ace:	4d54                	lw	a3,28(a0)
80000ad0:	cacd                	beqz	a3,80000b82 <_ZN4EPOS1S6Thread4exitEi+0xda>
80000ad2:	5110                	lw	a2,32(a0)
80000ad4:	c271                	beqz	a2,80000b98 <_ZN4EPOS1S6Thread4exitEi+0xf0>
80000ad6:	c6d0                	sw	a2,12(a3)
80000ad8:	5114                	lw	a3,32(a0)
80000ada:	4d50                	lw	a2,28(a0)
80000adc:	c690                	sw	a2,8(a3)
80000ade:	17fd                	addi	a5,a5,-1
80000ae0:	86f1ac23          	sw	a5,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000ae4:	4791                	li	a5,4
80000ae6:	c51c                	sw	a5,8(a0)
80000ae8:	411c                	lw	a5,0(a0)
80000aea:	c398                	sw	a4,0(a5)
80000aec:	84818793          	addi	a5,gp,-1976 # 80003048 <_ZN4EPOS1S6Thread13_thread_countE>
80000af0:	4398                	lw	a4,0(a5)
80000af2:	177d                	addi	a4,a4,-1
80000af4:	c398                	sw	a4,0(a5)
80000af6:	491c                	lw	a5,16(a0)
80000af8:	12078263          	beqz	a5,80000c1c <_ZN4EPOS1S6Thread4exitEi+0x174>
80000afc:	491c                	lw	a5,16(a0)
80000afe:	4705                	li	a4,1
80000b00:	c798                	sw	a4,8(a5)
80000b02:	4914                	lw	a3,16(a0)
80000b04:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b08:	47d8                	lw	a4,12(a5)
80000b0a:	01468593          	addi	a1,a3,20
80000b0e:	47dc                	lw	a5,12(a5)
80000b10:	10078163          	beqz	a5,80000c12 <_ZN4EPOS1S6Thread4exitEi+0x16a>
80000b14:	8781a803          	lw	a6,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b18:	08081b63          	bnez	a6,80000bae <_ZN4EPOS1S6Thread4exitEi+0x106>
80000b1c:	0006ae23          	sw	zero,28(a3)
80000b20:	0206a023          	sw	zero,32(a3)
80000b24:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b28:	c3cc                	sw	a1,4(a5)
80000b2a:	c78c                	sw	a1,8(a5)
80000b2c:	4705                	li	a4,1
80000b2e:	c398                	sw	a4,0(a5)
80000b30:	a0e5                	j	80000c18 <_ZN4EPOS1S6Thread4exitEi+0x170>
80000b32:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b36:	43d0                	lw	a2,4(a5)
80000b38:	439c                	lw	a5,0(a5)
80000b3a:	cb8d                	beqz	a5,80000b6c <_ZN4EPOS1S6Thread4exitEi+0xc4>
80000b3c:	4685                	li	a3,1
80000b3e:	00d78e63          	beq	a5,a3,80000b5a <_ZN4EPOS1S6Thread4exitEi+0xb2>
80000b42:	464c                	lw	a1,12(a2)
80000b44:	87818693          	addi	a3,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b48:	c2cc                	sw	a1,4(a3)
80000b4a:	0005a423          	sw	zero,8(a1)
80000b4e:	17fd                	addi	a5,a5,-1
80000b50:	c29c                	sw	a5,0(a3)
80000b52:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b56:	c7d0                	sw	a2,12(a5)
80000b58:	b771                	j	80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000b5a:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b5e:	0007a223          	sw	zero,4(a5) # 80000004 <__boot_stack__+0xf8000004>
80000b62:	0007a423          	sw	zero,8(a5)
80000b66:	0007a023          	sw	zero,0(a5)
80000b6a:	b7e5                	j	80000b52 <_ZN4EPOS1S6Thread4exitEi+0xaa>
80000b6c:	4601                	li	a2,0
80000b6e:	b7d5                	j	80000b52 <_ZN4EPOS1S6Thread4exitEi+0xaa>
80000b70:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b74:	0007a223          	sw	zero,4(a5)
80000b78:	0007a423          	sw	zero,8(a5)
80000b7c:	0007a023          	sw	zero,0(a5)
80000b80:	b795                	j	80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000b82:	d3ad                	beqz	a5,80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000b84:	87818693          	addi	a3,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b88:	42d0                	lw	a2,4(a3)
80000b8a:	4650                	lw	a2,12(a2)
80000b8c:	c2d0                	sw	a2,4(a3)
80000b8e:	00062423          	sw	zero,8(a2)
80000b92:	17fd                	addi	a5,a5,-1
80000b94:	c29c                	sw	a5,0(a3)
80000b96:	b7b9                	j	80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000b98:	d7b1                	beqz	a5,80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000b9a:	87818693          	addi	a3,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000b9e:	4690                	lw	a2,8(a3)
80000ba0:	4610                	lw	a2,8(a2)
80000ba2:	c690                	sw	a2,8(a3)
80000ba4:	00062623          	sw	zero,12(a2)
80000ba8:	17fd                	addi	a5,a5,-1
80000baa:	c29c                	sw	a5,0(a3)
80000bac:	bf25                	j	80000ae4 <_ZN4EPOS1S6Thread4exitEi+0x3c>
80000bae:	87c1a883          	lw	a7,-1924(gp) # 8000307c <_ZN4EPOS1S6Thread10_schedulerE+0x4>
80000bb2:	87c6                	mv	a5,a7
80000bb4:	a011                	j	80000bb8 <_ZN4EPOS1S6Thread4exitEi+0x110>
80000bb6:	87ba                	mv	a5,a4
80000bb8:	43d0                	lw	a2,4(a5)
80000bba:	4e98                	lw	a4,24(a3)
80000bbc:	00c74463          	blt	a4,a2,80000bc4 <_ZN4EPOS1S6Thread4exitEi+0x11c>
80000bc0:	47d8                	lw	a4,12(a5)
80000bc2:	fb75                	bnez	a4,80000bb6 <_ZN4EPOS1S6Thread4exitEi+0x10e>
80000bc4:	43d0                	lw	a2,4(a5)
80000bc6:	4e98                	lw	a4,24(a3)
80000bc8:	00c75c63          	bge	a4,a2,80000be0 <_ZN4EPOS1S6Thread4exitEi+0x138>
80000bcc:	4798                	lw	a4,8(a5)
80000bce:	c70d                	beqz	a4,80000bf8 <_ZN4EPOS1S6Thread4exitEi+0x150>
80000bd0:	c74c                	sw	a1,12(a4)
80000bd2:	c78c                	sw	a1,8(a5)
80000bd4:	ced8                	sw	a4,28(a3)
80000bd6:	d29c                	sw	a5,32(a3)
80000bd8:	0805                	addi	a6,a6,1
80000bda:	8701ac23          	sw	a6,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000bde:	a82d                	j	80000c18 <_ZN4EPOS1S6Thread4exitEi+0x170>
80000be0:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000be4:	4798                	lw	a4,8(a5)
80000be6:	c74c                	sw	a1,12(a4)
80000be8:	ced8                	sw	a4,28(a3)
80000bea:	0206a023          	sw	zero,32(a3)
80000bee:	c78c                	sw	a1,8(a5)
80000bf0:	0805                	addi	a6,a6,1
80000bf2:	0107a023          	sw	a6,0(a5)
80000bf6:	a00d                	j	80000c18 <_ZN4EPOS1S6Thread4exitEi+0x170>
80000bf8:	0006ae23          	sw	zero,28(a3)
80000bfc:	0316a023          	sw	a7,32(a3)
80000c00:	00b8a423          	sw	a1,8(a7)
80000c04:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c08:	c3cc                	sw	a1,4(a5)
80000c0a:	0805                	addi	a6,a6,1
80000c0c:	0107a023          	sw	a6,0(a5)
80000c10:	a021                	j	80000c18 <_ZN4EPOS1S6Thread4exitEi+0x170>
80000c12:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c16:	c7cc                	sw	a1,12(a5)
80000c18:	00052823          	sw	zero,16(a0)
80000c1c:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c20:	47d8                	lw	a4,12(a5)
80000c22:	438c                	lw	a1,0(a5)
80000c24:	e991                	bnez	a1,80000c38 <_ZN4EPOS1S6Thread4exitEi+0x190>
80000c26:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c2a:	47dc                	lw	a5,12(a5)
80000c2c:	4605                	li	a2,1
80000c2e:	438c                	lw	a1,0(a5)
80000c30:	3131                	jal	8000083c <_ZN4EPOS1S6Thread8dispatchEPS1_S2_b>
80000c32:	40b2                	lw	ra,12(sp)
80000c34:	0141                	addi	sp,sp,16
80000c36:	8082                	ret
80000c38:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c3c:	47d0                	lw	a2,12(a5)
80000c3e:	0047a803          	lw	a6,4(a5)
80000c42:	87c2                	mv	a5,a6
80000c44:	a011                	j	80000c48 <_ZN4EPOS1S6Thread4exitEi+0x1a0>
80000c46:	87ba                	mv	a5,a4
80000c48:	43d4                	lw	a3,4(a5)
80000c4a:	4258                	lw	a4,4(a2)
80000c4c:	00d74463          	blt	a4,a3,80000c54 <_ZN4EPOS1S6Thread4exitEi+0x1ac>
80000c50:	47d8                	lw	a4,12(a5)
80000c52:	fb75                	bnez	a4,80000c46 <_ZN4EPOS1S6Thread4exitEi+0x19e>
80000c54:	43d4                	lw	a3,4(a5)
80000c56:	4258                	lw	a4,4(a2)
80000c58:	02d75c63          	bge	a4,a3,80000c90 <_ZN4EPOS1S6Thread4exitEi+0x1e8>
80000c5c:	4798                	lw	a4,8(a5)
80000c5e:	c721                	beqz	a4,80000ca6 <_ZN4EPOS1S6Thread4exitEi+0x1fe>
80000c60:	c750                	sw	a2,12(a4)
80000c62:	c790                	sw	a2,8(a5)
80000c64:	c618                	sw	a4,8(a2)
80000c66:	c65c                	sw	a5,12(a2)
80000c68:	0585                	addi	a1,a1,1
80000c6a:	86b1ac23          	sw	a1,-1928(gp) # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c6e:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c72:	43d4                	lw	a3,4(a5)
80000c74:	4398                	lw	a4,0(a5)
80000c76:	c721                	beqz	a4,80000cbe <_ZN4EPOS1S6Thread4exitEi+0x216>
80000c78:	46d0                	lw	a2,12(a3)
80000c7a:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c7e:	c3d0                	sw	a2,4(a5)
80000c80:	00062423          	sw	zero,8(a2)
80000c84:	177d                	addi	a4,a4,-1
80000c86:	c398                	sw	a4,0(a5)
80000c88:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c8c:	c7d4                	sw	a3,12(a5)
80000c8e:	bf61                	j	80000c26 <_ZN4EPOS1S6Thread4exitEi+0x17e>
80000c90:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000c94:	4798                	lw	a4,8(a5)
80000c96:	c750                	sw	a2,12(a4)
80000c98:	c618                	sw	a4,8(a2)
80000c9a:	00062623          	sw	zero,12(a2)
80000c9e:	c790                	sw	a2,8(a5)
80000ca0:	0585                	addi	a1,a1,1
80000ca2:	c38c                	sw	a1,0(a5)
80000ca4:	b7e9                	j	80000c6e <_ZN4EPOS1S6Thread4exitEi+0x1c6>
80000ca6:	00062423          	sw	zero,8(a2)
80000caa:	01062623          	sw	a6,12(a2)
80000cae:	00c82423          	sw	a2,8(a6)
80000cb2:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000cb6:	c3d0                	sw	a2,4(a5)
80000cb8:	0585                	addi	a1,a1,1
80000cba:	c38c                	sw	a1,0(a5)
80000cbc:	bf4d                	j	80000c6e <_ZN4EPOS1S6Thread4exitEi+0x1c6>
80000cbe:	4681                	li	a3,0
80000cc0:	b7e1                	j	80000c88 <_ZN4EPOS1S6Thread4exitEi+0x1e0>

80000cc2 <_ZN4EPOS1S6Thread4idleEv>:
80000cc2:	1141                	addi	sp,sp,-16
80000cc4:	c606                	sw	ra,12(sp)
80000cc6:	c422                	sw	s0,8(sp)
80000cc8:	c226                	sw	s1,4(sp)
80000cca:	c04a                	sw	s2,0(sp)
80000ccc:	8481a703          	lw	a4,-1976(gp) # 80003048 <_ZN4EPOS1S6Thread13_thread_countE>
80000cd0:	4785                	li	a5,1
80000cd2:	00e7fa63          	bgeu	a5,a4,80000ce6 <_ZN4EPOS1S6Thread4idleEv+0x24>
80000cd6:	4705                	li	a4,1
80000cd8:	10500073          	wfi
80000cdc:	84818793          	addi	a5,gp,-1976 # 80003048 <_ZN4EPOS1S6Thread13_thread_countE>
80000ce0:	439c                	lw	a5,0(a5)
80000ce2:	fef76be3          	bltu	a4,a5,80000cd8 <_ZN4EPOS1S6Thread4idleEv+0x16>
80000ce6:	80002537          	lui	a0,0x80002
80000cea:	8dc50513          	addi	a0,a0,-1828 # 800018dc <__boot_stack__+0xf80018dc>
80000cee:	975ff0ef          	jal	ra,80000662 <_print>
80000cf2:	80001937          	lui	s2,0x80001
80000cf6:	7e090513          	addi	a0,s2,2016 # 800017e0 <__boot_stack__+0xf80017e0>
80000cfa:	969ff0ef          	jal	ra,80000662 <_print>
80000cfe:	82418413          	addi	s0,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
80000d02:	44a9                	li	s1,10
80000d04:	c004                	sw	s1,0(s0)
80000d06:	80002537          	lui	a0,0x80002
80000d0a:	8f850513          	addi	a0,a0,-1800 # 800018f8 <__boot_stack__+0xf80018f8>
80000d0e:	955ff0ef          	jal	ra,80000662 <_print>
80000d12:	7e090513          	addi	a0,s2,2016
80000d16:	94dff0ef          	jal	ra,80000662 <_print>
80000d1a:	c004                	sw	s1,0(s0)
80000d1c:	80002537          	lui	a0,0x80002
80000d20:	91450513          	addi	a0,a0,-1772 # 80001914 <__boot_stack__+0xf8001914>
80000d24:	93fff0ef          	jal	ra,80000662 <_print>
80000d28:	7e090513          	addi	a0,s2,2016
80000d2c:	937ff0ef          	jal	ra,80000662 <_print>
80000d30:	c004                	sw	s1,0(s0)
80000d32:	10500073          	wfi
80000d36:	a001                	j	80000d36 <_ZN4EPOS1S6Thread4idleEv+0x74>

80000d38 <_GLOBAL__sub_I__ZN4EPOS1S1U11This_Thread12_not_bootingE>:
80000d38:	87818793          	addi	a5,gp,-1928 # 80003078 <_ZN4EPOS1S6Thread10_schedulerE>
80000d3c:	0007a023          	sw	zero,0(a5)
80000d40:	0007a223          	sw	zero,4(a5)
80000d44:	0007a423          	sw	zero,8(a5)
80000d48:	0007a623          	sw	zero,12(a5)
80000d4c:	8082                	ret

80000d4e <_ZN4EPOS1S3CPU4initEv>:
80000d4e:	1141                	addi	sp,sp,-16
80000d50:	c606                	sw	ra,12(sp)
80000d52:	2215                	jal	80000e76 <_ZN4EPOS1S3MMU4initEv>
80000d54:	2ae5                	jal	80000f4c <_ZN4EPOS1S3TSC4initEv>
80000d56:	40b2                	lw	ra,12(sp)
80000d58:	0141                	addi	sp,sp,16
80000d5a:	8082                	ret

80000d5c <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>:
80000d5c:	455c                	lw	a5,12(a0)
80000d5e:	41d8                	lw	a4,4(a1)
80000d60:	97ba                	add	a5,a5,a4
80000d62:	c55c                	sw	a5,12(a0)
80000d64:	0006a023          	sw	zero,0(a3)
80000d68:	00062023          	sw	zero,0(a2)
80000d6c:	0005a303          	lw	t1,0(a1)
80000d70:	0045a883          	lw	a7,4(a1)
80000d74:	088a                	slli	a7,a7,0x2
80000d76:	989a                	add	a7,a7,t1
80000d78:	415c                	lw	a5,4(a0)
80000d7a:	c3dd                	beqz	a5,80000e20 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc4>
80000d7c:	873e                	mv	a4,a5
80000d7e:	00072803          	lw	a6,0(a4)
80000d82:	01088463          	beq	a7,a6,80000d8a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
80000d86:	4758                	lw	a4,12(a4)
80000d88:	fb7d                	bnez	a4,80000d7e <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x22>
80000d8a:	0047a803          	lw	a6,4(a5)
80000d8e:	00281893          	slli	a7,a6,0x2
80000d92:	0007a803          	lw	a6,0(a5)
80000d96:	9846                	add	a6,a6,a7
80000d98:	09030663          	beq	t1,a6,80000e24 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xc8>
80000d9c:	47dc                	lw	a5,12(a5)
80000d9e:	f7f5                	bnez	a5,80000d8a <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x2e>
80000da0:	411c                	lw	a5,0(a0)
80000da2:	cf81                	beqz	a5,80000dba <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x5e>
80000da4:	451c                	lw	a5,8(a0)
80000da6:	c7cc                	sw	a1,12(a5)
80000da8:	451c                	lw	a5,8(a0)
80000daa:	c59c                	sw	a5,8(a1)
80000dac:	0005a623          	sw	zero,12(a1)
80000db0:	c50c                	sw	a1,8(a0)
80000db2:	411c                	lw	a5,0(a0)
80000db4:	0785                	addi	a5,a5,1
80000db6:	c11c                	sw	a5,0(a0)
80000db8:	a811                	j	80000dcc <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x70>
80000dba:	0005a423          	sw	zero,8(a1)
80000dbe:	0005a623          	sw	zero,12(a1)
80000dc2:	c14c                	sw	a1,4(a0)
80000dc4:	c50c                	sw	a1,8(a0)
80000dc6:	411c                	lw	a5,0(a0)
80000dc8:	0785                	addi	a5,a5,1
80000dca:	c11c                	sw	a5,0(a0)
80000dcc:	4781                	li	a5,0
80000dce:	ef21                	bnez	a4,80000e26 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xca>
80000dd0:	8082                	ret
80000dd2:	00052223          	sw	zero,4(a0)
80000dd6:	00052423          	sw	zero,8(a0)
80000dda:	00052023          	sw	zero,0(a0)
80000dde:	a059                	j	80000e64 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80000de0:	08080263          	beqz	a6,80000e64 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80000de4:	00452803          	lw	a6,4(a0)
80000de8:	00c82803          	lw	a6,12(a6)
80000dec:	01052223          	sw	a6,4(a0)
80000df0:	00082423          	sw	zero,8(a6)
80000df4:	00052803          	lw	a6,0(a0)
80000df8:	187d                	addi	a6,a6,-1
80000dfa:	01052023          	sw	a6,0(a0)
80000dfe:	a09d                	j	80000e64 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80000e00:	06080263          	beqz	a6,80000e64 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80000e04:	00852803          	lw	a6,8(a0)
80000e08:	00882803          	lw	a6,8(a6)
80000e0c:	01052423          	sw	a6,8(a0)
80000e10:	00082623          	sw	zero,12(a6)
80000e14:	00052803          	lw	a6,0(a0)
80000e18:	187d                	addi	a6,a6,-1
80000e1a:	01052023          	sw	a6,0(a0)
80000e1e:	a099                	j	80000e64 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x108>
80000e20:	873e                	mv	a4,a5
80000e22:	bfbd                	j	80000da0 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x44>
80000e24:	c331                	beqz	a4,80000e68 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x10c>
80000e26:	0045a803          	lw	a6,4(a1)
80000e2a:	00472883          	lw	a7,4(a4)
80000e2e:	9846                	add	a6,a6,a7
80000e30:	0105a223          	sw	a6,4(a1)
80000e34:	00052803          	lw	a6,0(a0)
80000e38:	4885                	li	a7,1
80000e3a:	f9180ce3          	beq	a6,a7,80000dd2 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x76>
80000e3e:	00872303          	lw	t1,8(a4)
80000e42:	f8030fe3          	beqz	t1,80000de0 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x84>
80000e46:	00c72883          	lw	a7,12(a4)
80000e4a:	fa088be3          	beqz	a7,80000e00 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0xa4>
80000e4e:	01132623          	sw	a7,12(t1)
80000e52:	00872803          	lw	a6,8(a4)
80000e56:	0108a423          	sw	a6,8(a7)
80000e5a:	00052803          	lw	a6,0(a0)
80000e5e:	187d                	addi	a6,a6,-1
80000e60:	01052023          	sw	a6,0(a0)
80000e64:	c218                	sw	a4,0(a2)
80000e66:	c799                	beqz	a5,80000e74 <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_+0x118>
80000e68:	43d8                	lw	a4,4(a5)
80000e6a:	41d0                	lw	a2,4(a1)
80000e6c:	9732                	add	a4,a4,a2
80000e6e:	c3d8                	sw	a4,4(a5)
80000e70:	c28c                	sw	a1,0(a3)
80000e72:	8082                	ret
80000e74:	8082                	ret

80000e76 <_ZN4EPOS1S3MMU4initEv>:
80000e76:	711d                	addi	sp,sp,-96
80000e78:	ce86                	sw	ra,92(sp)
80000e7a:	cca2                	sw	s0,88(sp)
80000e7c:	caa6                	sw	s1,84(sp)
80000e7e:	c8ca                	sw	s2,80(sp)
80000e80:	87ffc437          	lui	s0,0x87ffc
80000e84:	0405                	addi	s0,s0,1
80000e86:	92418793          	addi	a5,gp,-1756 # 80003124 <_end>
80000e8a:	8c1d                	sub	s0,s0,a5
80000e8c:	47c1                	li	a5,16
80000e8e:	0287f863          	bgeu	a5,s0,80000ebe <_ZN4EPOS1S3MMU4initEv+0x48>
80000e92:	92418793          	addi	a5,gp,-1756 # 80003124 <_end>
80000e96:	92f1a223          	sw	a5,-1756(gp) # 80003124 <_end>
80000e9a:	c3c0                	sw	s0,4(a5)
80000e9c:	0007a423          	sw	zero,8(a5)
80000ea0:	0007a623          	sw	zero,12(a5)
80000ea4:	0814                	addi	a3,sp,16
80000ea6:	0070                	addi	a2,sp,12
80000ea8:	92418593          	addi	a1,gp,-1756 # 80003124 <_end>
80000eac:	91418513          	addi	a0,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
80000eb0:	3575                	jal	80000d5c <_ZN4EPOS1S1U13Grouping_ListIjNS1_13List_Elements22Doubly_Linked_GroupingIjEEE14insert_mergingEPS5_PS7_S8_>
80000eb2:	40f6                	lw	ra,92(sp)
80000eb4:	4466                	lw	s0,88(sp)
80000eb6:	44d6                	lw	s1,84(sp)
80000eb8:	4946                	lw	s2,80(sp)
80000eba:	6125                	addi	sp,sp,96
80000ebc:	8082                	ret
80000ebe:	82418493          	addi	s1,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
80000ec2:	4785                	li	a5,1
80000ec4:	00f48223          	sb	a5,4(s1)
80000ec8:	80002537          	lui	a0,0x80002
80000ecc:	82450513          	addi	a0,a0,-2012 # 80001824 <__boot_stack__+0xf8001824>
80000ed0:	f92ff0ef          	jal	ra,80000662 <_print>
80000ed4:	80002537          	lui	a0,0x80002
80000ed8:	92850513          	addi	a0,a0,-1752 # 80001928 <__boot_stack__+0xf8001928>
80000edc:	f86ff0ef          	jal	ra,80000662 <_print>
80000ee0:	80002537          	lui	a0,0x80002
80000ee4:	86850513          	addi	a0,a0,-1944 # 80001868 <__boot_stack__+0xf8001868>
80000ee8:	f7aff0ef          	jal	ra,80000662 <_print>
80000eec:	80002537          	lui	a0,0x80002
80000ef0:	94450513          	addi	a0,a0,-1724 # 80001944 <__boot_stack__+0xf8001944>
80000ef4:	f6eff0ef          	jal	ra,80000662 <_print>
80000ef8:	80002537          	lui	a0,0x80002
80000efc:	8c050513          	addi	a0,a0,-1856 # 800018c0 <__boot_stack__+0xf80018c0>
80000f00:	f62ff0ef          	jal	ra,80000662 <_print>
80000f04:	80002537          	lui	a0,0x80002
80000f08:	99c50513          	addi	a0,a0,-1636 # 8000199c <__boot_stack__+0xf800199c>
80000f0c:	f56ff0ef          	jal	ra,80000662 <_print>
80000f10:	80002537          	lui	a0,0x80002
80000f14:	8d450513          	addi	a0,a0,-1836 # 800018d4 <__boot_stack__+0xf80018d4>
80000f18:	f4aff0ef          	jal	ra,80000662 <_print>
80000f1c:	4681                	li	a3,0
80000f1e:	0810                	addi	a2,sp,16
80000f20:	07d00593          	li	a1,125
80000f24:	82418513          	addi	a0,gp,-2012 # 80003024 <_ZN4EPOS1S4kerrE>
80000f28:	7dc000ef          	jal	ra,80001704 <_ZN4EPOS1S1U7OStream4utoaEjPcj>
80000f2c:	089c                	addi	a5,sp,80
80000f2e:	953e                	add	a0,a0,a5
80000f30:	fc050023          	sb	zero,-64(a0)
80000f34:	0808                	addi	a0,sp,16
80000f36:	f2cff0ef          	jal	ra,80000662 <_print>
80000f3a:	80001537          	lui	a0,0x80001
80000f3e:	7e050513          	addi	a0,a0,2016 # 800017e0 <__boot_stack__+0xf80017e0>
80000f42:	f20ff0ef          	jal	ra,80000662 <_print>
80000f46:	47a9                	li	a5,10
80000f48:	c09c                	sw	a5,0(s1)
80000f4a:	b7a1                	j	80000e92 <_ZN4EPOS1S3MMU4initEv+0x1c>

80000f4c <_ZN4EPOS1S3TSC4initEv>:
80000f4c:	8082                	ret

80000f4e <_ZN4EPOS1S7Machine8pre_initEPNS0_11System_InfoE>:
80000f4e:	1141                	addi	sp,sp,-16
80000f50:	c606                	sw	ra,12(sp)
80000f52:	8401ac23          	sw	zero,-1960(gp) # 80003058 <_ZN4EPOS1S14Serial_Display5_lineE>
80000f56:	8401ae23          	sw	zero,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
80000f5a:	2411                	jal	8000115e <_ZN4EPOS1S2IC4initEv>
80000f5c:	40b2                	lw	ra,12(sp)
80000f5e:	0141                	addi	sp,sp,16
80000f60:	8082                	ret

80000f62 <_ZN4EPOS1S7Machine4initEv>:
80000f62:	1141                	addi	sp,sp,-16
80000f64:	c606                	sw	ra,12(sp)
80000f66:	2021                	jal	80000f6e <_ZN4EPOS1S5Timer4initEv>
80000f68:	40b2                	lw	ra,12(sp)
80000f6a:	0141                	addi	sp,sp,16
80000f6c:	8082                	ret

80000f6e <_ZN4EPOS1S5Timer4initEv>:
80000f6e:	800017b7          	lui	a5,0x80001
80000f72:	40478793          	addi	a5,a5,1028 # 80001404 <__boot_stack__+0xf8001404>
80000f76:	8af1a823          	sw	a5,-1872(gp) # 800030b0 <_ZN4EPOS1S2IC11_int_vectorE+0x1c>
80000f7a:	8082                	ret

80000f7c <_ZN4EPOS1S6System4initEv>:
80000f7c:	1141                	addi	sp,sp,-16
80000f7e:	c606                	sw	ra,12(sp)
80000f80:	2ae5                	jal	80001178 <_ZN4EPOS1S5Alarm4initEv>
80000f82:	286d                	jal	8000103c <_ZN4EPOS1S6Thread4initEv>
80000f84:	40b2                	lw	ra,12(sp)
80000f86:	0141                	addi	sp,sp,16
80000f88:	8082                	ret

80000f8a <_ZN4EPOS1S1U4Heap5allocEj>:
80000f8a:	c9c9                	beqz	a1,8000101c <_ZN4EPOS1S1U4Heap5allocEj+0x92>
80000f8c:	0035f793          	andi	a5,a1,3
80000f90:	c789                	beqz	a5,80000f9a <_ZN4EPOS1S1U4Heap5allocEj+0x10>
80000f92:	0585                	addi	a1,a1,1
80000f94:	0035f793          	andi	a5,a1,3
80000f98:	ffed                	bnez	a5,80000f92 <_ZN4EPOS1S1U4Heap5allocEj+0x8>
80000f9a:	0591                	addi	a1,a1,4
80000f9c:	47c1                	li	a5,16
80000f9e:	00f5f363          	bgeu	a1,a5,80000fa4 <_ZN4EPOS1S1U4Heap5allocEj+0x1a>
80000fa2:	45c1                	li	a1,16
80000fa4:	415c                	lw	a5,4(a0)
80000fa6:	cb91                	beqz	a5,80000fba <_ZN4EPOS1S1U4Heap5allocEj+0x30>
80000fa8:	01058693          	addi	a3,a1,16
80000fac:	43d8                	lw	a4,4(a5)
80000fae:	06d77963          	bgeu	a4,a3,80001020 <_ZN4EPOS1S1U4Heap5allocEj+0x96>
80000fb2:	06e58763          	beq	a1,a4,80001020 <_ZN4EPOS1S1U4Heap5allocEj+0x96>
80000fb6:	47dc                	lw	a5,12(a5)
80000fb8:	fbf5                	bnez	a5,80000fac <_ZN4EPOS1S1U4Heap5allocEj+0x22>
80000fba:	1141                	addi	sp,sp,-16
80000fbc:	c606                	sw	ra,12(sp)
80000fbe:	2f25                	jal	800016f6 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
80000fc0:	4501                	li	a0,0
80000fc2:	40b2                	lw	ra,12(sp)
80000fc4:	0141                	addi	sp,sp,16
80000fc6:	8082                	ret
80000fc8:	4118                	lw	a4,0(a0)
80000fca:	4685                	li	a3,1
80000fcc:	00d70d63          	beq	a4,a3,80000fe6 <_ZN4EPOS1S1U4Heap5allocEj+0x5c>
80000fd0:	4790                	lw	a2,8(a5)
80000fd2:	c20d                	beqz	a2,80000ff4 <_ZN4EPOS1S1U4Heap5allocEj+0x6a>
80000fd4:	47d4                	lw	a3,12(a5)
80000fd6:	ca8d                	beqz	a3,80001008 <_ZN4EPOS1S1U4Heap5allocEj+0x7e>
80000fd8:	c654                	sw	a3,12(a2)
80000fda:	4798                	lw	a4,8(a5)
80000fdc:	c698                	sw	a4,8(a3)
80000fde:	4118                	lw	a4,0(a0)
80000fe0:	177d                	addi	a4,a4,-1
80000fe2:	c118                	sw	a4,0(a0)
80000fe4:	a0a9                	j	8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
80000fe6:	00052223          	sw	zero,4(a0)
80000fea:	00052423          	sw	zero,8(a0)
80000fee:	00052023          	sw	zero,0(a0)
80000ff2:	a835                	j	8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
80000ff4:	cf0d                	beqz	a4,8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
80000ff6:	4158                	lw	a4,4(a0)
80000ff8:	4758                	lw	a4,12(a4)
80000ffa:	c158                	sw	a4,4(a0)
80000ffc:	00072423          	sw	zero,8(a4)
80001000:	4118                	lw	a4,0(a0)
80001002:	177d                	addi	a4,a4,-1
80001004:	c118                	sw	a4,0(a0)
80001006:	a025                	j	8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
80001008:	c31d                	beqz	a4,8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
8000100a:	4518                	lw	a4,8(a0)
8000100c:	4718                	lw	a4,8(a4)
8000100e:	c518                	sw	a4,8(a0)
80001010:	00072623          	sw	zero,12(a4)
80001014:	4118                	lw	a4,0(a0)
80001016:	177d                	addi	a4,a4,-1
80001018:	c118                	sw	a4,0(a0)
8000101a:	a811                	j	8000102e <_ZN4EPOS1S1U4Heap5allocEj+0xa4>
8000101c:	4501                	li	a0,0
8000101e:	8082                	ret
80001020:	8f0d                	sub	a4,a4,a1
80001022:	c3d8                	sw	a4,4(a5)
80001024:	4558                	lw	a4,12(a0)
80001026:	8f0d                	sub	a4,a4,a1
80001028:	c558                	sw	a4,12(a0)
8000102a:	43d8                	lw	a4,4(a5)
8000102c:	df51                	beqz	a4,80000fc8 <_ZN4EPOS1S1U4Heap5allocEj+0x3e>
8000102e:	4398                	lw	a4,0(a5)
80001030:	43dc                	lw	a5,4(a5)
80001032:	97ba                	add	a5,a5,a4
80001034:	00478513          	addi	a0,a5,4
80001038:	c38c                	sw	a1,0(a5)
8000103a:	8082                	ret

8000103c <_ZN4EPOS1S6Thread4initEv>:
8000103c:	7139                	addi	sp,sp,-64
8000103e:	de06                	sw	ra,60(sp)
80001040:	dc22                	sw	s0,56(sp)
80001042:	da26                	sw	s1,52(sp)
80001044:	d84a                	sw	s2,48(sp)
80001046:	d64e                	sw	s3,44(sp)
80001048:	d452                	sw	s4,40(sp)
8000104a:	d256                	sw	s5,36(sp)
8000104c:	c202                	sw	zero,4(sp)
8000104e:	02400593          	li	a1,36
80001052:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
80001056:	3f15                	jal	80000f8a <_ZN4EPOS1S1U4Heap5allocEj>
80001058:	842a                	mv	s0,a0
8000105a:	00052423          	sw	zero,8(a0)
8000105e:	00052623          	sw	zero,12(a0)
80001062:	00052823          	sw	zero,16(a0)
80001066:	c948                	sw	a0,20(a0)
80001068:	4792                	lw	a5,4(sp)
8000106a:	cd1c                	sw	a5,24(a0)
8000106c:	00052e23          	sw	zero,28(a0)
80001070:	02052023          	sw	zero,32(a0)
80001074:	6591                	lui	a1,0x4
80001076:	e6cff0ef          	jal	ra,800006e2 <_ZN4EPOS1S6Thread20constructor_prologueEj>
8000107a:	800007b7          	lui	a5,0x80000
8000107e:	0e078793          	addi	a5,a5,224 # 800000e0 <__boot_stack__+0xf80000e0>
80001082:	800004b7          	lui	s1,0x80000
80001086:	65448493          	addi	s1,s1,1620 # 80000654 <__boot_stack__+0xf8000654>
8000108a:	6a11                	lui	s4,0x4
8000108c:	4018                	lw	a4,0(s0)
8000108e:	9752                	add	a4,a4,s4
80001090:	ff070693          	addi	a3,a4,-16
80001094:	400009b7          	lui	s3,0x40000
80001098:	ff372823          	sw	s3,-16(a4)
8000109c:	fe972c23          	sw	s1,-8(a4)
800010a0:	fef72e23          	sw	a5,-4(a4)
800010a4:	c054                	sw	a3,4(s0)
800010a6:	ce3e                	sw	a5,28(sp)
800010a8:	6611                	lui	a2,0x4
800010aa:	086c                	addi	a1,sp,28
800010ac:	8522                	mv	a0,s0
800010ae:	87dff0ef          	jal	ra,8000092a <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
800010b2:	800007b7          	lui	a5,0x80000
800010b6:	fff7c793          	not	a5,a5
800010ba:	c83e                	sw	a5,16(sp)
800010bc:	02400593          	li	a1,36
800010c0:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
800010c4:	35d9                	jal	80000f8a <_ZN4EPOS1S1U4Heap5allocEj>
800010c6:	842a                	mv	s0,a0
800010c8:	4a85                	li	s5,1
800010ca:	01552423          	sw	s5,8(a0)
800010ce:	00052623          	sw	zero,12(a0)
800010d2:	00052823          	sw	zero,16(a0)
800010d6:	c948                	sw	a0,20(a0)
800010d8:	47c2                	lw	a5,16(sp)
800010da:	cd1c                	sw	a5,24(a0)
800010dc:	00052e23          	sw	zero,28(a0)
800010e0:	02052023          	sw	zero,32(a0)
800010e4:	6591                	lui	a1,0x4
800010e6:	dfcff0ef          	jal	ra,800006e2 <_ZN4EPOS1S6Thread20constructor_prologueEj>
800010ea:	800017b7          	lui	a5,0x80001
800010ee:	cc278793          	addi	a5,a5,-830 # 80000cc2 <__boot_stack__+0xf8000cc2>
800010f2:	4018                	lw	a4,0(s0)
800010f4:	9752                	add	a4,a4,s4
800010f6:	ff070693          	addi	a3,a4,-16
800010fa:	ff372823          	sw	s3,-16(a4)
800010fe:	fe972c23          	sw	s1,-8(a4)
80001102:	fef72e23          	sw	a5,-4(a4)
80001106:	c054                	sw	a3,4(s0)
80001108:	cc3e                	sw	a5,24(sp)
8000110a:	6611                	lui	a2,0x4
8000110c:	082c                	addi	a1,sp,24
8000110e:	8522                	mv	a0,s0
80001110:	81bff0ef          	jal	ra,8000092a <_ZN4EPOS1S6Thread20constructor_epilogueERKNS0_10CPU_Common8Log_AddrImEEj>
80001114:	45d1                	li	a1,20
80001116:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
8000111a:	3d85                	jal	80000f8a <_ZN4EPOS1S1U4Heap5allocEj>
8000111c:	00052023          	sw	zero,0(a0)
80001120:	47a9                	li	a5,10
80001122:	c15c                	sw	a5,4(a0)
80001124:	01550423          	sb	s5,8(a0)
80001128:	800017b7          	lui	a5,0x80001
8000112c:	91e78793          	addi	a5,a5,-1762 # 8000091e <__boot_stack__+0xf800091e>
80001130:	c91c                	sw	a5,16(a0)
80001132:	8601a783          	lw	a5,-1952(gp) # 80003060 <_ZN4EPOS1S5Timer9_channelsE>
80001136:	c38d                	beqz	a5,80001158 <_ZN4EPOS1S6Thread4initEv+0x11c>
80001138:	47a9                	li	a5,10
8000113a:	c55c                	sw	a5,12(a0)
8000113c:	84a1a623          	sw	a0,-1972(gp) # 8000304c <_ZN4EPOS1S6Thread6_timerE>
80001140:	4705                	li	a4,1
80001142:	84e18223          	sb	a4,-1980(gp) # 80003044 <_ZN4EPOS1S1U11This_Thread12_not_bootingE>
80001146:	50f2                	lw	ra,60(sp)
80001148:	5462                	lw	s0,56(sp)
8000114a:	54d2                	lw	s1,52(sp)
8000114c:	5942                	lw	s2,48(sp)
8000114e:	59b2                	lw	s3,44(sp)
80001150:	5a22                	lw	s4,40(sp)
80001152:	5a92                	lw	s5,36(sp)
80001154:	6121                	addi	sp,sp,64
80001156:	8082                	ret
80001158:	86a1a023          	sw	a0,-1952(gp) # 80003060 <_ZN4EPOS1S5Timer9_channelsE>
8000115c:	bff1                	j	80001138 <_ZN4EPOS1S6Thread4initEv+0xfc>

8000115e <_ZN4EPOS1S2IC4initEv>:
8000115e:	89418793          	addi	a5,gp,-1900 # 80003094 <_ZN4EPOS1S2IC11_int_vectorE>
80001162:	08078693          	addi	a3,a5,128
80001166:	80001737          	lui	a4,0x80001
8000116a:	36070713          	addi	a4,a4,864 # 80001360 <__boot_stack__+0xf8001360>
8000116e:	c398                	sw	a4,0(a5)
80001170:	0791                	addi	a5,a5,4
80001172:	fed79ee3          	bne	a5,a3,8000116e <_ZN4EPOS1S2IC4initEv+0x10>
80001176:	8082                	ret

80001178 <_ZN4EPOS1S5Alarm4initEv>:
80001178:	1141                	addi	sp,sp,-16
8000117a:	c606                	sw	ra,12(sp)
8000117c:	8341a503          	lw	a0,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
80001180:	415c                	lw	a5,4(a0)
80001182:	cb99                	beqz	a5,80001198 <_ZN4EPOS1S5Alarm4initEv+0x20>
80001184:	02700693          	li	a3,39
80001188:	4661                	li	a2,24
8000118a:	43d8                	lw	a4,4(a5)
8000118c:	06e6e663          	bltu	a3,a4,800011f8 <_ZN4EPOS1S5Alarm4initEv+0x80>
80001190:	06c70463          	beq	a4,a2,800011f8 <_ZN4EPOS1S5Alarm4initEv+0x80>
80001194:	47dc                	lw	a5,12(a5)
80001196:	fbf5                	bnez	a5,8000118a <_ZN4EPOS1S5Alarm4initEv+0x12>
80001198:	2bb9                	jal	800016f6 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>
8000119a:	4781                	li	a5,0
8000119c:	a8a5                	j	80001214 <_ZN4EPOS1S5Alarm4initEv+0x9c>
8000119e:	4118                	lw	a4,0(a0)
800011a0:	4685                	li	a3,1
800011a2:	00d70d63          	beq	a4,a3,800011bc <_ZN4EPOS1S5Alarm4initEv+0x44>
800011a6:	4790                	lw	a2,8(a5)
800011a8:	c20d                	beqz	a2,800011ca <_ZN4EPOS1S5Alarm4initEv+0x52>
800011aa:	47d4                	lw	a3,12(a5)
800011ac:	ca8d                	beqz	a3,800011de <_ZN4EPOS1S5Alarm4initEv+0x66>
800011ae:	c654                	sw	a3,12(a2)
800011b0:	4798                	lw	a4,8(a5)
800011b2:	c698                	sw	a4,8(a3)
800011b4:	4118                	lw	a4,0(a0)
800011b6:	177d                	addi	a4,a4,-1
800011b8:	c118                	sw	a4,0(a0)
800011ba:	a0b1                	j	80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011bc:	00052223          	sw	zero,4(a0)
800011c0:	00052423          	sw	zero,8(a0)
800011c4:	00052023          	sw	zero,0(a0)
800011c8:	a83d                	j	80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011ca:	cf15                	beqz	a4,80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011cc:	4158                	lw	a4,4(a0)
800011ce:	4758                	lw	a4,12(a4)
800011d0:	c158                	sw	a4,4(a0)
800011d2:	00072423          	sw	zero,8(a4)
800011d6:	4118                	lw	a4,0(a0)
800011d8:	177d                	addi	a4,a4,-1
800011da:	c118                	sw	a4,0(a0)
800011dc:	a02d                	j	80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011de:	c705                	beqz	a4,80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011e0:	4518                	lw	a4,8(a0)
800011e2:	4718                	lw	a4,8(a4)
800011e4:	c518                	sw	a4,8(a0)
800011e6:	00072623          	sw	zero,12(a4)
800011ea:	4118                	lw	a4,0(a0)
800011ec:	177d                	addi	a4,a4,-1
800011ee:	c118                	sw	a4,0(a0)
800011f0:	a819                	j	80001206 <_ZN4EPOS1S5Alarm4initEv+0x8e>
800011f2:	86f1a223          	sw	a5,-1948(gp) # 80003064 <_ZN4EPOS1S5Timer9_channelsE+0x4>
800011f6:	a825                	j	8000122e <_ZN4EPOS1S5Alarm4initEv+0xb6>
800011f8:	1721                	addi	a4,a4,-24
800011fa:	c3d8                	sw	a4,4(a5)
800011fc:	4558                	lw	a4,12(a0)
800011fe:	1721                	addi	a4,a4,-24
80001200:	c558                	sw	a4,12(a0)
80001202:	43d8                	lw	a4,4(a5)
80001204:	df49                	beqz	a4,8000119e <_ZN4EPOS1S5Alarm4initEv+0x26>
80001206:	4398                	lw	a4,0(a5)
80001208:	43dc                	lw	a5,4(a5)
8000120a:	973e                	add	a4,a4,a5
8000120c:	00470793          	addi	a5,a4,4
80001210:	46e1                	li	a3,24
80001212:	c314                	sw	a3,0(a4)
80001214:	4705                	li	a4,1
80001216:	c398                	sw	a4,0(a5)
80001218:	c3d8                	sw	a4,4(a5)
8000121a:	00e78423          	sb	a4,8(a5)
8000121e:	80001737          	lui	a4,0x80001
80001222:	23c70713          	addi	a4,a4,572 # 8000123c <__boot_stack__+0xf800123c>
80001226:	cb98                	sw	a4,16(a5)
80001228:	8641a703          	lw	a4,-1948(gp) # 80003064 <_ZN4EPOS1S5Timer9_channelsE+0x4>
8000122c:	d379                	beqz	a4,800011f2 <_ZN4EPOS1S5Alarm4initEv+0x7a>
8000122e:	4705                	li	a4,1
80001230:	c7d8                	sw	a4,12(a5)
80001232:	84f1a823          	sw	a5,-1968(gp) # 80003050 <_ZN4EPOS1S5Alarm6_timerE>
80001236:	40b2                	lw	ra,12(sp)
80001238:	0141                	addi	sp,sp,16
8000123a:	8082                	ret

8000123c <_ZN4EPOS1S5Alarm7handlerEj>:
8000123c:	85418793          	addi	a5,gp,-1964 # 80003054 <_ZN4EPOS1S5Alarm8_elapsedE>
80001240:	4398                	lw	a4,0(a5)
80001242:	0705                	addi	a4,a4,1
80001244:	c398                	sw	a4,0(a5)
80001246:	8881a703          	lw	a4,-1912(gp) # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
8000124a:	cb01                	beqz	a4,8000125a <_ZN4EPOS1S5Alarm7handlerEj+0x1e>
8000124c:	88c1a683          	lw	a3,-1908(gp) # 8000308c <_ZN4EPOS1S5Alarm8_requestE+0x4>
80001250:	42dc                	lw	a5,4(a3)
80001252:	17fd                	addi	a5,a5,-1
80001254:	c2dc                	sw	a5,4(a3)
80001256:	00f05363          	blez	a5,8000125c <_ZN4EPOS1S5Alarm7handlerEj+0x20>
8000125a:	8082                	ret
8000125c:	1141                	addi	sp,sp,-16
8000125e:	c606                	sw	ra,12(sp)
80001260:	88c1a683          	lw	a3,-1908(gp) # 8000308c <_ZN4EPOS1S5Alarm8_requestE+0x4>
80001264:	4785                	li	a5,1
80001266:	02f70f63          	beq	a4,a5,800012a4 <_ZN4EPOS1S5Alarm7handlerEj+0x68>
8000126a:	46d0                	lw	a2,12(a3)
8000126c:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
80001270:	c3d0                	sw	a2,4(a5)
80001272:	00062423          	sw	zero,8(a2) # 4008 <NUM_GP_REGS+0x3fe8>
80001276:	177d                	addi	a4,a4,-1
80001278:	c398                	sw	a4,0(a5)
8000127a:	46dc                	lw	a5,12(a3)
8000127c:	c789                	beqz	a5,80001286 <_ZN4EPOS1S5Alarm7handlerEj+0x4a>
8000127e:	43d8                	lw	a4,4(a5)
80001280:	42d0                	lw	a2,4(a3)
80001282:	9732                	add	a4,a4,a2
80001284:	c3d8                	sw	a4,4(a5)
80001286:	428c                	lw	a1,0(a3)
80001288:	459c                	lw	a5,8(a1)
8000128a:	577d                	li	a4,-1
8000128c:	02e78663          	beq	a5,a4,800012b8 <_ZN4EPOS1S5Alarm7handlerEj+0x7c>
80001290:	17fd                	addi	a5,a5,-1
80001292:	c59c                	sw	a5,8(a1)
80001294:	e395                	bnez	a5,800012b8 <_ZN4EPOS1S5Alarm7handlerEj+0x7c>
80001296:	41c8                	lw	a0,4(a1)
80001298:	411c                	lw	a5,0(a0)
8000129a:	479c                	lw	a5,8(a5)
8000129c:	9782                	jalr	a5
8000129e:	40b2                	lw	ra,12(sp)
800012a0:	0141                	addi	sp,sp,16
800012a2:	8082                	ret
800012a4:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
800012a8:	0007a223          	sw	zero,4(a5)
800012ac:	0007a423          	sw	zero,8(a5)
800012b0:	0007a023          	sw	zero,0(a5)
800012b4:	dae9                	beqz	a3,80001286 <_ZN4EPOS1S5Alarm7handlerEj+0x4a>
800012b6:	b7d1                	j	8000127a <_ZN4EPOS1S5Alarm7handlerEj+0x3e>
800012b8:	45dc                	lw	a5,12(a1)
800012ba:	c2dc                	sw	a5,4(a3)
800012bc:	8881a803          	lw	a6,-1912(gp) # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
800012c0:	00081d63          	bnez	a6,800012da <_ZN4EPOS1S5Alarm7handlerEj+0x9e>
800012c4:	0006a423          	sw	zero,8(a3)
800012c8:	0006a623          	sw	zero,12(a3)
800012cc:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
800012d0:	c3d4                	sw	a3,4(a5)
800012d2:	c794                	sw	a3,8(a5)
800012d4:	4705                	li	a4,1
800012d6:	c398                	sw	a4,0(a5)
800012d8:	bf7d                	j	80001296 <_ZN4EPOS1S5Alarm7handlerEj+0x5a>
800012da:	88c1a703          	lw	a4,-1908(gp) # 8000308c <_ZN4EPOS1S5Alarm8_requestE+0x4>
800012de:	4350                	lw	a2,4(a4)
800012e0:	42dc                	lw	a5,4(a3)
800012e2:	00c7ca63          	blt	a5,a2,800012f6 <_ZN4EPOS1S5Alarm7handlerEj+0xba>
800012e6:	4748                	lw	a0,12(a4)
800012e8:	c505                	beqz	a0,80001310 <_ZN4EPOS1S5Alarm7handlerEj+0xd4>
800012ea:	8f91                	sub	a5,a5,a2
800012ec:	c2dc                	sw	a5,4(a3)
800012ee:	4758                	lw	a4,12(a4)
800012f0:	4350                	lw	a2,4(a4)
800012f2:	fec7dae3          	bge	a5,a2,800012e6 <_ZN4EPOS1S5Alarm7handlerEj+0xaa>
800012f6:	4708                	lw	a0,8(a4)
800012f8:	cd05                	beqz	a0,80001330 <_ZN4EPOS1S5Alarm7handlerEj+0xf4>
800012fa:	40f607b3          	sub	a5,a2,a5
800012fe:	c35c                	sw	a5,4(a4)
80001300:	c554                	sw	a3,12(a0)
80001302:	c714                	sw	a3,8(a4)
80001304:	c688                	sw	a0,8(a3)
80001306:	c6d8                	sw	a4,12(a3)
80001308:	0805                	addi	a6,a6,1
8000130a:	8901a423          	sw	a6,-1912(gp) # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
8000130e:	b761                	j	80001296 <_ZN4EPOS1S5Alarm7handlerEj+0x5a>
80001310:	fec7c3e3          	blt	a5,a2,800012f6 <_ZN4EPOS1S5Alarm7handlerEj+0xba>
80001314:	8f91                	sub	a5,a5,a2
80001316:	c2dc                	sw	a5,4(a3)
80001318:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
8000131c:	4798                	lw	a4,8(a5)
8000131e:	c754                	sw	a3,12(a4)
80001320:	c698                	sw	a4,8(a3)
80001322:	0006a623          	sw	zero,12(a3)
80001326:	c794                	sw	a3,8(a5)
80001328:	0805                	addi	a6,a6,1
8000132a:	0107a023          	sw	a6,0(a5)
8000132e:	b7a5                	j	80001296 <_ZN4EPOS1S5Alarm7handlerEj+0x5a>
80001330:	40f607b3          	sub	a5,a2,a5
80001334:	c35c                	sw	a5,4(a4)
80001336:	0006a423          	sw	zero,8(a3)
8000133a:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
8000133e:	43d8                	lw	a4,4(a5)
80001340:	c6d8                	sw	a4,12(a3)
80001342:	c714                	sw	a3,8(a4)
80001344:	c3d4                	sw	a3,4(a5)
80001346:	0805                	addi	a6,a6,1
80001348:	0107a023          	sw	a6,0(a5)
8000134c:	b7a9                	j	80001296 <_ZN4EPOS1S5Alarm7handlerEj+0x5a>

8000134e <_GLOBAL__sub_I__ZN4EPOS1S5Alarm6_timerE>:
8000134e:	88818793          	addi	a5,gp,-1912 # 80003088 <_ZN4EPOS1S5Alarm8_requestE>
80001352:	0007a023          	sw	zero,0(a5)
80001356:	0007a223          	sw	zero,4(a5)
8000135a:	0007a423          	sw	zero,8(a5)
8000135e:	8082                	ret

80001360 <_ZN4EPOS1S2IC7int_notEj>:
80001360:	8082                	ret

80001362 <_ZN4EPOS1S7Machine5panicEv>:
80001362:	1141                	addi	sp,sp,-16
80001364:	c606                	sw	ra,12(sp)
80001366:	05000793          	li	a5,80
8000136a:	80002737          	lui	a4,0x80002
8000136e:	a0470713          	addi	a4,a4,-1532 # 80001a04 <__boot_stack__+0xf8001a04>
80001372:	4525                	li	a0,9
80001374:	10000637          	lui	a2,0x10000
80001378:	45a9                	li	a1,10
8000137a:	04f00e13          	li	t3,79
8000137e:	4335                	li	t1,13
80001380:	a819                	j	80001396 <_ZN4EPOS1S7Machine5panicEv+0x34>
80001382:	00a60023          	sb	a0,0(a2) # 10000000 <NUM_GP_REGS+0xfffffe0>
80001386:	85c1a783          	lw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
8000138a:	07a1                	addi	a5,a5,8
8000138c:	84f1ae23          	sw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
80001390:	00074783          	lbu	a5,0(a4)
80001394:	c7a1                	beqz	a5,800013dc <_ZN4EPOS1S7Machine5panicEv+0x7a>
80001396:	0705                	addi	a4,a4,1
80001398:	fea785e3          	beq	a5,a0,80001382 <_ZN4EPOS1S7Machine5panicEv+0x20>
8000139c:	00b79e63          	bne	a5,a1,800013b8 <_ZN4EPOS1S7Machine5panicEv+0x56>
800013a0:	00660023          	sb	t1,0(a2)
800013a4:	00b60023          	sb	a1,0(a2)
800013a8:	8401ae23          	sw	zero,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800013ac:	8581a783          	lw	a5,-1960(gp) # 80003058 <_ZN4EPOS1S14Serial_Display5_lineE>
800013b0:	0785                	addi	a5,a5,1
800013b2:	84f1ac23          	sw	a5,-1960(gp) # 80003058 <_ZN4EPOS1S14Serial_Display5_lineE>
800013b6:	bfe9                	j	80001390 <_ZN4EPOS1S7Machine5panicEv+0x2e>
800013b8:	85c1a803          	lw	a6,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800013bc:	0805                	addi	a6,a6,1
800013be:	8501ae23          	sw	a6,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800013c2:	00f60023          	sb	a5,0(a2)
800013c6:	85c1a783          	lw	a5,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800013ca:	fcfe53e3          	bge	t3,a5,80001390 <_ZN4EPOS1S7Machine5panicEv+0x2e>
800013ce:	00660023          	sb	t1,0(a2)
800013d2:	00b60023          	sb	a1,0(a2)
800013d6:	8401ae23          	sw	zero,-1956(gp) # 8000305c <_ZN4EPOS1S14Serial_Display7_columnE>
800013da:	bf5d                	j	80001390 <_ZN4EPOS1S7Machine5panicEv+0x2e>
800013dc:	80002537          	lui	a0,0x80002
800013e0:	91450513          	addi	a0,a0,-1772 # 80001914 <__boot_stack__+0xf8001914>
800013e4:	a7eff0ef          	jal	ra,80000662 <_print>
800013e8:	80001537          	lui	a0,0x80001
800013ec:	7e050513          	addi	a0,a0,2016 # 800017e0 <__boot_stack__+0xf80017e0>
800013f0:	a72ff0ef          	jal	ra,80000662 <_print>
800013f4:	4729                	li	a4,10
800013f6:	82e1a223          	sw	a4,-2012(gp) # 80003024 <_ZN4EPOS1S4kerrE>
800013fa:	10500073          	wfi
800013fe:	40b2                	lw	ra,12(sp)
80001400:	0141                	addi	sp,sp,16
80001402:	8082                	ret

80001404 <_ZN4EPOS1S5Timer11int_handlerEj>:
80001404:	1141                	addi	sp,sp,-16
80001406:	c606                	sw	ra,12(sp)
80001408:	c422                	sw	s0,8(sp)
8000140a:	842a                	mv	s0,a0
8000140c:	8601a783          	lw	a5,-1952(gp) # 80003060 <_ZN4EPOS1S5Timer9_channelsE>
80001410:	c791                	beqz	a5,8000141c <_ZN4EPOS1S5Timer11int_handlerEj+0x18>
80001412:	47d8                	lw	a4,12(a5)
80001414:	177d                	addi	a4,a4,-1
80001416:	c7d8                	sw	a4,12(a5)
80001418:	00e05e63          	blez	a4,80001434 <_ZN4EPOS1S5Timer11int_handlerEj+0x30>
8000141c:	8641a783          	lw	a5,-1948(gp) # 80003064 <_ZN4EPOS1S5Timer9_channelsE+0x4>
80001420:	c791                	beqz	a5,8000142c <_ZN4EPOS1S5Timer11int_handlerEj+0x28>
80001422:	43d8                	lw	a4,4(a5)
80001424:	c7d8                	sw	a4,12(a5)
80001426:	4b9c                	lw	a5,16(a5)
80001428:	8522                	mv	a0,s0
8000142a:	9782                	jalr	a5
8000142c:	40b2                	lw	ra,12(sp)
8000142e:	4422                	lw	s0,8(sp)
80001430:	0141                	addi	sp,sp,16
80001432:	8082                	ret
80001434:	43d8                	lw	a4,4(a5)
80001436:	c7d8                	sw	a4,12(a5)
80001438:	4b9c                	lw	a5,16(a5)
8000143a:	9782                	jalr	a5
8000143c:	b7c5                	j	8000141c <_ZN4EPOS1S5Timer11int_handlerEj+0x18>

8000143e <_ZNVK4EPOS1S3CPU7Context4loadEv>:
8000143e:	8341a803          	lw	a6,-1996(gp) # 80003034 <_ZN4EPOS1S6System5_heapE>
80001442:	87ffc737          	lui	a4,0x87ffc
80001446:	00170793          	addi	a5,a4,1 # 87ffc001 <__boot_stack__+0xffffc001>
8000144a:	4685                	li	a3,1
8000144c:	00d700a3          	sb	a3,1(a4)
80001450:	fc000693          	li	a3,-64
80001454:	00d780a3          	sb	a3,1(a5)
80001458:	56fd                	li	a3,-1
8000145a:	00d78123          	sb	a3,2(a5)
8000145e:	f8700693          	li	a3,-121
80001462:	00d781a3          	sb	a3,3(a5)
80001466:	00078223          	sb	zero,4(a5)
8000146a:	04000693          	li	a3,64
8000146e:	00d782a3          	sb	a3,5(a5)
80001472:	00078323          	sb	zero,6(a5)
80001476:	000783a3          	sb	zero,7(a5)
8000147a:	00078423          	sb	zero,8(a5)
8000147e:	000784a3          	sb	zero,9(a5)
80001482:	00078523          	sb	zero,10(a5)
80001486:	000785a3          	sb	zero,11(a5)
8000148a:	00078623          	sb	zero,12(a5)
8000148e:	000786a3          	sb	zero,13(a5)
80001492:	00078723          	sb	zero,14(a5)
80001496:	000787a3          	sb	zero,15(a5)
8000149a:	00c82683          	lw	a3,12(a6)
8000149e:	6611                	lui	a2,0x4
800014a0:	96b2                	add	a3,a3,a2
800014a2:	00d82623          	sw	a3,12(a6)
800014a6:	00174583          	lbu	a1,1(a4)
800014aa:	0017c703          	lbu	a4,1(a5)
800014ae:	0722                	slli	a4,a4,0x8
800014b0:	8f4d                	or	a4,a4,a1
800014b2:	0027c583          	lbu	a1,2(a5)
800014b6:	05c2                	slli	a1,a1,0x10
800014b8:	8f4d                	or	a4,a4,a1
800014ba:	0037c583          	lbu	a1,3(a5)
800014be:	05e2                	slli	a1,a1,0x18
800014c0:	8dd9                	or	a1,a1,a4
800014c2:	0047c603          	lbu	a2,4(a5)
800014c6:	0057c703          	lbu	a4,5(a5)
800014ca:	0722                	slli	a4,a4,0x8
800014cc:	8f51                	or	a4,a4,a2
800014ce:	0067c603          	lbu	a2,6(a5)
800014d2:	0642                	slli	a2,a2,0x10
800014d4:	8f51                	or	a4,a4,a2
800014d6:	0077c603          	lbu	a2,7(a5)
800014da:	0662                	slli	a2,a2,0x18
800014dc:	8e59                	or	a2,a2,a4
800014de:	962e                	add	a2,a2,a1
800014e0:	00482783          	lw	a5,4(a6)
800014e4:	cbe5                	beqz	a5,800015d4 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x196>
800014e6:	873e                	mv	a4,a5
800014e8:	4314                	lw	a3,0(a4)
800014ea:	00d60463          	beq	a2,a3,800014f2 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xb4>
800014ee:	4758                	lw	a4,12(a4)
800014f0:	ff65                	bnez	a4,800014e8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xaa>
800014f2:	4394                	lw	a3,0(a5)
800014f4:	43d0                	lw	a2,4(a5)
800014f6:	96b2                	add	a3,a3,a2
800014f8:	0ed58063          	beq	a1,a3,800015d8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x19a>
800014fc:	47dc                	lw	a5,12(a5)
800014fe:	fbf5                	bnez	a5,800014f2 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xb4>
80001500:	00082783          	lw	a5,0(a6)
80001504:	c7b1                	beqz	a5,80001550 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x112>
80001506:	00882683          	lw	a3,8(a6)
8000150a:	87ffc7b7          	lui	a5,0x87ffc
8000150e:	0785                	addi	a5,a5,1
80001510:	c6dc                	sw	a5,12(a3)
80001512:	00882683          	lw	a3,8(a6)
80001516:	00d78423          	sb	a3,8(a5) # 87ffc008 <__boot_stack__+0xffffc008>
8000151a:	0086d613          	srli	a2,a3,0x8
8000151e:	00c784a3          	sb	a2,9(a5)
80001522:	0106d613          	srli	a2,a3,0x10
80001526:	00c78523          	sb	a2,10(a5)
8000152a:	82e1                	srli	a3,a3,0x18
8000152c:	00d785a3          	sb	a3,11(a5)
80001530:	00078623          	sb	zero,12(a5)
80001534:	000786a3          	sb	zero,13(a5)
80001538:	00078723          	sb	zero,14(a5)
8000153c:	000787a3          	sb	zero,15(a5)
80001540:	00f82423          	sw	a5,8(a6)
80001544:	00082783          	lw	a5,0(a6)
80001548:	0785                	addi	a5,a5,1
8000154a:	00f82023          	sw	a5,0(a6)
8000154e:	a82d                	j	80001588 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x14a>
80001550:	87ffc7b7          	lui	a5,0x87ffc
80001554:	000784a3          	sb	zero,9(a5) # 87ffc009 <__boot_stack__+0xffffc009>
80001558:	00078523          	sb	zero,10(a5)
8000155c:	000785a3          	sb	zero,11(a5)
80001560:	00078623          	sb	zero,12(a5)
80001564:	000786a3          	sb	zero,13(a5)
80001568:	00078723          	sb	zero,14(a5)
8000156c:	000787a3          	sb	zero,15(a5)
80001570:	00078823          	sb	zero,16(a5)
80001574:	0785                	addi	a5,a5,1
80001576:	00f82223          	sw	a5,4(a6)
8000157a:	00f82423          	sw	a5,8(a6)
8000157e:	00082783          	lw	a5,0(a6)
80001582:	0785                	addi	a5,a5,1
80001584:	00f82023          	sw	a5,0(a6)
80001588:	4781                	li	a5,0
8000158a:	eb21                	bnez	a4,800015da <_ZNVK4EPOS1S3CPU7Context4loadEv+0x19c>
8000158c:	a8d9                	j	80001662 <c_load>
8000158e:	00082223          	sw	zero,4(a6)
80001592:	00082423          	sw	zero,8(a6)
80001596:	00082023          	sw	zero,0(a6)
8000159a:	a045                	j	8000163a <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fc>
8000159c:	ced9                	beqz	a3,8000163a <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fc>
8000159e:	00482703          	lw	a4,4(a6)
800015a2:	4758                	lw	a4,12(a4)
800015a4:	00e82223          	sw	a4,4(a6)
800015a8:	00072423          	sw	zero,8(a4)
800015ac:	00082703          	lw	a4,0(a6)
800015b0:	177d                	addi	a4,a4,-1
800015b2:	00e82023          	sw	a4,0(a6)
800015b6:	a051                	j	8000163a <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fc>
800015b8:	c2c9                	beqz	a3,8000163a <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fc>
800015ba:	00882703          	lw	a4,8(a6)
800015be:	4718                	lw	a4,8(a4)
800015c0:	00e82423          	sw	a4,8(a6)
800015c4:	00072623          	sw	zero,12(a4)
800015c8:	00082703          	lw	a4,0(a6)
800015cc:	177d                	addi	a4,a4,-1
800015ce:	00e82023          	sw	a4,0(a6)
800015d2:	a0a5                	j	8000163a <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fc>
800015d4:	873e                	mv	a4,a5
800015d6:	b72d                	j	80001500 <_ZNVK4EPOS1S3CPU7Context4loadEv+0xc2>
800015d8:	c335                	beqz	a4,8000163c <_ZNVK4EPOS1S3CPU7Context4loadEv+0x1fe>
800015da:	87ffc5b7          	lui	a1,0x87ffc
800015de:	0055c683          	lbu	a3,5(a1) # 87ffc005 <__boot_stack__+0xffffc005>
800015e2:	0065c603          	lbu	a2,6(a1)
800015e6:	0622                	slli	a2,a2,0x8
800015e8:	8e55                	or	a2,a2,a3
800015ea:	0075c683          	lbu	a3,7(a1)
800015ee:	06c2                	slli	a3,a3,0x10
800015f0:	8e55                	or	a2,a2,a3
800015f2:	0085c683          	lbu	a3,8(a1)
800015f6:	06e2                	slli	a3,a3,0x18
800015f8:	8ed1                	or	a3,a3,a2
800015fa:	4350                	lw	a2,4(a4)
800015fc:	96b2                	add	a3,a3,a2
800015fe:	00d582a3          	sb	a3,5(a1)
80001602:	0086d613          	srli	a2,a3,0x8
80001606:	00c58323          	sb	a2,6(a1)
8000160a:	0106d613          	srli	a2,a3,0x10
8000160e:	00c583a3          	sb	a2,7(a1)
80001612:	82e1                	srli	a3,a3,0x18
80001614:	00d58423          	sb	a3,8(a1)
80001618:	00082683          	lw	a3,0(a6)
8000161c:	4605                	li	a2,1
8000161e:	f6c688e3          	beq	a3,a2,8000158e <_ZNVK4EPOS1S3CPU7Context4loadEv+0x150>
80001622:	470c                	lw	a1,8(a4)
80001624:	dda5                	beqz	a1,8000159c <_ZNVK4EPOS1S3CPU7Context4loadEv+0x15e>
80001626:	4750                	lw	a2,12(a4)
80001628:	da41                	beqz	a2,800015b8 <_ZNVK4EPOS1S3CPU7Context4loadEv+0x17a>
8000162a:	c5d0                	sw	a2,12(a1)
8000162c:	4718                	lw	a4,8(a4)
8000162e:	c618                	sw	a4,8(a2)
80001630:	00082703          	lw	a4,0(a6)
80001634:	177d                	addi	a4,a4,-1
80001636:	00e82023          	sw	a4,0(a6)
8000163a:	c785                	beqz	a5,80001662 <c_load>
8000163c:	87ffc637          	lui	a2,0x87ffc
80001640:	00564703          	lbu	a4,5(a2) # 87ffc005 <__boot_stack__+0xffffc005>
80001644:	00664683          	lbu	a3,6(a2)
80001648:	06a2                	slli	a3,a3,0x8
8000164a:	8ed9                	or	a3,a3,a4
8000164c:	00764703          	lbu	a4,7(a2)
80001650:	0742                	slli	a4,a4,0x10
80001652:	8ed9                	or	a3,a3,a4
80001654:	00864703          	lbu	a4,8(a2)
80001658:	0762                	slli	a4,a4,0x18
8000165a:	8f55                	or	a4,a4,a3
8000165c:	43d4                	lw	a3,4(a5)
8000165e:	9736                	add	a4,a4,a3
80001660:	c3d8                	sw	a4,4(a5)

80001662 <c_load>:
80001662:	812a                	mv	sp,a0
80001664:	07410113          	addi	sp,sp,116
80001668:	ff812283          	lw	t0,-8(sp)
8000166c:	ff412303          	lw	t1,-12(sp)
80001670:	ff012383          	lw	t2,-16(sp)
80001674:	fec12403          	lw	s0,-20(sp)
80001678:	fe812483          	lw	s1,-24(sp)
8000167c:	fe412503          	lw	a0,-28(sp)
80001680:	fe012583          	lw	a1,-32(sp)
80001684:	fdc12603          	lw	a2,-36(sp)
80001688:	fd812683          	lw	a3,-40(sp)
8000168c:	fd412703          	lw	a4,-44(sp)
80001690:	fd012783          	lw	a5,-48(sp)
80001694:	fcc12803          	lw	a6,-52(sp)
80001698:	fc812883          	lw	a7,-56(sp)
8000169c:	fc412903          	lw	s2,-60(sp)
800016a0:	fc012983          	lw	s3,-64(sp)
800016a4:	fbc12a03          	lw	s4,-68(sp)
800016a8:	fb812a83          	lw	s5,-72(sp)
800016ac:	fb412b03          	lw	s6,-76(sp)
800016b0:	fb012b83          	lw	s7,-80(sp)
800016b4:	fac12c03          	lw	s8,-84(sp)
800016b8:	fa812c83          	lw	s9,-88(sp)
800016bc:	fa412d03          	lw	s10,-92(sp)
800016c0:	fa012d83          	lw	s11,-96(sp)
800016c4:	f9c12e03          	lw	t3,-100(sp)
800016c8:	f9812e83          	lw	t4,-104(sp)
800016cc:	f9412f03          	lw	t5,-108(sp)
800016d0:	f9012f83          	lw	t6,-112(sp)
800016d4:	f8c12083          	lw	ra,-116(sp)
800016d8:	ffc12f83          	lw	t6,-4(sp)
800016dc:	8082                	ret

800016de <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>:
800016de:	a001                	j	800016de <_ZN4EPOS1S3CPU14switch_contextEPPNS1_7ContextES3_>

800016e0 <_GLOBAL__sub_I__ZN4EPOS1S3MMU5_freeE>:
800016e0:	91418793          	addi	a5,gp,-1772 # 80003114 <_ZN4EPOS1S3MMU5_freeE>
800016e4:	0007a023          	sw	zero,0(a5)
800016e8:	0007a223          	sw	zero,4(a5)
800016ec:	0007a423          	sw	zero,8(a5)
800016f0:	0007a623          	sw	zero,12(a5)
800016f4:	8082                	ret

800016f6 <_ZN4EPOS1S1U4Heap13out_of_memoryEv>:
800016f6:	1141                	addi	sp,sp,-16
800016f8:	c606                	sw	ra,12(sp)
800016fa:	f45fe0ef          	jal	ra,8000063e <_panic>
800016fe:	40b2                	lw	ra,12(sp)
80001700:	0141                	addi	sp,sp,16
80001702:	8082                	ret

80001704 <_ZN4EPOS1S1U7OStream4utoaEjPcj>:
80001704:	c9a1                	beqz	a1,80001754 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x50>
80001706:	10000793          	li	a5,256
8000170a:	00b7f663          	bgeu	a5,a1,80001716 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
8000170e:	411c                	lw	a5,0(a0)
80001710:	17e1                	addi	a5,a5,-8
80001712:	9bdd                	andi	a5,a5,-9
80001714:	cba1                	beqz	a5,80001764 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x60>
80001716:	4118                	lw	a4,0(a0)
80001718:	87ae                	mv	a5,a1
8000171a:	88b6                	mv	a7,a3
8000171c:	0685                	addi	a3,a3,1
8000171e:	883e                	mv	a6,a5
80001720:	02e7d7b3          	divu	a5,a5,a4
80001724:	fee87be3          	bgeu	a6,a4,8000171a <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x16>
80001728:	9646                	add	a2,a2,a7
8000172a:	80002837          	lui	a6,0x80002
8000172e:	a0c80813          	addi	a6,a6,-1524 # 80001a0c <__boot_stack__+0xf8001a0c>
80001732:	411c                	lw	a5,0(a0)
80001734:	02f5f7b3          	remu	a5,a1,a5
80001738:	97c2                	add	a5,a5,a6
8000173a:	0007c783          	lbu	a5,0(a5)
8000173e:	00f60023          	sb	a5,0(a2)
80001742:	411c                	lw	a5,0(a0)
80001744:	872e                	mv	a4,a1
80001746:	02f5d5b3          	divu	a1,a1,a5
8000174a:	167d                	addi	a2,a2,-1
8000174c:	fef773e3          	bgeu	a4,a5,80001732 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x2e>
80001750:	8536                	mv	a0,a3
80001752:	8082                	ret
80001754:	9636                	add	a2,a2,a3
80001756:	03000793          	li	a5,48
8000175a:	00f60023          	sb	a5,0(a2)
8000175e:	00168513          	addi	a0,a3,1
80001762:	8082                	ret
80001764:	00168713          	addi	a4,a3,1
80001768:	00d607b3          	add	a5,a2,a3
8000176c:	03000813          	li	a6,48
80001770:	01078023          	sb	a6,0(a5)
80001774:	00052803          	lw	a6,0(a0)
80001778:	47c1                	li	a5,16
8000177a:	00f81963          	bne	a6,a5,8000178c <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x88>
8000177e:	0689                	addi	a3,a3,2
80001780:	9732                	add	a4,a4,a2
80001782:	07800793          	li	a5,120
80001786:	00f70023          	sb	a5,0(a4)
8000178a:	b771                	j	80001716 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>
8000178c:	86ba                	mv	a3,a4
8000178e:	b761                	j	80001716 <_ZN4EPOS1S1U7OStream4utoaEjPcj+0x12>

Disassembly of section .fini:

80001790 <_fini>:
80001790:	800037b7          	lui	a5,0x80003
80001794:	0007a783          	lw	a5,0(a5) # 80003000 <__boot_stack__+0xf8003000>
80001798:	c391                	beqz	a5,8000179c <_fini+0xc>
8000179a:	8082                	ret
8000179c:	800037b7          	lui	a5,0x80003
800017a0:	4705                	li	a4,1
800017a2:	00e7a023          	sw	a4,0(a5) # 80003000 <__boot_stack__+0xf8003000>
800017a6:	800037b7          	lui	a5,0x80003
800017aa:	ffc7a783          	lw	a5,-4(a5) # 80002ffc <__boot_stack__+0xf8002ffc>
800017ae:	d7f5                	beqz	a5,8000179a <_fini+0xa>
800017b0:	1141                	addi	sp,sp,-16
800017b2:	c606                	sw	ra,12(sp)
800017b4:	c422                	sw	s0,8(sp)
800017b6:	80003437          	lui	s0,0x80003
800017ba:	ffc40413          	addi	s0,s0,-4 # 80002ffc <__boot_stack__+0xf8002ffc>
800017be:	9782                	jalr	a5
800017c0:	0411                	addi	s0,s0,4
800017c2:	401c                	lw	a5,0(s0)
800017c4:	ffed                	bnez	a5,800017be <_fini+0x2e>
800017c6:	40b2                	lw	ra,12(sp)
800017c8:	4422                	lw	s0,8(sp)
800017ca:	0141                	addi	sp,sp,16
800017cc:	8082                	ret
