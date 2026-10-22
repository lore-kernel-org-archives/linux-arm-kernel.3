Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162260A2605
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKbInveO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ai3iA0ZO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=; b=HKbInveOBL4mn8/vfTjpfBa4mC
	SwFlwYkv65aowPdyE3vCl2PbpAF7ylIwx/xLibUXOn7h41ji0cdWvMYqKq8WmXPNQOOBKgiymlnFO
	4FCH+blJSWMFdMO/SzJNe2gn08HQmh0tvglLpBzrs2/c/pj7PeFwiw+jbxmRl4LBVagtJ+p4yY1ZK
	UIYVlzdOIepKviW7kjh1XuFq3fZoNHzz3r/jk3gwOHsKF1alWLYtv41hZl9pFrDrYZ3tJv6tnTbI3
	/dMQUA7k8cXXYguBL0o7wkcGhVatvhPR9su3MjthivaBfnoJqlkOrdtNW1TitYKxJ+V1aFWDFovv6
	Z/NAQiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBC-0000000DMG0-1B65;
	Thu, 22 Oct 2026 05:17:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlB3-0000000DMCA-0ORu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2650685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646239; x=1793251039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=Ai3iA0ZOATLvPxx/yKKJOA2Kl5Y6a+1NtPrMHVLhm1QieGzrLS368XHNYt6GV5/uST
         j6Ggch9Pa6p2sCu14i9Nz0O4hWg1PxHo1QbMmH+D75kT6yZvk9E/c3zRS05e/0FjB54V
         9cpzfIjEAjFyyA+OVAcOewHyNnGqzHcSk3U/J+6Jf392WxC9KXXxIBrTMDBpEL3KCfdd
         1e1TJE7IARl0PRnhJdk2xXbI4AX/XDoFSPnr9B/2xy4oJK+R/eMefTDatyCyUPvuBla5
         HNjHxiR7PGSONNdsIdmgP7jGEHJBs5pVwSKwFAuYZ0XLzduuvGjrUZvWuheJZqaZYmOV
         e6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646239; x=1793251039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FHADbTy4zikl0HljBSmGkN/GzMWvpwiot6dr8kUaUas=;
        b=wYwe56cpTHBffVcVMZvVgCb5gQDxWkGdh9Q5AoPf2m2PLujdQ1z3rEHCa+lE/NajHr
         nd4W7AR00hUyMhMXOURfroEDWh5dzyS0C0OWV6vpr3xJurqDtroDb09OkjY4nv+Xukwt
         58RmPegjuyE3iBcB2vxN2moQWcj52uep8auiBfks6BqfRtFe4L92gmT9f+02JJ+JRJFC
         5Kltl7N2I/2q75W6n7Pjcp6pNLrt3YpqS85i2Ij/+SFLYk2bfu7VGyXC0+wuaxE80Vn9
         ZDS9TolxADD5LdovSmPp6zU7I9H0qDNf4YbjUqt5fTuHdh4dNDs/cC0UcG7Jptk95RVS
         2mGg==
X-Forwarded-Encrypted: i=1; AKwUvBxTX1lluZr04zryVlFxn1Aet5iBLdlfMV74h+OJN8YDu01wLkPILeQgMQg701TW1I3GVa52vUE898w4LHhXroZd@lists.infradead.org
X-Gm-Message-State: AFq9FYK8ZFm24xtuTE8LJOZT9pPhjXVdqvsCpEWOpw7qDaqjetBdm37B
	XbAeqY73N4GpKUSCfKZreh6oRJ3HnaOar+Fbpvu3116EdJAKXXxCXt4v
X-Gm-Gg: AYBFou3j8PjG9PXqqxVNuFMxYWF0xtJwxmkqWPyd+5+zdAgGlwuFXj2YqPvFjlm3Rk5
	agdi3DEuvWrpWdX3bIImBZ8iBy/8Lsjl733zh8tBBgKOlLI5dlq8sh2ThQTc8b7CPlymfmFWL/o
	3p1Hybjx+DjzOplTgTU2kMNEWGOU1YYr22fcHVBV74eI6ycCYv6bpMFTWK9JXqt0Sar4JMgl+2o
	kO2eT6FBefTyb+kmyai2orN6rS/48aIEQPqN/eGiMYL/nYPgdrK3UHebJIn25bbYrpEzTrzz1Ux
	xhWgmKrmMvgoieGEYj8694vzsJTwIwizjUCc5ZLUZQFytcieWieUU/Px80clrYErcPy4LGcECq6
	R2RVS92QMXp6b6K3+VDuTKyn2BCB5SjWsHNF41SZcOpokaFhQ//G1P6hfoq58Bb9QI+qSRjFqvP
	0ovktWrxusRyGIWjF6OgmRUlwSMWPQDxVz2s+FEpeOIeQ0A3eE+GQLZaUqnTzK32ZrmMmUSBq6t
	xoMGS/++Z9sN3jo4l6BsGGOi9nePeN9j02P0/8NOsSXDdzAx4DZNy2FGK7ojuNVaZiMkzW5Uexl
	cbOngYc7coFOdi+rFpF02gsDSWdzXrlaFSQhVEtKy0ZP4xRETeA7FQaQpIonD51NPpmXf3GoPm9
	IIKD+upXE1tDsNKremvOzDBKHemU42tiaaAgWTJi8XK6G8dgVU5rG7b+5i+k=
X-Received: by 2002:a05:600c:4fc9:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a204b2032cmr26718835e9.12.1792646239093;
        Wed, 21 Oct 2026 22:17:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
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
Subject: [RFC PATCH 02/12] lockdep: Use raw access for pinned hardirq state
Date: Thu, 22 Oct 2026 07:16:44 +0200
Message-Id: <20261022051654.79224-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221721_164285_51BF160A 
X-CRM114-Status: GOOD (  20.69  )
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

On arm64, this change does not by itself make the call chain noinstr-safe:
__kern_my_cpu_offset() must also be forced inline. That prerequisite is
listed in the cover letter.

Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 2 +-
 include/linux/irqflags.h         | 3 +++
 kernel/entry/common.c            | 2 +-
 kernel/locking/lockdep.c         | 6 ++++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 72c03ccea59fe..93056a766fb20 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -141,7 +141,7 @@ static noinstr irqentry_state_t arm64_enter_el1_dbg(struct pt_regs *regs)
 {
 	irqentry_state_t state;
 
-	state.lockdep = lockdep_hardirqs_enabled();
+	state.lockdep = lockdep_hardirqs_enabled_raw();
 
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
index e3d381fd3d251..28399c41ebfb1 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,7 +171,7 @@ irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
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


