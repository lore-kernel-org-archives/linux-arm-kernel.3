Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 01:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4MRDXNkx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMw0lvZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HKpTgsAdietgImbWPM33Hs3sIvDzrbl29q+l/XmMzoc=; b=4MRDXNkxZANLl4qqdqD7cNNOta
	ISzrEwc6O7boYiukzSkzI8J4I1yc31WCKM/m/PSiOM0Uk1LY1h2FMqE76g1QoV9/j7lITVCUodEh0
	XIiaEflsw/En6UQc2nSn45YKmjbtn65Jz40drYmUOuhFMjy5zAHA1du4esww7Ggd1uX3qC7OmUQar
	XvJWJu4yCCyjInUjHJUAFypULPRgi4Rc8sXO00YHs7aDapjJFTD1acOVMDNXlfXNb9VxMcf+YVb/V
	99X1+rwWbWUSd5DUjUapImpRiZsQbokkaTDfMwk9Me4D/e9im2Pn7c4IA7OglKOxIJQv/SW/tN4aj
	aY9Rlycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNKPK-0000000DnbF-1re7;
	Sun, 01 Nov 2026 01:30:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNKPH-0000000Dnar-36tM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 01:30:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1188755a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 18:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793496646; x=1794101446; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HKpTgsAdietgImbWPM33Hs3sIvDzrbl29q+l/XmMzoc=;
        b=UMw0lvZFogDYXjLeope9tNQvLMQ2BDUBKuVOspdZs0tCMQCdxZq1+EXAxpQ8Qy4xXH
         EIiu7aKwlG86vuI5q3v39uFWdutURchTQWtoM94DVH+xCsytz5i0IroIKO+WkdUVNlEq
         D6QfUHPncEtQuf0i3ci7uUJn7jpuSVMzSwCA5C/Cd8Omp96Qa1QdyXrWJq5SzFAW7Sf8
         7CJHncUIfAp/PyDbgveIGzRgwgCXHqjRJ6U6mAMz4g7EfTalnORLbWfIjRyGQI3AMA8E
         j62pXVO8EYLAeGNhLZhFjv2e6aUtnJEx4VJey9fET6AMy2GExsmW7uxfIGk2LN1MVj26
         NPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496646; x=1794101446;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKpTgsAdietgImbWPM33Hs3sIvDzrbl29q+l/XmMzoc=;
        b=kaZng7xKalMkLlGk6ccBEFL5FCo5y8XkBRtGbZMks2m0kh9mqOwIDymSlvqNxmbLKr
         YpxqewaxVrWZdgkrh22HZHpzZ9BeAfAwNQkfhXVhHSVFwh8oyFLYXV/4I++8y6fsgizF
         sS2hlYZhJGicz0FGWcr7ivWEwnJWIM6z3bQuKV8cLEUmEpzXm+/LJuMnuz73Q2mSQIGX
         QiWvcJp9FKk0XOgmNN8nZgW3DLtCuxU3VZ9yh5R8eHyjarA9a/ZoSA1eaC4csFYNxcSk
         BSNac2DSVrYLS8McESeI0YJe2919o/g0BYVG6ZaOAs6TUODO2VSCJh4Y/Ialn6odP3fC
         N+lQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNqobL9HJ3pa9NB9badoxXtm3YWjt9Uw2ZTB1JVO9wUD3jVFcRZaHLhJFlgGoTsvv6cDSpONVpb/Fs3Psq4jp7@lists.infradead.org
X-Gm-Message-State: APuU4Z+yD+JC5oe9u4/vKayLh0pjqIxuogbtTf8KqIKI14Vb8VDRybHT
	E1QHIE3vXFqYU1vySwjay5WnR1TfLHtl1mRza319IojjjjZsYTYvBOJQ
