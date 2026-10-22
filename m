Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF414606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhM48i9Q;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyzrEL27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=; b=RhM48i9QEaX7qPOy0sic2FLzMy
	aSF0/IxUQanNE8QCI1WrXTbJJMWGW3PWxXVbC8iLYHqTWExpfFo3NtkVPShvRnAH+xjRaxRRa+Utn
	YhZJDzfeuG1W7Fp56BwfN8/0mhiZ333U/Nlv/E9gkM+1lzCcR4ngTUAuhRo1ardiOmpwL0gC3B+aV
	5Si4RFqh/Irub5TjYhDjPWnZq1ZjgJ/kdcfN6LBq9fmCDaZemTcVDWynNcBlxg6tx4HDPrv2rXPzT
	NK1bNTKA1RRFcv3GeLn2xGVR0Q1poh4kJ1xjsSFXXpXkQd04tNLDq6CiP8Q25ovWu/PmSSr0dpC9r
	+Xg8nmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBL-0000000DMLc-184o;
	Thu, 22 Oct 2026 05:17:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlB9-0000000DMEc-16zU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1df146015so10968305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646245; x=1793251045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=TyzrEL27UJxZW2xwVb3U+vO0tD0xxLmXZS4r+FQopoxk1f+u6Jsp90+CuUxkJpRkRN
         DnMG7PE9okdY765tpdp45vNWNYHLwTOIvU2N9QR/7PayV9kxBpXcwo1q8pD3hmI335ra
         VKnSQEwhoY1pHbYReIY10ZrflatVs3nMS798OCeZNZrMSzQ/Zp58/9CXAMqOKQh95noP
         wDLzTBxTel2iI1iboTUtCKhonqp7iEqpM6bsc6Rrny8Rnn5pIakgNZjU2T0E/gDvitnO
         +ksl/5ApPmIKXX6RVr2jV44UPjpISGrU1erftR70rl66dq1jB94BGrcbnal9lYt/zqj9
         po/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646245; x=1793251045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=FFPzjPDbABew07zoIdfphdy9c79G83LV1rWiDa3KXePlD/I4yLzIEQOKVmYGE8Ks4V
         urwqM5M8Q7EQucf/f0ga0kP76zcIkgsL3X/RfeNCi4/kkb8RKZW4g4hfIWLdd5PxpO2G
         RjRMqXhGh/HJNktfRM3tYKgfePOf+DuALSFSzj2MnDo1ceRI3a6Fgi4S1lT34l+pgZqO
         HeRbjexlsvKoXYyCMyxnPHaO6akGPEztkIbV8PZ4XxcqAr5TUT0S9IjysYuf988gL1j4
         6cGR0oOkT39NDmstkPdLOAzLXT40w79Fb8pzbqU1rJkpydBxvZycD//k0J9ZK6f5snG2
         y4Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwV6BY1TRtacKPUSmqD1zbWNbGGNY1RAOGg2F0w1ovVBAxUrrmK8NgbaScaiSUNzGeMpKOJT0+BCUnmDtZsCGp7@lists.infradead.org
X-Gm-Message-State: AFq9FYLNzdm8P8YEh/58kJr5pa41R5JSddiegXK1RNOm/WmzRrDkSBMa
	JodFbYzDqrLTTWpsYGxWl3yYrm8XTiM3POSqha8SmB3JwOzjkYeblMch
X-Gm-Gg: AYBFou14VNsMegsANVj1sM2nwm5lc4bUnbmzlJe5vtlkbcX867U7E7KRV9L5R9lEMDv
	vLmP4c5YhdRmz8nGB4rbX9hauHH3QERM0qHreSleF35oczHoGxNdzLrUMY16/oDYl9G+ZG4Y+ai
	2KFbxPgVFw1EyhlOgbf7eEprljg7YW3hS8vcBNzfyMuFzG2a0U7vdSI3x2v1+FarLLVPlZca5jq
	S2MLWhWxjc71D4c31EScdgrk6EZggUTnfLGgjSOjWRyKV0YdDQ6PdJHWNSxCeTAqRMKRtXYOybm
	qnON5LlMibULeMlhKk2jVQ5KIeIjo+3ve4Hlm3aBgIvvAbNOnB5fS4I1PN6Pw7U22U6SMLOD0k/
	f1n0AgCG1qCkpoRsQLjaqJMEJe6ZEbmlCZVEu6uVLdKTTrDwfJlDtR8/HHdWeyNvfPgdyBkfkOt
	kv9cBClAS0fvGMzhrpYrl30y/aGdOu1A367mMyoViS/wSUl/SKbggWo3pxlKlfICvHIgneQHOzd
	K7m+ONOwFBXlTcUgW2XYt62wOS1Z+yXw+Qwugj2v+8hVQvSj3815hD/WQ+3OHijPM95/Kvon7JM
	4gxpMoKLMnfeLh1QICt0KPBGy4q/7D0B2vr35VLDYaxQ12FNhz2z/1e841kSNCU5mie13hNgEL/
	wTMHxfCyu24oOqAoWLl7rCsnL6w1rOzXtf9h6ymIRl1Dq4Dl8CKWJkJIObX8=
X-Received: by 2002:a05:600c:4f50:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1fdb079ebmr98097255e9.10.1792646245241;
        Wed, 21 Oct 2026 22:17:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:24 -0700 (PDT)
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
Subject: [RFC PATCH 04/12] entry: Skip inactive IRQ-return reschedule calls
Date: Thu, 22 Oct 2026 07:16:46 +0200
Message-Id: <20261022051654.79224-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221727_811060_C3DD2C19 
X-CRM114-Status: GOOD (  14.97  )
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

irqentry_exit_to_kernel_mode_preempt() calls the dynamic reschedule helper
when preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 3ee80e926a17a..24c2b9fdff4f4 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -487,7 +487,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)


