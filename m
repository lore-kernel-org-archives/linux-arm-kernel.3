Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC5606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0hcBKY+F;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wbq5p9Xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eeFaMcaI/QULWPGI46eWUbs+3gYM1Hxa41OxQr0Fu1k=; b=0hcBKY+FK29g3x
	r1ww8Rn0p9Nn+oxGSTxSNjMejG5ZXWrOsgUwUdeNhCiuAnvjJ3rD5PlYvFM21Jk4deI3Eq4MQE3W2
	RQ+6wz/+MxSI0EbyXA0+ygjOPPJnESi1HgNBbSSymx9CW9ebMo1QXNkwg7QpRtHy8VG0k3lqALW2t
	y22sCoPmYZodHFRW3//5HAsW/hh2srt8yDaYYRyHod5I4ODJVOQfUIwkaLC78OJIISB49QB4rD5L8
	skqdf9JtqtAi9Z9zZdw/njHe2jDIY0gB6GfJznQtHyPRqh+bN9rizUUrnTTk8L0t8VmsQ4c7F48uj
	OmQcgPofqHOiy/cJwQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOU-00000006D6u-2IfO;
	Wed, 28 Oct 2026 03:32:06 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOO-00000006D1F-49SP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48e47347279so331329f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158317; x=1793763117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeFaMcaI/QULWPGI46eWUbs+3gYM1Hxa41OxQr0Fu1k=;
        b=Wbq5p9XlPbfxNH8qLOFTyrQF/BqT0DPJ5VaVoctNJKXnfxWVX9m5GhJi9oUsRLVFlz
         JoKy6/Ou+JU9vK9nX0OXQ1UNMt6XIFLHmdzqpJruDMg31dAqITvEPJKMFS8pwPdcqG28
         0VTlKpWYaBgdTGOI+wGamXL7JtFHHpBHxnBgeDb76I9M6L7vKpLh+uIoK5EiRfGULUZV
         i7vCY13Xqtxm1z1tkcTkpPr2nFjbJLoAQsLDgcHnt4hRfLjKt7/OMD2iJ9lWii1MlbML
         fffzGcQ5ZusLksSaI5+imqWJIUU5WtTVgDROwGLxXvqBCM5mdWxOg1wr8kcf9IYpZZkm
         rWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158317; x=1793763117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eeFaMcaI/QULWPGI46eWUbs+3gYM1Hxa41OxQr0Fu1k=;
        b=Dc8rWk1zVGeqgsHhlmGCla9avO19ePUuOOemWGnE/3vD4cmM5ovzLUL4mw0z8bUJj1
         OvB7XXwgdM1nCi//wq4j2LKaKOkcru1F5QxpPbcH9eNys98JA9jDeNtvzXpLzykLEguI
         8964srTNmx95h/auSQLsf9ybuYLyMs9IqBHm/N0TluUE1LJeDIs5IZkbNP9yvLmKiojC
         +INc4FCMN07d8SRpCRWsp7BDpAjJNXDCQWb5euysY1B5DdRDGEfinCTpxJd5IiOWqPct
         KVW2OARjO2K6zBJAUtHzsmw+mrNnM5z7RNfo7XGqAevIU2g+ttlOBfjgw0w/lmTyELM8
         /sHg==
X-Forwarded-Encrypted: i=1; AKwUvBwWFiaJi5ED9eAEG5XMRXSc5JQaGE5blzRaVNUcbVwelkG0h4blcowBmYobNAzCJw31YzjfgM2LcbJtgYaVRcLf@lists.infradead.org
X-Gm-Message-State: AFq9FYKM1OuIMKztonX+NP6FCRL+JouLOYZEfy0YUQtAiixP+iZRSujg
	lTbBYXivg+jbC6q0ghxh0WZrzqKB/He5uX47eOtogvqhrWYCRJqZyK2O
