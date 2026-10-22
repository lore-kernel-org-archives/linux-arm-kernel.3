Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8330606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ijpkDbqp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iDHWkJ78
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=; b=ijpkDbqp5056jjJ21n/TsxGCB7
	Bs9ZnzYu0Avb5aGGH1s3cYVj5MQJ/rrwqErRUJG6Alf587Stkx5oxqLTguFkTR+V4qAPFOiedkKqT
	sTEscYBgrFIArClLIQKzN+uWgxIIanb2Pi2VqbjIA1V+AK8X7pjXYqAti0M0YGle7M0DTUFWW/3I/
	PxiXGk2hRqbg1IoTE8vWTMkO0pooQ2lh83ssWuh9hn01xijcqUNwX9GI6PGGNw+/JzQR6GZnc5dUj
	vS5El5Cn3BCwBlx6QMcdRpoIAecogga+dL+ejxwK39gYdVj9inKbMfPVpYW5r+gG/rXeQJUGUlpHC
	7NQbkzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBL-0000000DMMM-2Ccq;
	Thu, 22 Oct 2026 05:17:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBE-0000000DMHT-2ehm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso15954125e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646251; x=1793251051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=iDHWkJ78r71qoYsPmQP9bqGNASMTJkIJaHxWzxWm4JRkhfWNoLb7dVbFxXuRyiYoZH
         VqefRxDFQkbgsHgkt5T6Ah1Cswv1AEumwTWSCOlRGAWdCdZummm/hxUunsAvmnHUFI7/
         RuKTw0eAkheoktAI7m7OHg4XWqGkoIlCwzjsUoB3KxWfq9B8Km+r4JOupxDwHR385ctx
         Dl89Ca/RdDuZa6O3vmgtGGu+AcWpzWfkthLrp2I0vpeMgPtnolRj6meqzbovwgli59dP
         v3qZSBiVTQbETNNxrKFeHh0NxCmgsA5lbtc9hx9AoueZQoq8iKMXlpwnwtviw9hhf7Ri
         XEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646251; x=1793251051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SgSVPju/oDwYCUMu1qXQuK1g6vGXDkUziO98RSaFsPc=;
        b=oqvyp9hofFuOawxxUz4pvbP7+zXG9R0W/slexSiTiU5ubuNnnI5av3LLqBtK6YxRJ2
         D1rmdD+eeT6+gqJMG3AYghnUt0Lw9Yq8Ejf78Ea+S3mdu5mwBDjnbXNF9noalnfxJDpf
         uMMfltMYj5voY1AmeFc1L2oh82HyViZuc7SuqIjIIFvwXOAjjkp4xnKE+LRQ8pFr+chJ
         jlrlFTNZDLooD6UAhkiLT40wLU7OXXHwY7J4RqYpyS0XunPPvL2b2rYv9rZQQ1dHRMxT
         NO/XnMRcNAkM9hqyaWJIsfAoi/9cCVduaKkYQ++H6V1awJqma2Qt+LSPNWY1aAnkSU6d
         QeKw==
X-Forwarded-Encrypted: i=1; AKwUvBzh0tT2mfaC+gZVNA7SK5HbeCeNlz3467sWg9z7wndvWTzUuCAL4qTp/kt68/QfH92VsklLSi0Qgr+c4UfCz6PL@lists.infradead.org
X-Gm-Message-State: AFq9FYLmKZlb70ZkXYdZsX4irGUprFF4ycTVPS21eBIIrTlixwPclLwN
	dujxXsm74ZFiEfA6/Bi3joJaUWgH2/XvR9We2mIx/HY7fAqMw3i14bF1
