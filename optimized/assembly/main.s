	.file	"main.c"
	.text
	.globl	rgb_to_ycc
	.type	rgb_to_ycc, @function
rgb_to_ycc:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$136, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -136(%rbp)
	movq	%rsi, %rax
	movq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	%rax, -160(%rbp)
	movq	%rdx, -152(%rbp)
	movl	-152(%rbp), %eax
	sarl	%eax
	movl	%eax, -44(%rbp)
	movl	-148(%rbp), %eax
	sarl	%eax
	movl	%eax, -48(%rbp)
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_meta_ycc_matrix
	movq	%rax, -56(%rbp)
	movl	$0, -60(%rbp)
	movb	$16, -61(%rbp)
	movl	$16843, -68(%rbp)
	movl	$33030, -72(%rbp)
	movl	$6423, -76(%rbp)
	movl	$-9699, -80(%rbp)
	movl	$-19071, -84(%rbp)
	movl	$28770, -88(%rbp)
	movl	$28770, -92(%rbp)
	movl	$-24117, -96(%rbp)
	movl	$-4653, -100(%rbp)
	movl	$0, -104(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L2
.L5:
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -108(%rbp)
	movl	-36(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -112(%rbp)
	movl	$0, -40(%rbp)
	jmp	.L3
.L4:
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -116(%rbp)
	movl	-40(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
	movl	$0, -60(%rbp)
	movl	-60(%rbp), %eax
	movl	%eax, -120(%rbp)
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %r13d
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	1(%rax), %r12d
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	2(%rax), %ebx
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzbl	%r13b, %eax
	imull	-68(%rbp), %eax
	movl	%eax, %ecx
	movzbl	%r12b, %eax
	imull	-72(%rbp), %eax
	addl	%eax, %ecx
	movzbl	%bl, %eax
	imull	-76(%rbp), %eax
	leal	(%rcx,%rax), %esi
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	addl	$16, %eax
	movb	%al, (%rdx)
	movzbl	%r13b, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -120(%rbp)
	movzbl	%r13b, %eax
	imull	-92(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-100(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -60(%rbp)
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %r13d
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	1(%rax), %r12d
	movl	-108(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	2(%rax), %ebx
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzbl	%r13b, %eax
	imull	-68(%rbp), %eax
	movl	%eax, %ecx
	movzbl	%r12b, %eax
	imull	-72(%rbp), %eax
	addl	%eax, %ecx
	movzbl	%bl, %eax
	imull	-76(%rbp), %eax
	leal	(%rcx,%rax), %esi
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	addl	$16, %eax
	movb	%al, 1(%rdx)
	movzbl	%r13b, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -120(%rbp)
	movzbl	%r13b, %eax
	imull	-92(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-100(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -60(%rbp)
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %r13d
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	1(%rax), %r12d
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-116(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	2(%rax), %ebx
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzbl	%r13b, %eax
	imull	-68(%rbp), %eax
	movl	%eax, %ecx
	movzbl	%r12b, %eax
	imull	-72(%rbp), %eax
	addl	%eax, %ecx
	movzbl	%bl, %eax
	imull	-76(%rbp), %eax
	leal	(%rcx,%rax), %esi
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	addl	$16, %eax
	movb	%al, 2(%rdx)
	movzbl	%r13b, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -120(%rbp)
	movzbl	%r13b, %eax
	imull	-92(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-100(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -60(%rbp)
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %r13d
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	1(%rax), %r12d
	movl	-112(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-136(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-104(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rcx, %rax
	movzbl	2(%rax), %ebx
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	leaq	(%rcx,%rax), %rdx
	movzbl	%r13b, %eax
	imull	-68(%rbp), %eax
	movl	%eax, %ecx
	movzbl	%r12b, %eax
	imull	-72(%rbp), %eax
	addl	%eax, %ecx
	movzbl	%bl, %eax
	imull	-76(%rbp), %eax
	leal	(%rcx,%rax), %esi
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %esi
	movl	%esi, %eax
	addl	$16, %eax
	movb	%al, 3(%rdx)
	movzbl	%r13b, %eax
	imull	-80(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -120(%rbp)
	movzbl	%r13b, %eax
	imull	-92(%rbp), %eax
	movl	%eax, %edx
	movzbl	%r12b, %eax
	imull	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	%bl, %eax
	imull	-100(%rbp), %eax
	addl	%eax, %edx
	movzbl	-61(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	addl	%eax, -60(%rbp)
	sarl	$2, -120(%rbp)
	sarl	$2, -60(%rbp)
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	-120(%rbp), %edx
	addl	$-128, %edx
	movb	%dl, 4(%rax)
	movl	-36(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-40(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movl	-60(%rbp), %edx
	addl	$-128, %edx
	movb	%dl, 5(%rax)
	addl	$1, -40(%rbp)
.L3:
	movl	-44(%rbp), %eax
	cmpl	-40(%rbp), %eax
	ja	.L4
	addl	$1, -36(%rbp)
.L2:
	movl	-48(%rbp), %eax
	cmpl	-36(%rbp), %eax
	ja	.L5
	movq	-56(%rbp), %rax
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	rgb_to_ycc, .-rgb_to_ycc
	.type	clip, @function
clip:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	cmpl	$255, -4(%rbp)
	jg	.L8
	cmpl	$0, -4(%rbp)
	js	.L9
	movl	-4(%rbp), %eax
	jmp	.L11
.L9:
	movl	$0, %eax
	jmp	.L11
.L8:
	movl	$-1, %eax
.L11:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	clip, .-clip
	.globl	ycc_to_rgb
	.type	ycc_to_rgb, @function
ycc_to_rgb:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -168(%rbp)
	movq	%rsi, %rax
	movq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	%rax, -192(%rbp)
	movq	%rdx, -184(%rbp)
	movq	-192(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-184(%rbp), %eax
	sarl	%eax
	movl	%eax, -36(%rbp)
	movl	-180(%rbp), %eax
	sarl	%eax
	movl	%eax, -40(%rbp)
	movb	$16, -41(%rbp)
	movl	$76284, -48(%rbp)
	movl	$104595, -52(%rbp)
	movl	$53281, -56(%rbp)
	movl	$25625, -60(%rbp)
	movl	$132252, -64(%rbp)
	movl	$0, -68(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L14
.L17:
	movl	-20(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -72(%rbp)
	movl	-20(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -76(%rbp)
	movl	$0, -24(%rbp)
	jmp	.L15
.L16:
	movl	-24(%rbp), %eax
	addl	%eax, %eax
	movl	%eax, -80(%rbp)
	movl	-24(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -68(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, -112(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	4(%rax), %eax
	movb	%al, -111(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	5(%rax), %eax
	movb	%al, -110(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	1(%rax), %eax
	movb	%al, -128(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	4(%rax), %eax
	movb	%al, -127(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	5(%rax), %eax
	movb	%al, -126(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	2(%rax), %eax
	movb	%al, -144(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	4(%rax), %eax
	movb	%al, -143(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	5(%rax), %eax
	movb	%al, -142(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	3(%rax), %eax
	movb	%al, -160(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	4(%rax), %eax
	movb	%al, -159(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-168(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rcx, %rax
	movzbl	5(%rax), %eax
	movb	%al, -158(%rbp)
	movzbl	-112(%rbp), %eax
	movzbl	%al, %eax
	subl	$16, %eax
	imull	-48(%rbp), %eax
	movl	%eax, -84(%rbp)
	movzbl	-128(%rbp), %eax
	movzbl	%al, %eax
	subl	$16, %eax
	imull	-48(%rbp), %eax
	movl	%eax, -88(%rbp)
	movzbl	-144(%rbp), %eax
	movzbl	%al, %eax
	subl	$16, %eax
	imull	-48(%rbp), %eax
	movl	%eax, -92(%rbp)
	movzbl	-160(%rbp), %eax
	movzbl	%al, %eax
	subl	$16, %eax
	imull	-48(%rbp), %eax
	movl	%eax, -96(%rbp)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-110(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edx
	movl	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, (%rbx)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-110(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-56(%rbp), %eax
	movl	%eax, %edx
	movl	-84(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movzbl	-111(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-60(%rbp), %eax
	leal	(%rcx,%rax), %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 1(%rbx)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-111(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-84(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 2(%rbx)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-126(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edx
	movl	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, (%rbx)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-126(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-56(%rbp), %eax
	movl	%eax, %edx
	movl	-88(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movzbl	-127(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-60(%rbp), %eax
	leal	(%rcx,%rax), %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 1(%rbx)
	movl	-72(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-127(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-88(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 2(%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-142(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edx
	movl	-92(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, (%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-142(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-56(%rbp), %eax
	movl	%eax, %edx
	movl	-92(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movzbl	-143(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-60(%rbp), %eax
	leal	(%rcx,%rax), %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 1(%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-80(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-143(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-92(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 2(%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-158(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-52(%rbp), %eax
	movl	%eax, %edx
	movl	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, (%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-158(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-56(%rbp), %eax
	movl	%eax, %edx
	movl	-96(%rbp), %eax
	leal	(%rdx,%rax), %ecx
	movzbl	-159(%rbp), %eax
	movzbl	%al, %eax
	movl	$128, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	imull	-60(%rbp), %eax
	leal	(%rcx,%rax), %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 1(%rbx)
	movl	-76(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-68(%rbp), %edx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rbx
	movzbl	-159(%rbp), %eax
	movzbl	%al, %eax
	addl	$-128, %eax
	imull	-64(%rbp), %eax
	movl	%eax, %edx
	movl	-96(%rbp), %eax
	addl	%eax, %edx
	movzbl	-41(%rbp), %eax
	movl	%eax, %ecx
	sarl	%cl, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	clip
	movb	%al, 2(%rbx)
	addl	$1, -24(%rbp)
.L15:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L16
	addl	$1, -20(%rbp)
.L14:
	movl	-20(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L17
	movq	-32(%rbp), %rax
	movq	%rax, -192(%rbp)
	addq	$184, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	ycc_to_rgb, .-ycc_to_rgb
	.section	.rodata
	.align 8
.LC0:
	.string	"Usage: main <image_filename.bmp>"
.LC1:
	.string	"r"
.LC2:
	.string	"trainRGB.bmp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	cmpl	$2, -100(%rbp)
	je	.L19
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L19:
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	leaq	-48(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	read_header_info
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	load_image
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_ycc_data
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-64(%rbp), %rax
	movq	-80(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	rgb_to_ycc
	movq	%rax, -16(%rbp)
	movl	-40(%rbp), %edx
	movl	-44(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	allocate_rgb_data
	movq	%rax, -96(%rbp)
	movq	%rdx, -88(%rbp)
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ycc_to_rgb
	movq	-96(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, (%rsp)
	movq	-40(%rbp), %rdx
	movq	%rdx, 8(%rsp)
	movq	-32(%rbp), %rdx
	movq	%rdx, 16(%rsp)
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rsp)
	movq	%rax, %rsi
	movl	$.LC2, %edi
	call	save_RGB_image
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