X-Gm-Gg: AYBFou2q49UxoIm+tuXvyBGQuqwBEObjPxegDO+LSBQW0Yi3Mp2Qm7vLYp+Tz5feo30
	71k9hgR+GknK1rlWdSPiWKDgIR+fRIU8coKOty3T4ioVk0kTkQjVYq77aIclFhVw4X+dbvt7vF/
	2Z0zuMAD2O8xankZ1L/M1Tva5UE3wIvkZ2ZZXn3iJY/pBlifpMJHbuXZ5DdGtr2p0+w8XG7dIg4
	72gOZbm5d/B8VVDKlw+nQSVIRrr/f1LVHhNtJcpB8WdkuL7Kx3HZTYkYT2Z8N2EgxI8XCXPl8hg
	RhUbhLLLaB1tf+jocWYrlScFoe629i8qM3dMkKY8FkTFjxMyLSOlJxyGlfHTydFKrN8FKEvKdFa
	BYzga0tqeUj5MIXt8bwGGplQM6hlO9NLuUYOMj8l70R3WblKwQV27FKRZjS2hGcUuMrA1mh8y6K
	lxs7DjyTCFv8R98xcZJA/j1NVAjhSzggQwfcroG8wo2i0o06W+8FVXjIGkxDWwGtNS0vo/R09b4
	MYUQUlVvY3qx39DhDf7LihyaFTPHVWXVPuqobUs69A490rHe3A87yMpimUquhJ1XxwfP5bJwBLL
	xmDskMeLgBsNVV4BhgP/rOeCT7ORen+e5V8BQ1UbAIvj5tHFx7V+S0dvx/7CdN+0tae5umjl3gn
	q9yaMNGpsSY+WW8CYGN3hhb2Hu2JXXw9rR8bqVGweIhCvkfoMkIJDBm7MbMIuNYxgK5nlTQxYWN
	TOlt9CI8PUSgAJb/9962oCRdXtpgB0Us1J
X-Received: by 2002:adf:f18f:0:b0:48e:1d87:f170 with SMTP id ffacd0b85a97d-48e5d5c27c7mr2142297f8f.12.1793158316595;
        Tue, 27 Oct 2026 20:31:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:55 -0700 (PDT)
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
Subject: [RFC PATCH v2 05/13] entry: Add the pre-counted ordinary-hardirq entry/exit contract
Date: Wed, 28 Oct 2026 04:31:19 +0100
Message-Id: <20261028033127.82193-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203202_981162_D4983721 
X-CRM114-Status: GOOD (  23.42  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Architectures which identify ordinary hardirqs before generic entry need
to install HARDIRQ_OFFSET before context tracking and tracing callbacks
run. Lockdep hardirq state must agree with that count. On exit, both states
must remain installed until every traceable callback has returned.

Add irqentry_hardirq_enter() to stage the raw count update, record whether
it was applied in irqentry_state_t, and establish lockdep state before
instrumentable entry work. irq_enter_rcu_preempt_counted() finishes the
staged count update while preserving the existing timer and hardirq
accounting boundary.

Add a retained exit path which runs IRQ-exit processing and instrumentable
teardown preparation before returning to an immediate conditional raw count
and lockdep teardown. This keeps function-graph return callbacks in hardirq
context.

A return callback after the final softirq drain can raise regular or
forced-thread timer work while hardirq state still suppresses the usual
wakeup. Recheck ksoftirqd, ktimerd, then ksoftirqd after the last traceable
teardown step. Record wake requests made by the main exit path so the
closure does not repeat them.

Keep the existing entry and exit interfaces unchanged. Architectures opt
in only after distinguishing ordinary hardirqs from NMI-like entry. They
must not place instrumentable code between the retained-exit helper and
raw teardown.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  31 ++++++
 include/linux/interrupt.h        |   2 +-
 include/linux/irq-entry-common.h |  62 +++++++++++-
 include/linux/irqflags.h         |   9 +-
 kernel/entry/common.c            |  37 +++++++
 kernel/softirq.c                 | 160 ++++++++++++++++++++++++++-----
 6 files changed, 271 insertions(+), 30 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index dcbda3c1d5636..d4b2754468c09 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -26,6 +26,37 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 		__rcu_irq_enter_check_tick();
 }
 