X-Gm-Gg: AYBFou202w/HGWDRgQCtnnFLt8DBPk7IpTbgIrAI4wiS1ru9IEwH55bAbCF3z+kGTfT
	CSex9ciBJBZ6Q8LIZWP9aFl5boN0XMK3+J+zyHTMFoMvFXxQFKK191fLnWUYLNJcba0VQ197mCo
	eKB40KCj/Fw9P5gkbZZ432evXF9MnYI1YA7D6CSXZvXzORZqCt2NaeJspmrMyT58t+sLAWdjuCQ
	FkWGW5QYmSYo8dpWT+wOVPz5e5ZlZ+zWXvMxvHJgBIwe2bv5SnzJuPHcfNbUkO4O3rpv5uWDcR6
	NrMo/lL4mkHbT1+GMQ4lgok9r8gxc8H/qwEGFH+56eJQM/lUQ5K8NwEuyLqkjWJZH202MnXHeQ0
	xuBC4Ro9pZwoiAiKi/L2rVvZGvKawhrnNoVMS0IDH3Ibap9upfR89t+DyHQQ/QPTVZJKpJ7tUyB
	lhuPIzI7ctXxWXHHJslh9Rbvke6Q72gVhHIS5Nh87aR4GPElYyHEA3oxpeOhMOH7pDPQNFJlHXf
	EKxkpsRe/ggN2BxTb5VBymfYdcMRcH1Mf0aaZHGT6dnFeRPd37UVAuu50CF2KriKdOK8h18ynNV
	mRHbaPF3br3gR/6k4J9qhC3G7cJ49ddXEDVVMorZEwsduaH0hgXnA7KtBij/O6Sacv08Vo29Hsd
	0DP3EvewCGshMS1D9FCCMifGpvTsYiRjIb/PNlitfqB94bPKhg6xMSv3cNoA=
X-Received: by 2002:a05:600d:8653:20b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4a205ca7975mr15129905e9.4.1792646250340;
        Wed, 21 Oct 2026 22:17:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:29 -0700 (PDT)
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
Subject: [RFC PATCH 06/12] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Thu, 22 Oct 2026 07:16:48 +0200
Message-Id: <20261022051654.79224-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221732_706003_ED3102CD 
X-CRM114-Status: GOOD (  17.63  )
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

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain one synthetic hardirq nesting level
through traceable IRQ-on preparation so callbacks remain classified as
hardirq work.

Factor the common preparation and add a return-tail variant which accepts
exactly one nesting level. Keep the ordinary helper restricted to zero.
Neither helper changes IRQ or hardirq state. The caller must remove the
tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 42 ++++++++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index e98313a8ad307..c7601a173e55b 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -25,6 +25,7 @@ struct task_struct;
   extern void lockdep_softirqs_on(unsigned long ip);
   extern void lockdep_softirqs_off(unsigned long ip);
   extern void lockdep_hardirqs_on_prepare(void);
+void lockdep_hardirqs_on_prepare_irqtail(void);
   extern void lockdep_hardirqs_on(unsigned long ip);
   extern void lockdep_hardirqs_off(unsigned long ip);
   extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
@@ -33,6 +34,7 @@ struct task_struct;
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
   static inline void lockdep_hardirqs_on_prepare(void) { }
+static inline void lockdep_hardirqs_on_prepare_irqtail(void) { }
   static inline void lockdep_hardirqs_on(unsigned long ip) { }
   static inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 01dba8fb32a90..457bef3ea1689 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4395,15 +4395,7 @@ static void __trace_hardirqs_on_caller(void)
 		mark_held_locks(curr, LOCK_ENABLED_SOFTIRQ);
 }
 
-/**
- * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
- *
- * Invoked before a possible transition to RCU idle from exit to user or
- * guest mode. This ensures that all RCU operations are done before RCU
- * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
- * invoked to set the final state.
- */
-void lockdep_hardirqs_on_prepare(void)
+static void __lockdep_hardirqs_on_prepare(unsigned int expected_context)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant permits exactly the synthetic context it is about to
+	 * remove.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context() != expected_context))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,33 @@ void lockdep_hardirqs_on_prepare(void)
 	__trace_hardirqs_on_caller();
 	lockdep_recursion_finish();
 }
+
+/**
+ * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
+ *
+ * Invoked before a possible transition to RCU idle from exit to user or
+ * guest mode. This ensures that all RCU operations are done before RCU
+ * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
+ * invoked to set the final state.
+ */
+void lockdep_hardirqs_on_prepare(void)
+{
+	__lockdep_hardirqs_on_prepare(0);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the single synthetic
+ * lockdep hardirq context covering an interrupt return tail is still active.
+ * The caller must remove that context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(1);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


