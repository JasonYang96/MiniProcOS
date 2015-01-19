
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 d8 01 00 00       	call   1001f1 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 b0 9e 10 00       	mov    0x109eb0,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 50             	imul   $0x50,%edx,%eax
  1000a4:	83 b8 90 91 10 00 01 	cmpl   $0x1,0x109190(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 48 91 10 00       	add    $0x109148,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 51 03 00 00       	call   10040c <run>

001000bb <interrupt>:

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d b0 9e 10 00    	mov    0x109eb0,%ebx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 04             	cmp    $0x4,%eax
  1000e1:	0f 87 08 01 00 00    	ja     1001ef <interrupt+0x134>
  1000e7:	ff 24 85 c4 09 10 00 	jmp    *0x1009c4(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
		run(current);
  1000f0:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000f3:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	e9 8c 00 00 00       	jmp    100188 <interrupt+0xcd>
  1000fc:	b8 e0 91 10 00       	mov    $0x1091e0,%eax
  100101:	bd 01 00 00 00       	mov    $0x1,%ebp

	//find an empty process desciptor
	for (i = 1; i < NPROCS ; i++)
	{
		//empty process found
		if (proc_array[i].p_state == P_EMPTY)
  100106:	83 38 00             	cmpl   $0x0,(%eax)
  100109:	75 65                	jne    100170 <interrupt+0xb5>
		{
			proc_array[i].p_state = P_RUNNABLE;
  10010b:	6b c5 50             	imul   $0x50,%ebp,%eax
			proc_array[i].p_registers = parent->p_registers;
  10010e:	b9 11 00 00 00       	mov    $0x11,%ecx
  100113:	8d 73 04             	lea    0x4(%ebx),%esi
  100116:	8d 90 48 91 10 00    	lea    0x109148(%eax),%edx
  10011c:	8d 7a 04             	lea    0x4(%edx),%edi
  10011f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
			proc_array[i].p_registers.reg_eax = 0;
  100121:	8d 4c ad 00          	lea    0x0(%ebp,%ebp,4),%ecx
	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
	dest_stack_top = PROC1_STACK_ADDR + dest->p_pid * PROC_STACK_SIZE;
	dest_stack_bottom = dest_stack_top - difference;
  100125:	8b b0 48 91 10 00    	mov    0x109148(%eax),%esi
		//empty process found
		if (proc_array[i].p_state == P_EMPTY)
		{
			proc_array[i].p_state = P_RUNNABLE;
			proc_array[i].p_registers = parent->p_registers;
			proc_array[i].p_registers.reg_eax = 0;
  10012b:	c1 e1 04             	shl    $0x4,%ecx
  10012e:	c7 81 68 91 10 00 00 	movl   $0x0,0x109168(%ecx)
  100135:	00 00 00 
	// We have done one for you.

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
  100138:	8b 0b                	mov    (%ebx),%ecx
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
  10013a:	8b 7b 40             	mov    0x40(%ebx),%edi
	for (i = 1; i < NPROCS ; i++)
	{
		//empty process found
		if (proc_array[i].p_state == P_EMPTY)
		{
			proc_array[i].p_state = P_RUNNABLE;
  10013d:	c7 80 90 91 10 00 01 	movl   $0x1,0x109190(%eax)
  100144:	00 00 00 
	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
	dest_stack_top = PROC1_STACK_ADDR + dest->p_pid * PROC_STACK_SIZE;
	dest_stack_bottom = dest_stack_top - difference;
  100147:	83 c6 0a             	add    $0xa,%esi
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, difference);
  10014a:	50                   	push   %eax
	// We have done one for you.

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
  10014b:	83 c1 0a             	add    $0xa,%ecx
  10014e:	c1 e1 12             	shl    $0x12,%ecx
  100151:	29 f9                	sub    %edi,%ecx
	dest_stack_top = PROC1_STACK_ADDR + dest->p_pid * PROC_STACK_SIZE;
	dest_stack_bottom = dest_stack_top - difference;
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, difference);
  100153:	51                   	push   %ecx
	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
	dest_stack_top = PROC1_STACK_ADDR + dest->p_pid * PROC_STACK_SIZE;
	dest_stack_bottom = dest_stack_top - difference;
  100154:	c1 e6 12             	shl    $0x12,%esi
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, difference);
  100157:	57                   	push   %edi
	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR + src->p_pid * PROC_STACK_SIZE;
	src_stack_bottom = src->p_registers.reg_esp;
	uint32_t difference = src_stack_top - src_stack_bottom;
	dest_stack_top = PROC1_STACK_ADDR + dest->p_pid * PROC_STACK_SIZE;
	dest_stack_bottom = dest_stack_top - difference;
  100158:	29 ce                	sub    %ecx,%esi
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, difference);
  10015a:	56                   	push   %esi
  10015b:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  10015f:	e8 80 03 00 00       	call   1004e4 <memcpy>
	dest->p_registers.reg_esp = dest_stack_bottom;
  100164:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  100168:	83 c4 10             	add    $0x10,%esp
  10016b:	89 72 40             	mov    %esi,0x40(%edx)
  10016e:	eb 0c                	jmp    10017c <interrupt+0xc1>
	// Finally, return the child's process ID to the parent.

	int i;

	//find an empty process desciptor
	for (i = 1; i < NPROCS ; i++)
  100170:	45                   	inc    %ebp
  100171:	83 c0 50             	add    $0x50,%eax
  100174:	83 fd 10             	cmp    $0x10,%ebp
  100177:	75 8d                	jne    100106 <interrupt+0x4b>
  100179:	83 cd ff             	or     $0xffffffff,%ebp
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  10017c:	89 6b 20             	mov    %ebp,0x20(%ebx)
		run(current);
  10017f:	83 ec 0c             	sub    $0xc,%esp
  100182:	ff 35 b0 9e 10 00    	pushl  0x109eb0
  100188:	e8 7f 02 00 00       	call   10040c <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  10018d:	e8 fa fe ff ff       	call   10008c <schedule>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  100192:	a1 b0 9e 10 00       	mov    0x109eb0,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  100197:	8b 50 20             	mov    0x20(%eax),%edx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  10019a:	c7 40 48 03 00 00 00 	movl   $0x3,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  1001a1:	89 50 4c             	mov    %edx,0x4c(%eax)
		schedule();
  1001a4:	e8 e3 fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001a9:	a1 b0 9e 10 00       	mov    0x109eb0,%eax
  1001ae:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001b1:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001b4:	83 f9 0e             	cmp    $0xe,%ecx
  1001b7:	77 11                	ja     1001ca <interrupt+0x10f>
  1001b9:	3b 10                	cmp    (%eax),%edx
  1001bb:	74 0d                	je     1001ca <interrupt+0x10f>
		    || proc_array[p].p_state == P_EMPTY)
  1001bd:	6b d2 50             	imul   $0x50,%edx,%edx
  1001c0:	8b 8a 90 91 10 00    	mov    0x109190(%edx),%ecx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001c6:	85 c9                	test   %ecx,%ecx
  1001c8:	75 09                	jne    1001d3 <interrupt+0x118>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001ca:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001d1:	eb 17                	jmp    1001ea <interrupt+0x12f>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  1001d3:	83 f9 03             	cmp    $0x3,%ecx
  1001d6:	75 0b                	jne    1001e3 <interrupt+0x128>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1001d8:	8b 92 94 91 10 00    	mov    0x109194(%edx),%edx
  1001de:	89 50 20             	mov    %edx,0x20(%eax)
  1001e1:	eb 07                	jmp    1001ea <interrupt+0x12f>
		else
			current->p_registers.reg_eax = WAIT_TRYAGAIN;
  1001e3:	c7 40 20 fe ff ff ff 	movl   $0xfffffffe,0x20(%eax)
		schedule();
  1001ea:	e8 9d fe ff ff       	call   10008c <schedule>
  1001ef:	eb fe                	jmp    1001ef <interrupt+0x134>

001001f1 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  1001f1:	53                   	push   %ebx
  1001f2:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  1001f5:	68 00 05 00 00       	push   $0x500
  1001fa:	6a 00                	push   $0x0
  1001fc:	68 48 91 10 00       	push   $0x109148
  100201:	e8 42 03 00 00       	call   100548 <memset>
  100206:	ba 48 91 10 00       	mov    $0x109148,%edx
  10020b:	31 c0                	xor    %eax,%eax
  10020d:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100210:	89 02                	mov    %eax,(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100212:	40                   	inc    %eax
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  100213:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  10021a:	83 c2 50             	add    $0x50,%edx
  10021d:	83 f8 10             	cmp    $0x10,%eax
  100220:	75 ee                	jne    100210 <start+0x1f>
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  100222:	c7 05 b0 9e 10 00 98 	movl   $0x109198,0x109eb0
  100229:	91 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  10022c:	e8 73 00 00 00       	call   1002a4 <segments_init>
	special_registers_init(current);
  100231:	83 ec 0c             	sub    $0xc,%esp
  100234:	ff 35 b0 9e 10 00    	pushl  0x109eb0
  10023a:	e8 e4 01 00 00       	call   100423 <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  10023f:	e8 2f 01 00 00       	call   100373 <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  100244:	83 c4 0c             	add    $0xc,%esp
  100247:	68 d8 09 10 00       	push   $0x1009d8
  10024c:	68 00 07 00 00       	push   $0x700
  100251:	ff 35 00 00 06 00    	pushl  0x60000
  100257:	e8 4e 07 00 00       	call   1009aa <console_printf>
  10025c:	83 c4 10             	add    $0x10,%esp
  10025f:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  100264:	e8 4d 01 00 00       	call   1003b6 <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  100269:	8d 58 ff             	lea    -0x1(%eax),%ebx
  10026c:	83 fb 01             	cmp    $0x1,%ebx
  10026f:	77 f3                	ja     100264 <start+0x73>
	console_clear();
  100271:	e8 fd 00 00 00       	call   100373 <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  100276:	a1 b0 9e 10 00       	mov    0x109eb0,%eax
  10027b:	83 c0 34             	add    $0x34,%eax
  10027e:	52                   	push   %edx
  10027f:	52                   	push   %edx
  100280:	50                   	push   %eax
  100281:	53                   	push   %ebx
  100282:	e8 d1 01 00 00       	call   100458 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  100287:	a1 b0 9e 10 00       	mov    0x109eb0,%eax
  10028c:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  100293:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  10029a:	89 04 24             	mov    %eax,(%esp)
  10029d:	e8 6a 01 00 00       	call   10040c <run>
  1002a2:	90                   	nop
  1002a3:	90                   	nop

001002a4 <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002a4:	b8 48 96 10 00       	mov    $0x109648,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002a9:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002ae:	89 c2                	mov    %eax,%edx
  1002b0:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  1002b3:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002b4:	bb 56 00 10 00       	mov    $0x100056,%ebx
  1002b9:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002bc:	66 a3 76 1a 10 00    	mov    %ax,0x101a76
  1002c2:	c1 e8 18             	shr    $0x18,%eax
  1002c5:	88 15 78 1a 10 00    	mov    %dl,0x101a78
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002cb:	ba b0 96 10 00       	mov    $0x1096b0,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002d0:	a2 7b 1a 10 00       	mov    %al,0x101a7b
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002d5:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002d7:	66 c7 05 74 1a 10 00 	movw   $0x68,0x101a74
  1002de:	68 00 
  1002e0:	c6 05 7a 1a 10 00 40 	movb   $0x40,0x101a7a
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  1002e7:	c6 05 79 1a 10 00 89 	movb   $0x89,0x101a79

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  1002ee:	c7 05 4c 96 10 00 00 	movl   $0x80000,0x10964c
  1002f5:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  1002f8:	66 c7 05 50 96 10 00 	movw   $0x10,0x109650
  1002ff:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100301:	66 89 0c c5 b0 96 10 	mov    %cx,0x1096b0(,%eax,8)
  100308:	00 
  100309:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100310:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100315:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  10031a:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  10031f:	40                   	inc    %eax
  100320:	3d 00 01 00 00       	cmp    $0x100,%eax
  100325:	75 da                	jne    100301 <segments_init+0x5d>
  100327:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  10032b:	ba b0 96 10 00       	mov    $0x1096b0,%edx
  100330:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  100337:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  10033e:	66 89 0c c5 b0 96 10 	mov    %cx,0x1096b0(,%eax,8)
  100345:	00 
  100346:	c1 e9 10             	shr    $0x10,%ecx
  100349:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10034e:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  100353:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100358:	40                   	inc    %eax
  100359:	83 f8 3a             	cmp    $0x3a,%eax
  10035c:	75 d2                	jne    100330 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  10035e:	b0 28                	mov    $0x28,%al
  100360:	0f 01 15 3c 1a 10 00 	lgdtl  0x101a3c
  100367:	0f 00 d8             	ltr    %ax
  10036a:	0f 01 1d 44 1a 10 00 	lidtl  0x101a44
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  100371:	5b                   	pop    %ebx
  100372:	c3                   	ret    

00100373 <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  100373:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100374:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  100376:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100377:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  10037e:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  100381:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  100388:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  10038b:	40                   	inc    %eax
  10038c:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100391:	75 ee                	jne    100381 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100393:	be d4 03 00 00       	mov    $0x3d4,%esi
  100398:	b0 0e                	mov    $0xe,%al
  10039a:	89 f2                	mov    %esi,%edx
  10039c:	ee                   	out    %al,(%dx)
  10039d:	31 c9                	xor    %ecx,%ecx
  10039f:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1003a4:	88 c8                	mov    %cl,%al
  1003a6:	89 da                	mov    %ebx,%edx
  1003a8:	ee                   	out    %al,(%dx)
  1003a9:	b0 0f                	mov    $0xf,%al
  1003ab:	89 f2                	mov    %esi,%edx
  1003ad:	ee                   	out    %al,(%dx)
  1003ae:	88 c8                	mov    %cl,%al
  1003b0:	89 da                	mov    %ebx,%edx
  1003b2:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  1003b3:	5b                   	pop    %ebx
  1003b4:	5e                   	pop    %esi
  1003b5:	c3                   	ret    

001003b6 <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1003b6:	ba 64 00 00 00       	mov    $0x64,%edx
  1003bb:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  1003bc:	a8 01                	test   $0x1,%al
  1003be:	74 45                	je     100405 <console_read_digit+0x4f>
  1003c0:	b2 60                	mov    $0x60,%dl
  1003c2:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  1003c3:	8d 50 fe             	lea    -0x2(%eax),%edx
  1003c6:	80 fa 08             	cmp    $0x8,%dl
  1003c9:	77 05                	ja     1003d0 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  1003cb:	0f b6 c0             	movzbl %al,%eax
  1003ce:	48                   	dec    %eax
  1003cf:	c3                   	ret    
	else if (data == 0x0B)
  1003d0:	3c 0b                	cmp    $0xb,%al
  1003d2:	74 35                	je     100409 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  1003d4:	8d 50 b9             	lea    -0x47(%eax),%edx
  1003d7:	80 fa 02             	cmp    $0x2,%dl
  1003da:	77 07                	ja     1003e3 <console_read_digit+0x2d>
		return data - 0x47 + 7;
  1003dc:	0f b6 c0             	movzbl %al,%eax
  1003df:	83 e8 40             	sub    $0x40,%eax
  1003e2:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  1003e3:	8d 50 b5             	lea    -0x4b(%eax),%edx
  1003e6:	80 fa 02             	cmp    $0x2,%dl
  1003e9:	77 07                	ja     1003f2 <console_read_digit+0x3c>
		return data - 0x4B + 4;
  1003eb:	0f b6 c0             	movzbl %al,%eax
  1003ee:	83 e8 47             	sub    $0x47,%eax
  1003f1:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  1003f2:	8d 50 b1             	lea    -0x4f(%eax),%edx
  1003f5:	80 fa 02             	cmp    $0x2,%dl
  1003f8:	77 07                	ja     100401 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  1003fa:	0f b6 c0             	movzbl %al,%eax
  1003fd:	83 e8 4e             	sub    $0x4e,%eax
  100400:	c3                   	ret    
	else if (data == 0x53)
  100401:	3c 53                	cmp    $0x53,%al
  100403:	74 04                	je     100409 <console_read_digit+0x53>
  100405:	83 c8 ff             	or     $0xffffffff,%eax
  100408:	c3                   	ret    
  100409:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  10040b:	c3                   	ret    

0010040c <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  10040c:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100410:	a3 b0 9e 10 00       	mov    %eax,0x109eb0

	asm volatile("movl %0,%%esp\n\t"
  100415:	83 c0 04             	add    $0x4,%eax
  100418:	89 c4                	mov    %eax,%esp
  10041a:	61                   	popa   
  10041b:	07                   	pop    %es
  10041c:	1f                   	pop    %ds
  10041d:	83 c4 08             	add    $0x8,%esp
  100420:	cf                   	iret   
  100421:	eb fe                	jmp    100421 <run+0x15>

00100423 <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  100423:	53                   	push   %ebx
  100424:	83 ec 0c             	sub    $0xc,%esp
  100427:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  10042b:	6a 44                	push   $0x44
  10042d:	6a 00                	push   $0x0
  10042f:	8d 43 04             	lea    0x4(%ebx),%eax
  100432:	50                   	push   %eax
  100433:	e8 10 01 00 00       	call   100548 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100438:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  10043e:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  100444:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  10044a:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  100450:	83 c4 18             	add    $0x18,%esp
  100453:	5b                   	pop    %ebx
  100454:	c3                   	ret    
  100455:	90                   	nop
  100456:	90                   	nop
  100457:	90                   	nop

00100458 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100458:	55                   	push   %ebp
  100459:	57                   	push   %edi
  10045a:	56                   	push   %esi
  10045b:	53                   	push   %ebx
  10045c:	83 ec 1c             	sub    $0x1c,%esp
  10045f:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  100463:	83 f8 01             	cmp    $0x1,%eax
  100466:	7f 04                	jg     10046c <program_loader+0x14>
  100468:	85 c0                	test   %eax,%eax
  10046a:	79 02                	jns    10046e <program_loader+0x16>
  10046c:	eb fe                	jmp    10046c <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  10046e:	8b 34 c5 7c 1a 10 00 	mov    0x101a7c(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  100475:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  10047b:	74 02                	je     10047f <program_loader+0x27>
  10047d:	eb fe                	jmp    10047d <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  10047f:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  100482:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  100486:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  100488:	c1 e5 05             	shl    $0x5,%ebp
  10048b:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  10048e:	eb 3f                	jmp    1004cf <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  100490:	83 3b 01             	cmpl   $0x1,(%ebx)
  100493:	75 37                	jne    1004cc <program_loader+0x74>
			copyseg((void *) ph->p_va,
  100495:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100498:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  10049b:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  10049e:	01 c7                	add    %eax,%edi
	memsz += va;
  1004a0:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  1004a2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  1004a7:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  1004ab:	52                   	push   %edx
  1004ac:	89 fa                	mov    %edi,%edx
  1004ae:	29 c2                	sub    %eax,%edx
  1004b0:	52                   	push   %edx
  1004b1:	8b 53 04             	mov    0x4(%ebx),%edx
  1004b4:	01 f2                	add    %esi,%edx
  1004b6:	52                   	push   %edx
  1004b7:	50                   	push   %eax
  1004b8:	e8 27 00 00 00       	call   1004e4 <memcpy>
  1004bd:	83 c4 10             	add    $0x10,%esp
  1004c0:	eb 04                	jmp    1004c6 <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  1004c2:	c6 07 00             	movb   $0x0,(%edi)
  1004c5:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1004c6:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  1004ca:	72 f6                	jb     1004c2 <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  1004cc:	83 c3 20             	add    $0x20,%ebx
  1004cf:	39 eb                	cmp    %ebp,%ebx
  1004d1:	72 bd                	jb     100490 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  1004d3:	8b 56 18             	mov    0x18(%esi),%edx
  1004d6:	8b 44 24 34          	mov    0x34(%esp),%eax
  1004da:	89 10                	mov    %edx,(%eax)
}
  1004dc:	83 c4 1c             	add    $0x1c,%esp
  1004df:	5b                   	pop    %ebx
  1004e0:	5e                   	pop    %esi
  1004e1:	5f                   	pop    %edi
  1004e2:	5d                   	pop    %ebp
  1004e3:	c3                   	ret    

001004e4 <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  1004e4:	56                   	push   %esi
  1004e5:	31 d2                	xor    %edx,%edx
  1004e7:	53                   	push   %ebx
  1004e8:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1004ec:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1004f0:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1004f4:	eb 08                	jmp    1004fe <memcpy+0x1a>
		*d++ = *s++;
  1004f6:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  1004f9:	4e                   	dec    %esi
  1004fa:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1004fd:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1004fe:	85 f6                	test   %esi,%esi
  100500:	75 f4                	jne    1004f6 <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  100502:	5b                   	pop    %ebx
  100503:	5e                   	pop    %esi
  100504:	c3                   	ret    

00100505 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  100505:	57                   	push   %edi
  100506:	56                   	push   %esi
  100507:	53                   	push   %ebx
  100508:	8b 44 24 10          	mov    0x10(%esp),%eax
  10050c:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100510:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  100514:	39 c7                	cmp    %eax,%edi
  100516:	73 26                	jae    10053e <memmove+0x39>
  100518:	8d 34 17             	lea    (%edi,%edx,1),%esi
  10051b:	39 c6                	cmp    %eax,%esi
  10051d:	76 1f                	jbe    10053e <memmove+0x39>
		s += n, d += n;
  10051f:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  100522:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  100524:	eb 07                	jmp    10052d <memmove+0x28>
			*--d = *--s;
  100526:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100529:	4a                   	dec    %edx
  10052a:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  10052d:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  10052e:	85 d2                	test   %edx,%edx
  100530:	75 f4                	jne    100526 <memmove+0x21>
  100532:	eb 10                	jmp    100544 <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  100534:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  100537:	4a                   	dec    %edx
  100538:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  10053b:	41                   	inc    %ecx
  10053c:	eb 02                	jmp    100540 <memmove+0x3b>
  10053e:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  100540:	85 d2                	test   %edx,%edx
  100542:	75 f0                	jne    100534 <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  100544:	5b                   	pop    %ebx
  100545:	5e                   	pop    %esi
  100546:	5f                   	pop    %edi
  100547:	c3                   	ret    

00100548 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100548:	53                   	push   %ebx
  100549:	8b 44 24 08          	mov    0x8(%esp),%eax
  10054d:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  100551:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  100555:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  100557:	eb 04                	jmp    10055d <memset+0x15>
		*p++ = c;
  100559:	88 1a                	mov    %bl,(%edx)
  10055b:	49                   	dec    %ecx
  10055c:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  10055d:	85 c9                	test   %ecx,%ecx
  10055f:	75 f8                	jne    100559 <memset+0x11>
		*p++ = c;
	return v;
}
  100561:	5b                   	pop    %ebx
  100562:	c3                   	ret    

00100563 <strlen>:

size_t
strlen(const char *s)
{
  100563:	8b 54 24 04          	mov    0x4(%esp),%edx
  100567:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100569:	eb 01                	jmp    10056c <strlen+0x9>
		++n;
  10056b:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  10056c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  100570:	75 f9                	jne    10056b <strlen+0x8>
		++n;
	return n;
}
  100572:	c3                   	ret    

00100573 <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  100573:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  100577:	31 c0                	xor    %eax,%eax
  100579:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  10057d:	eb 01                	jmp    100580 <strnlen+0xd>
		++n;
  10057f:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100580:	39 d0                	cmp    %edx,%eax
  100582:	74 06                	je     10058a <strnlen+0x17>
  100584:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  100588:	75 f5                	jne    10057f <strnlen+0xc>
		++n;
	return n;
}
  10058a:	c3                   	ret    

0010058b <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  10058b:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  10058c:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100591:	53                   	push   %ebx
  100592:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  100594:	76 05                	jbe    10059b <console_putc+0x10>
  100596:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  10059b:	80 fa 0a             	cmp    $0xa,%dl
  10059e:	75 2c                	jne    1005cc <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005a0:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  1005a6:	be 50 00 00 00       	mov    $0x50,%esi
  1005ab:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  1005ad:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005b0:	99                   	cltd   
  1005b1:	f7 fe                	idiv   %esi
  1005b3:	89 de                	mov    %ebx,%esi
  1005b5:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  1005b7:	eb 07                	jmp    1005c0 <console_putc+0x35>
			*cursor++ = ' ' | color;
  1005b9:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005bc:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  1005bd:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005c0:	83 f8 50             	cmp    $0x50,%eax
  1005c3:	75 f4                	jne    1005b9 <console_putc+0x2e>
  1005c5:	29 d0                	sub    %edx,%eax
  1005c7:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  1005ca:	eb 0b                	jmp    1005d7 <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  1005cc:	0f b6 d2             	movzbl %dl,%edx
  1005cf:	09 ca                	or     %ecx,%edx
  1005d1:	66 89 13             	mov    %dx,(%ebx)
  1005d4:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  1005d7:	5b                   	pop    %ebx
  1005d8:	5e                   	pop    %esi
  1005d9:	c3                   	ret    

001005da <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  1005da:	56                   	push   %esi
  1005db:	53                   	push   %ebx
  1005dc:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  1005e0:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1005e3:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  1005e7:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  1005ec:	75 04                	jne    1005f2 <fill_numbuf+0x18>
  1005ee:	85 d2                	test   %edx,%edx
  1005f0:	74 10                	je     100602 <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  1005f2:	89 d0                	mov    %edx,%eax
  1005f4:	31 d2                	xor    %edx,%edx
  1005f6:	f7 f1                	div    %ecx
  1005f8:	4b                   	dec    %ebx
  1005f9:	8a 14 16             	mov    (%esi,%edx,1),%dl
  1005fc:	88 13                	mov    %dl,(%ebx)
			val /= base;
  1005fe:	89 c2                	mov    %eax,%edx
  100600:	eb ec                	jmp    1005ee <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  100602:	89 d8                	mov    %ebx,%eax
  100604:	5b                   	pop    %ebx
  100605:	5e                   	pop    %esi
  100606:	c3                   	ret    

00100607 <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  100607:	55                   	push   %ebp
  100608:	57                   	push   %edi
  100609:	56                   	push   %esi
  10060a:	53                   	push   %ebx
  10060b:	83 ec 38             	sub    $0x38,%esp
  10060e:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  100612:	8b 7c 24 54          	mov    0x54(%esp),%edi
  100616:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10061a:	e9 60 03 00 00       	jmp    10097f <console_vprintf+0x378>
		if (*format != '%') {
  10061f:	80 fa 25             	cmp    $0x25,%dl
  100622:	74 13                	je     100637 <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  100624:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100628:	0f b6 d2             	movzbl %dl,%edx
  10062b:	89 f0                	mov    %esi,%eax
  10062d:	e8 59 ff ff ff       	call   10058b <console_putc>
  100632:	e9 45 03 00 00       	jmp    10097c <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100637:	47                   	inc    %edi
  100638:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  10063f:	00 
  100640:	eb 12                	jmp    100654 <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  100642:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  100643:	8a 11                	mov    (%ecx),%dl
  100645:	84 d2                	test   %dl,%dl
  100647:	74 1a                	je     100663 <console_vprintf+0x5c>
  100649:	89 e8                	mov    %ebp,%eax
  10064b:	38 c2                	cmp    %al,%dl
  10064d:	75 f3                	jne    100642 <console_vprintf+0x3b>
  10064f:	e9 3f 03 00 00       	jmp    100993 <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100654:	8a 17                	mov    (%edi),%dl
  100656:	84 d2                	test   %dl,%dl
  100658:	74 0b                	je     100665 <console_vprintf+0x5e>
  10065a:	b9 0c 0a 10 00       	mov    $0x100a0c,%ecx
  10065f:	89 d5                	mov    %edx,%ebp
  100661:	eb e0                	jmp    100643 <console_vprintf+0x3c>
  100663:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  100665:	8d 42 cf             	lea    -0x31(%edx),%eax
  100668:	3c 08                	cmp    $0x8,%al
  10066a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  100671:	00 
  100672:	76 13                	jbe    100687 <console_vprintf+0x80>
  100674:	eb 1d                	jmp    100693 <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  100676:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  10067b:	0f be c0             	movsbl %al,%eax
  10067e:	47                   	inc    %edi
  10067f:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  100683:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  100687:	8a 07                	mov    (%edi),%al
  100689:	8d 50 d0             	lea    -0x30(%eax),%edx
  10068c:	80 fa 09             	cmp    $0x9,%dl
  10068f:	76 e5                	jbe    100676 <console_vprintf+0x6f>
  100691:	eb 18                	jmp    1006ab <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  100693:	80 fa 2a             	cmp    $0x2a,%dl
  100696:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  10069d:	ff 
  10069e:	75 0b                	jne    1006ab <console_vprintf+0xa4>
			width = va_arg(val, int);
  1006a0:	83 c3 04             	add    $0x4,%ebx
			++format;
  1006a3:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  1006a4:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1006a7:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  1006ab:	83 cd ff             	or     $0xffffffff,%ebp
  1006ae:	80 3f 2e             	cmpb   $0x2e,(%edi)
  1006b1:	75 37                	jne    1006ea <console_vprintf+0xe3>
			++format;
  1006b3:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  1006b4:	31 ed                	xor    %ebp,%ebp
  1006b6:	8a 07                	mov    (%edi),%al
  1006b8:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006bb:	80 fa 09             	cmp    $0x9,%dl
  1006be:	76 0d                	jbe    1006cd <console_vprintf+0xc6>
  1006c0:	eb 17                	jmp    1006d9 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  1006c2:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1006c5:	0f be c0             	movsbl %al,%eax
  1006c8:	47                   	inc    %edi
  1006c9:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  1006cd:	8a 07                	mov    (%edi),%al
  1006cf:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006d2:	80 fa 09             	cmp    $0x9,%dl
  1006d5:	76 eb                	jbe    1006c2 <console_vprintf+0xbb>
  1006d7:	eb 11                	jmp    1006ea <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  1006d9:	3c 2a                	cmp    $0x2a,%al
  1006db:	75 0b                	jne    1006e8 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  1006dd:	83 c3 04             	add    $0x4,%ebx
				++format;
  1006e0:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  1006e1:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  1006e4:	85 ed                	test   %ebp,%ebp
  1006e6:	79 02                	jns    1006ea <console_vprintf+0xe3>
  1006e8:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  1006ea:	8a 07                	mov    (%edi),%al
  1006ec:	3c 64                	cmp    $0x64,%al
  1006ee:	74 34                	je     100724 <console_vprintf+0x11d>
  1006f0:	7f 1d                	jg     10070f <console_vprintf+0x108>
  1006f2:	3c 58                	cmp    $0x58,%al
  1006f4:	0f 84 a2 00 00 00    	je     10079c <console_vprintf+0x195>
  1006fa:	3c 63                	cmp    $0x63,%al
  1006fc:	0f 84 bf 00 00 00    	je     1007c1 <console_vprintf+0x1ba>
  100702:	3c 43                	cmp    $0x43,%al
  100704:	0f 85 d0 00 00 00    	jne    1007da <console_vprintf+0x1d3>
  10070a:	e9 a3 00 00 00       	jmp    1007b2 <console_vprintf+0x1ab>
  10070f:	3c 75                	cmp    $0x75,%al
  100711:	74 4d                	je     100760 <console_vprintf+0x159>
  100713:	3c 78                	cmp    $0x78,%al
  100715:	74 5c                	je     100773 <console_vprintf+0x16c>
  100717:	3c 73                	cmp    $0x73,%al
  100719:	0f 85 bb 00 00 00    	jne    1007da <console_vprintf+0x1d3>
  10071f:	e9 86 00 00 00       	jmp    1007aa <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  100724:	83 c3 04             	add    $0x4,%ebx
  100727:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  10072a:	89 d1                	mov    %edx,%ecx
  10072c:	c1 f9 1f             	sar    $0x1f,%ecx
  10072f:	89 0c 24             	mov    %ecx,(%esp)
  100732:	31 ca                	xor    %ecx,%edx
  100734:	55                   	push   %ebp
  100735:	29 ca                	sub    %ecx,%edx
  100737:	68 14 0a 10 00       	push   $0x100a14
  10073c:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100741:	8d 44 24 40          	lea    0x40(%esp),%eax
  100745:	e8 90 fe ff ff       	call   1005da <fill_numbuf>
  10074a:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  10074e:	58                   	pop    %eax
  10074f:	5a                   	pop    %edx
  100750:	ba 01 00 00 00       	mov    $0x1,%edx
  100755:	8b 04 24             	mov    (%esp),%eax
  100758:	83 e0 01             	and    $0x1,%eax
  10075b:	e9 a5 00 00 00       	jmp    100805 <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  100760:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  100763:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100768:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10076b:	55                   	push   %ebp
  10076c:	68 14 0a 10 00       	push   $0x100a14
  100771:	eb 11                	jmp    100784 <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  100773:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  100776:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100779:	55                   	push   %ebp
  10077a:	68 28 0a 10 00       	push   $0x100a28
  10077f:	b9 10 00 00 00       	mov    $0x10,%ecx
  100784:	8d 44 24 40          	lea    0x40(%esp),%eax
  100788:	e8 4d fe ff ff       	call   1005da <fill_numbuf>
  10078d:	ba 01 00 00 00       	mov    $0x1,%edx
  100792:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100796:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  100798:	59                   	pop    %ecx
  100799:	59                   	pop    %ecx
  10079a:	eb 69                	jmp    100805 <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  10079c:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  10079f:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007a2:	55                   	push   %ebp
  1007a3:	68 14 0a 10 00       	push   $0x100a14
  1007a8:	eb d5                	jmp    10077f <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  1007aa:	83 c3 04             	add    $0x4,%ebx
  1007ad:	8b 43 fc             	mov    -0x4(%ebx),%eax
  1007b0:	eb 40                	jmp    1007f2 <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  1007b2:	83 c3 04             	add    $0x4,%ebx
  1007b5:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007b8:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  1007bc:	e9 bd 01 00 00       	jmp    10097e <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007c1:	83 c3 04             	add    $0x4,%ebx
  1007c4:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1007c7:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  1007cb:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  1007d0:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007d4:	88 44 24 24          	mov    %al,0x24(%esp)
  1007d8:	eb 27                	jmp    100801 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  1007da:	84 c0                	test   %al,%al
  1007dc:	75 02                	jne    1007e0 <console_vprintf+0x1d9>
  1007de:	b0 25                	mov    $0x25,%al
  1007e0:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  1007e4:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  1007e9:	80 3f 00             	cmpb   $0x0,(%edi)
  1007ec:	74 0a                	je     1007f8 <console_vprintf+0x1f1>
  1007ee:	8d 44 24 24          	lea    0x24(%esp),%eax
  1007f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007f6:	eb 09                	jmp    100801 <console_vprintf+0x1fa>
				format--;
  1007f8:	8d 54 24 24          	lea    0x24(%esp),%edx
  1007fc:	4f                   	dec    %edi
  1007fd:	89 54 24 04          	mov    %edx,0x4(%esp)
  100801:	31 d2                	xor    %edx,%edx
  100803:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100805:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  100807:	83 fd ff             	cmp    $0xffffffff,%ebp
  10080a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100811:	74 1f                	je     100832 <console_vprintf+0x22b>
  100813:	89 04 24             	mov    %eax,(%esp)
  100816:	eb 01                	jmp    100819 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100818:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100819:	39 e9                	cmp    %ebp,%ecx
  10081b:	74 0a                	je     100827 <console_vprintf+0x220>
  10081d:	8b 44 24 04          	mov    0x4(%esp),%eax
  100821:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  100825:	75 f1                	jne    100818 <console_vprintf+0x211>
  100827:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10082a:	89 0c 24             	mov    %ecx,(%esp)
  10082d:	eb 1f                	jmp    10084e <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  10082f:	42                   	inc    %edx
  100830:	eb 09                	jmp    10083b <console_vprintf+0x234>
  100832:	89 d1                	mov    %edx,%ecx
  100834:	8b 14 24             	mov    (%esp),%edx
  100837:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  10083b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10083f:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  100843:	75 ea                	jne    10082f <console_vprintf+0x228>
  100845:	8b 44 24 08          	mov    0x8(%esp),%eax
  100849:	89 14 24             	mov    %edx,(%esp)
  10084c:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  10084e:	85 c0                	test   %eax,%eax
  100850:	74 0c                	je     10085e <console_vprintf+0x257>
  100852:	84 d2                	test   %dl,%dl
  100854:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  10085b:	00 
  10085c:	75 24                	jne    100882 <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  10085e:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  100863:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  10086a:	00 
  10086b:	75 15                	jne    100882 <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  10086d:	8b 44 24 14          	mov    0x14(%esp),%eax
  100871:	83 e0 08             	and    $0x8,%eax
  100874:	83 f8 01             	cmp    $0x1,%eax
  100877:	19 c9                	sbb    %ecx,%ecx
  100879:	f7 d1                	not    %ecx
  10087b:	83 e1 20             	and    $0x20,%ecx
  10087e:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  100882:	3b 2c 24             	cmp    (%esp),%ebp
  100885:	7e 0d                	jle    100894 <console_vprintf+0x28d>
  100887:	84 d2                	test   %dl,%dl
  100889:	74 40                	je     1008cb <console_vprintf+0x2c4>
			zeros = precision - len;
  10088b:	2b 2c 24             	sub    (%esp),%ebp
  10088e:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  100892:	eb 3f                	jmp    1008d3 <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100894:	84 d2                	test   %dl,%dl
  100896:	74 33                	je     1008cb <console_vprintf+0x2c4>
  100898:	8b 44 24 14          	mov    0x14(%esp),%eax
  10089c:	83 e0 06             	and    $0x6,%eax
  10089f:	83 f8 02             	cmp    $0x2,%eax
  1008a2:	75 27                	jne    1008cb <console_vprintf+0x2c4>
  1008a4:	45                   	inc    %ebp
  1008a5:	75 24                	jne    1008cb <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008a7:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008a9:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008ac:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008b1:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008b4:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  1008b7:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  1008bb:	7d 0e                	jge    1008cb <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  1008bd:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1008c1:	29 ca                	sub    %ecx,%edx
  1008c3:	29 c2                	sub    %eax,%edx
  1008c5:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008c9:	eb 08                	jmp    1008d3 <console_vprintf+0x2cc>
  1008cb:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1008d2:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008d3:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1008d7:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008d9:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008dd:	2b 2c 24             	sub    (%esp),%ebp
  1008e0:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008e5:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008e8:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008eb:	29 c5                	sub    %eax,%ebp
  1008ed:	89 f0                	mov    %esi,%eax
  1008ef:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008f3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1008f7:	eb 0f                	jmp    100908 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  1008f9:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1008fd:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100902:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100903:	e8 83 fc ff ff       	call   10058b <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100908:	85 ed                	test   %ebp,%ebp
  10090a:	7e 07                	jle    100913 <console_vprintf+0x30c>
  10090c:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100911:	74 e6                	je     1008f9 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  100913:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100918:	89 c6                	mov    %eax,%esi
  10091a:	74 23                	je     10093f <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  10091c:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100921:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100925:	e8 61 fc ff ff       	call   10058b <console_putc>
  10092a:	89 c6                	mov    %eax,%esi
  10092c:	eb 11                	jmp    10093f <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  10092e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100932:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100937:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100938:	e8 4e fc ff ff       	call   10058b <console_putc>
  10093d:	eb 06                	jmp    100945 <console_vprintf+0x33e>
  10093f:	89 f0                	mov    %esi,%eax
  100941:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100945:	85 f6                	test   %esi,%esi
  100947:	7f e5                	jg     10092e <console_vprintf+0x327>
  100949:	8b 34 24             	mov    (%esp),%esi
  10094c:	eb 15                	jmp    100963 <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  10094e:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  100952:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  100953:	0f b6 11             	movzbl (%ecx),%edx
  100956:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10095a:	e8 2c fc ff ff       	call   10058b <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10095f:	ff 44 24 04          	incl   0x4(%esp)
  100963:	85 f6                	test   %esi,%esi
  100965:	7f e7                	jg     10094e <console_vprintf+0x347>
  100967:	eb 0f                	jmp    100978 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  100969:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10096d:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100972:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100973:	e8 13 fc ff ff       	call   10058b <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100978:	85 ed                	test   %ebp,%ebp
  10097a:	7f ed                	jg     100969 <console_vprintf+0x362>
  10097c:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10097e:	47                   	inc    %edi
  10097f:	8a 17                	mov    (%edi),%dl
  100981:	84 d2                	test   %dl,%dl
  100983:	0f 85 96 fc ff ff    	jne    10061f <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  100989:	83 c4 38             	add    $0x38,%esp
  10098c:	89 f0                	mov    %esi,%eax
  10098e:	5b                   	pop    %ebx
  10098f:	5e                   	pop    %esi
  100990:	5f                   	pop    %edi
  100991:	5d                   	pop    %ebp
  100992:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100993:	81 e9 0c 0a 10 00    	sub    $0x100a0c,%ecx
  100999:	b8 01 00 00 00       	mov    $0x1,%eax
  10099e:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1009a0:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009a1:	09 44 24 14          	or     %eax,0x14(%esp)
  1009a5:	e9 aa fc ff ff       	jmp    100654 <console_vprintf+0x4d>

001009aa <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  1009aa:	8d 44 24 10          	lea    0x10(%esp),%eax
  1009ae:	50                   	push   %eax
  1009af:	ff 74 24 10          	pushl  0x10(%esp)
  1009b3:	ff 74 24 10          	pushl  0x10(%esp)
  1009b7:	ff 74 24 10          	pushl  0x10(%esp)
  1009bb:	e8 47 fc ff ff       	call   100607 <console_vprintf>
  1009c0:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  1009c3:	c3                   	ret    
