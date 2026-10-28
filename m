Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74140606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rcOI7AVb;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLvTKeoA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=; b=rcOI7AVbHfSe9P
	Hzwqzjx5J6j6i1xmxAi/ugmAsdVSSl+DryRaUozipHv8RGWd5x6qgSgw/zQPynviV8xeRduiU7EOL
	z5kpQdJkmRcZ3PwF/HfEeKrUq3/yqfalfQRiVpId2UpGzxuZYVIhz06+eXxfGu2xALkgSWsykg4L2
	WzvoGmG+4bqPnFvRN8C88bPAPZUHpmiw0/+fIeYrnoUV8fqiR1X4Pmp2Kj3yRw9YNQauMq+i207UG
	Mh+ImUKBM5oYiY5pCIR2n4ebO3H1b3YiXCKR45J5yBca3B1VvT/y5FY8E9seDwMWVRHuJvj0coVAp
	eEh7yeaOpjlxFrCQ5/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOq-00000006DO6-4BCH;
	Wed, 28 Oct 2026 03:32:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOX-00000006D8q-33jL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48c4649b35bso405337f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158328; x=1793763128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=SLvTKeoAu3uZPk/urNBGDjlf1VRIgZSsCKLXfDb8EIBY+Z8q7LYIl8JwMMRu7fyMZ3
         q/CzElR/dyUtDKryE/8zj4ujuxHei/JlNndxaf6Pygu01dQldFSjS++Xwp7md8Ll+/eG
         O3c9bXQnoUmLdl9ONwqb4oCu+kri70LnjIBBKM1A1b9bicoUtozCDNiy9pSkVK+QmGQd
         dPLUjaa6aTNCmxdMWvmgY9UgpGJfV05SZJ1Tag6T7RGTPtAhwcea6MVKtZ6be47jJ6om
         IItak0rhCQ7RR1+DbNSfq3O36jZmbz6W72w7zeG8Ltxh2lLli0KbxKyQ8xb5YdHUrRdc
         /orA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158328; x=1793763128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=qHEyketHJ6HOkfz8sU6D/R9GeIQ8Wyl05njthz7o8LIX425kVshozqZM6mMXaJcRPW
         Uote9djBY0UaavFMV7A2YtlAVPxJ2vKAFujNQnmloaGjUWercBd48Hk3nVeU3rp3h5DU
         xJ5egy85RmrgBWkHGO/Go+XQ6+8xzDG/CzuflSK2f5lzo8viz4J4z7qhUXDNHmjv9ijz
         mQMpeZHazwvhYdwL3eAgS/PGXousNuTY2zGlDDrFsKyC1swu9d1qooh72EzpcUrgKfKW
         zZ7mbcz7SoWCa98bTqrgBDkeSktEjod9rAvPJE9RHer83OMIFTtCSzuZvXWo10GRzhI1
         UeVw==
X-Forwarded-Encrypted: i=1; AKwUvBxPzIE262iPvs0U4gEb+BF26ghBxTPMLKo+ILRUmmQ7uZcUuIamAmi/a1n2BffBmN9R4mK0ToNNWf6+cAZ0bdX2@lists.infradead.org
X-Gm-Message-State: AFq9FYLUNEsgQZHzfXqn1GfbxCrJ8yfCFMu4G23UX4DIEdSgEM13irHU
	Ba7nwzkvE+x65cQiXEmDgue9Z3hemOf4MW7eGqoN6A3qmVJ+2O09WvB7
X-Gm-Gg: AYBFou1DViKcR3/wjrigsr3UG5/RrE61O/QRoYMqT69mD26iOephIgUkZA1fmGuR23M
	bQJNLa9tKFWQE+VzRiNWEMK7/TPCkWhTIXUKHsZ7aQpY2k4zzJEaxytLt1zWDnHd56xvT/VCF8F
	CuuLr7+pM5/9TI8UPE9YIM7rqLpRNC8GlIk4vuKtyKQl6x2RlRtH31hKmDpsJTsQmKSJhbUBcGI
	23cNT0dCfP0CVlm+T+5bPlj+SjwXDZXRU/Xh9ACqloaLzSVpiAy0KfNqsDbuAkFSvmWxz/4dQMe
	S9d8UOEFjp067wHtnY7X4uOpoq2BzEnbXDZq8BNkHNcA2SthWEizZP5DjurKGmhtF302mxZlVX9
	ZAkkheAyvGrGfqb3Zzw5s9tW0VQa3CTBcCj3ds4oLmg5MJGW+8MdsZsyo1EjyMdt0boZXxgraY6
	aIUQuX97wFKnabuUNXVWnkBeYsW0OWzLq2qQcaRN9pd7B6gNWsWTFbbGmn4xCrZP/yRc4FnL6Th
	FhhMgwJd9ve9faBDpY8QbqbDRkO3fUu7hex9YPHy6CHCFWC2qaSOKZDFREu0iRaf138gOU6U8lP
	FnETliMX6HYaaopJLeqwyDqojhHlDdYFJPdQ+VpLv5+zifw9MdxcobDomrzlnfagoTRxIgNemty
	BFTkZYbE/f84e6uO9JxwUz5WBn9kFeDk9mjBNLWZm5m6MxN1aIivLcvnoGOHnaDzcHMit8d4OZX
	k9odowKl5iDyRRo7MBIU9BZBAejXLH2Bc6
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr2964330f8f.27.1793158327517;
        Tue, 27 Oct 2026 20:32:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:06 -0700 (PDT)
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
Subject: [RFC PATCH v2 09/13] entry: Carry ordinary-hardirq provenance through kernel return
Date: Wed, 28 Oct 2026 04:31:23 +0100
Message-Id: <20261028033127.82193-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203209_814136_1D38D47E 
X-CRM114-Status: GOOD (  16.08  )
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Initialize the hardirq state in every entry path so irqentry_state_t
distinguishes ordinary hardirqs from other entries across kernel return
while keeping the two-byte generic state layout. A later return tail can
restore hardirq classification only for entries which established the
pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 6 ++++--
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index e1fd9155410c1..6f649f6613312 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -341,8 +341,8 @@ enum irqentry_hardirq_state {
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
- * @hardirq: Encodes whether the current staged hardirq-count attempt was
- *           applied.
+ * @hardirq: Encodes ordinary-hardirq provenance and whether the current
+ *           staged hardirq-count attempt was applied.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -412,6 +412,8 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq ? IRQENTRY_HARDIRQ_APPLIED :
+				      IRQENTRY_HARDIRQ_NONE,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 9d207c37c5707..c7814c51bb35d 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_NONE,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -144,6 +145,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		ret = (irqentry_state_t) {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_APPLIED,
 		};
 		irqentry_hardirq_count_state_set(&ret, cookie);
 
@@ -193,7 +195,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = IRQENTRY_HARDIRQ_NONE,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)


