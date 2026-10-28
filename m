Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C4E606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SVa+I1KY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BxdVwD5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=; b=SVa+I1KY8CSTZ+
	VMMY4jvjH0kNHvNUQjIqLaoo0PkE9SkyB24WFVz3R26zGZxTccMfn7+La/qhRrNlJ2ZK9pq1euuJ8
	fX25LZ8zJZAMJFOU55v1UDbSAb6/aWerrsuqYqgDGVis//QOB3F0bV2FiHDNe30m58aKJlinfoWvf
	BAdLYoFmhQhxpJcMOlcO691SuKMgbZVWOwE8tJ7KT8kBMWWWfPLCGoAJH+UjyZ3VoG2ZL3r8v3Np6
	rCchljMvBDz+34wAfuT4swf77aPXCwcZkuFsYnEOXQ786LflF62xv0eO1V8EKht9pI1d1J4K1EaQU
	j6dhxGgALOTCznPH82JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOT-00000006D4K-3OYZ;
	Wed, 28 Oct 2026 03:32:05 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOG-00000006CxJ-15Ee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:31:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so381935f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158310; x=1793763110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=;
        b=BxdVwD5LrmoW/BLtuSJ7uxvZ+/d3HYmLDP0xPYNsFFHu4MV0y7SWrWT+n97K2zrOg/
         O2zux2ebYRNOZiEQPgMIfTz4JNYXNDZc0qwkfl7OeFB3vJ8ze2TeTTiXLV6Hg5VPN0/W
         7s3d67vx12UEpxIUmuOB6Zy5A0zGIWGpkoIVE7smEnEN060Eu60ooscQeNbos7g++eVS
         1Ap8l9z33bZ97wlT/aMS3pgvZIk5ohbfiymr5mk+hN9Z8L6sn269BXdW//4hucSWCjUr
         mQqCTOyGaJJFM065Fkc+yMU1jV1lrBqICUn2SdzC0GPLePqgH5DGs8QI0wAdSqeXvUw5
         1Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158310; x=1793763110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBw/L/ygxWFW2P1pTYoVf3ArkDdn4roU8ZXqmZMF7LY=;
        b=gQUs1v3xRpjvKhH4IXn+ChyCl3hbTD33H8pR+Jq/K+FCahuXySte84cic7YaucMS4t
         W2VIIejUdy/zeCh6+eNlI40QnvgF/ARA2T6R+vX98nj479ZRJu7vnoNJicKLxkt15EY7
         1WGqOU+f/bj9ZbU/xEHXgL8tP4DNpWdS0bIR0PAfIu1FjOzTLnNhS6eAnzlas8Ha4gcT
         czjzHTRjWJfPrprIskC/wT6tIVeOfSfFj+R5zVYfJvUgzeoEqplMUPrABqDtJTIduHEh
         iU1ytzMzNQ6I1NjE1g8jWrMtHKG/7iJ8zowoe1MrLNZyjuolxGCn3CUxAjjnYQeSQaoC
         BFIA==
X-Forwarded-Encrypted: i=1; AKwUvBxC7CZlJWtmhTp956ss5fH93JMN3beJk9jWeFmyJWPja5N7H6ewcUjT2u7FVAvSTOrWVTAmU2+e3pjBWFNDvDO+@lists.infradead.org
X-Gm-Message-State: AFq9FYLqAROkmjLY78ufmsCcLmOTZZn3KFHILEh5L/giBTRi6E3HYOGM
	abMyc2cWlPwouR897pir8hsXAG15Qj1gEoMuFEXKrUXse+7IiWo+FhcR
X-Gm-Gg: AYBFou1l9qRT8dLD/qRqDUXuJSfXBS+eNJ10Ltqg1H1V8MA/A8dd/iHsXLye8VYZ4RS
	mzYb/dCfJg98VZHUPdgPqivuzaAcW5dk0JO/MUWWajuoOZKmW32kotozU3LDGXLlVNVg0uFfro1
	9DeikfGnscjS97S5qu66y3ewzcJRbRh8TH6FPe06NHybhMguvf/zaDs55GQTRz81fieQR+Zr56P
	v09ueL0JLEKXQG5IE1mM6SoSwi8WC2Q2v1AjKSRikDLrQVfuPT5Th24WFJ2CBJans9I5GRCeXuS
	bKN3t5fl2cg79aFP35hrT4TBgCcDO/qGnqH+nMErTuFrPaW3Mbuie4piot/Sv2/eVlbOjJXk6Be
	uauqaYEcXQavas/jLrN85jUUdHXBmEmyF4gRYnW+oPAw8Qiu2N9ipqz9FBH0IIW9vjRnHNGqlY8
	zqMVB7MMjPrJtDg/HAh6WbqKDv2kT2F8g5Ip0HYYc2KBwvT9iBJkY2hHCL/8reODaX0YzKXYvFR
	RWLaAmNWOP+6kVNFcXC8/bfvmwzVjxAHKuuRhkQXS/JYtAjB2YJAUp3JN/7O+tpxxGu66d2kt9x
	JnyfHRA6mMRSDqzlIFbvhi9FeL9cbdqSjFMwsgqYj4NYgixMhNIzORg6yfk4MsFlD/OxhVabIZl
	3BkcE+H2fQxPUy1DZdyGN3U/D2ewC5CFd6+2G246ZGPFrhgY7xkvSKoBTbAqPtwXf32gaGKgomF
	zKI00pD3tORNBdsokdY8BQ7eA7DhmnOCsa
