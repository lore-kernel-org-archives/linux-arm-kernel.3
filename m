Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE6760A2607
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SQAlUPPC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZLAX98fq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=; b=SQAlUPPCsY3gCs
	lggKUHgAcsNBAiBP/mQf1TxbMbZXTDeHRrE6epzeDCzm/fwt55skd9mYMBrtCTswqyZ8jxhaGB2Um
	NLd3nXTrLlWJWxVy2kieqeoF75jBrLjhpBI1sxbm7v84mXxUkZGBM8issKueYIt7RcH7+83vGCAab
	/oKho2VxftQirggpBIU33XS173PVxcSMbguzerzcEL7LU+roTsPrdOJO76eBBOAJzozn2ameMDSCd
	MBr8pwuDtPgzvJq2ikTPBzY8j1jsUKqgzWR0h7WG337IBdPLSN/l2civeArma4oXoQyGysXdZi1xw
	iXNTd60iiwKKB/tUXfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOT-00000006D4p-3sGC;
	Wed, 28 Oct 2026 03:32:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOJ-00000006Cy7-2gR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:31:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48df4f540ebso224096f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158313; x=1793763113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=ZLAX98fqykqVZhtEnE1Fv2mE7LIKBE8ysdwKCcuv+BxJUYwtxnMetZ7iSE3sbcfWc4
         uqBXX8wawyg+FbUqmyTQ/wxMXNeJCIr5TTu4Kn2YuM9kPnPLXrSyZCDz4pqGSGr0de6N
         TTaZ071n7HfY7wX5BgwsbV5C//0Oz6RNMg+JRP+2vN20tNb4Jcmo1Hzyo0cZ8u9gRvFs
         QvSe41mbe4A0Wrtl2zyA2LQUMvok64jnI2XwEKKnNx9WVwS0cJscDaklJk0CqfmkGC8O
         pDyW22sGSo+gP/tc0jA1lk3HvoAcQYhiWzA4GOJIAPMR1vRw0mNZrDvxO/5CBqhjVX+i
         Ixvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158313; x=1793763113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bZvL/9Bc8+ZGmd5br85IbVSWoa0e2ud1GyeOTF2PTQ=;
        b=YertXhmgJ4yP9eDlRYa6ZnvWHFA8iyAvTCsn02gZxWwHwxEOoqf8VgZSZ3IOoY3Ips
         bWIYDz4EgmNzTvJJBkKy/3TgaIfvIfLpvV0I7uT6x5dgkZle4QGwMOLLC/17/rMtw0kO
         6axd/1dJ+l8bkln6kZD0tUBHBmKCqmQKVcvXk6x7OyNTOI6IzXl8uH0a3/+hP95SVCxR
         duu13/thuP/biv1R58MVfvZjtoacxOmUcUm94HAML2wpVkltZRnsD7eVM/+lt94Y5vpR
         vv50t+S8C/mTKEtcLF/zovVlXrw7LgZe5lb9GuNsbxcNhudsyMfmAjfSG9w0TwpnzyOB
         c/CQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1TD2DcFw61QS2bAoDHQj/2SbhdAM25HY5LpjUvGOTZXJCuGHO53H5uhZafTbNGljBlZ52QfsOTzhEaDGV1oqb@lists.infradead.org
X-Gm-Message-State: AFq9FYKd9vSc1bpxMwdOlai//Vex+qbLwTR9NfnbAUboEi2naFy241rr
	QmTGVA6OUZ6pi4rcwagnhHhoI215vC0C48Uqfrc3YpMlo0YspE8WC8kD
