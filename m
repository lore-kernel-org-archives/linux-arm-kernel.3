Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3A1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ742w8ZJVIuGW3jnwo9Rh3GEZ+ujaREsWARlA26Ou4=; b=GubTv+18nTFT5S+TifCaE+Kzzw
	8olmKWlZzDSit0rlWu9QJTa/2T7eEwpu3NAXjKhQWOt9GsfY923vH2iQewzMopi0dVLEKcc21BYxx
	0nfzXPJEDXZYgcEkU/wqquEJuPug62Xw9pAP1EmdC+oV40HgUbZTFphqxIAk8/g1TecMW6iw4MT1s
	yITP4xiqYawC3dj7Ha0WVV5rmwbij1QZGnyubJg7eLOQIGpZ4adLL/GM063mkJDYLr9TDag5u+szs
	HNnS+O8L4WJp69Xtk4cKh5lY/1AJzQQ86jj6TlnLluiXf72hUDh2u5BfRURplt0/s0/M746bgo4VB
	kMt1Pnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrls-0000000BNMY-32CW;
	Tue, 12 Aug 2025 16:22:44 +0000
Received: from mail-m3295.qiye.163.com ([220.197.32.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloAH-0000000Ah45-3qN9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:31:43 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f211b6d7;
	Tue, 12 Aug 2025 20:31:37 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	adrian.hunter@intel.com,
	robin.murphy@arm.com,
	ding.wang@bst.ai,
	gordon.ge@bst.ai
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v3 7/8] arm64: defconfig: enable BST platform and SDHCI controller support
Date: Tue, 12 Aug 2025 20:31:09 +0800
Message-ID: <20250812123110.2090460-8-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
References: <20250812123110.2090460-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a989e43c28509cckunm52c5de628443cc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0JMVk0aTRlOSxhMShkZSVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=OIOieOabStHm2JazoXydk/fhydRg4Q9mi/tfK3CChPUTmplGxJk27odPBGKfsxD7nu91J4PvuPOkcLMmPYdDuylEgKLRb3AaDn2I3Bz1YJ+G8nCZ7sG/LEWXd98fDgulxIDWrQ7rJ8hQxFqTv19mvXVzbaZl9jfFgmc3HTpZ8Q8=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=kJ742w8ZJVIuGW3jnwo9Rh3GEZ+ujaREsWARlA26Ou4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_053142_184998_EAC5E03D 
X-CRM114-Status: UNSURE (   9.37  )
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

Enable support for Black Sesame Technologies (BST) platform and drivers
in the ARM64 defconfig:

- CONFIG_ARCH_BST: Enable BST SoC platform support
- CONFIG_MMC_SDHCI_BST: Enable BST C1200 DWCMSHC SDHCI controller driver

This enables eMMC/SD card access on Black Sesame Technologies C1200 series
SoCs. The SDHCI driver provides hardware-specific implementation for the
Synopsys DesignWare Mobile Storage Host Controller integrated in BST SoCs.

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
Change for v3:
- Also enable CONFIG_ARCH_BST in arm64 defconfig (in addition to
CONFIG_MMC_SDHCI_BST)

Change for v2:
- No changes.
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..8daf8cf3dc97 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
@@ -1187,6 +1188,7 @@ CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
 CONFIG_MMC_SDHCI_F_SDH30=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
 CONFIG_MMC_SPI=y
-- 
2.43.0


