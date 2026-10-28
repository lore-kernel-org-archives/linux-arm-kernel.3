Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023C4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eZVx+8Uz;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=prM2re1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=; b=eZVx+8Uz+wP8nH
	8Boz8jc98lf2dTGoBDAIt/pxEP6ScjezhRzGdc0RxEzBA+sGnnCbigFW3y9y0s0fevrK8KMnXoDC7
	/AL5gZMgkEgvT+RY2zXmtPt13CarYdQ0KWMhLtntSPbWZzj87WpYCtAtdkyhTbs64LCsFycnkEAUC
	89+cu9HLwsnRjeye1tIVFNbqIe5EAB5YCiXQygNMNVTgRPFH74Xzo1995V4PR0/LKMjyRgJvWrG80
	EF0+OEY0vs+6WCAqXgOtxg32bFkCGPSqH778TJ9no5xeZwzARd41tdcOr6Colt1oQWI9G3F9YJSSe
	j00qtyOTpWmGc3Tbr56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOs-00000006DQe-04iY;
	Wed, 28 Oct 2026 03:32:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOh-00000006DHE-10gd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b060ec084so266976f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158337; x=1793763137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=;
        b=prM2re1VaPv7SQZ0C9UlisrWtAdSDqRmNK1a45QHKio2HgnSEn1zHxSqVGHvWlAtgN
         RIeqafIK6Lgmc+KYftmPSxHiZ8PzlfJMzTOQQf8sVy7XqFz/LJcmNWeM8Ha1N7R/bNzB
         mUm5MxEssn9eMWyW2/QgecieY+pCOX5NTRNA46N/b+9vQj+LyQiwJXzdtFH41JPerUCt
         ZkbkLJNaaprTjR7E3LPbBA2cmyXNkwcuNOLaeCMzQcoswcK2KU+HaeSP89luO1yy1AWU
         QFisf21tKDp/prmzV//bnOrTy0hkUAsgXPQPArQeML7O6phlZiFIbSuwBkm5qVAd3nur
         v0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158337; x=1793763137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/z19Dyd36Kry4my+DL1hRK2Ik7rhLnBj6p5QTA/aWQg=;
        b=w5kmNqk12EyV4Se++ZcqTJ1MkYCBL5Hi72NI7NMTLekimXr4hAlcRxaKtOYrv6VqZX
         GLbx5aCku767hFFHcLWBNvTDXRLip67BOqR7KC5RKGbumwUKaNXzrX37lwQmt4t50Szo
         mZSLxGtjJf/iRZHGicbFKG2k72uyN2PWlfEZjPUwDXyDtPglumeoIYrOlTn3vH5aQlFr
         S2y6wQb1Me8BrMCWART+Kfs/vM52dhdP73Hw276MvGp4SeRsPewiM0YmGBkkiaxt7+Tb
         DCl7CXpCqZmRwJyMD2BiotXlJrGexeq26Jzct5pwhS9gj/7iglAXz2ByHHPxsQf1lRww
         bfhg==
X-Forwarded-Encrypted: i=1; AKwUvBy3UX+HGlkjYT+qenzHE9TbC+EnZeMZNBA5R311Z1XY/o7jCWgbx+P8WeyRKy7r05DivVnHih8CMwhS5/XlUA47@lists.infradead.org
X-Gm-Message-State: AFq9FYJF1UjCewFwOlbWRvJvYELPEQoOULFVKqTgYmNLCOPGUs+amr22
	CP27OGIJNAwvJDdG/2SkF3BtfW2mMV2Bwv9TGzK8nTVTa1FEPG2mx4p4