X-Received: by 2002:a5d:4f07:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e5d312c2bmr2026606f8f.52.1793158309691;
        Tue, 27 Oct 2026 20:31:49 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:48 -0700 (PDT)
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
Subject: [RFC PATCH v2 03/13] sched: Split preempt-count bookkeeping from raw updates
Date: Wed, 28 Oct 2026 04:31:17 +0100
Message-Id: <20261028033127.82193-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203155_621576_84AE86A6 
X-CRM114-Status: GOOD (  28.71  )
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

Very early hardirq entry code needs to update the preempt count before
instrumentable debug and tracing code can run. Conversely, hardirq return
code needs to finish instrumentable validation and latency tracing before
raw teardown.

Add a small hardirq-entry header with irqentry_hardirq_count_start() to
stage the raw HARDIRQ_OFFSET addition and record whether it was applied in
an opaque cookie. With DEBUG_PREEMPT and without separate reschedule bits,
route an already-negative count through a noinstr slow helper which
preserves the existing DEBUG_LOCKS_WARN_ON() oops short circuit. Add
irqentry_hardirq_count_finish() to report a rejected addition or complete
post-add debug checks and latency tracing, and add
irqentry_hardirq_count_sub_prepare() for validation and tracing before a
raw subtraction. Keep preempt_count_add() and preempt_count_sub() behavior
and ordering unchanged.

Keep latency tracing in each calling path so CALLER_ADDR0 identifies the
caller. Force the start and stop helpers inline because trace provenance
depends on their stack frames.

Assisted-by: LLM
---
 include/linux/hardirq.h          |   1 +
 include/linux/irqentry_hardirq.h |  81 +++++++++++++++++++++++++
 kernel/sched/core.c              | 101 +++++++++++++++++++++++++++----
 3 files changed, 171 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/irqentry_hardirq.h

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 2648c49cd8f6c..dcbda3c1d5636 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -4,6 +4,7 @@
 
 #include <linux/context_tracking_state.h>
 #include <linux/preempt.h>
+#include <linux/irqentry_hardirq.h>
 #include <linux/lockdep.h>
 #include <linux/ftrace_irq.h>
 #include <linux/sched.h>
diff --git a/include/linux/irqentry_hardirq.h b/include/linux/irqentry_hardirq.h
new file mode 100644
index 0000000000000..1937fc972e846
--- /dev/null
+++ b/include/linux/irqentry_hardirq.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_IRQENTRY_HARDIRQ_H
+#define __LINUX_IRQENTRY_HARDIRQ_H
+
+#include <linux/preempt.h>
+
+struct irqentry_hardirq_cookie {
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	bool applied;
+#endif
+};
+
+static __always_inline bool
+irqentry_hardirq_count_applied(struct irqentry_hardirq_cookie cookie)
+{
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	return cookie.applied;
+#else
+	return true;
+#endif
+}
+
+static __always_inline bool irqentry_hardirq_count_valid(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	/*
+	 * Without separate reschedule bits, preempt_count() excludes any
+	 * shared reschedule bit. A negative result therefore denotes an
+	 * existing underflow.
+	 */
+	if (!IS_ENABLED(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS) &&
+	    preempt_count() < 0)
+		return false;
+#endif
+	return true;
+}
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+struct irqentry_hardirq_cookie noinstr
+__irqentry_hardirq_count_start_slow(void);
+#endif
+
+/*
+ * Attempt the non-instrumentable part of a staged hardirq-count addition and
+ * record whether it was applied. The returned cookie must be passed to the
+ * matching irqentry_hardirq_count_finish() and subtraction preparation. A
+ * rejected cookie attempts deferred reporting and suppresses post-add
+ * bookkeeping and the matching subtraction regardless of warning
+ * suppression.
+ */
+static __always_inline struct irqentry_hardirq_cookie
+irqentry_hardirq_count_start(void)
+{
+	struct irqentry_hardirq_cookie cookie = { };
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	cookie.applied = true;
+	/* DEBUG_LOCKS_WARN_ON() permits the addition during an oops. */
+	if (unlikely(!irqentry_hardirq_count_valid()))
+		return __irqentry_hardirq_count_start_slow();
+#endif
+	__preempt_count_add(HARDIRQ_OFFSET);
+
+	return cookie;
+}
+
+#if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
+					defined(CONFIG_TRACE_PREEMPT_TOGGLE))
+void irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie);
+bool irqentry_hardirq_count_sub_prepare(void);
+#else
+static __always_inline void
+irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie) { }
+static __always_inline bool irqentry_hardirq_count_sub_prepare(void) { return true; }
+#endif
+
+#endif /* __LINUX_IRQENTRY_HARDIRQ_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8ca..7e2da8fc32b6d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6028,7 +6028,7 @@ static inline void sched_tick_stop(int cpu) { }
  * If the value passed in is equal to the current preempt count
  * then we just disabled preemption. Start timing the latency.
  */
