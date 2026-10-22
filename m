Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C5606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WgpDzgx/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gVaF91Wd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=; b=WgpDzgx/tKw4ZXavGZFWSwM2qo
	VO0ipdZ6UOauwZUWn3s8ZNlODLIbI81tmkV/HJm0+noETscZ680/7iJC+HU5Ma0Kl4pxgOaOYwMpx
	QOF0BEmJ16U12AZb8pjMTYGYlKnp0qgkU00f+WqSjOO5A2gBJDH32L+xIsKIenPLpgb5m0YqbWgBF
	yrZ3fGBD4qA4Z5t0vJV+TVZnmkcXGNtg9D88wvzIWpURxlPp6bxfgnzZSFck0G4Oq5yB/uBKz/aPN
	D5737LUWHiUEwlV2FYbFs1r1KUldvK/slixM4r0zGFT+B4HuGnMXW1m13cqhYwOifVICVXzDno60M
	/L/5YP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBj-0000000DMcR-2037;
	Thu, 22 Oct 2026 05:18:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlBc-0000000DMWj-0j6Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:18:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso18117555e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646274; x=1793251074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=gVaF91Wd/yFVXOhfpCsD3nHphsrYol9s9i8OiB+9mQ9HDJT2GlNpaKNEZConWJYAYQ
         6Cg8yMIDI78MmGO5QnKErsrxm0/uIGhIH/uq5ZmoqT2fHZ2y8fd6cpG4N4O/nPhIUO4y
         62vt41k13kaDJ6OD7zu5JGEFECRZHIA4spgHnlbL8JQ2JiEg4ES8x0B9YWh0VWyKH+q1
         l6jRSjDkCLUuQeJBeGQLosCI6E1RJaIBJJ8QGRdT5t2A6TI97Yzt+oYaEiFF5hO6Oql3
         VewI7KFBE3Gu3gf2ifz5z3tBEdSZepD0PIRvABuwS+0sFcuo1dz4gOjBdqw99CRzYVmL
         E2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646274; x=1793251074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mo4ijoE4/zyX2xv2dQEbhTN41cna2GSZkZljd09Fpk4=;
        b=Xmm8gx+VABEA5EQZztuzuqHtlq6oVSnIj/BJzzXVkbRCoijVxMTDeYW8nawIiru3Th
         0tbrrZ76U/V0T1COHb6oNXiLKmtgJcFhuPcF8dgQ+fGWPWcO4hvXBklIStB+wEnFwB/9
         LN59FpnxI5EQ4ue01gplES9CHa/DaeEeKg1GnjszFpzlMo2+hIaPNEros0Fc6fsH/Lok
         8RwQ9hBTHVdYdaX08uKWgrTV1RAtGHfVLlQ+e/ZeZENsaLDqk/2tcTlMAciW1R7ugvTc
         62igjzpeiXFzvtuwbprhmafR5lRzZv51w8PaGaPAulVUN+pFmYIKoFADtRdeTEqrUoBp
         c2cw==
X-Forwarded-Encrypted: i=1; AKwUvBxSps+IRx9X7Cy8CexIx4Sbr9WqmTMYgNePPb8nBHAiF4cwfJ4wKqcutfY7fGc30hjWlVOyyX2DQ6VZQjDe1a9B@lists.infradead.org
X-Gm-Message-State: AFq9FYJqgaqfDcSANJmMPBYv2S6zR/Gno9aPa/IGUJm45upzpgHUr7tJ
	NXtjW8+k6PMmDnexZ1gqd+xAlykWLW3/g65iYGXk3O074g3ZCMIKSDiY
