Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE64606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxCmZC4F;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sbI9nfN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=; b=dxCmZC4FEiobDH
	GyAQBAo9ogehvLZEF5dB1V9wkeMYq7CeXV2uPs2F4nm6sXmOyRiLK4VGoSNFL9w0CHHHBII2/Y99O
	z9Mmum7b4jHMu/T1g8rI35uzM6BUC72Lzpz0c/OVrGc0KeR+txLzFXHQW0MfmmAq06BoeLaRjOdpV
	XPYrze3iODSSmCtJUk2YuRgpKP52heWU76GT7BXaXghPhs+CmWlAdVnlmaSwp4XevFdmbFvU1VSuk
	P6A3S7R7jFIQU29EgTKfOHuQzu2dJKtPOegng4XDw9hcXfXJwiwkHA9syz7VoFfrCKaRD7V6P0t3u
	UXsv+nP8M5brNTSzsR8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOr-00000006DP8-2Eva;
	Wed, 28 Oct 2026 03:32:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOc-00000006DCk-1m29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48afbd2c386so267936f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158331; x=1793763131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=;
        b=sbI9nfN9zKLlOfzu/wIkHivgCi0yqZ1JTiT2gjAfCfiRdI90+CLf4Djup041w+YUU6
         FAtz1UjnWhyelZNpVuKwuAr0uA7N6atfsLsTqM1LeaTfRtFtoRl6Jldflxr8OsronQBN
         cteXpl01aFn8zvcA1KwToIO3o90TBqswBOfUUM2Jmy4vEKoiBEmx6HY7dIT0Pr1Pth+q
         wp66PuvdeoGhZA8wRcnM9sYqGqeFmqQJasPMDfWdW1bD4g/AN2j0/j4VjbWNZvVqU/io
         mblAm/YaKFsVTNCsadDp8ZV1ibeVBeQaeLrhVRtzOHdHphlBLTOx3Ldh7lbFv4axt40A
         Q8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158331; x=1793763131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=;
        b=zVbEK5ThxDHDByX30kSEQmhhOsS6//TWKplqCMdOUIPSmwfuriffi6RSJYykRPzUvw
         5M+PY3Obiv2OPiWyrNIEF2Qzcz1lUQvsm4kSyQWTUuxFknb8NRlp8biZZimwxnR7Vlux
         QYzSWPkBh1fXlcG4iFHSyJVCuaSyz2IIBcTqmSqaBtg71sAtLscoffr/HfX8NRdQAKap
         pN2EAODBd9KoqtApq3A+uanvroREviMOjLnkUhz+VxmWbSrkjSffNYDqb8T41r5Dz5t/
         ukZI8gELd22PUFD07ldwFvXFUm7IfXSJNm8fmqUmJMvYVsNBECKdQ9SMQOMT3uS4wjd8
         ylOg==
X-Forwarded-Encrypted: i=1; AKwUvBz2Muuw+2ciNCYh8mJVXQ1ZvDEOJHwuiqjuUbqJc4usr2WMOtNCzAqssEcm0QuRVPT2O8Rj4ffZ0Dnhfh3aI2IG@lists.infradead.org
X-Gm-Message-State: AFq9FYIq40/POiENdZV3C+8XBFlZmv3+m6IDBrCRJ9+OCxkp2otz8Dpv
	AIVMQwdpVGQmcp+vM0jQDb6hPRVfEt88svmpir0WFEm3gg8Or5mdc5hm
X-Gm-Gg: AYBFou0AmuAUKjwGmS9p1dUISBzDm6Pox46+bm6xnKnGrvb9c7C/nzygnjYClWiHo8r
	Qio5YSB9yT8aGRzglHtDNM0u4V88CWgly61Qch7Ax17nDC6iSTglrDA/jsOefUqZ4vecSNBxzUa
	m0U+cK+7DAIPy/UL4bPkeGocoIfvF1/M8lTrLxLQr6wPr+gDfVifkXNjXqfJFqFZMGgWmXU6Fyv
	yR+QxrG3vYH/KWb+MHxu4UjSx9jrJvEWPjisMuu4jhBqvS6ZJfuG2iN76Amr7/QykEyl0TbGVkR
	ESczCmT8UBykgiJ7LD7Fgc9SNWFz1l6OBWW+f2ZK6ZViRJ8OttjiDKkSrP4enZPMfhR6Eu+rCsm
	yGOCtY/DogQMSTjKbyTz7qdl/PjizrdjKtKKlI6PWPKzVoiFLtlW9H/u2TvpPPblNY1QtSCl6aw
	jxBlDdwBRPNQK30qxiPGMWyf/cZVdxQMxSYg/nmvBSEsNgGXDwKZNLJtn3KlMcrMYOBLxvRRw7T
	FEZksR/YgfuWSu4VkuoEb8+gIrBYyYU8xxfYGe+q7BVZ+5jHizJ3Bf0WR3vKepiwUlxPsQPJxEs
	3qvaigDmczg6NWZHSTVaiM+Ln4FvlBiQOAlHqcSn9s8gxTbGIc1fINPg1u/o35DNgbvu8ui5REI
	COnAOGf6CBgFh67ImFgVFJimqs5jfnjGOVjTnD9CnnKutnn1Vso3kFhDCy//V3F++bzrPTpCWc6
	2b7UnlMXQ88xRzMiTFwFDcRx1EX6Ap4dNz
