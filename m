Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC30CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wYL+QTnahYA8W6BIWbc0y8myOYV1kLbZlxm0xBma04=; b=Li4MmM8hliN7uD5M6M6gt03Q3y
	5Ssk6rKuzUIEc+lIcMlmcsFNIAfmy9s7a1+WEFqU4VCgwZj7iVbNCh+DTLhfn9PW8/0c8rY6yfJe/
	8HfRVI3cW/UQtP7l12SvX6YtlKDYt3tdki+yqycGq0y/54RVCaPCDEmvnj5hocKzNuURTvKqwrMmR
	qZMS8JyK7wpB7Hmcg4alWjyUtoy/oj3/aSw6mMnndQjBZBCX/v6E9kE83BIvoB5lYE32MLbvb4yzY
	YOjfozPShc2hE0YNB0qFCtWuTTlZaLr22imAwzYWb4S3hP81tTCKYe0NrDVbCOPPIHDhKggKVPS1m
	4O41JDmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mky-00000004fvd-2vGP;
	Thu, 16 Oct 2025 12:06:56 +0000
Received: from mail-m1973180.qiye.163.com ([220.197.31.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Mku-00000004fpj-1bo5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 12:06:53 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 262659589;
	Thu, 16 Oct 2025 20:06:48 +0800 (GMT+08:00)
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
Subject: [PATCH v5 5/6] arm64: defconfig: enable BST platform support
Date: Thu, 16 Oct 2025 20:05:57 +0800
Message-ID: <20251016120558.2390960-6-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99ecea670309cckunm98a0ee061288a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSE1LVkJOTE0eSh1KTR9KS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=H6z9Sgmvu2C1R0oPR62LMripRSOW2lVjysP5SKiq8YQn7c8BE3zTzgdVB1nsM/YOm5Y23y6JKrPYpOhLQCfVQAbASHrCJvZ8OR/BquULYWDqiFbNcgHahxx1SUEyS2nwdfoFu/c6je8N6Cr/pDCZh9zv/B0s5/I/a04bD+TidEM=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=2wYL+QTnahYA8W6BIWbc0y8myOYV1kLbZlxm0xBma04=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_050652_609595_E8F51ED1 
X-CRM114-Status: UNSURE (   7.98  )
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

Enable support for Black Sesame Technologies (BST) platform
in the ARM64 defconfig:
- CONFIG_ARCH_BST: Enable BST SoC platform support

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v5:
- Remove CONFIG_MMC_SDHCI_BST (MMC patches will be submitted separately)

Changes for v4:
- move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30
- Remove Signed-off-by line for Ge Gordon
- Simplify commit message (remove detailed description about eMMC/SD functionality)

Changes for v3:
- Also enable CONFIG_ARCH_BST in arm64 defconfig (in addition to CONFIG_MMC_SDHCI_BST)

Changes for v2:
- No changes
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..972cae9bee88 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -47,6 +47,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
-- 
2.43.0