+void irq_enter_rcu_preempt_counted(struct irqentry_hardirq_cookie cookie);
+bool irq_exit_rcu_preempt_counted_prepare(struct irqentry_hardirq_cookie cookie);
+
+/*
+ * Prepare every potentially instrumentable part of hardirq teardown before
+ * the raw count and lockdep updates. The caller must invoke the matching
+ * finish helper without passing through instrumentable code.
+ */
+static __always_inline bool
+irqentry_hardirq_exit_prepare(struct irqentry_hardirq_cookie cookie)
+{
+	bool do_sub;
+
+	/*
+	 * Preempt-on tracing can raise deferred work. The caller must perform
+	 * the final worker closure before conditionally removing an applied
+	 * raw hardirq count.
+	 */
+	do_sub = irqentry_hardirq_count_applied(cookie) &&
+		 irqentry_hardirq_count_sub_prepare();
+	lockdep_hardirq_exit_prepare();
+	return do_sub;
+}
+
+static __always_inline void irqentry_hardirq_exit_finish(bool do_sub)
+{
+	if (do_sub)
+		__preempt_count_sub(HARDIRQ_OFFSET);
+	lockdep_hardirq_exit_finish();
+}
+
 /*
  * It is safe to do non-atomic ops on ->hardirq_context,
  * because NMI handlers may not preempt and the ops are
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index ee2dd5349697d..6143ef6074ad6 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -640,7 +640,7 @@ DECLARE_PER_CPU(struct task_struct *, ktimerd);
 DECLARE_PER_CPU(unsigned long, pending_timer_softirq);
 void raise_ktimers_thread(unsigned int nr);
 
-static inline unsigned int local_timers_pending_force_th(void)
+static __always_inline unsigned int local_timers_pending_force_th(void)
 {
 	return __this_cpu_read(pending_timer_softirq);
 }
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index d5a66f54d70b5..289e308d2d46c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,8 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/preempt.h>
+#include <linux/irqentry_hardirq.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -76,8 +78,9 @@ static __always_inline bool arch_in_rcu_eqs(void) { return false; }
 #endif
 
 /**
- * enter_from_user_mode - Establish state when coming from user mode
+ * __enter_from_user_mode - Establish state when coming from user mode
  * @regs:	Pointer to currents pt_regs
+ * @hardirq:	Whether to establish hardirq lockdep context before tracing
  *
  * Syscall/interrupt entry disables interrupts, but user mode is traced as
  * interrupts enabled. Also with NO_HZ_FULL RCU might be idle.
@@ -95,10 +98,13 @@ static __always_inline bool arch_in_rcu_eqs(void) { return false; }
  * done between establishing state and enabling interrupts. The caller must
  * enable interrupts before invoking syscall_enter_from_user_mode_work().
  */
-static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void __enter_from_user_mode(struct pt_regs *regs,
+						   bool hardirq)
 {
 	arch_enter_from_user_mode(regs);
 	lockdep_hardirqs_off(CALLER_ADDR0);
+	if (hardirq)
+		lockdep_hardirq_enter();
 
 	CT_WARN_ON(__ct_state() != CT_STATE_USER);
 	user_exit_irqoff();
@@ -109,6 +115,11 @@ static __always_inline void enter_from_user_mode(struct pt_regs *regs)
 	instrumentation_end();
 }
 
