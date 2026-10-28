Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=smzwPspP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+nsW+yY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=; b=smzwPspPmQRPzI
	n2Be/QA51BCTFigFTTXLKV8hg5qsZZQS51Pc15/HlF0HVPgGzJoZVptmsIe2TFJs7aCS5amDDqyG/
	+uMX5cynZtwzQ0ol7KECJ9zllV18iJH93TbVqYEzkgTBisgP69ALzNw50bBHkyLybMQBcTxzrEP2q
	iA3ldTgoq3osVYlKv3XNhJeIRj950mkxb+ghoeFzOrOxZ9WCpWZkhq7GDpR4trV0OAzc5PK1KaATS
	StbnUJHdJTwYQ9UgPTKBiphwBQMOiLofFMPaGyxhKZOXb6saHVJTSlaoy1/sHbwSxvAVIg//XLXxF
	I8KsI/IlJ10XQK4lTMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOs-00000006DQw-0xoM;
	Wed, 28 Oct 2026 03:32:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOl-00000006DJE-22JX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:32:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so949625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158340; x=1793763140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=r+nsW+yY/WBjUF6zf/i07Vxx5K24X4YlfGLQCXjbn2xi4TN+6BwdH5QNZOolumLBv/
         S02HXQquhpp/RI5EELk2hkuO7mR/jxVo55SY82asXrjdmc7UC3RgZF0yZlGM2oU6weXx
         vTVerHsPi+9Pw0k0fv3QkBvsOJDBZCcmZWja7KY4Tk8wkmGxOmN/F+IjOzTncTaAYoJt
         UixrZ+SQI6UU2nU/Xg5wIQponeR3iNIZNpGXNR1sXZVdX08F3kv+y2ZJscuv2j0AlYYr
         +FFH6Xc2/9LfM25y/u8n/ag5ksmxVpUpHnhT1m+DBFmg2Hb9juIYMcXoxWbXg45eI33o
         ha/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158340; x=1793763140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=WslfFk6xk+N2uykUnk3bJfzKok2/EyhMrTBykz+jqgC0niiwndyjPhJ5K2a+LYWilU
         UmH3vRydVUFILSS2D4iiva0BZqtWLZcbV+ZTLEHP0AUNcZds8ULpI3CH7HJYEsYGLm8k
         slAdQwq9ha4H3P3tltrGUZVlFSGpGj2RNlx8P/I89toBf5N38geWLMtEaua11kNSdHpt
         JuGIgPjjuiv84+Wf37a+s3p99d7r+sVTEqWc41mdf3rMQIwqsK3lEy4PIlqaZzRWVH5K
         ZZNArI74Xa825pUFRikB1sXqQzSf6QiL18m+8Xc+Ty5syAw3tk2Q5lHuutj7NIAGYH46
         pleA==
X-Forwarded-Encrypted: i=1; AKwUvBwxpxHr3hhwLD0rz63f2h3y/Mrbi4JNaBbI2ACUwBobHqPFa199zezTdyq2PG7/czT9jka0IeU0FEcCyj6s/pHG@lists.infradead.org
X-Gm-Message-State: AFq9FYJFxwVvp3ecJ+Eu9dxJFYFBGri2zGZRLxrEnF0neBJXeOmcbLwh
	yWoU6r8HBAQFXmU2PSiBX2H5u/WMRDtkb/cZoUGkthjLp3gXRbSr5j32mrZcjSIbPFI=
X-Gm-Gg: AYBFou0CzxsuBqHzQw9m8qglBaPA3HC+Q797v+AGLZWGVLsOwMyz4fSL0dC+Q4xvly5
	7qPtq3TlKY7rPjKx3PmxazbK0/NvSJ+tsl/Di8ds77ZkIYPl6t4GR5KZI1uuD1b4m/Smy+DZRG7
	QWRWJvuNnok3Qy6QjZyTA3TYjow074rHZQlc407OZNTH+1VSskAVU33gVSxBjYLbygn3VBefOTf
	eYr5ZycKNIeTiWyP027GYgw0Xcx4Q34r9uRRmklE5tfwaPeTKbtA7hyB3ivkdpo11m6PFunkR1N
	ZlRCZX6XhzpkPsWp+T4i2dJeaBd7rEXgFN1Pjbm24ugfDgBIfdJVRTycG52rx+/diCMnX4DKZd/
	kCdgjnGxwgjNpi16kHxXDM2tlfwQ4+eAm9tCyZqb93m0Vqr8JOdrTW05iilBJWoRbyBecvU3MwZ
	ucPSa9KKDjWNfmPUABcn8TNXkG+afRySb89CwEu64+i84eO1kRXrH03k1r9U/Xv4pmRD0QLxJC0
	E2tNTyJ/xS5+Tufif7SWCkPY7xOE5s8bj0ty0ZdYhHywyRvuhnm5pdochX5SyYe4fltgbBcjldu
	hrmMrSvTphqSw+LoIjvpdABL2N+QlTvEGtIwMRBApzBdbbisMF9xBIrD1YAR9BZrvHU+NecsH6R
	09ERF6WuYapfoX3Z++niK7Dlsw7u27uxVMCgYjr8xp/6R0preNnMz7h1rK5MoJzaVoD2ZBhjQqh
	jfn26wnkwHieQzGADlnpye00ER4CAk210n
X-Received: by 2002:a05:600d:8641:20b0:4a2:10d:5e0d with SMTP id 5b1f17b1804b1-4a7c58f389cmr88355155e9.14.1793158339700;
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
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
Subject: [RFC PATCH v2 13/13] locking/selftest: Exercise hardirq return-tail preparation
Date: Wed, 28 Oct 2026 04:31:27 +0100
Message-Id: <20261028033127.82193-14-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203223_764907_21D30F39 
X-CRM114-Status: GOOD (  15.31  )
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

The return-tail lockdep preparation must see a live hardirq context. A zero
depth must fail. Depth one and nested contexts must pass. The ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the final
IRQ-state transition after an expected preparation failure so that each
failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..7e26b757344a4 100644
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
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)


