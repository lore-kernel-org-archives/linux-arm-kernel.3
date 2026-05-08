Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF987CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30ZhZdfmrtOcFuubwwqepnxzvYFJYqa0s1UQWQJqRVU=; b=lxc0UU19grIfZUtO07mmhOgMO6
	fW8VhtyJtHyE8J0FqWPaLKGLY3hgTyHoi4fOBdtowmR496K1D3lVKp0m6S1FFYM3jvRhimYp5gPxS
	wDZ0yqhdqQohPZmGSDAlHoMZYkBmJcDVNUH7ydW9XESmMiPi7/CLoiWDNJGU6iaWNh07gYCybu+Cx
	pBlV8HtPk8KZVFn4qzrIS6cNtjsKS0Efcwwv3peVki/DPNPIQG5IR5ufeAeeVwxqpvnvIoqsqrLIP
	+2+4qWvtQgTh1FRhJb2seZrRiz+/TGoRev7yF/6EWGmFY9x9gDa5teA5xecs7ik/mW/XzJU4QMqui
	3k15NuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHiu-000000068tn-0L2p;
	Fri, 08 May 2026 09:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHit-000000068t5-2MFj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 09:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=30ZhZdfmrtOcFuubwwqepnxzvYFJYqa0s1UQWQJqRVU=; b=rK3hgHOTGh3zoCPeuhDzxDUBvM
	1fCXULtPFj/70yoZdaM4tTkx2HtyrSZTnMqUdscDOU9dtPC6pIMOddcZccW0b96KWS9GgbC9g8x5w
	D81brr1UmR1/xCzEpCigJKOwUSNxj/JZM4fdpwewTOT7MMWRxhNWcljoVXFebcnKHLOXCQUkvsHfC
	jgC2FM37VCD1pVrGkjLoL2rvqFot7hm7kFm81ALX7bVxgRwTysg/iTNiz2nl2EuAcjXh72n91r+sB
	wpopPI3f8de9XqoOqnkipy/DSNU8pLMQKzHC0jWSfcza6zMSnzE5tj3gKA/cPdJ8Pj1P/dXW2hgyL
	lGiwQ8uA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHim-00000005qTD-2vqj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 09:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DE974442C;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB2FC2BCF5;
	Fri,  8 May 2026 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778233331;
	bh=Ng7f/Ng6zPtl5KJt5T+b4Vt/9C+9LhrfLa105ysMhuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jsp4ANK/0x+B6gBX4y+5UXM1HHwizaYIwWoqtOptRcaUy2UFOqaJCHJOyuQsTi4w2
	 8KD2gB9QJ081fCa7c47peA3w9cAdmuID66Ggojr28n7evvoHl1zLemG06UXsVGe/3c
	 83BokTOrBo+tKn5sX4yfTVJQUJ0fDqWjw6Khl19wC3zpWTrsJzGDuPjp04wSeTBtek
	 EYTH++feSE9G8VBM0Q8GkLASl4CUqMh/Cvb5329yMzi1LvL5iju9gXn150hPf+PR6e
	 0PerWgTosEHKgcLfdkJXAXa1AT47g3MJ6cFbiqB/Adhglx3ESqal1FMXvyAURrQNf1
	 2StIRKiWsGM6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wLHij-00000000HJz-1MJW;
	Fri, 08 May 2026 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v2 4/5] clocksource/drivers/arm_arch_timer: Expose a direct accessor for the virtual counter
Date: Fri,  8 May 2026 10:42:02 +0100
Message-ID: <20260508094203.2913880-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260508094203.2913880-1-maz@kernel.org>
References: <20260508094203.2913880-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_104216_536105_6F0083D7 
X-CRM114-Status: GOOD (  12.76  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

We allow access to the architected counter via arch_timer_read_counter().
However, this accessor can either be the virtual or the physical
view of the counter, depending on how the kernel has been booted.

At the same time, we have some architectural features (such as WFIT,
WFET) that rely on the virtual counter, and nothing else.

If implementations were perfect, we'd rely on reading CNTVCT_EL0,
and be done with it. However, we have a bunch of broken implementations
in the wild, which rely on preemption being disabled and other
costly workarounds.

In order to provide decent performance on non-broken HW while still
supporting the legacy horrors, expose arch_timer_read_vcounter() as
a new helper that hides this complexity. Obviously, this is simply
a global alias of arch_counter_get_cntvct().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 2 ++
 include/clocksource/arm_arch_timer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index ee21804d6613c..6fcd9afad38c2 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -137,6 +137,8 @@ static notrace u64 arch_counter_get_cntvct(void)
 u64 (*arch_timer_read_counter)(void) __ro_after_init = arch_counter_get_cntvct;
 EXPORT_SYMBOL_GPL(arch_timer_read_counter);
 
+u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));
+
 static u64 arch_counter_read(struct clocksource *cs)
 {
 	return arch_timer_read_counter();
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 2eda895f19f54..587314e584839 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -88,6 +88,7 @@ struct arch_timer_mem {
 
 extern u32 arch_timer_get_rate(void);
 extern u64 (*arch_timer_read_counter)(void);
+extern u64 arch_timer_read_vcounter(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
 
-- 
2.47.3