+static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+{
+	__enter_from_user_mode(regs, false);
+}
+
 /**
  * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
  *				 to user mode.
@@ -317,6 +328,12 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
 	exit_to_user_mode();
 }
 
+enum irqentry_hardirq_state {
+	IRQENTRY_HARDIRQ_NONE,
+	IRQENTRY_HARDIRQ_APPLIED,
+	IRQENTRY_HARDIRQ_REJECTED,
+};
+
 #ifndef irqentry_state
 /**
  * struct irqentry_state - Opaque object for exception state storage
@@ -324,6 +341,8 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
+ * @hardirq: Encodes whether the current staged hardirq-count attempt was
+ *           applied.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -338,9 +357,32 @@ typedef struct irqentry_state {
 		bool	exit_rcu;
 		bool	lockdep;
 	};
+	u8		hardirq;
 } irqentry_state_t;
 #endif
 
+irqentry_state_t noinstr irqentry_hardirq_enter(struct pt_regs *regs);
+
+static __always_inline struct irqentry_hardirq_cookie
+irqentry_hardirq_count_state(irqentry_state_t state)
+{
+	struct irqentry_hardirq_cookie cookie = { };
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	cookie.applied = state.hardirq == IRQENTRY_HARDIRQ_APPLIED;
+#endif
+	return cookie;
+}
+
+static __always_inline void
+irqentry_hardirq_count_state_set(irqentry_state_t *state,
+				 struct irqentry_hardirq_cookie cookie)
+{
+	state->hardirq = irqentry_hardirq_count_applied(cookie) ?
+		IRQENTRY_HARDIRQ_APPLIED : IRQENTRY_HARDIRQ_REJECTED;
+}
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -349,8 +391,9 @@ typedef struct irqentry_state {
 void irqentry_exit_cond_resched(void);
 
 /**
- * irqentry_enter_from_kernel_mode - Establish state before invoking the irq handler
+ * __irqentry_enter_from_kernel_mode - Establish state before invoking an exception
  * @regs:	Pointer to currents pt_regs
+ * @hardirq:	Whether to establish hardirq lockdep context before tracing
  *
  * Invoked from architecture specific entry code with interrupts disabled.
  * Can only be called when the interrupt entry came from kernel mode. The
@@ -364,7 +407,8 @@ void irqentry_exit_cond_resched(void);
  *
  * Returns: An opaque object that must be passed to irqentry_exit_to_kernel_mode().
  */
-static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+static __always_inline irqentry_state_t
+__irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
@@ -401,6 +445,8 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 		 * as in irqentry_enter_from_user_mode().
 		 */
 		lockdep_hardirqs_off(CALLER_ADDR0);
+		if (hardirq)
+			lockdep_hardirq_enter();
 		ct_irq_enter();
 		instrumentation_begin();
 		kmsan_unpoison_entry_regs(regs);
@@ -418,6 +464,8 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 	 * in having another one here.
 	 */
 	lockdep_hardirqs_off(CALLER_ADDR0);
+	if (hardirq)
+		lockdep_hardirq_enter();
 	instrumentation_begin();
 	kmsan_unpoison_entry_regs(regs);
 	rcu_irq_enter_check_tick();
@@ -427,6 +475,12 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 	return ret;
 }
 
