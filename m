Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D660A261F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ziGbAvjt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYZ48bVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=; b=ziGbAvjtFmLywV8o44uRNKWuJ6
	AdBg/6jkbhow1gVcXm8xpCQwa9NHjC22WSjoRCoPXyOrZZ/YEh7jLLcGc7XNzPzpn2fn58wncaF3c
	1c5Zq2zKftVJtF24FHSiYhTLscbOkN+FtTMfDTCdEX2DYn8x/+LC4ZSktyEVkN3Fhs33cGnePkvEx
	U1UHYSIHLKxVosW84xojtggeTY+HQgucpZeyJQSFX+screOVl04Nf1OZU29aBy1GVyFi5JKnhKlCG
	0Z6Kk3Ry24j1UMpjP0nMw5PWGFdY6+2D9Ik/CeQwXl8exRe2Vhfc5vYySntJtHqfR3MmE+zP9SP7s
	wVrYTIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBL-0000000DMMt-2rxi;
	Thu, 22 Oct 2026 05:17:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBH-0000000DMJJ-3HnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso420845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646254; x=1793251054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=fYZ48bVAjDSZbdsNeM0eGowF65inUNDt8C7Vry6pK7Nwdi6LkOSMYpFoGCI1b/Ab7w
         jammyK4pDhFOIRGxo0iLOtmK5PfxJ83QrigORc5G0WCFl7A3GGYRnoHZmpaLjCwWONIn
         U9uiK2qDdlo3U7Hza+bVMe4B2Kp4zlKWaRg2L1CD7odeHl3ldwWPvDmWLN/M1qEdtOmD
         glWZ5jBIy8Ff1pCqa3Ka7ydKE9vFuwkpBIwf3l5CWIxdI2Z/3ODxC9LKdLQtTd8Tsx6k
         z7Si/zwquI/vxKiJMt+dpeRNV1ea9Q65S2eodAOH4Yqge6nQ2A6d/pbLHWAQ+Lqs/exD
         jd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646254; x=1793251054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=vsCNOl5MHZgW986M0UAEOhUZ+B2vdTUSM+QOzO+sGBBkEArxSZ9N3hZyrZ472Gw9R2
         hwtKzpHBY44K+oKB/tpp9C2t9pMjpLhLj65ZBJtNhG86OLFkj3goJIdaORvr7pkCBRU4
         UU/f34806IOnlmjImDDtbo0Jyci81lr6BP0vPACm1ZFoj9DB5ucmz3mDfoNFnUpLISW8
         UYwFB2NxhK+rBj1aQPiMaBzuFk6GzAqnI+WNw6OYYbCxtb2cF54yOgmOHH9AwSSIRjzb
         iOZzzt8VlmSpR1DJ2s8x94NEjcTdEMnDgQIYHl+zti76oQbIop0qpA+Pu8x1CdYA0ay1
         m5kA==
X-Forwarded-Encrypted: i=1; AKwUvBwV8sIf0dVNbt+hsbGgARvj5/78/XVvUAh/REYoyrlbPx4BBTQIE71HfAaQVhX9YZiQXMRtSOY5LZqMs4LShff9@lists.infradead.org
X-Gm-Message-State: AFq9FYKR294RUx8KxtL+SI4vtDImeF+eR+sxkydXt9qmDSLIIgdIoM1a
	6qSPFSQCrjf4Xn7qugDDuwmPCagJcYzZ2ymPDnKXP/UU9wpzfM68iEv5
X-Gm-Gg: AYBFou2lETGbfuVF3OJKVEZDh0qPzOF2VgahHwOLOeMC7zbnFmsvj0UwoXHaeAq5ny0
	mxEaTSZA/mxSx0zPWX/jz2P+hXIqCzHvhbyZxw+3L/zd7DEf0WTYySQqtw8ZkILOChgizyO/tek
	rZ2YCulAkvERfFtaUDaeu9N8w/m7nSNHW8bL2NXnvMSI5+H7Wz2QMyARN8GtmHHj79owrSTVnMd
	iNiybJ2Z4nxejOCSwmB1TGHXwIc2juRujtVK6eV8knYHQFrX9UpUb1Qy4IWGO/KPkc2dFxDZyTh
	mSx7chGyGEATuo+jnWHb3uCkcbe32pSz92hkk8dI7I2Rma9xubwopwKHHY+BQLNzbtpYk7aL7ww
	ATlHyKTpCsld7hHoF7BVuyiJcdKIMGSuXjZ3BM0XOjbg+pC9FnrZrtkg9QprBsKaX+BMq0TWGY7
	sW+t4Pyjw7y7mOXXmluG5L387tJESGPOpmad5PVFtgKG1YsHESBiRfYMYEwE2oe6Wen9pcotn6D
	p2dOkPlcvVPHi9Vheg2WlR+gsFrang1n8J9WkC2Lnp5XoyC4LHqG3mjS/ttgmRDc1w5Io1JjenD
	kb0St7fb4CdCHo3pvt4SMn7qle+6j8vrEWSMut2t+lYqIlj7PZH3dCawqZicga9cXIxKB5lmrMG
	JV0KqGzlHtrnmDuF84CYKtD5I7QjRGJAbfAJGHazeZogbxT16zqV9saeLAn0=
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr75350095e9.12.1792646253837;
        Wed, 21 Oct 2026 22:17:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
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
Subject: [RFC PATCH 07/12] entry: Carry ordinary-hardirq provenance through kernel return
Date: Thu, 22 Oct 2026 07:16:49 +0200
Message-Id: <20261022051654.79224-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221735_852015_354A1643 
X-CRM114-Status: GOOD (  16.28  )
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Record ordinary-hardirq provenance in irqentry_state_t and initialize it
in every entry path. A later return tail can restore hardirq classification
only for entries which established the pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 4 ++++
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 24c2b9fdff4f4..2ed637cf66b0c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -333,6 +333,8 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
+ * @hardirq: Records that irqentry_hardirq_enter() established this state for
+ *           an ordinary hard interrupt.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -347,6 +349,7 @@ typedef struct irqentry_state {
 		bool	exit_rcu;
 		bool	lockdep;
 	};
+	bool		hardirq;
 } irqentry_state_t;
 #endif
 
@@ -396,6 +399,7 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 36c43d3c76eae..ba5959a84bc4a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = false,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -140,6 +141,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = true,
 		};
 
 		__enter_from_user_mode(regs, true);
@@ -199,7 +201,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = false,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)


