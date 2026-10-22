Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951A606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rUYRcOub;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VrWFFJiP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=; b=rUYRcOubJNQMqBu8Xr7/qe9fPj
	RFAohOfEc7IcU2v0k4oaMBfpeQpuqDrDs3FLdj9rai3wkC1Nti4uCXONLcssa+YCsHEg/rnUh/735
	gdZcAweuQfE3f8qNXFb7DV5yT4/BQ9jbv91KlPHHHOxEbSAM0p456fmJRWz7UdjfPLag+Q9cpea5I
	GNrB6SJsTqrVYZsSZXMss+afye4E9a8aCZ1evY2/96NIxHnRdXIIIFcBLlzweReAtMl6/9Wd6173b
	5Wcv9WelXvTIhU7J1CcPBwQpKqczHwKRFTHb9TRWmSy/6UpYqj3tkzPSvqtBSqUC7ziO5Kem/4900
	911MMiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBj-0000000DMbw-157J;
	Thu, 22 Oct 2026 05:18:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBW-0000000DMTR-0efN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso15957025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646268; x=1793251068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=VrWFFJiPURV93/mVEGY4h0KZ+RnWcOMn/wLb68dDLvaP3xk5bV5H4UWN76/YBV2L87
         IdsU5ahBioEb7tW8YjDQ660wd/HnPSpSRNdWWoHIfIXTRnhFZbKoxsX0Jy6aRW9NE2of
         Zbce7LYGAvfTHv7NthNZivCl4f0hHdmusL7qTQeIfpiMNR63FfeE3JGsYhgl19a/cTB1
         MGmVUqOKXjHeZ5XUkRlBxgTHLvcucvrcXYZlkvflqPgyQYiJOcAO8/3XyBDdIqk+sFeV
         YDop24EUX9X+mvtM7tW67DllnntXtVJo9oforoYr0jEMqhIwVkJEpXA4zRNKYJocXN1z
         OjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646268; x=1793251068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5VpfkiruZaKFMNAXJdCzQrQfGZBIQ5E4hTuwKkgO4o=;
        b=T1JTV/aa8UX8aN8VvlLN+Fh6p2av9E+2FARwJ9V2uoS60dxIPG1G+CSxJUbm5IYf+K
         XOTa+LbGy+WcTxIMswbnibH4FCyTwg0tSpvuA8RL7Ecd+ZJ6RulU8JlwJinTPL5cE5UD
         YftAHj7xo3QkHmIdREYewbEKF1vGoiM+kVcLRaA52yUmNIx8cuVf2bS2KsPDpxVV64sq
         gFQDvzKy+nMrnIMOJvkxTc14NhW+RlCnBKKeDBpKlzjm8NyCo9grdFHzwYMOPaclMfDR
         OKUgaQeK5xWaxf3CZX9bNmpidLPsaW0YvnEJC80FWqR6BzRI93U4F8p5OnJOtUPgOQ7y
         nG3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyYvayOHnlLp3z8GsNIWrGAcc7RVaDqllovJKguJgJuP8Hp80BZkKlqITqEUHWH4jtezNlAcs463ziWe7aNInc@lists.infradead.org
X-Gm-Message-State: AFq9FYIoFyw5MFPabybye3ljzRy8JpEt6/m3WUYzxiW76bZM7reidIZK
	8peOOZGgNxd6wrle9r8dhOwFBITAaxF0A0u1Ja2IvjjdkxCpppSZo0xZ
