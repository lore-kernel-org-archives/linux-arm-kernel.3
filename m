Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FUCc9uz7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BBXRcQrq;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j0RzxcOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=; b=FUCc9uz7RFMlqi
	nTL3dRq0hdu8jlUL4BgRso3cQuBUwYaAB+vA4Rs4SJxGGm1uWUTSKDOg2g1SHu+gI59Wdi7IJn+Mc
	sG2Zr9wBsDy9cdKhf9AKR2oUeNMQGRk4GIGMEGCFKuQfLTe18wHxPXGx4C9Z9j8umdp/CaK8SJkTo
	tqOjPrGWQAKH5NtR4L8xyjp3DrF8MPJjqdL9Y3NwsDhiXtfwueWLH8wo9+k4lXR7ZfQkiYJBcDTwH
	S6v9yHhSVhs4BtjEq9Xgrkf+HzsU4V9ENfRDib2Bkd8mIjLccO7VyxKu75f2rIS/nscOub2Q2Zg2T
	9zSptIwVZIhPu7yff4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOr-00000006DOc-0btV;
	Wed, 28 Oct 2026 03:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOa-00000006DA1-2phG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Oct 2026 03:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=; b=BBXRcQrq/DMyNbcslleZ3A5ATQ
	9PlPIu/9C8Uv6gN9Zogjx9TROmQ76gTtexXkR577i5LoZN8kPTLxlkQwQSG0lXIEQWKR00d1Lv1qF
	IsSsddZWEXozPPY4vGH3YiCOpCtxx/qopDEvy/biiUOvTaW5iEQ+rocCqz4DzJPgQR8SyZk/wlc2L
	zhQSz08WbWEndi+0G3ykWxBglZbOyc+Cs0sbqqVidluCjP6DxQ+hU6XMJSItzVwllVczk8AE9iuOL
	nBP/yKqdi9Cav+9btZlnCkCZk8+q/Z+vKhq15yjeFvDhFGlxsnYR8WTpcPDDNe4PQHp0j8AaLsjDG
	nDyzkHQA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOU-0000000Fem8-2qQm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48df54150dfso285869f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158324; x=1793763124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=j0RzxcOccjFlHuLTHx35qKle6Z8KiH2kpHbdz8DFnxcTIGj9YVRjgIpKlhyx1u9Qi+
         6bRrF/xS0FlzGQoy4Qrq1ny5Js319OtdofjpygeOxvDLHvngv1iBUNewr5UOStShbFfq
         CO28S2Xy8qHzhVlhRlkFG+bFSNemogAnCrUhO8omTwO2F/Yi1zSgSAqASiIa88nR9ahR
         Is5MfNpCU2qdoLgkPdN6dmw69U+X03Pd/cQ0B1PV5CJ76IOm74f0pWETFdAEcPf8nvQn
         J7PohxlftYrOK+sPL6dMNruTdgsTypsXiEUEukItSq1JRKPtuR+YfKyNj2YFdNsqe1hV
         2nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158324; x=1793763124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=c5zVNESgQ70bX1aWSikmXFiVYUC6eDP3ObmM8FylMPbzaGyjp7gvEiorrQQKMZGGg/
         6On+uZH7fdY6ViQxCs5BZW/pnVWM40rg7kOSEtGpTLKzFDEBrrMhum/c0kbaXItHUj7d
         OS4NROmnO+tS7Pygt0n0m+3+SGBSWp9pWhJFsnNjgq2lcl2X3LKcjDqchTp4EqsClVcv
         xcv+yp4JWBAAXosilAnQWOxyC3Kx/VmcxPlvvnxA0/plz6bqTSmV3JG0CJIU/332kHgn
         taiA1gNGFpHAqhtoKphqBn2FaRKOnH2N3637GzVQJkS9oASkxqWsDS2hAayvBkrzcNTx
         juew==
