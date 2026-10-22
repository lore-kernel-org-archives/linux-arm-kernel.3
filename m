Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78663606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XZLN6Bhn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mLEAEPXo;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I39ub0RI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=; b=XZLN6BhnhfFlxPun+BfXXDljwd
	y2cKB+2t0ZR3vL8SYUf96zpllpbC0CVCVnp1SJZaPv6vLGuilrey6ZhajrintcgNfohVlSe+OUOsg
	oJKOOsKwIIrs7mvfwBbzvItRwtC9dwlUlpSqK8SCtV4gxhCMIemyr9sw/jR58P10lb4LQ8Ec2Aczf
	pj2nm6sDMxaSro6QqeICWtrv23raWADyMnzOQbdQE3e6aqT0LIFbDmWMSFobeg25OW3Jxvhvf6z6A
	lKXLMaY9791eSHd51I3RXocpNKalslEKUtViZvp6XE6Z7tvC01JhLsRzkOfvSJypcWaoq2eTySeBS
	KKcwa5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBj-0000000DMcD-1cAT;
	Thu, 22 Oct 2026 05:18:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBd-0000000DMXA-0fs8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 05:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=; b=mLEAEPXo7GUcFeS/YP7N9ZTxhC
	CVEA4XLEKqUuQafKmwz1cG36w3cbsQ0Xm+9fe3MmTTLu8tQ5/wXc9SPOR+p4ynT3wJdoyRNzMt6oe
	Z0BzqYdPxjyctdqOcDfZvN1jg+CKZQq96mLoX543OTN5z2fLd6xn5GGCiC5TbrGlwQQQLCWeQJIAI
	rqhcjKpb3YmJv0ITq4ryG/3Y+YqQzP4Gq/hk9UCqTxogWBqV2BVbxFCilUNhAHJft0yfRQ/TWeAEQ
	eY5OVmfPs6Xyg/YzMz4Ip6WfZdz6J/YgtaCFJ/Vawpp/ycitlJ+d2cnf+EyV84XmDpCpY5Vb9Mznh
	4w899K1Q==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJlBY-00000006Tgz-3lFE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4956869750eso9711045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646272; x=1793251072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=I39ub0RIxTxrI0WGCU+zAxr0KMiRZ2VKYzP8U3Q4aQXA9W0aNE4t1LciiDa1Bsc2Cm
         2hCAe7Pr3M3AvKqpfkA+ztN1t6EZqzrHzexrFrsuQq/f9gMgd9YmuaVWc57N8OiK5mEc
         KxHW40CgTDKoimeHy2vOXzPap7LkjSuD/o8XnqkJzU4ckVEMjlPGmjkNjGSA0RBElXCk
         4GlzNfJRvQca3RbZd5PjEaP4nkRCP95V5J3E0j21C2vOlYMrGn1TYvHkrm192ML6JnBH
         nalu+EQWjEwCqb9GvPOHQUmaqpvksbM4WXihLMTKZZN8K1ROBQTKcdShFvw1UKpcsoAG
         42/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646272; x=1793251072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=aWOuxqD57Mgs75uySgJlbBWef3GFIZLfiF+qzaJqJsuCWPeVeOGT7OFBUzamMTEBzL
         D4kpPGhZQpZUmCDz2xQ/6u+w3mZq4dR+dmwtt3iJ0QBwC7xKNMzM/gxq2yFiSUOF/yBh
         riyBjlboy3CY/7lmk77yRDn+KH7b+ilkm1wArV96F4rrV4xXEhbuDcKB3pivPorJO+Hl
         d3exo/+6KE/tnWU/J1ycnoZ5EmTn5pfRX1KUMyQLQG37HIkub7msVKKljcHzPGuREzRU
         kdq/SNawPWvp/Ugu4FDWzjrkPB+Yxf6bAnKJfcjg5WDU23eGrL++L+rNIw+SE5Iqc110
         Z3GA==
X-Forwarded-Encrypted: i=1; AKwUvBzvrPQll46e1sQOb1UilLZolPwiJpIVXc+o1DF0CqJ+j2Ps3bAqhqOy+kokD0pe9kakTiJFuE+oHhgcwRxVR7GS@lists.infradead.org
X-Gm-Message-State: AFq9FYKAu+MyQAsrHNfavKXRJpoO3bLnlnLsOHH1GtK/C1YbFgRZd4ka
	y67Lv8YhMA6kQEUrkNsjTCzhTy+dfTZ4dBNiaPCi9nUw9fGjfO364bQX