X-Gm-Gg: AYBFou1KO1hvb0sadT2E7gOKBEdb9swXB7xaLMAIFj9u7tTt5bQv6jN5biUqCwHKaJj
	7zKnt1VLmfJnj2zVoR2viu6qbnqpReaUdOG/bRdb+GkgtPOJAvwQZTs0aHxNRZqhMORu6G2Hg+R
	tzfPANp4V2pBTzrhUlQCdfkECC11tF6r9ePDPEzWKMc9D4ZcjtCVNQiy1v1uBesFCcRVtBPlb+U
	JPc1bqyxVFZsiY5kgijR9LfR9ypTKAF2d4ceOGj6HNEaIUJiH/7YG/oQbl3KAJxxaHSBDFNubRc
	1MdUw6pxkA/ULY1QD/nFN3GTLXIBVzvygu8URkaDq8QWLsCvd6Rf/5Vfz7ZEOPaBHVYUZdY/V9J
	XE8xf0Agg7hKBcVFKcY1EsX32qhAvvVL0fDYh/zXR5QCODXJ68+GyG7jDsOqhQip8zUvqh1MJ/J
	GuUcCRjln0UpaAX5kAvAr/6b7pcJcYulrr8aiF3n6fz+b197ZWJhStiuCLfJ0ZVBR47F6cyZnX6
	J/fkM3yNKmkiebbQ4XYSfRXs+FIYCAP1+go+aii4bCs2svyh4rUnqurpS0Kt21rthCGU9OcnAgA
	8D8Eya7Kbmr9r65Z27zHNMmexdbZpoRbT6lnBvH0cr0IA3Z7LqPFDaTepUQMNs4ylqB4y6SyLFH
	YOmu3/s85oMdZdFfBY9Fx9JUi8k8nzBgfDQQ=
X-Received: by 2002:a17:90b:5145:b0:3ac:9706:772c with SMTP id 98e67ed59e1d1-3ae8984cefamr5674017a91.60.1793496646286;
        Sat, 31 Oct 2026 18:30:46 -0700 (PDT)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm8943687a91.7.2026.10.31.18.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 18:30:45 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 01:30:44 +0000
Message-Id: <DMJHI077QR5H.5KF9WFI089UJ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Josef Bacik" <josef@toxicpanda.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Puranjay Mohan" <puranjay@kernel.org>,
 <rcu@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 00/14] rcu-tasks: build Tasks RCU on Tasks Trace
 readers in trampolines