-static inline void preempt_latency_start(int val)
+static __always_inline void preempt_latency_start(int val)
 {
 	if (preempt_count() == val) {
 		unsigned long ip = get_lock_parent_ip();
@@ -6039,6 +6039,62 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
+static __always_inline void preempt_count_add_debug_checks(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
+				PREEMPT_MASK - 10);
+#endif
+}
+
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+/*
+ * Preserve the DEBUG_LOCKS_WARN_ON() add-or-reject decision without invoking
+ * instrumented reporting from noinstr entry code. The caller reaches this
+ * only after observing an already-negative count. Recheck after testing oops
+ * state to retain the original short-circuit order.
+ */
+struct irqentry_hardirq_cookie noinstr
+__irqentry_hardirq_count_start_slow(void)
+{
+	struct irqentry_hardirq_cookie cookie = { };
+
+	if (!READ_ONCE(oops_in_progress) && !irqentry_hardirq_count_valid())
+		return cookie;
+
+	__preempt_count_add(HARDIRQ_OFFSET);
+	cookie.applied = true;
+	return cookie;
+}
+NOKPROBE_SYMBOL(__irqentry_hardirq_count_start_slow);
+#endif
+
+/**
+ * irqentry_hardirq_count_finish - Finish a staged hardirq-count addition
+ * @cookie: Result of the matching irqentry_hardirq_count_start()
+ *
+ * Attempt to report a rejected addition and skip its post-add work, or
+ * complete the post-add debug checks and latency tracing for an applied
+ * addition, after an entry path had to stage the update before instrumentable
+ * code could run.
+ */
+void irqentry_hardirq_count_finish(struct irqentry_hardirq_cookie cookie)
+{
+#if defined(CONFIG_DEBUG_PREEMPT) && \
+	!defined(CONFIG_HAS_SEPARATE_PREEMPT_RESCHED_BITS)
+	bool applied = irqentry_hardirq_count_applied(cookie);
+
+	if (!applied) {
+		DEBUG_LOCKS_WARN_ON(!applied);
+		return;
+	}
+#endif
+	preempt_count_add_debug_checks();
+	preempt_latency_start(HARDIRQ_OFFSET);
+}
+NOKPROBE_SYMBOL(irqentry_hardirq_count_finish);
+
 void preempt_count_add(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6054,13 +6110,8 @@ void preempt_count_add(int val)
 		return;
 #endif
 	__preempt_count_add(val);
-#ifdef CONFIG_DEBUG_PREEMPT
-	/*
-	 * Spinlock count overflowing soon?
-	 */
-	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
-				PREEMPT_MASK - 10);
-#endif
+	preempt_count_add_debug_checks();
+	/* Keep latency attribution in the preempt_count_add() stack frame. */
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6070,13 +6121,13 @@ NOKPROBE_SYMBOL(preempt_count_add);
  * If the value passed in equals to the current preempt count
  * then we just enabled preemption. Stop timing the latency.
  */
-static inline void preempt_latency_stop(int val)
+static __always_inline void preempt_latency_stop(int val)
 {
 	if (preempt_count() == val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6086,15 +6137,41 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
-		return;
+		return false;
 #endif
+	return true;
+}
+
+/**
+ * irqentry_hardirq_count_sub_prepare - Prepare a raw hardirq-count subtraction
+ *
+ * Run debug checks and latency tracing before an entry path performs a raw
+ * preempt count subtraction after all instrumentable code has returned.
+ *
+ * Return: true when the caller should perform the subtraction.
+ */
+bool irqentry_hardirq_count_sub_prepare(void)
+{
+	if (!preempt_count_sub_debug_checks(HARDIRQ_OFFSET))
+		return false;
+
+	preempt_latency_stop(HARDIRQ_OFFSET);
+	return true;
+}
+NOKPROBE_SYMBOL(irqentry_hardirq_count_sub_prepare);
+
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
 
+	/* Keep latency attribution in the preempt_count_sub() stack frame. */
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }
-- 
2.39.5 (Apple Git-154)