X-Gm-Gg: AYBFou3RMqyWE8GMwKLYIHO24RYOFEES3KPplKgj71Z0bfkAjgwiQ8eVP68JzrTYtqz
	mJ9R9Ed8WsrbgjldiTPG57X7Yhhn30xfBIf3Mbmk3onumiUj6N80WrZ3YLkADSIV4EdPvs8dF/d
	Mt8491fGI73n5EDYmJUYgcqTNAdddaucVeJRKnoAWXZe4R5h5QNbKJh1F84lXOgt+aoGwC5IPmq
	iTyq3vFnjO2+2YvUftr2xeBge+GQUgwi8yoPmmtr8d9o/nsEs1rMniLP5zfk9qJmEkJgNl/E/sn
	X+F4Liw6lXKdORkrYPp65yQleOth2SOLTybaPQR4q+ufLyGlzmXpSC0fPF5CnfTswsyd2mqWHme
	zX343LPXWiXdNoagIYAj8zaRA287BS/IBq+wXLXgHYwZ9QTG2EUOggBr3o4w98+AGfQfiuZU2wk
	WUzkQ1IBnOmpF1futK/8JI2CGIq/nJAbgkdaxhoSewGtqev5AIEZRTjj95xFgxPPaj+tJjKmXmZ
	ms9FjbKAzu/Umy33LOWe36czmlvtL8W582Dc8nU/8T7IMRhJRRgt25NU6/m/HEqfkv0i0ysjpmK
	rngnOf4MnrMc27tjdLcTLAKy4kcp86gYC/ytu5uty5/P8QOZJB3vSy5UnyVnirT49QjaY5yUwOh
	/Q8C68wnJMj65YLt4P1ozE/72CQgD1PoEo/mzV5DdVHn0i8gOHgb5t4zENOo=
X-Received: by 2002:a05:600c:34c9:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4a1fdd09bebmr74736715e9.26.1792646268101;
        Wed, 21 Oct 2026 22:17:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:47 -0700 (PDT)
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
Subject: [RFC PATCH 10/12] docs: entry: Describe the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:52 +0200
Message-Id: <20261022051654.79224-11-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221752_410316_87D737AE 
X-CRM114-Status: GOOD (  18.34  )
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

The entry documentation covers only the traditional irq_enter_rcu()
path. It does not explain the early-counted entry contract or the retained
and synthetic hardirq exit phases.

Document the raw count and lockdep entry, delayed traceable bookkeeping,
hardirq accounting, hardirq-to-softirq count swap, retained real IRQ exit,
possible preemption and migration, and the classification-only return tail.
Also cover late worker closure, raw teardown and context-tracking order.

Record that arm64 excludes pseudo-NMIs from this lifecycle and identify its
external noinstr inlining prerequisites.

Assisted-by: LLM
---
 Documentation/core-api/entry.rst | 75 +++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/entry.rst b/Documentation/core-api/entry.rst
index 09942135aad18..e02c463dcb08f 100644
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
@@ -216,6 +209,68 @@ is still attributed to the interrupt. HARDIRQ_OFFSET is removed before
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
+  * irqentry_hardirq_enter() adds HARDIRQ_OFFSET with a raw update and
+    establishes IRQ-disabled and lockdep hardirq state before instrumentable
+    entry work. It then runs the generic entry and context-tracking path,
+    including any required transition out of an RCU extended quiescent state.
+
+  * irq_enter_rcu_preempt_counted() later performs the traceable debug and
+    latency bookkeeping for that raw update. It also performs the deferred
+    timer repair, NOHZ tick handling and interrupt accounting from
+    irq_enter_rcu().
+
+  * irq_exit_rcu_preempt_counted_prepare() performs interrupt accounting,
+    softirq handling and NOHZ tick handling while retaining the hardirq count
+    and lockdep nesting through every traceable exit callback. Softirq
+    handling uses the same temporary HARDIRQ_OFFSET to SOFTIRQ_OFFSET and back
+    transition described above. The architecture immediately follows the
+    preparation with irqentry_hardirq_exit_finish(), which applies the raw
+    count and lockdep teardown.
+
+The real interrupt is complete after that teardown. Return-to-kernel
+preemption can schedule and migrate the task before the architecture-specific
+tail runs, so the current preemption count cannot identify the original entry
+class. irqentry_state_t retains that provenance instead.
+
+For an ordinary hardirq returning to kernel mode,
+irqentry_hardirq_tail_enter() restores only HARDIRQ_OFFSET and lockdep hardirq
+nesting after the preemption decision. This synthetic classification covers
+traceable architecture tail work, deferred timer rearming, IRQ-on preparation
+and context-tracking preparation. It does not repeat interrupt accounting,
+RCU or tick entry. IRQ-on preparation accepts exactly this one synthetic
+lockdep nesting level.
+
+irqentry_hardirq_tail_exit() performs the final traceable teardown preparation
+and then removes the raw synthetic state. Both retained exit points recheck
+regular softirq work and forced-thread timer work raised by late callbacks and
+wake the corresponding workers before dropping hardirq state. If the
+interrupted context was in an RCU extended quiescent state,
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