X-Received: by 2002:a05:6000:2089:b0:48c:4444:f0a2 with SMTP id ffacd0b85a97d-48e5d58cb94mr2760059f8f.7.1793158330919;
        Tue, 27 Oct 2026 20:32:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:09 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [RFC PATCH v2 10/13] entry: Classify ordinary hardirq return-tail work as hardirq context
Date: Wed, 28 Oct 2026 04:31:24 +0100
Message-Id: <20261028033127.82193-11-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203215_818340_02C1CC78 
X-CRM114-Status: GOOD (  23.34  )
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

Use the saved ordinary-hardirq provenance to stage a fresh hardirq-count
attempt and restore lockdep classification after the preemption decision.
Keep it across traceable return-tail work, deferred hrtimer rearming,
IRQ-on preparation, and context-tracking preparation.

Before removing the raw tail state, prepare the conditional count and
lockdep teardown and close late regular or forced-thread softirq work.
Complete any pending RCU quiescent-state transition only after that raw
teardown.

Do not repeat interrupt accounting, RCU or tick entry. Existing non-hardirq
return paths remain unchanged.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  1 +
 include/linux/irq-entry-common.h | 64 ++++++++++++++++++++++++++++++--
 kernel/softirq.c                 | 21 +++++++++++
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d4b2754468c09..22b312e674579 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -28,6 +28,7 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 
 void irq_enter_rcu_preempt_counted(struct irqentry_hardirq_cookie cookie);
 bool irq_exit_rcu_preempt_counted_prepare(struct irqentry_hardirq_cookie cookie);
+void noinstr irqentry_hardirq_tail_exit(struct irqentry_hardirq_cookie cookie);
 
 /*
  * Prepare every potentially instrumentable part of hardirq teardown before
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 6f649f6613312..f51aafc1b49fd 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -383,6 +383,32 @@ irqentry_hardirq_count_state_set(irqentry_state_t *state,
 		IRQENTRY_HARDIRQ_APPLIED : IRQENTRY_HARDIRQ_REJECTED;
 }
 
+/**
+ * irqentry_hardirq_tail_enter - Stage ordinary-hardirq return-tail state
+ * @state: Pointer to state returned by the matching irqentry_hardirq_enter()
+ *
+ * Make a fresh staged hardirq-count attempt and establish the lockdep
+ * classification which traceable return-tail work needs. Accounting, RCU and
+ * tick handling belong to the completed interrupt and must not be repeated
+ * here.
+ */
+static __always_inline void
+irqentry_hardirq_tail_enter(irqentry_state_t *state)
+{
+	struct irqentry_hardirq_cookie cookie;
+
+	if (!state->hardirq)
+		return;
+
+	cookie = irqentry_hardirq_count_start();
+	lockdep_hardirq_enter();
+
+	instrumentation_begin();
+	irqentry_hardirq_count_finish(cookie);
+	instrumentation_end();
+	irqentry_hardirq_count_state_set(state, cookie);
+}
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -519,7 +545,10 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
  *
  * The rearm on return to user mode needs no such annotation: no locks are
  * held there, so it uses the same lock chains as the rearm in hardirq
- * context.
+ * context. Ordinary-hardirq return paths do not use this wrapper: their saved
+ * provenance makes a fresh hardirq-count attempt and establishes lockdep
+ * nesting across the whole traceable tail. They call
+ * hrtimer_rearm_deferred() directly.
  */
 static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 {
@@ -534,7 +563,9 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
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
@@ -543,6 +574,31 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
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
+		irqentry_hardirq_tail_exit(irqentry_hardirq_count_state(state));
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
@@ -584,7 +640,8 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
  *
  * This is the counterpart of irqentry_enter_from_kernel_mode() and combines
  * the calls to irqentry_exit_to_kernel_mode_preempt() and
- * irqentry_exit_to_kernel_mode_after_preempt().
+ * irqentry_exit_to_kernel_mode_after_preempt(). It also establishes the
+ * conditional hardirq return tail between those calls.
  *
  * The requirement for the CPU state is that it can schedule. After the function
  * returns the tracing, lockdep and RCU state transitions are completed and the
@@ -599,6 +656,7 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs,
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	instrumentation_end();
 
+	irqentry_hardirq_tail_enter(&state);
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 169c559832501..85b167db37c29 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -837,6 +837,27 @@ irq_exit_wake_late_softirqs(unsigned int wake_flags)
 		irq_exit_wake_ksoftirqd();
 }
 
+/**
+ * irqentry_hardirq_tail_exit - Close work and remove return-tail state
+ * @cookie: Staged hardirq-count cookie from irqentry_hardirq_tail_enter()
+ *
+ * Run every instrumentable teardown operation, including the final worker
+ * closure, before conditionally removing any applied raw hardirq count and
+ * ending lockdep nesting.
+ */
+void noinstr
+irqentry_hardirq_tail_exit(struct irqentry_hardirq_cookie cookie)
+{
+	bool do_sub;
+
+	instrumentation_begin();
+	do_sub = irqentry_hardirq_exit_prepare(cookie);
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


