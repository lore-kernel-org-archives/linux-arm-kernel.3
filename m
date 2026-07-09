Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C58C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bwzh8l9wvGRzuZwCIOPoH3Qu5rGTVYxguQpIrFLJvk=; b=uOopavUUJKKLFd
	gTho6be9EO1vbWFfgSCoRh6UCdxjjSvbrXJygAuL6MdVRbpbraJkNkPHP+N0QrkECRbddOZL+5Vjs
	OU2/WJVDdzzLkkBm9vfxLB2GGx4EyXS+UnvPoaFYT2GqjHFnWuF5czayUt25kzrenj9xxvJZJgcKA
	x4pKnX0SJ5AGYwedCgtAc+Kl9mUmQnSemjusWEZ2DvpHVOuECXKZqF06/UrqDv7H0eHZvM7qOHPaf
	7VamBJn8z0PIit3nO+jFCjW4hlbVbK8BCWLTALWqFGPnQdpvEQq6ambwkqax0UdEKyLiJCUTBVKGJ
	ETCOzX0/yjF7eKyTvgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf8-00000002Mgy-0PFK;
	Thu, 09 Jul 2026 12:15:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneQ-00000002LDA-0GH2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05A433595;
	Thu,  9 Jul 2026 05:14:41 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 121743F66F;
	Thu,  9 Jul 2026 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599285; bh=/ChyatiOMgSc+kdMzimUyel/D0HpPqZXLPZvlHgsiFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TQsly/8TqRyfYzOMPIH2HlCeE2hMCeCL0phitMYemUap8ycZqtMuBmJWeof/NOZak
	 fytYyZ5xBu2PyUmnALyYwa58gtQ8zaf3fant+TqJlgVGqzcnlIY30KES64OaoiSpb8
	 SgX7FZzyGbLThOfOj0KvMAk3vVhJD4eFzDjqabSU=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 35/36] arm64: nmi: Add Kconfig for NMI
Date: Thu,  9 Jul 2026 13:13:32 +0100
Message-Id: <20260709121333.23507-36-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051446_314136_2BACDD09 
X-CRM114-Status: UNSURE (   9.63  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mark Brown <broonie@kernel.org>

Since NMI handling is in some fairly hot paths we provide a Kconfig
option which allows support to be compiled out when not needed.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/Kconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e36dc4831200..968a9d97549a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2195,6 +2195,24 @@ endmenu # "ARMv8.7 architectural features"
 config AS_HAS_MOPS
 	def_bool $(as-instr,.arch_extension mops)
 
+menu "ARMv8.8 architectural features"
+
+config ARM64_NMI
+	bool "Enable support for Non-maskable Interrupts (NMI)"
+	default y
+	help
+	  Non-maskable interrupts are an architecture and GIC feature
+	  which allow the system to configure some interrupts to be
+	  configured to have superpriority, allowing them to be handled
+	  before other interrupts and masked for shorter periods of time.
+
+	  The feature is detected at runtime, and will remain disabled
+	  if the cpu does not implement the feature. It will also be
+	  disabled if pseudo NMIs are enabled at runtime.
+
+endmenu # "ARMv8.8 architectural features"
+
+
 menu "ARMv8.9 architectural features"
 
 config ARM64_POE
-- 
2.34.1


