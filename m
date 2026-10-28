Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C19606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XLUDL32t;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwsnY6qu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=; b=XLUDL32tJEJAVD
	eYrK/TI9pQXNPXkDlNt/ixikAorw+4RZAz+EVDFg5t2QJ6oEp9vTLHovRCmx6aLH5D7cTiDVn8z/g
	xOKEo0I42hfLc51ddrIr0sox4kqIEF6Mtbgsvh5Pqv6i86gXG/kGZFecAALn/+iFBnERVbeZdq8Z6
	rWzYeV7D5BiMh/VNNTPbLLMjASc75uPepcisTnHxxRX9T2NKS2Yb/B936bi3sN7R8WsxrtxoZrJop
	rEtFNluseEXg4WsVp6C1QlQlUx0GQuT0nbGThb8Roe5nr5hJ8+1gKl0De+Pqm3a2u5CRJQrT8lEjO
	S6sOALqQ9ogCLq9AyzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOr-00000006DQ4-3AFc;
	Wed, 28 Oct 2026 03:32:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOd-00000006DDn-37gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:17 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1067994f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158333; x=1793763133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=dwsnY6quOH6BkQ/UCnYXN7oqU3ZAp3rm2+voAypQPCTyO5xpv1hWkwr/ujUFKpcNf8
         fMWoLBPy0VLO1tZb834vPcHnEfvoLYVq8Pmy6NW0O5PU2WifUKMr+PLj+DEyByvgueaA
         AuKCYPrhE10k9lKNn7GToMRYPS+cR8fTbyfJOzxQIO1MbjaaWyDtsqBZyh8TPQXutCBU
         Pq47LBM9xq8GB+pLCpfCuHgrM7U5tKeRKhG0MuIphcf1TUKQxrxMMqjHP3eoeUtSOKWB
         Qq2DnpmjSJmyyDG1aCw1Ab7R6sQypfn/1Gumv3MHYYh+DKXkYCjpHi98QetUhNnVaY0x
         J/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158333; x=1793763133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCtCiCeMvqleVCPGIStS9YbFBYnceHXr+HhJDm7YwVI=;
        b=hVwca9OaCJejJZ+sKqfmJTTXEXeyBYnPnpzGNTzPuJ4XK/nUU/6F4FJZ1X2MFl/qlj
         YvQUAONSgC2SFYoFuIea5J/H4x34dldZ6FVa8g3jdgFblmAfon7gJVQ5cDkdLSDFGU2F
         YFEcZOOTi0A3DXrTb599bMzETo0+xb1DtRubMZbmTTNfmt3qT0oEfxRevKlLNblWZuEJ
         A72R6N9B1RbmcCglCkwu9btATV5TU2Os8Km0pAwYOQoicpAehiATy4VYOqy4cKE3Fsla
         MZ5/n9JUWwkh09q8cQyUuqZL60riP6sFt89IV86g3KGtsFb/kZN2SeZmFivoX6yxrDPY
         SQWg==
X-Forwarded-Encrypted: i=1; AKwUvByw2xGZLZ1Tmo1SjOrisfo+e3GOPZ8eOXQjUkehUt5IhrY/NC7UVhZtYXO25NYwDkokqT46eSz5KnkuvTpUtsqU@lists.infradead.org
X-Gm-Message-State: AFq9FYKYkkUNEMYX+G/UxBMiGQh4wEoEgJKNGOoniAaYteoFs16lIkrV
	vOLgvyZxDX6WvP78mZeYg8XvY/ty5fa7iRGuWlAGTqz61XRwL7YKhWKD
