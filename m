Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE9560A2608
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15my9T1y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjRVy4cb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=; b=15my9T1yRdqMow
	c80ABVfcYNCogN9tEVf9vuYlp9xESNMBYkNCTt2Ze78apMDlhWg1DRwxq8Pdn1lovugIXT2KfKUJu
	qn58GztegjZkHni/lG/RWIwc+2u7YE+Q1543KJcokz0gZUW7kzLKsVq+nBIrdWqVcd7SlDFzzekXI
	WFxyQ+Hw4jNwX+QK/LUtncOJfU3367Q26NnwMusEWIylsLdhTP0dNAX8X3JIjcmNIXhEYHzcw6/Z1
	cALUB/vPlWLgUogkobnZI3yUui6CVBHBd66q2U575JnHL4LUxdeaN4E11LbAcDLG6hJ8L+BcW3Ujx
	6jNO4PxuVwPFv8ZuoI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOU-00000006D5A-094q;
	Wed, 28 Oct 2026 03:32:06 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOP-00000006D1d-2eib
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48e46e449e8so289396f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158319; x=1793763119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=BjRVy4cb7aMVFdonJ5pC4zm6s7HCsyygGHIY2oHBeA0H2qBkpBiT3FSaw5Q4nbHA4B
         +x1/3+qlf9UA2Uu4cKGEoet7WP7Gtviziqe9tnj9uPADSG7pYQYvx151s0Uu1cKL2pGI
         Mm4dqMeVsg0jhqVaifCHaKWMmrTDCKG3lnIh4+CWcR8DTO7WVMURLWcEl7zRjX4E+6vk
         PmeY6Uu9h2FZxabyETfpYBV9QuIDsumFWfRoaKYjDphVH9m9tuufQR7TOcP+xsBIDAHg
         EbloMiaFd0ktvgEXLTffRQFWe26FTdsnQ8Ll1XTeadraS9icWxenaDvIJzoM7FiY64sI
         u3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158319; x=1793763119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uboz3++C7Vd9eZqJpqK4o7EY0U6A0LogLMvrqlbwgTM=;
        b=2oXM11ajAd65xbJcnmkVe7Oe4nPI3Kykhzp3SKD5m13PDz5VYucG1RvWWpGk5nY/Gk
         yhTDAqx4zrKSSfwnMRv3/HRR6i/r8kvVCvTGChAQvQvQvE+8a8XA1CDcbK82Jt2mqQYu
         l5WuofZ7cjt3Bx6zes6kyMXBzUUPLaGSCMLzCDHLRTsbHEiD28uGJoc9N71M8mD8/uEv
         KYx6epWyTn76LNovWeFQ5O+p28Tq+zSLXDnXW3RZ/SnNLgdpAjIDRvVc7E9W/zu5deIp
         7yqLPnam8umjNa0NgtEtZP889hDpK/KpZXIdvjkTBuknW17i7u42uJY1woYvJm4IO4vu
         zd8w==
X-Forwarded-Encrypted: i=1; AKwUvBzDTArzBdTpBxerbBujCCTCBCOQKLCDbgkRwTMuDBaZG+vDJfwrahiDdZe+znzcb5CFQ7Oog3Qrd+wVcZjnp17f@lists.infradead.org
X-Gm-Message-State: AFq9FYLJaOic9d2E2tI4GeE/B1XBz12u7aZtcx0k4TC0QnNJpZ8IEkqA
	aHTqu8QxW5M2UL1yRiOXzwzM8M7SLiaclfhwpDzsOVpDb9W6x0r7tIVt
X-Gm-Gg: AYBFou06vTpuTvRNVrUh5ir274vkZ5qsSzu/LmN/KE9TLRx6rMmx+Q2JQJ9rK3wgnen
	bA3pzq7TlihCUOTf8Nk1c0H8YycfrZsPPMTBUBSaT6LrfMHq7cO4umhvoYgsG+CdOXEPoTUVi/r
	l8eHMcCmjQbEcXm30w1lxrwQhqJC0ThUfs6fi8SIE/JcjqDe1gh3k4XS0673sBrCSz5iMPcW5dz
	1QXbyJPMKBEJCsUkwDbmPXqf6tln1Bw5s7gzchp0hwS/wyzuXURUuJo/mO400h4dBYJ3dpb35Iq
	1Qoxdn7aBLCqunxv7ihbYV4c3OS8qEMGtquSwEDp/Ro5qZDMySbMP1Nu8MSCz13X5edmbTxvOkH
	Z5XcIhhJpHkLmEhps3aTMi5UUTHv3MiRQmYyp7dHcyBiYvB6IN1WE+m4S7tggD3+BjF7vO0i4wI
	2uyqPf9ehP5vL35gN/UGuqs44wSYzfbnWhlLIFIYoxNpSVyqi7uHdYCQKC3/0WmNcvPBsqrUBmk
	yrFok3HDBXQmeJQZlRAs0ByTb4pb+w50CPDr2qJFVXxlSu8ccMxKxfc8jBpAncsMTHl5gwxIW8u
	EnbRjxBzK+7dm84oCqpZ47Uf7NVDx3ZcQpJVYPH0KQkUDYHRM/U6UTyq79iUDbuUD/zOc0PpYgt
	vF3wEvyL5zBb9RIfL3PCLuiVP++XRfKFOGm9Jdc1kmXjZIk4iEmgGTZWzZEYrYbBo1BKAxrWl/x
	DD7dgJ80z7s3IanURukQih76NyVP3b6SkP
X-Received: by 2002:a5d:6f04:0:b0:48d:f7ef:cd1d with SMTP id ffacd0b85a97d-48e5d2e7526mr2965587f8f.9.1793158319122;
        Tue, 27 Oct 2026 20:31:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:58 -0700 (PDT)
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
Subject: [RFC PATCH v2 06/13] entry: Skip inactive IRQ-return reschedule calls
Date: Wed, 28 Oct 2026 04:31:20 +0100
Message-Id: <20261028033127.82193-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203202_905649_F36197F8 
X-CRM114-Status: GOOD (  16.58  )
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

irqentry_exit_to_kernel_mode_preempt() calls the reschedule helper when
preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Arm64 invokes this caller from noinstr code. Force its preempt_count()
implementation inline so Clang cannot outline the new check into
instrumentable text.

Assisted-by: LLM
---
 arch/arm64/include/asm/preempt.h | 2 +-
 include/linux/irq-entry-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index f3a5c2cd1936d..3e9bcc6e76625 100644
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
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 289e308d2d46c..e1fd9155410c1 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -503,7 +503,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)


