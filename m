Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A319CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uIEvkay1m9FXLKL6nNfa5AWTjTifx45z4KghX3hjOY=; b=jnV8gcS/Pw44O4cFCnudJjVuud
	h21HgjcYcSuqewWS/H+vijPlMBrRFny4VQWrDjZhab0vYykh5CaGTqojwyLuPqs7oc8LL4Kaksh8G
	Ha8FSQTKhRaaSBEgOXyBxI54/76OZqVabL0Fl4qb5ogMPKDv89QuhEjtbPFp2CG58FG+AaMTFtRnC
	e3jsqlQjGXSbzW3WFRQm5VZF+VqxicaPNvXeB96qqMWoW4MMQMWZT2QOd8cGmncQRlmVpVKbG/jvG
	0PmUUfVdBFIWCrQheY8kXzr+PcYaUdXKTzKuHuqq4b1fCV49Zj92pkAu5/ySUTKUreFXFlf4OL5SG
	gnUuvpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9ju-000000078gj-46YD;
	Sat, 30 Aug 2025 00:46:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1M7-00000006IBZ-1U6v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 15:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9uIEvkay1m9FXLKL6nNfa5AWTjTifx45z4KghX3hjOY=; b=HkBZpctHueNSDKnRms7IT3ZTZp
	l6Xsnzmbnaj0kKPPoKwEixl7IS7jrvbuGkTTH8R4o9K88Da1Px9dFdAX8gE7UnJLlB2rquQcI6jZH
	FzKmbx9ka/KpMtOyvZ/OpUFexSFGUQAHPzNFxps8GkUesYESk0TJtksum/xeKWoNwwRd8ZNLgecmQ
	pnIIrfKqL1cs0AjxA9rRaAAlyPq5X6ZpYYfBeZXMKrgepzkO4suQUCRFy2dDqaKwteGd6YKPKbnQZ
	DsCLr4n4zEjbq+Iv1nkETYkqgQQzP3iPoDxDtMlHWURj74Y/RCDIaGb2/GGHzyFa4Djl9lKO1LOJd
	sTAYtt1Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1M3-00000003CTN-2lzk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 564404049F;
	Fri, 29 Aug 2025 15:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA898C4CEF6;
	Fri, 29 Aug 2025 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756482570;
	bh=Rz519K4RzNFN9C7FTifkrc2s4js15D9og5elk9stWlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b746JEi7ofbu/Uhds2/RNNzOPXnS7NWLS66+0qFYAYdB06+Utq0poYU59EjL1x1H8
	 dezSaOR27Iq42u6uaWRjc0o/96wwcsMJAiN39CyBlkvhI7CEX4TDv/4c8o1TVSQNuq
	 YJm8ix9mud4MyQuOE04B2Uce5NFehL9MJbWBkyAmP4z3jflL9uWZVMd0fL9MNCMFta
	 ubplVfs0bNlY0fF8820ia4Zf3NegD9Fj7qfeg/9O6tXuRg41IIusMhbt9Tzjb38Soz
	 is41qw93F1ecHTsp+2PGo249tkyHvtYsos2tbi2AkSALvzDsQEUI8XU02jqckILXj8
	 rbZrZMlUlU9Bw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 25/33] sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN
Date: Fri, 29 Aug 2025 17:48:06 +0200
Message-ID: <20250829154814.47015-26-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829154814.47015-1-frederic@kernel.org>
References: <20250829154814.47015-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_164931_939273_90B68238 
X-CRM114-Status: GOOD (  10.79  )
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

Tasks that have all their allowed CPUs offline don't want their affinity
to fallback on either nohz_full CPUs or on domain isolated CPUs. And
since nohz_full implies domain isolation, checking the latter is enough
to verify both.

Therefore exclude domain isolation from fallback task affinity.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/mmu_context.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mmu_context.h b/include/linux/mmu_context.h
index ac01dc4eb2ce..ed3dd0f3fe19 100644
--- a/include/linux/mmu_context.h
+++ b/include/linux/mmu_context.h
@@ -24,7 +24,7 @@ static inline void leave_mm(void) { }
 #ifndef task_cpu_possible_mask
 # define task_cpu_possible_mask(p)	cpu_possible_mask
 # define task_cpu_possible(cpu, p)	true
-# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_TICK)
+# define task_cpu_fallback_mask(p)	housekeeping_cpumask(HK_TYPE_DOMAIN)
 #else
 # define task_cpu_possible(cpu, p)	cpumask_test_cpu((cpu), task_cpu_possible_mask(p))
 #endif
-- 
2.51.0