X-Gm-Gg: AYBFou2Erj4/JF9e/C5hQZ976I3z+lzIQTPJc01iK18dyuhBn80FmagMaxpUxpCnMAN
	qhIstoVqWmcqlYvDZ3Qv6QTz4ySitRzWEAFsbJIrQ/IYF0Vt54SNvZm51imJaPmZQ3G9S5cnczJ
	BuiUvL9gWSloSxAF1whds2orn2gXXlGoaUF+ctn6Z3N+iebnuUpe6L+69piwczP1cbKuYjxRRUL
	/OIbbDIEedvVu8ATvgRonf/lx9BW+9vkjeYs6W1dV6WvM3TgecepikvGnA+ZrdsiAywN0+KFaUK
	/LOZen2VXFc61XNXOGCCiRoNHbOed2fMJlmbCm+12672uZfl4/lpvHIR0oL0r52t9GZjVqXRRJA
	9MJeS2D1eTsUGqI0pJio6ygC1c3jyYw1XxGmMjnu9/NTbf44jl/waEnIV/X7+FfVQjrq1Xf2QdT
	f8A+tzRHdN7seGc1liXZ+PPbArBZ3AWLmenAm5/RcELMniMhIfSD0Ja58TR+rDq4onl/iAxcg97
	QDzXueONVYTA7+CKR7eMpy+dHl5jbZGIo90cL1F7+BbYr4YKcSSkgGwrmmkwpF7YKYVz5I89U2F
	vXCpItUm704QY/5CyRZpJO++fPtp0QeC9CBNnKQmOxHUat3wl1xPGDbPbWZde9drCokws9uqGZd
	XqHf8ssvsqFZswmt5GZmx8w5RQcr/h//Q8hxH4ybdchYK1p4qOk4zTR3ACYhyC/j4UGX0SM7EwA
	1a66LM
X-Received: by 2002:a05:600c:4715:b0:4a1:e46d:1bd4 with SMTP id 5b1f17b1804b1-4a1fdd574dcmr76596295e9.29.1792646271519;
        Wed, 21 Oct 2026 22:17:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:50 -0700 (PDT)
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
Subject: [RFC PATCH 11/12] locking/selftest: Exercise hardirq return-tail preparation
Date: Thu, 22 Oct 2026 07:16:53 +0200
Message-Id: <20261022051654.79224-12-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061753_127883_49E3F077 
X-CRM114-Status: GOOD (  15.87  )
X-Spam-Score: -0.2 (/)
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

The return-tail lockdep preparation must accept exactly one live
hardirq context. Zero and nested contexts must fail, and the ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the
final IRQ-state transition after an expected preparation failure so
that each failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..1575a04f65d46 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -222,6 +222,55 @@ static void init_shared_classes(void)
 		local_irq_enable();		\
 		local_bh_enable();
 
+static void irqtail_prepare_test_enter(unsigned int nr)
+{
+	unsigned int i;
+
+	local_irq_disable();
+	for (i = 0; i < nr; i++)
+		__irq_enter_raw();
+	trace_hardirqs_on_prepare();
+}
+
+static void irqtail_prepare_test_exit(unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		__irq_exit_raw();
+	if (debug_locks)
+		lockdep_hardirqs_on(_THIS_IP_);
+	raw_local_irq_enable();
+}
+
+static void prepare_irqtail_0(void)
+{
+	irqtail_prepare_test_enter(0);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(0);
+}
+
+static void prepare_irqtail_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(1);
+}
+
+static void prepare_irqtail_2(void)
+{
+	irqtail_prepare_test_enter(2);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(2);
+}
+
+static void prepare_regular_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare();
+	irqtail_prepare_test_exit(1);
+}
+
 /*
  * Shortcuts for lock/unlock API variants, to keep
  * the testcases compact:
@@ -2934,6 +2983,10 @@ void locking_selftest(void)
 	DO_TESTCASE_6x2x2RW("irq read-recursion", irq_read_recursion);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #2", irq_read_recursion2);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #3", irq_read_recursion3);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 0);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 1);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)


