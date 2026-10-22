Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470C60A260E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vvzt2e9a;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C/D04xgk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=; b=vvzt2e9ajG+d6qakXgKhf3eVgJ
	hDmZhGgy+ZqKFZu/6APVEXayqbpuD2UspQP8rFN4Fzm4QiXUsKl2VGemexDDexbrFlUh2M1EJbp5s
	Y3COqlWtZk+KgHzX1jSsg+8/lI25JKu84CcWAxN/tuSQHu1bdDLqPUC2ZIgTkBjqtkeKz0pyeHQ1w
	5UE910ivIofqKbngHZ6lc3NCHrCb/OsvW1hakIZgr2gqm9lhfMHt2br08waXXfHwRIrdGaONP37r+
	Ugl3gFmlR9jIvd5E47FwiKMhud85dz0UWe3I47pvZHqhmxgM0cDLaMUTyX1o/lgfl8Xd/LziBW1W0
	6AJpGcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlB6-0000000DMDb-0j2N;
	Thu, 22 Oct 2026 05:17:24 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlB0-0000000DMBq-3KI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:17:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so5310895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646237; x=1793251037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=;
        b=C/D04xgkyeHtBhhKRSQNJQR/83K79ZVV35RzL8pI4/34G4EnyMDQhGfe4L7KjERzK7
         r8SZhOON6dTPELYyEkVO4hPukuIwHUe4SYhoethx2eo5ncL5cfxKwVgLAPJg9pyEfm8I
         xTPTIhIdOWfzMV8sDLszyyXWGj7D+pGTnHTvhif14TZ/1JwrSCi/XnR74mKYwPt22JgQ
         z+n16Sx5ZcfksoeCBjfYUOP51gpfF+PvFvSAF2XDL+VKpt3hSkUdbN+099xWHP7nNaqK
         I+YVVo6JQEOiLqGdZJjELasc9FD1YnJrs6XIXd0yLRj0Kw2R2QDOEu6bSX1ox+kair9V
         Tl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646237; x=1793251037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTPx+dOGfrZ2gbZc2iR4OE7g80jE9NdI9RPBQdZQId4=;
        b=lTSOOvjmjq+3najEuMAvfU2enw/CiX2qSkoZ7Tt60SXyqo+d6OI8NNxPnoY/XVpUn1
         R0olpWTNUw86hTA4uECrb1tBtmRCh0ySfdog9cH9DbR+Yq3MEuzttxu2aZRnDNlsstEn
         1HWdGMQVK8w8x9/b4IV1O9veOghL0+b2J/5e0ToUlZAN/o5BZjPhwE3eQufzFTQBivii
         7Zsgzq5pk1jZi10+TDtCV0rl/rJMt0Ybem+Ym/Ga0enHWSwS8LP8/v70Wn7Bjh5TEEzc
         4rmene5dDgzyYiUVdMeWhPedJbWpF63g6q98mM+ku54Cm2WNgOmj0N5CGsKE/oB+JD9R
         QMAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDk62K8DesD2m87hrIi9c6oQnww7i32kPDpL92W41NHDLzQAjN6IwE+9FPDIMM5P/W0k9FAfCdIuPOWYnv+HKd@lists.infradead.org
X-Gm-Message-State: AFq9FYKGX3GhqjlfF52lIobKSQm9dgbdvUNkUcMSHfF98ImIZVTpHZgI
	SZa+AAea+hpzk0vL5wyA4yqmqFvGWSE3U1VL99GFBGr4V+QOyaqCnjXW
X-Gm-Gg: AYBFou04yQmto1a3c3o4bhKGe6XWQduygP26xHLfT+Hhy8SyxziOZMHWgoPkajvaFls
	YiwTewtZsthq9Sn+naKTBcf6Fgxh2AgkKW0xDfZzaCMYrr/p4ljZNs/FtiL7gi7yxA0POY4C6f4
	M7yReY1S+QzmERAPf5MVCYBJNBnmCmn4nXlwi1PS1FP1eLKVH+4eZPCnS1oSZTaaMadi58xcTg5
	PflylUSu2Zp8eoYCfpk2uyHQ3KoHGkfwLODfnj+Pr9gSCt7yM8kkCEm7aTBKVZXyXXS4PhuDN+O
	gJc3VqlGJ0CSQfCU9C0xUpzTFYH+0YkUG67E9rLg4/IoQmBGUrg4fD5G3ud4fZK1z+NCySK1I/x
	5SiSqeGh/iqyX67osXXGeuQnx3U1n/R4tjsPDR4BWpHuTe4osoCSRDInemOSSRJywmTspEVR73r
	g1/sWDcK4O8S2creWNwlJzUghrYjUNjssof2bJn3JneynNzZVhqJQDvOzgeGt5psZ2PxvILIP6L
	YtNxWjTKgmX2yZL7cqI+tna+ni9CEyOYcHZtUOLdQfKEjte9fb1YuVyF8y81ryskajpeqry5lgg
	nEDYTZ2SlxDS+5345s0vOU7Zde8fsH0YIMJsEWxjaIWVwt7B8i0bRt1dqTP1arIrgPXXmeMMHRw
	bNFarh/sjt+N8OjQdxRx5sog56iN9w8wxE9qOMX5r98DMQ3CL6RuYV/KMYxI=
X-Received: by 2002:a05:600c:c83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a204aace0amr25847565e9.5.1792646236628;
        Wed, 21 Oct 2026 22:17:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:16 -0700 (PDT)
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
Subject: [RFC PATCH 01/12] sched: Split preempt-count bookkeeping from raw updates
Date: Thu, 22 Oct 2026 07:16:43 +0200
Message-Id: <20261022051654.79224-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221718_869590_C1879A4C 
X-CRM114-Status: GOOD (  19.86  )
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

