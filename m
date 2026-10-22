Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60595606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yTzDjiqc;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iBXi+GSn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=; b=yTzDjiqcJ/b/QnRzZW2cIA+gpg
	rZ3XS30clMJd54eBgefcGZiWUNWCt48WNTbmzmjgqO9uc7kPpSrybnNxffqSfmjDnkt75RXwzN7KP
	SrzZVAFdGCpm1rOdD4L1El/Kt2a1/q1IE8ZwBgM+8EYyn2WJ2iBh5ntNNqzKAMqp7Uf5eAumfALs4
	5o04vp7DjXPqLjcTuSsTTR3J0fdvK5r6+hJyh6PadX9zTXErpI/QFmdhy82FcV7XoCXdklB1See2h
	N9bozVfQ1RzE5VuLUgskifFkLykXYytDXemGkLbA/7bOX/RoNzxHcqF8MX5Pv17CvogJcWWmNhEet
	M42mRyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBj-0000000DMbB-00eU;
	Thu, 22 Oct 2026 05:18:03 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBL-0000000DMLQ-3ZPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2074705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646258; x=1793251058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=;
        b=iBXi+GSndAGp8FCte35hH0Jr5X+FOaw1mcq1YDagyEgfk9Axp6sJ3GvJcXlqQmLImb
         3uJL8Ufqu0kEdPCezT+uTzXoMsP1JX6fvr+AuP7RVwVgGKidNNe8BWs5q00VO+dJi3h2
         8FTr9WhZn0ZDd9XcUn0h8IK0AbwlzAKtL+vCS1XaiOnCeglqfWTXf764mPZApLTbGUuj
         r0Q4uph2iOAIbeZA4pHPFz6HFG5TzUef7cyjE0jPlD3Emipq0jM1K8sZu60VZPGVD+j5
         rqYhuOOfosgMPbDy2HPkmnHHulSQUwHL0ARuuPZ9WNtJoDKqU97mUbeo1l+XRt+/Cu7X
         tAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646258; x=1793251058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yI/KRMuZRPijWcltjKclweO2FOu/JT/OWUV8SsmHo1Y=;
        b=z0cOMnFCDKWgL53XOMgGo9TTtfJ5KWRB+flPPSi75zxEGQ9sX7uy3gCU4W1Pa0DVYR
         uspnYveL2gtHws8Uu8MocDXht11uzv6I3uku8tW796gK6R708E1oRT9exw5mvvMp7V+1
         HyJyLNsCRZuJy5QLZp7kEl4W1eLUOVxoUFrDa7cmo5KuEvheyJH40KkFAg9AftSMqQX0
         tymuO1UF83FKjxRjG1Gi7rKecyuZeaNZgE4GwIjldmLFD4x5CFNgPt4rAqeEmgFupmX0
         PcUX/UdZIYmPJuCxOhpfL84fB1+hmEv8mD5poP5nC1vwJin+CXuayQxnyXyeqG1x2ZIB
         6VQg==
X-Forwarded-Encrypted: i=1; AKwUvBwG5juhUhq7Zjelb3q7h0Y8aGcd/UsIVdU95sJmYcZmWpIXJ3lWxkg2TavM8IGiW6Gas4lZP2xyxkL5C/lEZhSf@lists.infradead.org
X-Gm-Message-State: AFq9FYJWYNa4aPV2IZO8urg/cD7aMW+QZiMyc/7GHS8vAyDDm4TlGbWU
	pJzekCO5eIoCrsp1ASpbSy3f6IAeEX9C/PHyqmKe6wpko4o0fSLMvgN4
