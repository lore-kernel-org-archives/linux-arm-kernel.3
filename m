Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593DDC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1F3vjN2Hm48n+bwBpdlW10r55DzPXDcjIb2Jc8W1lI=; b=ljTxsUz8Slsz0NRyumxwayKCu+
	/DuB6bZsmjmPe006R+/Tzp3tnnTGoN+XKFOROE9UiIqC+/ktxKt58vE3mvivxHbY4lnVY5B8fHM98
	uKnnC9wicLVbiNopizeK+mCKmghozBdpIJeprf55PM0Xxv7JIUsg4JJrae/3KHFlBFr1VTBbB0Vwb
	6coJb/wazSyBQJtm1ZWu9tyK6gKuo6LCs35uNC7L95YMnmNEvlpxIBEUKpbKi/XwQ//C0YX0g/6XS
	Ynkm3iFs79bHMUYKl7sQ2QZRtGKA0QG29fhroPTzw33WZrbmx+3oaKy0L4ZIVSIEEc/DAJVASplz8
	c6qOBI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKn-00000003OJ0-3edo;
	Mon, 27 Jul 2026 16:37:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOIx-00000003MSR-09m2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:35:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FE0A1688;
	Mon, 27 Jul 2026 09:35:46 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 508CB3F86F;
	Mon, 27 Jul 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170150; bh=ORBvc14O7LvD4525nSIh6lJYu6gpux/aCvHnB8UipQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cNg3WCn0qUq//Kv9oyGrAxiwj1nR2WuV01MvwdC0RfIrWdRDU6RiRfPFEoz8pM7Ni
	 Xw5azqAOQ2Cg18YarB3kmmeXPR5VsqIzoNtf2uPSQOL0UmxAbx+O9VQXOZq61FaO7H
	 n++u98Xb5YeRXEifRyLjyB8f6084G7pqgnZvmM0A=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 24/45] arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
Date: Mon, 27 Jul 2026 17:34:32 +0100
Message-Id: <20260727163453.7969-25-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093551_160839_C4A8767A 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
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

Last users of CONFIG_ARM64_DEBUG_PRIORITY_MASKING have gone, so remove
it.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/Kconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..e36dc4831200 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2334,17 +2334,6 @@ config ARM64_PSEUDO_NMI
 
 	  If unsure, say N
 
-if ARM64_PSEUDO_NMI
-config ARM64_DEBUG_PRIORITY_MASKING
-	bool "Debug interrupt priority masking"
-	help
-	  This adds runtime checks to functions enabling/disabling
-	  interrupts when using priority masking. The additional checks verify
-	  the validity of ICC_PMR_EL1 when calling concerned functions.
-
-	  If unsure, say N
-endif # ARM64_PSEUDO_NMI
-
 config RELOCATABLE
 	bool "Build a relocatable kernel image" if EXPERT
 	select ARCH_HAS_RELR
-- 
2.34.1