Very early entry code may need to update the preempt count before
instrumentable debug and tracing code can run. Conversely, return code may
need to finish instrumentable validation and latency tracing before raw
teardown.

Add preempt_count_add_finish() for bookkeeping after a raw addition. Add
preempt_count_sub_prepare() for validation and tracing before a raw
subtraction. Keep preempt_count_add() and preempt_count_sub() behavior and
ordering unchanged.

Keep latency tracing in each calling path so CALLER_ADDR0 identifies the
caller. Force the start and stop helpers inline because trace provenance
depends on their stack frames.

Assisted-by: LLM
---
 include/linux/preempt.h |  9 ++++++
 kernel/sched/core.c     | 68 +++++++++++++++++++++++++++++++++--------
 2 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/include/linux/preempt.h b/include/linux/preempt.h
index 2e689de7b29ab..ad2c35b6813fb 100644
--- a/include/linux/preempt.h
+++ b/include/linux/preempt.h
@@ -228,6 +228,15 @@ extern void preempt_count_sub(int val);
 #define preempt_count_dec_and_test() __preempt_count_dec_and_test()
 #endif
 
+#if defined(CONFIG_PREEMPTION) && (defined(CONFIG_DEBUG_PREEMPT) || \
+					defined(CONFIG_TRACE_PREEMPT_TOGGLE))
+void preempt_count_add_finish(int val);
+bool preempt_count_sub_prepare(int val);
+#else
+static __always_inline void preempt_count_add_finish(int val) { }
+static __always_inline bool preempt_count_sub_prepare(int val) { return true; }
+#endif
+
 #define __preempt_count_inc() __preempt_count_add(1)
 #define __preempt_count_dec() __preempt_count_sub(1)
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1754d9f95f2cf..562d54b978960 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5978,7 +5978,7 @@ static inline void sched_tick_stop(int cpu) { }
  * If the value passed in is equal to the current preempt count
  * then we just disabled preemption. Start timing the latency.
  */
-static inline void preempt_latency_start(int val)
+static __always_inline void preempt_latency_start(int val)
 {
 	if (preempt_count() == val) {
 		unsigned long ip = get_lock_parent_ip();
@@ -5989,6 +5989,28 @@ static inline void preempt_latency_start(int val)
 	}
 }
 
+static __always_inline void preempt_count_add_debug_checks(void)
+{
+#ifdef CONFIG_DEBUG_PREEMPT
+	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
+				PREEMPT_MASK - 10);
+#endif
+}
+
+/**
+ * preempt_count_add_finish - Finish a raw preempt count addition
+ * @val: The value which was added to the preempt count
+ *
+ * Complete the debug checks and latency tracing after an entry path had to
+ * update the raw preempt count before instrumentable code could run.
+ */
+void preempt_count_add_finish(int val)
+{
+	preempt_count_add_debug_checks();
+	preempt_latency_start(val);
+}
+NOKPROBE_SYMBOL(preempt_count_add_finish);
+
 void preempt_count_add(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
@@ -6004,13 +6026,8 @@ void preempt_count_add(int val)
 		return;
 #endif
 	__preempt_count_add(val);
-#ifdef CONFIG_DEBUG_PREEMPT
-	/*
-	 * Spinlock count overflowing soon?
-	 */
-	DEBUG_LOCKS_WARN_ON((preempt_count() & PREEMPT_MASK) >=
-				PREEMPT_MASK - 10);
-#endif
+	preempt_count_add_debug_checks();
+	/* Keep latency attribution in the preempt_count_add() stack frame. */
 	preempt_latency_start(val);
 }
 EXPORT_SYMBOL(preempt_count_add);
@@ -6020,13 +6037,13 @@ NOKPROBE_SYMBOL(preempt_count_add);
  * If the value passed in equals to the current preempt count
  * then we just enabled preemption. Stop timing the latency.
  */
-static inline void preempt_latency_stop(int val)
+static __always_inline void preempt_latency_stop(int val)
 {
 	if (preempt_count() == val)
 		trace_preempt_on(CALLER_ADDR0, get_lock_parent_ip());
 }
 
-void preempt_count_sub(int val)
+static __always_inline bool preempt_count_sub_debug_checks(int val)
 {
 #ifdef CONFIG_DEBUG_PREEMPT
 	/*
@@ -6036,15 +6053,42 @@ void preempt_count_sub(int val)
 	unsigned int pc = preempt_count();
 
 	if (DEBUG_LOCKS_WARN_ON(pc - uval > pc))
-		return;
+		return false;
 	/*
 	 * Is the spinlock portion underflowing?
 	 */
 	if (DEBUG_LOCKS_WARN_ON((val < PREEMPT_MASK) &&
 			!(preempt_count() & PREEMPT_MASK)))
-		return;
+		return false;
 #endif
+	return true;
+}
+
+/**
+ * preempt_count_sub_prepare - Prepare a raw preempt count subtraction
+ * @val: The value which will be subtracted from the preempt count
+ *
+ * Run debug checks and latency tracing before an entry path performs a raw
+ * preempt count subtraction after all instrumentable code has returned.
+ *
+ * Return: true when the caller should perform the subtraction.
+ */
+bool preempt_count_sub_prepare(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return false;
+
+	preempt_latency_stop(val);
+	return true;
+}
+NOKPROBE_SYMBOL(preempt_count_sub_prepare);
+
+void preempt_count_sub(int val)
+{
+	if (!preempt_count_sub_debug_checks(val))
+		return;
 
+	/* Keep latency attribution in the preempt_count_sub() stack frame. */
 	preempt_latency_stop(val);
 	__preempt_count_sub(val);
 }
-- 
2.39.5 (Apple Git-154)