X-Gm-Gg: AYBFou3XPyGaxQgCpk3WESDDGpvDgDmu1F4eCA+a8nICVps3KPGIuTyn0tSIGRUO29U
	RkoII2W75ZpUB2OYFEamNdwHBSDPw2nE+oN5o+Ny61ND2QFKtXH7i2udN/hMJwUXiHI14ZmEAXI
	fz6DxDz52SJmlRNNMV0+eSIF1qFDbbkGi6Vqt8oatXrBqMplRJCWUcNI/DvIoQj4zt5gvWILC15
	Vg2XGSyIuRpB3DHD8SWKU8nPygEcTCbXJtqSBSIRUyaLHFpkYxfS7efKCjVXuRlis0tBTqR3huW
	KedXgEYoD0lIS2TjFTGdnpgS/o4HzlBEtjFTNu2E/ccmuGT7vjY6xjPxc5nxJKeobWWLqI80ELo
	xD2IrdbBEVvXwfm/niimn7EM5Q0DyEBvP19FeyXy6kTz5SoOlKi/+nX3yylKjLdCF3s4ZMakelS
	6P49skfcLhkLlcNA2hDQTkbtCoMWpZWhcIBreVKFGqFqGGiDRkglMw52FaOn64h3c8KRsWA58OS
	1tbHcK/yKYAhssJOnTOVxmo7SPQJkuyqK6Xp7OMcKE9/VIYhRgBlGmOR3DVEwdlP7s9svuiAycv
	wpc6NyxPUgvc5jvOKzNM+OzvkgXe2bcz0HVWqCTvFE9NbcKufATwUlziDkjBO938FssyEDAUZQM
	9iZkVx0jp018LkyqR7DjAPi9phh1zFIQqSeAwLwVRQ0EPyXbqY1mXAkAk1eLgLa6rt0LHA4jDBd
	gwvzmL
X-Received: by 2002:a05:600c:1f88:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4a1fdd15bc6mr83285535e9.31.1792646257872;
        Wed, 21 Oct 2026 22:17:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 08/12] entry: Classify ordinary hardirq return-tail work as hardirq context