+static __always_inline irqentry_state_t
+irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+	return __irqentry_enter_from_kernel_mode(regs, false);
+}
+
 /**
  * irqentry_exit_to_kernel_mode_preempt - Run preempt checks on return to kernel mode
  * @regs:	Pointer to current's pt_regs
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 5bc179a88e513..e98313a8ad307 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -64,9 +64,14 @@ do {							\
 do {						\
 	current->hardirq_threaded = 1;		\
 } while (0)
+# define lockdep_hardirq_exit_prepare()	\
+	__this_cpu_preempt_check("add")
+# define lockdep_hardirq_exit_finish()		\
+	raw_cpu_dec(hardirq_context)
 # define lockdep_hardirq_exit()			\
 do {						\
-	__this_cpu_dec(hardirq_context);	\
+	lockdep_hardirq_exit_prepare();		\
+	lockdep_hardirq_exit_finish();		\
 } while (0)
 
 # define lockdep_hrtimer_enter(__hrtimer)		\
@@ -119,6 +124,8 @@ do {						\
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
+# define lockdep_hardirq_exit_prepare()	do { } while (0)
+# define lockdep_hardirq_exit_finish()		do { } while (0)
 # define lockdep_hardirq_exit()			do { } while (0)
 # define lockdep_softirq_enter()		do { } while (0)
 # define lockdep_softirq_exit()			do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 2f5229132466c..9d207c37c5707 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/futex.h>
+#include <linux/hardirq.h>
 #include <linux/highmem.h>
 #include <linux/irq-entry-common.h>
 #include <linux/jump_label.h>
@@ -120,6 +121,42 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	return irqentry_enter_from_kernel_mode(regs);
 }
 
+/**
+ * irqentry_hardirq_enter - Establish state for ordinary hardirq entry
+ * @regs: Pointer to the interrupted register state
+ *
+ * Attempt a staged raw hardirq-count addition before anything instrumentable
+ * can run and record whether it was applied. Then establish IRQ-disabled and
+ * hardirq lockdep state before context tracking or irqflag tracing can invoke
+ * callbacks. The caller must have distinguished an ordinary hardirq from
+ * NMI-like entry and must finish the staged attempt with
+ * irq_enter_rcu_preempt_counted().
+ *
+ * Returns: An opaque object for the matching irqentry exit operation.
+ */
+noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
+{
+	struct irqentry_hardirq_cookie cookie;
+	irqentry_state_t ret;
+
+	cookie = irqentry_hardirq_count_start();
+
+	if (user_mode(regs)) {
+		ret = (irqentry_state_t) {
+			.exit_rcu = false,
+		};
+		irqentry_hardirq_count_state_set(&ret, cookie);
+
+		__enter_from_user_mode(regs, true);
+		rseq_note_user_irq_entry();
+		return ret;
+	}
+
+	ret = __irqentry_enter_from_kernel_mode(regs, true);
+	irqentry_hardirq_count_state_set(&ret, cookie);
+	return ret;
+}
+
 /**
  * arch_irqentry_exit_need_resched - Architecture specific need resched function
  *
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7fc2200392cdf..169c559832501 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -14,6 +14,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/instrumentation.h>
 #include <linux/local_lock.h>
 #include <linux/mm.h>
 #include <linux/notifier.h>
@@ -353,15 +354,18 @@ static inline void ksoftirqd_run_end(void)
 static inline bool softirq_handle_begin(void) { return false; }
 static inline void softirq_handle_end(bool from_irq_exit) { }
 
-static inline bool should_wake_ksoftirqd(void)
+static __always_inline bool should_wake_ksoftirqd(void)
 {
 	return !this_cpu_read(softirq_ctrl.cnt);
 }
 
-static inline void invoke_softirq(void)
+static inline bool invoke_softirq(void)
 {
-	if (should_wake_ksoftirqd())
-		wakeup_softirqd();
+	if (!should_wake_ksoftirqd())
+		return false;
+
+	wakeup_softirqd();
+	return true;
 }
 
 #define SCHED_SOFTIRQ_MASK	BIT(SCHED_SOFTIRQ)
@@ -525,12 +529,12 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
 
-static inline bool should_wake_ksoftirqd(void)
+static __always_inline bool should_wake_ksoftirqd(void)
 {
 	return true;
 }
 
-static inline void invoke_softirq(void)
+static inline bool invoke_softirq(void)
 {
 	if (!force_irqthreads() || !__this_cpu_read(ksoftirqd)) {
 #ifdef CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK
@@ -548,9 +552,11 @@ static inline void invoke_softirq(void)
 		 */
 		do_softirq_own_stack();
 #endif
-	} else {
-		wakeup_softirqd();
+		return false;
 	}
+
+	wakeup_softirqd();
+	return true;
 }
 
 asmlinkage __visible void do_softirq(void)