X-Gm-Gg: AYBFou1a2lkwHt+EnIJQJCVBI6F0UZ+0KC56MWYd2ao4uhEiGOoaUHUausR104rTk27
	MYYI/eqxP+glwseSv9Gz6TyIH02zZnro+PDXtrhviQAyyur3bkF5VnT1QSggoantrTj1qHYcEFw
	Ry2F+JjEIhkpd5gy1Z1TYD9EkdFHpy0dMD0g4wb+P7iFm43EVjGVzxcdkihmCRbLxQTOEGfRgeh
	WC2UM+EOnGiES4Lu5fal8LzQKCqZMvgQdpPYcfuDTCfPRWemxTZwzPHDXvrILfydoAYCSIQApl+
	mWX7ZzGxAkFipYINzdapldPlPWcQVrVTUWzslv/M98Yqa91RHl3RUCFc3jfa1WDyAsuuDw5eurv
	mJ55UoLvxwEos5kKLKyB5td+ntic0y9KJNCNhr2/mYNQ7yQ3vHFm3hYnXgYvIKGWJqxaolbfA14
	N5ncJIP/IFLKXD4m+XV4Mfsk/o+u2xclwGDl2XOGks64Pw1PUZpVlDq/JwASoBXqFwHczGi/eGe
	TOGI7nwjreGemLlL/Q3DsUgtVdFAINYcWjf43eXed0w9PY+17i/BPhb+Qv3zH/3DRxdrskJ1JaR
	sdkI7O3bYaxQdzQAFyC9qc0nxs6Nu8Uqy5zYM+7EZqUktIkSHRdbNnl90l8jXho7tqJasyu8MxO
	retclOMaasr33RJCsqI96JqlttwM54Cj2tdw+qOCa+59ZP6P6EclM+syuqaXAFvx5zy659ZJ7lO
	aoqzDxhyJgjNgT38C7kNMb/h+hBBogIEVH
X-Received: by 2002:a5d:5d88:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e60212fb8mr338598f8f.16.1793158333537;
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/13] arm64: Use the pre-counted hardirq lifecycle
Date: Wed, 28 Oct 2026 04:31:25 +0100
Message-Id: <20261028033127.82193-12-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203216_008042_BD099BB8 
X-CRM114-Status: GOOD (  15.62  )
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

Ordinary EL0 and EL1 interrupt paths establish generic entry state before
irq_enter_rcu() adds HARDIRQ_OFFSET and lockdep nesting. Callbacks in that
early window are therefore not classified as hardirq work. Their exit paths
also drop the classification before function-graph return callbacks and the
kernel return tail have completed.

After the EL1 pseudo-NMI decision, enter ordinary interrupts through
irqentry_hardirq_enter(). Finish the staged count update and delayed timer
and accounting work with irq_enter_rcu_preempt_counted(). Use the retained
exit preparation followed immediately by conditional raw count and lockdep
teardown.

For kernel returns, preserve the existing per-CPU register adjustment, then
stage hardirq return-tail classification before MTE exit tracing. Keep the
pseudo-NMI lifecycle unchanged.

The noinstr path also depends on the raw preempt-count and
__kern_my_cpu_offset() inlining prerequisites earlier in this series.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Link: https://lore.kernel.org/r/20260918161407.2300-12-will@kernel.org
Assisted-by: LLM
---
 arch/arm64/kernel/entry-common.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 003f84109a913..d70cffffe71c6 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -94,6 +94,8 @@ static void noinstr __arm64_exit_to_kernel_mode(struct pt_regs *regs,
 {
 	local_daif_mask();
 	irqentry_exit_pcpu_adjust(regs);
+	/* arm64 uses the split exit API, so enter the tail before MTE tracing. */
+	irqentry_hardirq_tail_enter(&state);
 	mte_check_tfsr_exit();
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
@@ -560,13 +562,19 @@ static __always_inline void __el1_pnmi(struct pt_regs *regs,
 static __always_inline void __el1_irq(struct pt_regs *regs,
 				      void (*handler)(struct pt_regs *))
 {
+	struct irqentry_hardirq_cookie cookie;
 	irqentry_state_t state;
+	bool do_sub;
 
-	state = arm64_enter_from_kernel_mode(regs);
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_check_tfsr_entry();
+	mte_disable_tco_entry(current);
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_kernel_mode_preempt(regs, state);
 }
@@ -877,16 +885,24 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 static void noinstr el0_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	struct irqentry_hardirq_cookie cookie;
+	irqentry_state_t state;
+	bool do_sub;
+
+	state = irqentry_hardirq_enter(regs);
+	cookie = irqentry_hardirq_count_state(state);
+	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 
 	write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
 
 	if (regs->pc & BIT(55))
 		arm64_apply_bp_hardening();
 
-	irq_enter_rcu();
+	irq_enter_rcu_preempt_counted(cookie);
 	do_interrupt_handler(regs, handler);
-	irq_exit_rcu();
+	do_sub = irq_exit_rcu_preempt_counted_prepare(cookie);
+	irqentry_hardirq_exit_finish(do_sub);
 
 	arm64_exit_to_user_mode(regs);
 }
-- 
2.39.5 (Apple Git-154)


