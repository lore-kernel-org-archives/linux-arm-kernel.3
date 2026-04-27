Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C2FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLe/JUqnW5/3GA47FWix+U9BvqXd61kPAp78FpLV5z8=; b=n9Clm7lvWGCZwouXX5bshNIerB
	8bCc4y1aLSIrI7HvPgvJZ5nx/y+fY38F2Gvz8YT7lgzRkMgZGcnLeIFyhaOA8SYMCt1PCi2Gxpa2y
	6jHusp+boy6kyZoxD78xcf1Xp4rmOi5tPTLCBOaqxnyk4Yzi+j6E9aKf3626StRkveA9TZ/2MA9XR
	xV3Anenm15N6AGQUuEu9WakxOMWVwX/Mcdcn9xzYl8vwWU3ABNihJ2v67YjkGgOZtviWqelPdvy5Y
	2KZ2bZZo8879d1Hcs6/VwA1ui9jewhsT9LB9B+5iNCFfInxH0ozMW72n2WEn8PUXrBFkbD2xWkfDZ
	ewcVjX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEx7-0000000GDwx-3Jy4;
	Mon, 27 Apr 2026 05:56:17 +0000
Received: from mail-m60204.netease.com ([210.79.60.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEx4-0000000GDtL-1KGw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 05:56:15 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c3fc5fce;
	Mon, 27 Apr 2026 13:56:00 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: gordon.ge@bst.ai,
	krzk@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] arm64: defconfig: enable BST SDHCI controller
Date: Mon, 27 Apr 2026 13:55:55 +0800
Message-ID: <20260427055555.3693459-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427055555.3693459-1-yangzh0906@thundersoft.com>
References: <20260427055555.3693459-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd8248e109cckunme57a9fd319e3fa
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEsdVkwYSk1MTkxIGBpCHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Kuu5lkdKdKM269xwry/SLvIJKaR5qnrWABY71iKaA6SkihE/22gAeCG8o+RBMkREPGrfdrAeYGITmShVY5Hz3qBxQC6Df1YSaFiCC5L3XxupC8ShQTa9zpdYkNKbsqY3OCYzShmKAVr1FomEq0jIlvMPYIv7ftPsrEo4/KRnlb8=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=zLe/JUqnW5/3GA47FWix+U9BvqXd61kPAp78FpLV5z8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_225614_566712_5769048A 
X-CRM114-Status: UNSURE (   6.86  )
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

Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame
Technologies C1200 boards.

Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
Acked-by: Gordon Ge <gordon.ge@bst.ai>
---
Changes for v8:
- Collected Acked-by: Gordon Ge <gordon.ge@bst.ai>
- Rebased onto v7.1-rc1
- No code changes

Changes for v7:
- No code changes; resend with corrected recipients

Changes for v6:
- Fix CONFIG_MMC_SDHCI_BST ordering to match Kconfig position
  (between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30)
  as pointed out by Krzysztof Kozlowski. Confirmed via savedefconfig.

Changes for v5:
- Split from platform series per Arnd's feedback

Changes for v4:
- Move CONFIG_MMC_SDHCI_BST before CONFIG_MMC_SDHCI_F_SDH30

Changes for v3:
- Split from arm64: dts patch

Changes for v2:
- Initial defconfig change included in DTS patch
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..304e12c80af9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1292,6 +1292,7 @@ CONFIG_MMC_SDHCI_OF_SPARX5=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SDHCI_ESDHC_IMX=y
 CONFIG_MMC_SDHCI_TEGRA=y
+CONFIG_MMC_SDHCI_BST=y
 CONFIG_MMC_SDHCI_F_SDH30=y
 CONFIG_MMC_MESON_GX=y
 CONFIG_MMC_SDHCI_MSM=y
-- 
2.43.0