@@ -703,13 +709,8 @@ asmlinkage __visible void __softirq_entry __do_softirq(void)
 	handle_softirqs(false);
 }
 
-/**
- * irq_enter_rcu - Enter an interrupt context with RCU watching
- */
-void irq_enter_rcu(void)
+static __always_inline void irq_enter_rcu_common(void)
 {
-	__irq_enter_raw();
-
 	/*
 	 * If this is a nested interrupt that hits the exit_to_user_mode_loop
 	 * where it has enabled interrupts but before it has hit schedule() we
@@ -724,6 +725,32 @@ void irq_enter_rcu(void)
 	account_hardirq_enter(current);
 }
 
+/**
+ * irq_enter_rcu_preempt_counted - Finish staged hardirq entry
+ * @cookie: Staged hardirq-count cookie from irqentry_hardirq_enter()
+ *
+ * Finish an early staged hardirq preempt-count attempt, then establish the
+ * remaining timer and accounting state. The matching lockdep hardirq state
+ * was established by irqentry_hardirq_enter() before entry tracing. An
+ * applied update receives post-add bookkeeping. A rejected update attempts
+ * deferred reporting and skips that bookkeeping even if reporting is
+ * suppressed.
+ */
+void irq_enter_rcu_preempt_counted(struct irqentry_hardirq_cookie cookie)
+{
+	irqentry_hardirq_count_finish(cookie);
+	irq_enter_rcu_common();
+}
+
+/**
+ * irq_enter_rcu - Enter an interrupt context with RCU watching
+ */
+void irq_enter_rcu(void)
+{
+	__irq_enter_raw();
+	irq_enter_rcu_common();
+}
+
 /**
  * irq_enter - Enter an interrupt context including RCU update
  */
@@ -764,8 +791,56 @@ static inline void wake_timersd(void) { }
 
 #endif
 
-static inline void __irq_exit_rcu(void)
+static __always_inline bool irq_exit_wake_ksoftirqd(void)
 {
+	if (irq_count() != HARDIRQ_OFFSET || !local_softirq_pending() ||
+	    !should_wake_ksoftirqd())
+		return false;
+
+	wakeup_softirqd();
+	return true;
+}
+
+static __always_inline bool irq_exit_wake_timersd(void)
+{
+	if (!IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) || !force_irqthreads() ||
+	    !local_timers_pending_force_th() ||
+	    hardirq_count() != HARDIRQ_OFFSET)
+		return false;
+
+	wake_timersd();
+	return true;
+}
+
+enum irq_exit_wake_flags {
+	IRQ_EXIT_WAKE_KSOFTIRQD	= BIT(0),
+	IRQ_EXIT_WAKE_KTIMERD	= BIT(1),
+};
+
+static __always_inline void
+irq_exit_wake_late_softirqs(unsigned int wake_flags)
+{
+	bool ksoftirqd_wake_requested = wake_flags & IRQ_EXIT_WAKE_KSOFTIRQD;
+	bool ktimerd_wake_requested = wake_flags & IRQ_EXIT_WAKE_KTIMERD;
+
+	/*
+	 * A wakeup can be traced, and its callback can raise work for the other
+	 * worker. Check ksoftirqd, then ktimerd, then ksoftirqd again. Skip a
+	 * worker whose direct wake request was recorded above: it cannot run on
+	 * this CPU before hardirq teardown, so later work remains visible to it.
+	 */
+	if (!ksoftirqd_wake_requested)
+		ksoftirqd_wake_requested = irq_exit_wake_ksoftirqd();
+	if (!ktimerd_wake_requested)
+		ktimerd_wake_requested = irq_exit_wake_timersd();
+	if (!ksoftirqd_wake_requested && ktimerd_wake_requested)
+		irq_exit_wake_ksoftirqd();
+}
+
+static __always_inline unsigned int __irq_exit_rcu(bool keep_hardirq_count)
+{
+	unsigned int wake_flags = 0;
+
 #ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
 	local_irq_disable();
 #else
@@ -774,7 +849,8 @@ static inline void __irq_exit_rcu(void)
 	account_hardirq_exit(current);
 
 	/*
-	 * HARDIRQ_OFFSET is still set. Only the outermost interrupt handles
+	 * HARDIRQ_OFFSET normally remains set. A rejected staged addition leaves
+	 * an already-invalid count unchanged. Only the outermost interrupt handles
 	 * softirqs, and only if it did not hit a softirq or BH disabled section.
 	 */
 	if (irq_count() == HARDIRQ_OFFSET && local_softirq_pending()) {
@@ -783,20 +859,56 @@ static inline void __irq_exit_rcu(void)
 		 * before enabling interrupts to run softirq.
 		 */
 		hrtimer_rearm_deferred();
-		invoke_softirq();
+		if (invoke_softirq() && keep_hardirq_count)
+			wake_flags |= IRQ_EXIT_WAKE_KSOFTIRQD;
 	}
 
 	/*
 	 * Wake the timer thread even if the interrupt hit a softirq or a
 	 * section with BHs disabled. Only the outermost interrupt can wake it.
 	 */
-	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() &&
-	    hardirq_count() == HARDIRQ_OFFSET)
-		wake_timersd();
+	if (irq_exit_wake_timersd() && keep_hardirq_count)
+		wake_flags |= IRQ_EXIT_WAKE_KTIMERD;
 
 	tick_irq_exit();
