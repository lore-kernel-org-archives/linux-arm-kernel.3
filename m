Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9049ECCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTiFMa0um5MCx7YKz9M9UL5FTlU26BokizDRovnOdsQ=; b=YpcAacdrcX/0svirunEbvBl1RU
	AJ7fO7CJ95meLJsUtqJ6vkHt5ZnX8wzcVWHT+fhkxvxb5ZaeFrxjQe78z5vdebdq895u1hIymqEXN
	eCCWRMhH3akoXwcLWTu36oeK3jwSxs1f7t7O21Z8zdaVsdAW+ulEICCwbXT1bLmSv98Q+QLBBDqqb
	zn5iOjyMU4UZY32qru7pBK0Qs/Y6Z2ZIXPAU6d7BX7aSIe1pV4a/1oa2kHzVBy7Tk1OA1QMz50rud
	z2J3iajsrLA2r/h0pX+WDhWZtunYuBuw/ydQLvgKHAHm9lkw9l8GEBki2FJ4FW2sNDYxdiYBPWZlJ
	OxnzB5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mkt-00000004fq4-2Aer;
	Thu, 16 Oct 2025 12:06:51 +0000
Received: from mail-m3269.qiye.163.com ([220.197.32.69])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mkp-00000004flt-39iP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:06:50 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 26265957a;
	Thu, 16 Oct 2025 20:06:42 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzysztof.kozlowski@linaro.org
Cc: krzk+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v5 3/6] arm64: Kconfig: add ARCH_BST for Black Sesame Technologies SoCs
Date: Thu, 16 Oct 2025 20:05:55 +0800
Message-ID: <20251016120558.2390960-4-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ecea4cb109cckunm98a0ee061283a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx9IVkpDHxhCTh1LGkwaHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=PeRvnqFxOosBECcstfsShRbjQR2lQV0eRGa/35ZIsIhLUw6SMIj2KL4gg+HQ0vtbAPj0LtJFoZrpLrPISDGVxAGZ9hUZWffZqJPcij2RVTFZo0/IAX1pozDf7kb/92tQRVgmdEQGmKNb/G76qr1EooiWCVbw52OLv0XMIQeg+Dc=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=NTiFMa0um5MCx7YKz9M9UL5FTlU26BokizDRovnOdsQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050648_134473_EA514D03 
X-CRM114-Status: UNSURE (   8.52  )
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

Add ARCH_BST configuration option to enable support for Black Sesame
Technologies SoC family. BST produces automotive-grade system-on-chips
for intelligent driving, focusing on computer vision and AI capabilities.
The BST C1200 family includes SoCs for ADAS and autonomous driving
applications.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v4:
- remove Signed-off-by: Ge Gordon

Changes for v3:
- Reword subject from "for bst silicons" to "for Black Sesame Technologies
SoCs"
- drop unrelated whitespace hunk

Changes for v2:
- Placed the configuration entry in correct alphabetical order
- Used generic family name (ARCH_BST) instead of SoC-specific naming
- Followed upstream kernel naming and description conventions
---
 arch/arm64/Kconfig.platforms | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d..0ef07343cc3d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -119,6 +119,14 @@ config ARCH_BLAIZE
 	help
 	  This enables support for the Blaize SoC family
 
+config ARCH_BST
+	bool "Black Sesame Technologies SoC Family"
+	help
+	  This enables support for Black Sesame Technologies (BST) SoC family.
+	  BST produces automotive-grade system-on-chips for intelligent driving,
+	  focusing on computer vision and AI capabilities. The BST C1200 family
+	  includes SoCs for ADAS and autonomous driving applications.
+
 config ARCH_CIX
 	bool "Cixtech SoC family"
 	help
-- 
2.43.0


