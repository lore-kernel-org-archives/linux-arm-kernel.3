Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6BC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+J5TsPokEtcBZgoC4/eVwMDHhzV3+rip9BUfjH6oWiE=; b=JsyO9tpj2hAhoc8ewuVreFFPxf
	xycTT4vFTNNnC6FRwKerzzvEcE4qJy1wzHUrLOIEGe49kuiU7kmgu/00rHp3Lf23tmH+XecRJStbs
	or+hDccUEiQZJEwGKZQ32U9TDZdL0yfoDYWOgQdBZ0vfWEP5xDNltbpCl9MrM/mmOntHGQDnPEZHD
	0Nzr6Tmqge7x22QM19SC3kNe3dStnDCDCWEbRzB8/khoBOOgIifICXwS5z2qMZ24e+v5v4GX+8Pwi
	iT00cSiiGYEWYRlT2/PdZFTytALnDjDmY6LOK0OtZq5P4bsmcEAsinYLnK3DoJ162pan459tij6FF
	eNdgRkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrV-0000000FBa6-1R3l;
	Thu, 10 Sep 2026 18:51:05 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jrS-0000000FBY0-0KOh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:51:03 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-52f9fc510e1so10648021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066260; x=1789671060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+J5TsPokEtcBZgoC4/eVwMDHhzV3+rip9BUfjH6oWiE=;
        b=ieOotKelUFi4M4c6RSUro84dZUH6A2vA0ZXFwYJ1DuxpenAwVn20bfvDtFLp89+aJC
         sUkOtJc7eU05SHiG24uVixG3iiT5noNWguDp4NK920a7WFxQTf4PWEPvgdNMY6FURtHd
         EBKat2MnmpyxVQW5xx8Ux3L5EsdwNVm5IYodE5tY/0p7uZ4tepB/012ynDlQymkEi0kZ
         t9MRdE1HNXjGGY1o+VZJ16nEzimw3dJSMZwAAlpw73qsnBYQGEv/ogQEd8ZN1CDPSay7
         aIpUR2RkH47maSeYzLwqwzmQ7L8QOnSUJTR5xOMq4H95rUKfu4vdvKdYC7Mj3B6WUOTW
         jTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066260; x=1789671060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+J5TsPokEtcBZgoC4/eVwMDHhzV3+rip9BUfjH6oWiE=;
        b=ePnAU/wW/FEesvrak5XAhoTbIKF0lHNKFrWszB60i/E8xVVoH/JFh8sPvToY3yblnw
         T/GB6Kvbg0cZxCehy44Z6ft2fEu4KF4+LlfjGuHdUqRFaOcd/eyB+BU/kEjv6Lp+u0Lk
         GmwEQZvF1rU09Ih2Yyubv+beczkU0/VsnWArbny75hNHoWkYqIjD88g/pKsVBJ8Lv2UY
         CxbmQEN/UOokG9YC/TYLb3z+zGb0ubC4n6LKH9IEvB1+0ftbdBZr2iAa4+FgXM1Fm/6X
         ENqRbyj3WPT9ayvShv8o5YdfkVtUV5WtPr2/MxqOQlAs/gpHuke7F7fvfyZf0kSeJiXv
         UX0g==
X-Forwarded-Encrypted: i=1; AKwUvBwFbX6rFz6YjwiXZ3w4rejIfvsJ8g9eflRhDXnLkL6NTsspAzSKi71ujOR7S498l50jp537ZpmDDYuw0Ezdzn7p@lists.infradead.org
X-Gm-Message-State: AFuF++lEN47wgXX4bJbhQtviLsDJERHLGMQ+lMQZol1/snCE1/EU3MlO
	qexxRmTD5+Wfidg60B8vq+Mmaa+IQTaLPCwPJysyKuwDXBEbKV0C0FHmy0gehGpHTnA=
