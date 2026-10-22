Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wm0bMfbF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=afAlHNWK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=; b=Wm0bMfbFpIo04frr9ruAmeNqjT
	NbufQj66LW+YmIP/HZbz1ptYpo4S4IZkZG7zADWBYJYdyCMlZ78H43knipcdk6b3zhtSmpuAOVp7z
	qQuX1GwAsfby15l7tW1I04f1phMZdgWLKfy5b9EgCRp8iD+ixknu+EVWoJXNS5DoD9jovqADC277+
	l7FKSLbyZJBekJlWN+DVTxwUESa79VyeqZ1PB1SYlFA96ugZ1KxeMrHkwrbHBbVUSBzzJSfXDf4pr
	3GvEygYCN1Ta6rVHgHJorMlLK5XV/3bCWzxJko2ojgpiw/h89SzfjUC2ClHKPzt+y+N0VrLcp/dKE
	VdeD2gyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBj-0000000DMbY-0YSo;
	Thu, 22 Oct 2026 05:18:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBP-0000000DMPV-1q7Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so2075115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646262; x=1793251062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=afAlHNWKq0f9XDuMUYJayAhGJTahckz/dqcg/fKG6DH2HVGnFvmEyS4DtScNiMwitU
         SZAZDzt60w4kuv/3EI+sUhfYatStdemSKHs0dKasx2wbPWZm9IrDVC6ChI/+1+2wTAH+
         xhoRG8sjylk3mBmVxODDnyUmQsOJEK4Ubk4scxTLBs94hHvYNCY8nwBQraHUlsJ5N4er
         +sNMdnPVSWqXjas5HzGuJrgbjhB2OhJXzRhpW9F3OWFKYfod8jIvmjoBSUXvv7uv4dD+
         ZQyzaoXnoGf2LHCiWyuLttWeYfmWRLMf2NzTX+fAhCgLCAMVmLSsL3FvwVXrX30J17ao
         +rCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646262; x=1793251062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNAQ43P7mOXqvjFIm1UIgh+LHBg4TUD3j/lYh+CFxWo=;
        b=hb3c/SJUuK0VjJAMJMFD3ajiDTy2BkrUAUS1RI+4dst2RGJMaYTPcT69sHIv9yJYkW
         hppbbr88C61QTv+YdiN3n0GyWm+fHIC0igpdvurtcdCWZK/aRTKCX4A5vPO9BBjedqjS
         b6rBOuP2r2gN5atEcx3uzeb8H+x3ONjgjdVEEo7mQm/5DS89GBUjHv2xcPtw3j9iVkdT
         EjSNStRjbgYV6mznq8LQ3FyNph4eihhpe9z106K1NGJzSl3hrclObPLXxOMz1cwvzxK3
         3Oyc/WLpXjQBSfF5lPkkyZxsawscLKRIaTnwyJVTa9goWxYO7axM53XaS3B8SNHpu6lI
         4RVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzq/xM2tqxJZSwthHMyQFq9eZniEouqGjcPgWGpbgWPvt4TiS3JFQNw5OA9KrzqLOYO6DRwv7fLhgXFTe87Rv7K@lists.infradead.org
X-Gm-Message-State: AFq9FYJXrWsUbWwZFBKkizzCISJYQg4N0PYK5rYouXFuMpnnaolWgNIE
	M6T1lz4acboe3os7kbhd4nauRJyZ9DbmiWvvzCTNRfkJLW7c1LCsEdam
X-Gm-Gg: AYBFou2edaLPG/GPzX/BOl6QtxW/b1eWOq7pudMmffXa3N4UKpdIH0TI8ujp11xyc/G
	J8SzNgyywqqAZWMvo70p2HYZdgJId7iHKKzuD3CZtMHij555iGba9O/9Xs5pvjC2ci2mCxkA2LM
	iXa2ieqvdA1y/Z6XdMYW87JtZUVp7UcRLE0CXfmMmNjE1dmyguHq65v/VqoTVv8KXLzyzel3QTy
	+oDO/jye+vJmsEDd8M8y7o+gyiunyWUJNgFOIIN5B/T70TivUnrMaJyMrOFfX2BWjQhRHk5uyLs
	qTpCt37VMmJNqp7pUS1wCL6FLYJcvH89zWXjcLz2mvt+eHnXdbs5g+FQ15isVpEXGEoowvMkyli
	3CCsL3Fa53gllSTS+9p29BQ/2J/wRa3Gz57rz2dEhFwaCQ1LyYvRqeiH9hT+ZZR6GYb9Dpe0XHp
	lAguCiwPQDXObmbAjYo756vYeJlvZOfx+V/5nMW68H4Of6KonIzhEIvbaUOzUUiaDqegCzN07sa
	mgoGal6e8lu8c3aRBtaVX6AXmCfuH5M+gNc9iIFWxXS5kM66nT80ft4hvoMaoB4Vt3jwX0m+HAy
	+bbdG34xnggcahYs9zTFigWpj+9Y0uYuNF71i1ymm6lPWtrG9fDraNbOFncEe1T0IUAesEtHJBJ
	jRIee7xtyR0BZ51MUVWtKk8DsqgTZO6iVGpIq35OQ+6LaMpKxtsImSzpdcqiqe1nQflJSYmsFq4
	bJtj5dDw==
X-Received: by 2002:a05:600c:8b4c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4a20729f92bmr16486165e9.8.1792646261504;
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:41 -0700 (PDT)
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
Subject: [RFC PATCH 09/12] arm64: Use the pre-counted hardirq lifecycle
Date: Thu, 22 Oct 2026 07:16:51 +0200
Message-Id: <20261022051654.79224-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221743_515122_2AD33784 
X-CRM114-Status: GOOD (  15.78  )
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

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Complete delayed timer and accounting work with
irq_enter_rcu_preempt_counted(). Use the retained exit preparation followed
immediately by raw count and lockdep teardown.

For kernel returns, restore return-tail classification after masking DAIF
and before MTE exit tracing. Keep the pseudo-NMI lifecycle unchanged. Force
arm64 preempt_count() inline so noinstr callers cannot be outlined into
instrumentable text.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining changes carried as patches 1 and 2. Keep
them separate because they are externally authored fixes.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h |  2 +-
 arch/arm64/kernel/entry-common.c | 23 +++++++++++++++++------
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 4f917596f387d..3d61be0f825fb 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -7,7 +7,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __always_inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 93056a766fb20..fda807c61ff27 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -56,6 +56,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 						irqentry_state_t state)
 {
 	local_daif_mask();
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -523,12 +525,16 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -839,16 +845,21 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	bool do_sub;
+
+	(void)irqentry_hardirq_enter(regs);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted();
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare();
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)


