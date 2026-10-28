Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C3E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvNjtfy8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6SFgm0U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=; b=OvNjtfy88RkIPk
	t1IYn/+1abL8y/290wNSAXK+gnsxcKo9pUWlCfNKOD+WuNTTIEABLhwou6SkggIjBTZXQmheizJ/Q
	T+rKwfzLpcv3Bos9QAyk4Ft1Mt1g6SJ0jwkIFUitUmnJsYbM8PbdH6OnF1Ytla+oXr8X7ZSJkF4Xq
	cRv4FPNnO/Sq/F75rNMZuOxeMTLqF413mEnnf9gDs2umjs181rJpujdsbZloI+oiPrXzl6UiN+uuc
	xgPlhSoN8EDOnBHD/W19S/IHTnPCdKZoDqpIm3hbR5JELB9dVDaOc3XT3ddqw9WlXZeiOYN2fhiDf
	11IPzd0sI8EFYlheoRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOI-00000006CyA-1PAH;
	Wed, 28 Oct 2026 03:31:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuOA-00000006Cvb-3r87
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:31:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5004665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158304; x=1793763104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=s6SFgm0UNARtiyEhV6HgxH0LqKItJxjywMKQnATwwmplqIl/0Oye+qp1sIoXiY0QnD
         t5p3NZMAiF2igMJ2jagHm6nNuD8wIVRVSoxfFiaVQwwJfdRXooXJ4vrwPByUoGgWXqhv
         7Eb63CFhoOBhrXPUYy77mC5A1O10YBUnnbwO48lWEmEFeboM68cx7hMkUltDveXix6lw
         +L7tQVHriLFFNPMHqfYiob+1fUXRl6qavud3AU3aSaCnKvf5YGyCxsz2vN7Hw8p2TAhC
         LQLBnvw8YbujpwJ7yb89hSVEg585Q9LOCpvvi1iBJpMpXUi8XrFnLIfEK5BVHzksTx0i
         peUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158304; x=1793763104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=v94favm9rkU9ViNj3CrArlwP1clP3rbmy2sK17vpLjP4m1XDd3gl126MEXimIYjb5o
         1Jxiq1BPcQM9gH7vwu54m9Hm3HR0oyapDVd0gnXxXQQoKN9epE/+L3WsN39rcu2FPd81
         KFgMj8MtrrBJvcHHw9GEaiAcIu7UeWDdgNDtc/4T1j3TDGB5MfQfrAwfqyiTg87hfCOo
         frWwViDSkRC9k04EMbw8goPiMCOEYR3V8qhUmUkbdi7O9gmdVN/W3Iwkl2YVvbO5gvgE
         KWw6RY0XQ6GTI4HY+0D5cl4XVEzpJY798BUQCmZhlr+t737C9iE6bYz3grwp2WRnw16x
         jamQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTxGVen/W8nA57l93AZLzOZRBRCUiIOCl8czMsX5oyxi0P2EJO6dIsiqzXTBMBpsA4irAJHVVhyh0sHhcgYqC8@lists.infradead.org
X-Gm-Message-State: AFq9FYLuOVGzN/1uWvB0DZCRh1mf+NTwAio5w9gMEOjirPcig+QE+zhT
	lCXcjh13frfi8csu7UkDS9sKAfbXDN5Q8OoDYdhDtjp91V5b4d6ZPxCg
X-Gm-Gg: AYBFou1nXQ9/hxqLMoZG9xzwT5iVWx/MzGvLwJHqegvqhoUi/A0Sfz1GgsOxTRch1rW
	f9w7C/eicspdA8MyIa54gwNmhO7NN65LjVZN4EBqr2hdvaG7QmSiTWvCMEY/GfBZTsNv1LEQcML
	KFA2yIbIfTBfiSn9fJJfq9sPm8RKZT8tJgd+35bfzRTKgxDUZkLAFpuSya2TGd/9Z6LjfmRJPU4
	Q7V3PAmkb+zk1YC/ck6AMRRAjM4lJe+wAkcf2VNzHhZOfFDkF5Z9f4KuKvD2lovoItO+RlYJjDG
	0VBL2HgmzUgziZIZd+iciSTwIfoymnAuKWnbkQEiOqTQO+8EayUfjDZ5RdqOzYQ6wI2T66Hc70p
	HVdu01TdUzoYhJvZWeE2Mb4zK2+R+KgZOfJUW8MAMaKom+XVH2c3fnOqRxI3W4ohiUsxJXAGOGA
	B/oZ/35Vq4sGremUkjlUgUV77ZA8thR3vMkqqNcJR0NwYXfBmVvh8vj33ZJ7ogq1wkudkl7gd6R
	aJwkL6K+JbPjiJX1V47fDVM5qPwIQ797i/POsQ70ew9rZFptTHPzFu/SlaZfG9rZJjhGbVTKY1y
	PnYvg3O0+sPM0lIQ4+RK7P2Z0ACdfyvPXykW/GizVbbeUkBRnMczWtGIrXcfjOWI0nIHJJ3fzK4
	w1PZ3ZTlahGRHZVSpj9BSGjtdMMF4Tm6mb+R/d0tSCp8UC3gp74hrDYtl4p2JJDOgIsLE0G7/vo
	7+Ls5x5hl+JNJCh4Mf5n6hiEZ1H5TujEK+
X-Received: by 2002:a05:600c:6206:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a967e8c07cmr16606825e9.34.1793158303715;
        Tue, 27 Oct 2026 20:31:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
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
Subject: [RFC PATCH v2 01/13] arm64: Always inline raw preempt count updates
Date: Wed, 28 Oct 2026 04:31:15 +0100
Message-Id: <20261028033127.82193-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_203147_216566_8C5FDB37 
X-CRM114-Status: GOOD (  14.01  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hongyan Xia <hongyan.xia@transsion.com>

Clang can outline the raw preempt count helpers from noinstr callers into
ordinary instrumentable text. Force the add and subtract operations inline
so entry code performs the count update in its own noinstr section.

This is the preempt-count hunk from Hongyan Xia's pending Kprobe noinstr
RFC. Keep it as a separate prerequisite so the early-hardirq work neither
hides nor claims that fix.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
-- 
2.39.5 (Apple Git-154)