X-Gm-Gg: AYBFou1y2yhp8Pn2b+QL8hl8Vq30LmNrqyT1W/6xqr0uJFCQWYANepUf6hlHYVeQQGq
	PP0tpSTjX/NbHiHcEs8fopk+pTw1KB4vHtor3FzzYkaY8m/+tycLIFgUUgDNriQDhtDi3sldlNP
	vkP1pttGDaXW+V9DLdKqMfvIuZ9PAzaVp8+jLPkjifhv1tTc0B0IvxHjTEs1AVwbdXcd6Pm39gs
	7aqgn1FGxg5wY++d6F5gacQe1BW0LdVrblpEUtL/SHj8n5pJfaouo1dY16ekkEKSLH5SF3Yi1sj
	Fp9W0inkOtTkWnrXcSoif4zxHglQ2986uZL5LMh4n/IZwS4Jl6u0NvJJYwv7NpIvy5coRPu6zkf
	I7e89ydLi5UccKZ8Th0+dLTyU5RdSDSTngHgZ1rzRHm+G+mxfjl54JVlEedORVbRLOnTK/3FSC0
	Mm4f6uY5ze3w1btb0XWZwhfyp7L4zBAzCGQkjK0wavKfYMVkfh3HmrO6lnWhiqHM3IzkaSwHQqX
	dr88KGrh4VKmeR5DFh0VV/9bVi7hG2CJ8ZNC2gc0uLPW+qowgjROaWf
X-Received: by 2002:ac8:6f19:0:b0:530:4773:113d with SMTP id d75a77b69052e-530b35ec4f6mr85380621cf.27.1789066260401;
        Thu, 10 Sep 2026 11:51:00 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45bbd7sm230971cf.8.2026.09.10.11.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:59 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:28 +0000
Subject: [PATCH RFC 05/13] ftrace: Mark modules hosting direct-call
 trampolines for Tasks RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-5-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115102_145834_BA478440 