X-Gm-Gg: AYBFou1K1kDdKyq154CN9GW8tRx6+V1omG1c1IDTP/WXVhUu6tY7dsS9LteyV/kmcz4
	H1L6DL4lnd0N39wUVwftjDVsn4blDVY+9LbS2axpfWBYxS57fuiO8gsdYQf2aFgfFy4/H67gGuB
	aVtypee5ifpoMgFQRB17ib6GryIPl7nwN4mmALFzTh8zUEW7YGfdx4p56QVBh3TdcJGpY1pq4FR
	sD4ZVUoxBD3BKT+PAigIicjXseOTR4MMTxIVqbH1cJ9oA3MBcml0rYK7eAVvMO3UNuli+AWJvWn
	ck/ZKaF6JN4PgyNtVlYdVkscYnDIWrN2ki+csr8RMp/l6pYl1ed01KeO6a95f3chkUH1zbPAbJQ
	zDKeVqRXuYsgx1kvU3rbZNqx/qpW/CFmLeJ+NCn3BbDSGCDesT5PexaWCk3E3UeACXmfjR1o8Vm
	uGhzRNVMUxuWk9WhXUgkVzVNItZjyhxeQy/j6loaZ1WkDfTWxBcXYKjtjyFrz9Jt486T56dQ38w
	EJDb+v97X8h7J1zO6lGrkseow6zZmTGT+asD/RGglHfqIw580chGhssMFlYQ3jGwcrMTmimQ6E2
	9VsgPiqnAqx+XVDKfwl0pRJQg1Ta54bYWbNWeZ8ihOFJm1wvlFIw4+ZCxkfLuZt/vMUK+P9V532
	akWn8t9ivkAlafDbqFFwpzyKRjo3G6FKYMlgfBJXpTg8urWu051NuIp0/B/XWgdRmUKha3X9S1X
	2dyHrVwkk9DJTPfmzIQS7+qOSzCrUf/MOm
X-Received: by 2002:adf:e011:0:10b0:48c:4d32:ccf8 with SMTP id ffacd0b85a97d-48e5d58f11dmr2007171f8f.16.1793158337059;
        Tue, 27 Oct 2026 20:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:15 -0700 (PDT)
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
Subject: [RFC PATCH v2 12/13] Documentation: entry: Describe the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:26 +0100
Message-Id: <20261028033127.82193-13-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203219_603664_780773EF 
X-CRM114-Status: GOOD (  20.38  )
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

The entry documentation covers only the traditional irq_enter_rcu()
path. It does not explain the early-counted entry contract or the retained
and synthetic hardirq exit phases.

Document the staged raw count and lockdep entry, delayed traceable
bookkeeping and rejected-add handling, hardirq accounting,
hardirq-to-softirq classification switch, retained real IRQ exit, possible
preemption and migration, and the classification-only return tail. Also
cover late worker closure, conditional raw teardown and context-tracking
order.

Record that arm64 excludes pseudo-NMIs from this lifecycle and identify its
external noinstr inlining prerequisites.

Assisted-by: LLM
---
 Documentation/core-api/entry.rst | 89 ++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 09942135aad18..7153cc4120192 100644
--- a/Documentation/core-api/entry.rst
+++ b/Documentation/core-api/entry.rst
@@ -193,21 +193,14 @@ Note that the invocation of the actual interrupt handler is within a
 irq_enter_rcu() and irq_exit_rcu() pair.
 
 irq_enter_rcu() updates the preemption count which makes in_hardirq()
-return true, handles NOHZ tick state and interrupt time accounting. This
-means that up to the point where irq_enter_rcu() is invoked in_hardirq()
-returns false.
+return true, handles NOHZ tick state and interrupt time accounting. On this
+entry path, in_hardirq() therefore returns false until irq_enter_rcu() is
+invoked.
 
 irq_exit_rcu() handles interrupt time accounting, handles soft interrupts if
 possible, handles the NOHZ tick state and finally undoes the preemption count
 update.
 
-In theory, the preemption count could be updated in irqentry_enter(). In
-practice, deferring this update to irq_enter_rcu() allows the preemption-count
-code to be traced, while also maintaining symmetry with irq_exit_rcu() and
-irqentry_exit(), which are described in the next paragraph. The only downside
-is that the early entry code up to irq_enter_rcu() must be aware that the
-preemption count has not yet been updated with the HARDIRQ_OFFSET state.
-
 Note that soft interrupt handlers must run in BH context rather than in hard
 interrupt context. irq_exit_rcu() therefore replaces HARDIRQ_OFFSET with
 SOFTIRQ_OFFSET in the preemption count while it handles soft interrupts and
@@ -216,6 +209,82 @@ is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
 irq_exit_rcu() returns because irqentry_exit() might schedule, which requires
 that HARDIRQ_OFFSET has been removed from the preemption count.
 