X-Gm-Gg: AYBFou1z5AYdHD1k3EGXwgFdCygjdH2mSpSN4EqQBHibGmmnUeqlXLQ/HwmLKB5Y9IY
	O+dmLXzg7cowNV5f4js0HLiB1AhZKCizJlp3tIPZNH2W+Rdg2o2UXx0Fes6pygF/PcgZIlkJy7d
	C3FW2KWWsuxamwAa2H5mgowVv6nyjb2ZAJI5WTu9cZdbNvZ/ICsUQZhfFPJcp5D/hqwH/YerMkZ
	RkoYC53v3VUbn6wm3gUBycNq9PLmb9NABVQwoAjRlJH4d7f+81clLjAa0zQdNMoR9IwZXtx68N/
	chywJJWjaKsx+nsCmRUHz7zzcCpkCCNABFnO0Fa5bm7dERz4tnQVu6Jt4AyZJ9HVpxOSOW0UICV
	mlTkoSW7GOukGe2sOUlfyWawTEik+65eDiPQl9himckR66Wk+hxZJkbmepdK+TUltLNXVZQC+37
	Vlgl9p+voh27liaW1i4TAbKMgOh6cg+vjLSwYIaUH2srMf6JfLitXnqXsRCJs4FVEnoN8Isz8g3
	mfoOVrOA7WCNGyOl6qN3IngdUU8LokMhrd24wXyTslZYhEQ7Y16iqNFK66jmT2Q2rb2OzLNmlSn
	B4xwK0Etuzr0TSh6i2H3vEtTV9gOYYDLv4la9IRHPrIz21kOISMSTzQ8DWb83RYy0jPMeKBTy24
	l2uROl/WKhEi1nClJkMdxZ9vDqxsX4KbINuNoKOd9nwp1FJEZEO2+3DAPLnaYPmpk9rSTubfCXL
	QqsLJGtifxgBbJ9C4bViYLQKGM3vjNs+iY
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id ffacd0b85a97d-48e5d2f0870mr3087140f8f.27.1793158313112;
        Tue, 27 Oct 2026 20:31:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:51 -0700 (PDT)
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
Subject: [RFC PATCH v2 04/13] lockdep: Use raw access for pinned hardirq state
Date: Wed, 28 Oct 2026 04:31:18 +0100
Message-Id: <20261028033127.82193-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203157_650510_72E62331 
X-CRM114-Status: GOOD (  22.34  )
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

irqentry_nmi_enter() reads lockdep's hardirq state before __nmi_enter()
establishes NMI context. Arm64 does the same for its NMI-like EL1 debug
entry. Both paths run with interrupts disabled and cannot migrate.

lockdep_hardirqs_enabled() uses this_cpu_read(), whose preemption checks
are unnecessary for these callers. Add a raw accessor and use it in the
two entry paths and in lockdep_hardirqs_off(). Keep the existing accessor
for callers which are not already pinned.

Check the interrupt state before accessing per-CPU state in
lockdep_hardirqs_off(), independently of warning suppression.

On arm64, this change relies on __kern_my_cpu_offset() being forced inline
by the earlier prerequisite patch so the call chain remains noinstr-safe.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 6 +++---
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 11d3f888fcd87..003f84109a913 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -177,9 +177,9 @@ asmlinkage void noinstr asm_exit_to_user_mode(struct pt_regs *regs)
  */
 static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
-	irqentry_state_t state;
-
-	state.lockdep = lockdep_hardirqs_enabled();
+	irqentry_state_t state = {
+		.lockdep = lockdep_hardirqs_enabled_raw(),
+	};
 
 	lockdep_hardirqs_off(CALLER_ADDR0);
 	ct_nmi_enter();
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 57b074e0cfbbb..5bc179a88e513 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -52,6 +52,8 @@ extern void trace_hardirqs_off(void);
 # define lockdep_hardirq_context()	(raw_cpu_read(hardirq_context))
 # define lockdep_softirq_context(p)	((p)->softirq_context)
 # define lockdep_hardirqs_enabled()	(this_cpu_read(hardirqs_enabled))
+/* The caller must already be pinned to the current CPU. */
+# define lockdep_hardirqs_enabled_raw()	(raw_cpu_read(hardirqs_enabled))
 # define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
 # define lockdep_hardirq_enter()			\
 do {							\
@@ -113,6 +115,7 @@ do {						\
 # define lockdep_hardirq_context()		0
 # define lockdep_softirq_context(p)		0
 # define lockdep_hardirqs_enabled()		0
+# define lockdep_hardirqs_enabled_raw()		0
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e234b04373fea..2f5229132466c 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -158,7 +158,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
 	irqentry_state_t irq_state;
 
-	irq_state.lockdep = lockdep_hardirqs_enabled();
+	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
 	__nmi_enter();
 	lockdep_hardirqs_off(CALLER_ADDR0);
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..01dba8fb32a90 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4543,10 +4543,12 @@ void noinstr lockdep_hardirqs_off(unsigned long ip)
 	 * So we're supposed to get called after you mask local IRQs, but for
 	 * some reason the hardware doesn't quite think you did a proper job.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(!irqs_disabled()))
+	if (unlikely(!irqs_disabled())) {
+		DEBUG_LOCKS_WARN_ON(1);
 		return;
+	}
 
-	if (lockdep_hardirqs_enabled()) {
+	if (lockdep_hardirqs_enabled_raw()) {
 		struct irqtrace_events *trace = &current->irqtrace;
 
 		/*
-- 
2.39.5 (Apple Git-154)