X-Forwarded-Encrypted: i=1; AKwUvBzU1oKubIVyjpEdGN/Kqn44ooUGsPK/A1EiGrZG05u3seigjsFOEqGm0lToxyXqxJmefn30iMhS85r+Z8eI1wLR@lists.infradead.org
X-Gm-Message-State: AFq9FYL4dSsbmR69yAvVsvYi6pxNXRoKfJ9tWTzkAm6yaC5Tl3yowzlJ
	P5uuzSEt/tdnFMmJhi8xsouZwEB884futD6Ybkypz6rctQKt8TMxQ+kn
X-Gm-Gg: AYBFou10IB96IAt+ms2a/jGuRwBN3f3tqLQyIcC4Igk2lZJLPaksg4Y3JD5gHCI4baQ
	I/O68kpxrjlGdckdDzEUsg6yqkZkpUSIfrbJRSKyqFkJg5K0sbLUAx7NZot3yvNt2GxLHH6NMS8
	cSvwrvuxiZxqJgSzvl2I0uhX4CtgIAyDY66IGlVpFoSNOwlptPx7la3iCaOkwbZMyl/wmOPanrI
	yowrDFwVWFY3ZqIAee2XCCK7zyClyC9OfaThaqElFVzkPwpudSWUeoIYL/Uay27BcjBQbFwOqwt
	LrEXe3k305HXtoadzCW7Bv3FnA8ogX5UWsdDaJWRGKkjDimvcSThKWG9+ml3RcDrbdBm+7Ui/mj
	yqJZAXgIuFadkoYVuSl0HX2/Y/kLF8VNH9rM0aegkX0Q69fP3muxzn0R3vyJZ9R9ctLwMX0BEwL
	yHU+YfJwQ4XpKDGW9YtWatiZDOkyVQf+OcCi+EBjMIm+MjhxnoRpLOK0gapTLTob+uuNdBeG9Wx
	vKP00ar/DUqM6t84S3//BUMw4Z7bTZdmto5ZuTR6NzapJF8M6vFwX4UdEP6W1OXY7hvMlSQsVU0
	KnEXFwIIVkKUZNFGNLK/fZD5TGzBKx/SHkSTo/Z4kzytcvSYMn01BkdJ1ItXzpcn8ugvJBde5sa
	lq/hQCNqgOu2zlRVwglrG+/6VL5uMoWqwE/Vf2QVs7rSKLLgerT/tXfyfnJRhZUaIBO7NejaIJK
	8ut0rWdbHg94jrrz+UQQch3xz++fUkLshT
X-Received: by 2002:a05:6000:46d9:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e5d567dd3mr1945784f8f.2.1793158324146;
        Tue, 27 Oct 2026 20:32:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/13] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Wed, 28 Oct 2026 04:31:22 +0100
Message-Id: <20261028033127.82193-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_033206_847329_58083293 
X-CRM114-Status: GOOD (  18.89  )
X-Spam-Score: -0.2 (/)
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
hardirq return tail needs to retain synthetic hardirq nesting through
traceable IRQ-on preparation. This keeps callbacks classified as hardirq
work.

Factor the common preparation and add a return-tail variant which requires
the synthetic hardirq context to be present. An interrupted outer hardirq
can contribute additional nesting. Keep the ordinary helper restricted to
zero. Neither helper changes IRQ or hardirq state. The caller must remove
the tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 43 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 12 deletions(-)

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
index 01dba8fb32a90..2ecd506715fa7 100644
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
+static void __lockdep_hardirqs_on_prepare(bool expect_hardirq)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant requires its synthetic context, possibly nested inside
+	 * an interrupted outer hardirq.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(!!lockdep_hardirq_context() != expect_hardirq))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,34 @@ void lockdep_hardirqs_on_prepare(void)
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
+	__lockdep_hardirqs_on_prepare(false);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the synthetic lockdep
+ * hardirq context covering an interrupt return tail is still active. An
+ * interrupted outer hardirq can contribute additional nesting. The caller
+ * must remove the tail context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(true);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)