+Pre-counted hardirq lifecycle
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Architectures which need hardirq state before early context-tracking or
+tracing callbacks can use the pre-counted lifecycle. It applies only to an
+ordinary hard interrupt after the architecture has distinguished it from an
+NMI-like event:
+
+  * irqentry_hardirq_enter() attempts to add HARDIRQ_OFFSET with a raw update
+    and records whether the update was applied. It establishes IRQ-disabled
+    and lockdep hardirq state before instrumentable entry work. It then runs
+    the generic entry and context-tracking path, including any required
+    transition out of an RCU extended quiescent state.
+
+  * irq_enter_rcu_preempt_counted() later finishes the staged attempt. For an
+    applied update it performs traceable debug and latency bookkeeping. For a
+    rejected update it attempts deferred reporting and skips post-add
+    bookkeeping. It also performs the deferred timer repair, NOHZ tick
+    handling and interrupt accounting from irq_enter_rcu().
+
+  * irq_exit_rcu_preempt_counted_prepare() performs interrupt accounting,
+    softirq handling and NOHZ tick handling while carrying any applied
+    hardirq count across the traceable exit path. When an applied outer
+    hardirq invokes softirqs, both the preempt-count and lockdep
+    classifications temporarily switch from hardirq to softirq and back. The
+    architecture immediately follows the preparation with
+    irqentry_hardirq_exit_finish(), which performs the conditional raw-count
+    subtraction and lockdep teardown.
+
+The staged addition carries an opaque state into its instrumentable finish and
+matching teardown. With DEBUG_PREEMPT and no separate reschedule bits, an
+already-negative count follows the legacy DEBUG_LOCKS_WARN_ON() rule. During
+an oops the warning condition is bypassed and the addition is applied.
+Otherwise the attempt is rejected and leaves the count unchanged. Its finish
+attempts deferred reporting, which an intervening oops can suppress. A
+rejected token always skips post-add bookkeeping and the matching subtraction,
+independently of whether reporting produced a warning.
+
+The real interrupt is complete after that teardown. Return-to-kernel
+preemption can schedule and migrate the task before the architecture-specific
+tail runs, so the current preemption count cannot identify the original entry
+class. irqentry_state_t retains that provenance instead.
+
+For an ordinary hardirq returning to kernel mode,
+irqentry_hardirq_tail_enter() makes a fresh staged attempt to add
+HARDIRQ_OFFSET and establishes lockdep hardirq nesting after the preemption
+decision. This synthetic classification covers traceable architecture tail
+work, deferred timer rearming, IRQ-on preparation and context-tracking
+preparation. It does not repeat interrupt accounting, RCU or tick entry.
+IRQ-on preparation requires this synthetic lockdep nesting to remain present.
+An interrupted outer hardirq can contribute additional nesting.
+
+irqentry_hardirq_tail_exit() performs the final traceable teardown preparation
+and then conditionally removes any applied raw synthetic count. For an applied
+staged count at outermost hardirq depth, both retained exit points recheck
+regular softirq work and forced-thread timer work raised by late callbacks and
+wake the corresponding workers before ending hardirq state. If the interrupted
+context was in an RCU extended quiescent state,
+ct_irq_exit_prepare() runs before the raw tail teardown and
+ct_irq_exit_finish() completes the transition afterwards.
+
+On arm64 the ordinary lifecycle is selected only after the pseudo-NMI
+decision. Pseudo-NMIs continue to use irqentry_nmi_enter() and
+irqentry_nmi_exit(). All raw transitions are in noinstr paths, so
+preempt_count(), the raw preempt-count update helpers and
+__kern_my_cpu_offset() must remain inline. The arm64 conversion includes the
+first requirement and depends on the `arm64 raw preempt-count inlining
+prerequisite`_ and `arm64 per-CPU offset inlining prerequisite`_ for the
+others.
+
+.. _`arm64 raw preempt-count inlining prerequisite`:
+   https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
+
+.. _`arm64 per-CPU offset inlining prerequisite`:
+   https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
+
 Even though interrupt handlers are expected to run with local interrupts
 disabled, interrupt nesting is common from an entry/exit perspective. For
 example, softirq handling happens within an irqentry_{enter,exit}() block with
-- 
2.39.5 (Apple Git-154)