X-Gm-Gg: AYBFou0CcMIPhi+5k0kONt4/X9gelDuQU/VQaCol4nlKUCy6AKoIYsDyEVerumW2Hpv
	AfU6Eu/E4dwYi2xGzhODQeGk9/GTqd5dMiBfA9sqoutrmzgJH5bkGKu0lqds0/xyoSEAL3mwrZ0
	/yAL2fnUkhCMiMg0l1I1Xc9NJILmAoq3Kl1oep/UzyMVn6E55nN58Dvmpzna6rqLcpOCjrDmjAk
	GHQD4PBOi0QSAm+HiwKx5QMJRMnrOIKT+/JdVlT57uSchsFyO/29l+L+zPCmSevgFaSOvFYa3cR
	7JyLdgnTOpWl7Il+PWzhaLZ1tcqKU1mMf/wbvW19fi8ica0zb90dB9lZ1L+W+8MPB8NrRct52tm
	kvGx5wScSNUD+pKicezsUdomQMqHhJZ9cH7FOetkK/4pbt0Z4QFXc5dck3IRL/l7AJLclnj1Uwl
	twR+JdeD7GU7W+Mmg7iW4Dj5/ty0CaMStoU2/slImDeQPhmFwa8Ab9dFn0SdyxiUDB3ikEQrfsI
	+TLqKNGphpwcECgqA5vpf2Clk39KUFfxDkrWo0I1UNIfUnMxysBDJV1Kzd0/jYtUBChgKaQf7bE
	h6EMUPSUAhDP+BYMxIDYBcGZ57xNA7v3rnuK07Y+dqOgoCj4Nx+L8Sa2VxORjrDcUWvNI4Svhc0
	8F+AhCISILWzuF25v3qDxlkhgTvqRPup0X2Xsij0AgdOomACqbGhdxEQyEc99
X-Received: by 2002:a05:600c:1c09:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4a1fdd2468bmr84667645e9.7.1792646274255;
        Wed, 21 Oct 2026 22:17:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
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
Subject: [RFC PATCH 12/12] tracing: Pin recursion state for its complete lifetime
Date: Thu, 22 Oct 2026 07:16:54 +0200
Message-Id: <20261022051654.79224-13-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_221757_177679_9D702FD9 
X-CRM114-Status: GOOD (  15.30  )
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

trace_test_and_set_recursion() publishes the task recursion bit before it
disables preemption. Scheduler tracing can therefore run while acquisition
is in progress. Conversely, trace_clear_recursion() enables preemption
before clearing the bit, so a reschedule can observe stale recursion state
during release.

CONFIG_FTRACE_VALIDATE_RCU_IS_WATCHING also validates RCU state before the
outer preemption disable. rcu_is_watching() drops its internal preemption
reference before returning, and the warning path accesses
TRACE_RECORD_RECURSION_BIT outside the protected lifetime.

Disable preemption before validation and retain that reference until the
recursion bit is cleared. Balance both rejection paths. This keeps
validation and published recursion state inside one preemption-disabled
interval.

Keep the transition slot unchanged. It remains necessary for
interrupt-entry intervals whose context is not yet reflected in
preempt_count().

Use preempt_enable_notrace() because this inline API is also used by
modules. The no-reschedule variant is unavailable there.

Assisted-by: LLM
---
 include/linux/trace_recursion.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85a..fd14380751404 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -126,11 +126,16 @@ extern void ftrace_record_recursion(unsigned long ip, unsigned long parent_ip);
 static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
 							int start)
 {
-	unsigned int val = READ_ONCE(current->trace_recursion);
+	unsigned int val;
 	int bit;
 
-	if (trace_warn_on_no_rcu(ip))
+	preempt_disable_notrace();
+	if (trace_warn_on_no_rcu(ip)) {
+		preempt_enable_notrace();
 		return -1;
+	}
+
+	val = READ_ONCE(current->trace_recursion);
 
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
@@ -145,6 +150,7 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
+			preempt_enable_notrace();
 			return -1;
 		}
 	}
@@ -153,8 +159,6 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
-	preempt_disable_notrace();
-
 	return bit;
 }
 
@@ -163,9 +167,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
  */
 static __always_inline void trace_clear_recursion(int bit)
 {
-	preempt_enable_notrace();
 	barrier();
 	trace_recursion_clear(bit);
+	preempt_enable_notrace();
 }
 
 /**
-- 
2.39.5 (Apple Git-154)