In-Reply-To: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
References: <20260929-b4-rcu-tasks-preempt-qs-v6-0-c111ee02caca@toxicpanda.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_183047_797742_B489EE80 
X-CRM114-Status: GOOD (  24.05  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Sep 29, 2026 at 10:07 AM Josef Bacik <josef@toxicpanda.com> wrote:
>                    Graviton4                  Xeon 8375C
>                    base   series   C          base   series   C
>   nothing          87.0    87.8   87.7        70.3    70.5   69.8
>   function tracer 103.7   105.6  105.9        87.2    88.0   88.2
>   kprobe event    215.5   215.6  216.4       119.9   123.2  124.7
>   fentry          101.3   109.7  111.3        77.0    77.9   78.3
>   fexit           118.8   136.2  139.3        78.4    80.7   80.5
>   fentry+fexit    134.1   151.0  154.5        83.2    85.6   85.5

On Graviton4, on top of the bare syscall:

                  today      the series adds
  fentry          14.3 ns     8.4 ns
  fexit           31.8 ns    17.4 ns
  fentry+fexit    47.1 ns    16.9 ns

Every fentry and fexit prog pays that on every call :(
while synchronize_rcu_tasks() is rare.

> mutex, and the hung task detector panicked the machine. The kprobe jump
> optimizer is worse in principle: it does synchronize_rcu_tasks() under
> kprobe_mutex, text_mutex and cpus_read_lock(), so one long-running
> kthread can stall static key updates and CPU hotplug for its whole run.

Not anymore.

  who waits for Tasks RCU     how                      locks in the wait
  kprobe optimizer            call_rcu_tasks()         none
  bpf detach on x86           call_rcu_tasks()         none
  bpf image and prog free     call_rcu_tasks()         none
  ftrace_shutdown() of a      synchronize_rcu_tasks()  ftrace_lock and
  dynamic ftrace_ops                                   what the caller has

The first row is
commit 06e0d3b89da1 ("kprobes: Make optprobe optimizer multi-generational and asynchronous").
The second row is
commit 424f6a361096 ("bpf,x86: Use single ftrace_ops for direct calls").
bpf on arm64 still allocates ftrace_ops per trampoline.
That's the last row.

Another idea...
livepatch had the same problem with PREEMPT_LAZY.
commit 676e8cf70cb0 ("sched,livepatch: Untangle cond_resched() and live-patching")
solved it with a stack walk of prev in __schedule().
can we do the same for a holdout task ?
A preempted task is in a quiescent state when its stack trace is
reliable and has no address in a trampoline.
On x86 ORC unwinds through the interrupt frame.
bpf_has_frame_pointer() makes it reliable through progs and trampolines.

                                   series              stack walk
  cost in a trampoline             0.8 to 17.4 ns      none
  copies of rcu_read_lock_trace()  6                   none
  hook in the irq exit path        yes                 no
  return thunks, __bhi_args        listed by hand      return address is
                                                       on the stack
  register_ftrace_direct() users   must take a reader  as-is
  implementations of Tasks RCU     2                   1
  scan of the task list            only for kprobes    as today

Then no need for patches 2, 3 and 6-13, rcu_tasks_irq_ip,
rcu_tasks_wait_irq_preempted(), etc.

  not in the diff            what it needs
  kprobe jump window         kprobe_in_optimized_region() of patch 4 in
                             rcu_tasks_stack_entry()
  trampolines in modules     the flag of patch 5 in the same place
  fexit on a long function   the task in it stays a holdout, like today
  nohz_full                  resched_cpu() for a running holdout
  rcutorture                 a reader that the walk can see
  arm64                      see below

arm64 is the hard part. arch_stack_walk_reliable() stops at an exception
boundary, because LR can be live there. So a task that an irq preempted
is never clean. A false positive is fine for this check. The walk can
report regs->pc and regs->regs[30] and go on with the frame records.
Mark has to say whether that is enough.

Patch 1 is useful on its own. It removes two smp_mb() from every
sleepable prog. Pls send it separately.

Something like this

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 15fd9ec..83cb440 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -288,6 +288,7 @@ config X86
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_MERGE_VMAS
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
+	select HAVE_RCU_TASKS_STACK_QS		if UNWINDER_ORC && DYNAMIC_FTRACE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if UNWINDER_ORC || STACK_VALIDATION
 	select HAVE_FUNCTION_ARG_ACCESS_API
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 17d6edf..a3a33e9 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -275,6 +275,21 @@ static inline void tramp_free(void *tramp)
 	execmem_free(tramp);
 }

+#ifdef CONFIG_TASKS_RCU_STACK_QS
+extern void ftrace_static_tramp_end(void);
+
+/*
+ * ftrace_caller(), ftrace_regs_caller() and return_to_handler() keep the
+ * address of ftrace_ops, of a direct trampoline or of the caller in a register.
+ * The unwinder does not see it.
+ */
+bool arch_rcu_tasks_trampoline_text(unsigned long addr)
+{
+	return addr >= (unsigned long)ftrace_caller &&
+	       addr < (unsigned long)ftrace_static_tramp_end;
+}
+#endif
+
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
 extern void ftrace_caller_end(void);
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 62c1c93..c0e8c50 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -403,3 +403,9 @@ SYM_CODE_START(return_to_handler)
 		    X86_FEATURE_CALL_DEPTH
 SYM_CODE_END(return_to_handler)
 #endif
+
+/* See arch_rcu_tasks_trampoline_text() */
+SYM_CODE_START_NOALIGN(ftrace_static_tramp_end)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+SYM_CODE_END(ftrace_static_tramp_end)
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 44c07a6..2eb88c6 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -180,9 +180,16 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 #ifdef CONFIG_TASKS_RCU_GENERIC

 # ifdef CONFIG_TASKS_RCU
+#  ifdef CONFIG_TASKS_RCU_STACK_QS
+bool rcu_tasks_preempted_qs(struct task_struct *t);
+bool arch_rcu_tasks_trampoline_text(unsigned long addr);
+#  else
+static inline bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+#  endif
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
-		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
+		if (READ_ONCE((t)->rcu_tasks_holdout) &&		\
+		    (!(preempt) || rcu_tasks_preempted_qs(t)))		\
 			WRITE_ONCE((t)->rcu_tasks_holdout, false);	\
 	} while (0)
 void call_rcu_tasks(struct rcu_head *head, rcu_callback_t func);
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 332df7a..93a6a83 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -107,6 +107,20 @@ config TASKS_RCU
 	default NEED_TASKS_RCU && PREEMPTION
 	select IRQ_WORK