X-CRM114-Status: GOOD (  23.16  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

An out-of-line direct trampoline registered with register_ftrace_direct()
is kept alive only by Tasks RCU while a task executes it or is preempted
in something it called; ftrace_shutdown()'s synchronize_rcu_tasks() is
what stops rmmod freeing it under such a task.  Once preemption becomes a
Tasks RCU quiescent state, such a trampoline must hold
current->rcu_tramp_nesting across its call-out like the ftrace and BPF
trampolines do, so document that in register_ftrace_direct().

That still leaves the few instructions before the increment and after
the decrement.  For BPF images those are in dynamically allocated text
that rcu_tasks_ip_in_trampoline() already treats as protected, but the
in-tree samples (and any similar user) place their trampolines in module
.text.  Add a sticky module::ftrace_direct_tramp flag, set by every
register/modify path when the direct address is module text, and have
rcu_tasks_ip_in_trampoline() treat a task interrupted anywhere in such a
module as a potential reader.  Other modules' text is unaffected.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/module.h |  7 +++++++
 kernel/rcu/tasks.h     | 23 +++++++++++++++++++++--
 kernel/trace/ftrace.c  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..ea4727f53fab 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -521,6 +521,13 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	/*
+	 * An ftrace direct-call trampoline lives in this module's text; see
+	 * rcu_tasks_ip_in_trampoline().  Sticky once set.
+	 */
+	bool ftrace_direct_tramp;
+#endif
 #ifdef CONFIG_KPROBES
 	void *kprobes_text_start;
 	unsigned int kprobes_text_size;
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a55dc2a20fb7..df68a330769a 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1117,19 +1117,38 @@ bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
  *  - inside the bytes following a registered kprobe that jump optimization
  *    may overwrite, which kprobe_optimizer() protects with
  *    synchronize_rcu_tasks();
- *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline().
+ *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline();
+ *  - in the text of a module that hosts an ftrace direct-call trampoline,
+ *    which covers the instructions before that trampoline's increment and
+ *    after its decrement (see ftrace_direct_mark_module()).
  *
  * A false positive only defers the quiescent state to the task's next
  * context switch.
  */
 bool rcu_tasks_ip_in_trampoline(unsigned long ip)
 {
+	bool ret = true;
+
 	if (kprobe_in_optimized_region(ip))
 		return true;
 
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_ip_in_trampoline(ip);
-	return !is_module_text_address(ip);
+
+#ifdef CONFIG_MODULES
+	scoped_guard(rcu) {
+		struct module *mod = __module_text_address(ip);
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+		if (mod)
+			ret = READ_ONCE(mod->ftrace_direct_tramp);
+#else
+		if (mod)
+			ret = false;
+#endif
+	}
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(rcu_tasks_ip_in_trampoline);
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..14f27b887231 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6076,6 +6076,29 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->trampoline = 0;
 }
 
+/*
+ * A direct trampoline may live in module text rather than in dynamically
+ * allocated text that rcu_tasks_ip_in_trampoline() recognises on its own (see
+ * samples/ftrace/ftrace-direct*.c).  The trampoline itself must hold
+ * current->rcu_tramp_nesting across its call-out (see register_ftrace_direct());
+ * marking the owning module here covers the instructions before that increment
+ * and after the decrement, where a task interrupted in the module's text must
+ * not be treated as Tasks-RCU quiescent, so that ftrace_shutdown()'s
+ * synchronize_rcu_tasks() still keeps the module text from being freed under
+ * it.
+ */
+static void ftrace_direct_mark_module(unsigned long addr)
+{
+#ifdef CONFIG_MODULES
+	struct module *mod;
+
+	guard(rcu)();
+	mod = __module_text_address(addr);
+	if (mod)
+		WRITE_ONCE(mod->ftrace_direct_tramp, true);
+#endif
+}
+
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * for multiple functions registered in @ops
@@ -6090,6 +6113,17 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
  * and save the parameters of the function being traced, and restore them
  * (or inject new ones if needed), before returning.
  *
+ * Nothing but Tasks RCU keeps the trampoline at @addr alive while a task is
+ * executing it or is preempted in something it called.  On architectures that
+ * select ARCH_HAS_RCU_TASKS_PREEMPT_QS a preemption is a Tasks RCU quiescent
+ * state unless current->rcu_tramp_nesting is non-zero, so the trampoline must
+ * increment it before calling out and decrement it before returning, as the
+ * ftrace and BPF trampolines do (see rcu_tasks_trampoline_enter() and
+ * samples/ftrace/ftrace-direct.h).  The few instructions before the increment
+ * and after the decrement are covered by the irq-exit IP check: automatically
+ * for trampolines outside kernel and module text (e.g. BPF images), and via
+ * ftrace_direct_mark_module() for trampolines in module text.
+ *
  * Returns:
  *  0 on success
  *  -EINVAL  - The @ops object was already registered with this call or
@@ -6169,6 +6203,7 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->flags |= MULTI_FLAGS;
 	ops->trampoline = FTRACE_REGS_ADDR;
 	ops->direct_call = addr;
+	ftrace_direct_mark_module(addr);
 
 	err = register_ftrace_function_nolock(ops);
 	if (err)
@@ -6237,6 +6272,8 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	lockdep_assert_held_once(&direct_mutex);
 
+	ftrace_direct_mark_module(addr);
+
 	/* Enable the tmp_ops to have the same functions as the direct ops */
 	ftrace_ops_init(&tmp_ops);
 	tmp_ops.func_hash = ops->func_hash;
@@ -6419,6 +6456,7 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
 			if (__ftrace_lookup_ip(direct_functions, entry->ip))
 				goto out_unlock;
+			ftrace_direct_mark_module(entry->direct);
 		}
 	}
 
@@ -6702,6 +6740,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
 			tmp = __ftrace_lookup_ip(direct_hash, entry->ip);
 			if (!tmp)
 				continue;
+			ftrace_direct_mark_module(entry->direct);
 			tmp->direct = entry->direct;
 		}
 	}

-- 
2.55.0


