Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7240CCAC5B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+6q69p9FsNzEbrFoCzPAw+WKvTnHLdyMbYmyzgBLzg=; b=EOBQPaeZZbsKlJq/hXDyGkl+vh
	9FENygKeuubzsoeLfSpfV8ViVtr85JXFi+TNvRpYVtM251aEdrBgI1TdvRAJ8n+gbtIMjdwMi/pxc
	xPL/dHRcqvtIdEYXs66oZCtogmH9zQpQEG+f/ofJ9w9KzA+UVqMGj9s8Aarr4PMaa479AUWabgwN0
	NoWajagx1bAAesh9JC6pKfN5SPcqG6KMBSqt/SOuYKFBD3uNaJQiXYSue9zAzRYlj9UW3cJOOFFsi
	579txIO+bhWuh+R5XHd7oQSe+/3RHRe0zbP/UKiKTkeyONvXhHmsjLePlXbAHEFurr67Uivak4596
	7izKgIuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEq-0000000CWoX-41hT;
	Tue, 23 Sep 2025 06:10:56 +0000
Received: from mail-m32104.qiye.163.com ([220.197.32.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wEe-0000000CWgQ-1LxX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 06:10:45 +0000
Received: from [127.0.1.1] (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23bdec007;
	Tue, 23 Sep 2025 14:10:39 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
Date: Tue, 23 Sep 2025 14:10:14 +0800
Subject: [PATCH 8/9] arm64: defconfig: enable BST platform and SDHCI
 controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-v4-patch-final-v1-8-2283ad7cbf88@thundersoft.com>
References: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
In-Reply-To: <20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 soc@lists.linux.dev, Albert Yang <yangzh0906@thundersoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758607828; l=1411;
 i=yangzh0906@thundersoft.com; s=20250814; h=from:subject:message-id;
 bh=GESOXygDFTo0+zjPMAAH/mMuZM8ehq9tb72d7ALilWc=;
 b=jr2tBq82ym4uCgrtKfh0RPngoe233C5kOI8cqHiK6YaQAnkIumkhjn+wfy/dleV1zGyi+yoYK
 /xcg0HO4FYtDabz8dwLcxjXLek+LaJzW2IgxIQ0gpaVSwWKdE/Y9RUV
X-Developer-Key: i=yangzh0906@thundersoft.com; a=ed25519;
 pk=bEcgALL9KpUg/m7zH44r50xa/re91dI9SA0vGV1/bu4=
X-HM-Tid: 0a9975320fd409cckunmfc27e25b4e0366
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTB1PVh9KTkxPHkJPGk9PTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fu6DUDbH5ESgeyUy3H0MWaQVFxyQGzplht2D2jOzRVnDTIsvmbnP7cWW5WrzWLv7XT3SEHekYwUR2MPSex9QsFqlOXCPjMNYubeLIZbsQSxgWtG9wBfXpDzXl6L0DzA9V0Atwduta1T3VaqvaQByyM1JuxbVDdwAC3DSJdop6oU=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=w+6q69p9FsNzEbrFoCzPAw+WKvTnHLdyMbYmyzgBLzg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_231044_536852_726D633F 
X-CRM114-Status: GOOD (  10.49  )
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

Enable support for Black Sesame Technologies (BST) platform and drivers
in the ARM64 defconfig:

- CONFIG_ARCH_BST: Enable BST SoC platform support
- CONFIG_MMC_SDHCI_BST: Enable BST C1200 DWCMSHC SDHCI controller driver

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Changes for v4:
- move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30
- Remove Signed-off-by line for Ge Gordon
- Simplify commit message (remove detailed description about eMMC/SD functionality)

Changes for v3:
- Also enable CONFIG_ARCH_BST in arm64 defconfig (in addition to CONFIG_MMC_SDHCI_BST)

Changes for v2:
- No changes
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..91ad7911a2c2178581100d2ba41888b4b42fc87a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -46,6 +46,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
@@ -1196,6 +1197,7 @@ CONFIG_MMC_SDHCI_OF_SPARX5=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_SDHCI_F_SDH30=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y

-- 
2.43.0