-	preempt_count_sub(HARDIRQ_OFFSET);
+	if (!keep_hardirq_count)
+		preempt_count_sub(HARDIRQ_OFFSET);
+
+	return wake_flags;
+}
+
+/**
+ * irq_exit_rcu_preempt_counted_prepare - Process IRQ exit and prepare teardown
+ * @cookie: Staged hardirq-count cookie from irqentry_hardirq_enter()
+ *
+ * The caller staged a hardirq-count attempt and established lockdep state
+ * before instrumentable IRQ entry. Carry any applied count across traceable
+ * IRQ exit. Softirq handling temporarily replaces HARDIRQ_OFFSET with
+ * SOFTIRQ_OFFSET and restores it afterwards. The caller must invoke the raw
+ * teardown helper immediately after return. A rejected staged-add state makes
+ * that helper skip the matching subtraction.
+ *
+ * Return callbacks can raise regular or forced-thread timer softirqs after
+ * __irq_exit_rcu() performed its final drain and worker wakeups. Recheck both
+ * queues after all traceable preparation. Worker wakeups are traceable too,
+ * so order the rechecks such that a callback which raises work for the other
+ * worker cannot leave it asleep. Do not repeat a direct worker wake
+ * recorded by __irq_exit_rcu(); the worker cannot run on this CPU before
+ * hardirq teardown.
+ */
+bool noinstr
+irq_exit_rcu_preempt_counted_prepare(struct irqentry_hardirq_cookie cookie)
+{
+	unsigned int wake_flags;
+	bool do_sub;
+
+	instrumentation_begin();
+	wake_flags = __irq_exit_rcu(true);
+	do_sub = irqentry_hardirq_exit_prepare(cookie);
+	irq_exit_wake_late_softirqs(wake_flags);
+	instrumentation_end();
+
+	return do_sub;
 }
 
 /**
@@ -806,7 +918,7 @@ static inline void __irq_exit_rcu(void)
  */
 void irq_exit_rcu(void)
 {
-	__irq_exit_rcu();
+	__irq_exit_rcu(false);
 	 /* must be last! */
 	lockdep_hardirq_exit();
 }
@@ -818,7 +930,7 @@ void irq_exit_rcu(void)
  */
 void irq_exit(void)
 {
-	__irq_exit_rcu();
+	__irq_exit_rcu(false);
 	ct_irq_exit();
 	 /* must be last! */
 	lockdep_hardirq_exit();
-- 
2.39.5 (Apple Git-154)