Date: Thu, 22 Oct 2026 07:16:50 +0200
Message-Id: <20261022051654.79224-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221739_992799_0D77CD78 
X-CRM114-Status: GOOD (  23.04  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An ordinary hardirq removes its original count and lockdep state before the
return path may preempt. Traceable return-tail callbacks then appear to run
in the interrupted task or softirq context and can collide with recursion
state owned by that context.

Use the saved ordinary-hardirq provenance to restore only preempt-count and
lockdep classification after the preemption decision. Keep it across
traceable return-tail work, deferred hrtimer rearming, IRQ-on preparation,
and context-tracking preparation.

Before removing the raw tail state, prepare the count and lockdep teardown
and close late regular or forced-thread softirq work. Complete any pending
RCU quiescent-state transition only after that raw teardown.

Do not repeat interrupt accounting, RCU or tick entry. Existing non-hardirq
return paths remain unchanged.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  5 +++
 include/linux/irq-entry-common.h | 59 ++++++++++++++++++++++++++++++--
 kernel/softirq.c                 | 18 ++++++++++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index ad27a06c859a0..a120e3756d076 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -27,6 +27,7 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 
 void irq_enter_rcu_preempt_counted(void);
 bool irq_exit_rcu_preempt_counted_prepare(void);
+void noinstr irqentry_hardirq_tail_exit(void);
 
 /*
  * Prepare every potentially instrumentable part of hardirq teardown before
@@ -37,6 +38,10 @@ static __always_inline bool irqentry_hardirq_exit_prepare(void)
 {
 	bool do_sub;
 
+	/*
+	 * Preempt-on tracing can raise deferred work. The caller must perform
+	 * the final worker closure before removing the raw hardirq count.
+	 */
 	do_sub = preempt_count_sub_prepare(HARDIRQ_OFFSET);
 	lockdep_hardirq_exit_prepare();
 	return do_sub;
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 2ed637cf66b0c..c6bdd5a2522e8 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -355,6 +355,28 @@ typedef struct irqentry_state {
 
 irqentry_state_t noinstr irqentry_hardirq_enter(struct pt_regs *regs);
 
+/**
+ * irqentry_hardirq_tail_enter - Restore ordinary-hardirq return-tail state
+ * @state: Return value from the matching irqentry_hardirq_enter()
+ *
+ * Restore only the hardirq classification which traceable return-tail work
+ * needs. Accounting, RCU and tick handling belong to the completed interrupt
+ * and must not be repeated here.
+ */
+static __always_inline void
+irqentry_hardirq_tail_enter(irqentry_state_t state)
+{
+	if (!state.hardirq)
+		return;
+
+	__preempt_count_add(HARDIRQ_OFFSET);
+	lockdep_hardirq_enter();
+
+	instrumentation_begin();
+	preempt_count_add_finish(HARDIRQ_OFFSET);
+	instrumentation_end();
+}
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -505,7 +527,9 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
  *
  * The rearm on return to user mode needs no such annotation: no locks are
  * held there, so it uses the same lock chains as the rearm in hardirq
- * context.
+ * context. Ordinary-hardirq return paths do not use this wrapper: their saved
+ * provenance restores both the hardirq count and lockdep nesting across the
+ * whole traceable tail and they call hrtimer_rearm_deferred() directly.
  */
 static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 {
@@ -520,7 +544,9 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
  * @state:	Return value from matching call to irqentry_enter_from_kernel_mode()
  *
  * This is to be invoked after irqentry_exit_to_kernel_mode_preempt() and before
- * actually returning to the interrupted context.
+ * actually returning to the interrupted context. If @state records ordinary
+ * hardirq provenance, the caller must first invoke
+ * irqentry_hardirq_tail_enter() exactly once.
  *
  * There are no requirements for the CPU state other than being able to complete
  * the tracing, lockdep and RCU state transitions. After this function returns
@@ -529,6 +555,31 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 static __always_inline void
 irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
 {
+	struct ct_irq_exit_state ct_state = { };
+
+	if (state.hardirq) {
+		if (!regs_irqs_disabled(regs)) {
+			instrumentation_begin();
+			hrtimer_rearm_deferred();
+			/* Tell the tracer that the return will enable IRQs. */
+			trace_hardirqs_on_prepare();
+			lockdep_hardirqs_on_prepare_irqtail();
+			instrumentation_end();
+		}
+
+		if (state.exit_rcu)
+			ct_state = ct_irq_exit_prepare();
+
+		irqentry_hardirq_tail_exit();
+
+		if (state.exit_rcu)
+			ct_irq_exit_finish(ct_state);
+
+		if (!regs_irqs_disabled(regs))
+			lockdep_hardirqs_on(CALLER_ADDR0);
+		return;
+	}
+
 	if (!regs_irqs_disabled(regs)) {
 		/*
 		 * If RCU was not watching on entry this needs to be done
@@ -570,7 +621,8 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
  *
  * This is the counterpart of irqentry_enter_from_kernel_mode() and combines
  * the calls to irqentry_exit_to_kernel_mode_preempt() and
- * irqentry_exit_to_kernel_mode_after_preempt().
+ * irqentry_exit_to_kernel_mode_after_preempt(). It also establishes the
+ * conditional hardirq return tail between those calls.
  *
  * The requirement for the CPU state is that it can schedule. After the function
  * returns the tracing, lockdep and RCU state transitions are completed and the
@@ -585,6 +637,7 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs,
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	instrumentation_end();
 
+	irqentry_hardirq_tail_enter(state);
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 63427d29cb6d1..80d12deeb694a 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -833,6 +833,24 @@ irq_exit_wake_late_softirqs(unsigned int wake_flags)
 		irq_exit_wake_ksoftirqd();
 }
 
+/**
+ * irqentry_hardirq_tail_exit - Close work and remove return-tail state
+ *
+ * Run every instrumentable teardown operation, including the final worker
+ * closure, before removing the raw hardirq count and lockdep nesting.
+ */
+void noinstr irqentry_hardirq_tail_exit(void)
+{
+	bool do_sub;
+
+	instrumentation_begin();
+	do_sub = irqentry_hardirq_exit_prepare();
+	irq_exit_wake_late_softirqs(0);
+	instrumentation_end();
+
+	irqentry_hardirq_exit_finish(do_sub);
+}
+
 static __always_inline unsigned int __irq_exit_rcu(bool keep_hardirq_count)
 {
 	unsigned int wake_flags = 0;
-- 
2.39.5 (Apple Git-154)