+config HAVE_RCU_TASKS_STACK_QS
+	bool
+	help
+	  Select this if arch_stack_walk_reliable() can walk the stack of
+	  a task that was preempted by an interrupt, and if
+	  arch_rcu_tasks_trampoline_text() reports the kernel text that
+	  keeps the address of a trampoline or of ftrace_ops in a register.
+
+config TASKS_RCU_STACK_QS
+	def_bool TASKS_RCU && HAVE_RCU_TASKS_STACK_QS && HAVE_RELIABLE_STACKTRACE
+	help
+	  A preempted task is in a Tasks RCU quiescent state when its stack
+	  has no address in a trampoline.
+
 config FORCE_TASKS_RUDE_RCU
 	bool "Force selection of Tasks Rude RCU"
 	depends on RCU_EXPERT
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 6272953..69f7aef 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1089,6 +1089,44 @@ static void rcu_tasks_postscan(struct list_head *hop)
 		timer_delete_sync(&tasks_rcu_exit_stall_timer);
 }

+#ifdef CONFIG_TASKS_RCU_STACK_QS
+/*
+ * Tasks RCU protects the text outside of the kernel and of the modules
+ * (ftrace and bpf trampolines, optprobe slots) and what the arch adds.
+ */
+static bool rcu_tasks_stack_entry(void *cookie, unsigned long addr)
+{
+	if (core_kernel_text(addr))
+		return !arch_rcu_tasks_trampoline_text(addr);
+	return is_module_text_address(addr);
+}
+
+static int rcu_tasks_stack_is_clean(struct task_struct *t, void *arg)
+{
+	if (t != current && task_curr(t))
+		return 0;
+	return !arch_stack_walk_reliable(rcu_tasks_stack_entry, NULL, t);
+}
+
+/*
+ * A preempted task is in a quiescent state when its stack trace is reliable
+ * and has no address in the protected text.  __schedule() asks for current.
+ * The grace-period kthread asks for a task that waits on a runqueue.
+ */
+bool rcu_tasks_preempted_qs(struct task_struct *t)
+{
+	bool ret;
+
+	if (t == current)
+		return rcu_tasks_stack_is_clean(t, NULL);
+	if (!try_get_task_stack(t))
+		return false;
+	ret = task_call_func(t, rcu_tasks_stack_is_clean, NULL);
+	put_task_stack(t);
+	return ret;
+}
+#endif
+
 /* See if tasks are still holding out, complain if so. */
 static void check_holdout_task(struct task_struct *t,
 			       bool needreport, bool *firstreport)
@@ -1098,6 +1136,7 @@ static void check_holdout_task(struct task_struct *t,
 	if (!READ_ONCE(t->rcu_tasks_holdout) ||
 	    t->rcu_tasks_nvcsw != READ_ONCE(t->nvcsw) ||
 	    !rcu_tasks_is_holdout(t) ||
+	    rcu_tasks_preempted_qs(t) ||
 	    (IS_ENABLED(CONFIG_NO_HZ_FULL) &&
 	     !is_idle_task(t) && READ_ONCE(t->rcu_tasks_idle_cpu) >= 0)) {
 		WRITE_ONCE(t->rcu_tasks_holdout, false);
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index b62735a..a21b76f 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -25,6 +25,8 @@
 #include <linux/interrupt.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/debug.h>
+#include <linux/sched/task_stack.h>
+#include <linux/stacktrace.h>
 #include <linux/torture.h>
 #include <linux/atomic.h>
 #include <linux/bitops.h>

pw-bot: cr

