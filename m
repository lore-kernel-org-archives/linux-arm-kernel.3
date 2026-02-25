Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6C4F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qu97ogafe1ECz7tJtaU8qCPiTT7cxwgF9c/P5/qbe5U=; b=c6lfUm2iWZsgZ40DRvLVGHk4Pg
	hESMxkJyfR2qTaA9Pp/nhj/FeC2WsncTZBN+6ULZqFX24fremfxnjnk/wjoTBg4JYvN2u07QVEPYK
	K7VkIzGtz5ORxCYaSHltxPP/RjcQo+El+q/bS++L3ysOYLv9eQ5y5BsOo02CAuTQCDEAJwM/yQBwg
	DQp+HZAIe968CDK/MFX3K0oTNAyN2AwZnR40/EDiKIcultQY4iODPVqNE6g5JlUeGoNSy1B9uJ5Jf
	oKBsoJmxE8UFeJDkBEeDf53wxupw6gpeu7CROuMZ73+hETMhZGidw1dV0bbXZWST52voUhF1uuerg
	Wgfq4GuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBmo-00000003k35-3OLx;
	Wed, 25 Feb 2026 10:06:30 +0000
Received: from mail-m4921.qiye.163.com ([45.254.49.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBmk-00000003k1g-3kAv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:06:28 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34ea9e542;
	Wed, 25 Feb 2026 18:06:18 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de,
	soc@kernel.org,
	krzk@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangzh0906@thundersoft.com
Subject: [PATCH v6 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Wed, 25 Feb 2026 18:06:11 +0800
Message-ID: <20260225100613.3791261-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c944384ee09cckunm3fc0fc0ab1afd4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGh5CVh5CTBlJSRoZHkhIGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=ciJ9FPX2EJtRPysbD09Eyvd0xqGHEqHj14sgdDsIHh/VurM3f1fEX6egq7jVOizDqZI6J1ROMRLSklHdeI07j4rILWZmqIBxK/9aiKI9IB2ot1gXkO1JDKEjKd2o1D4XU3VmFLynfR4jqX4JF4/lsdwJ/3CPyaleeHNAU/J1fFQ=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=Qu97ogafe1ECz7tJtaU8qCPiTT7cxwgF9c/P5/qbe5U=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020627_209406_738A2090 
X-CRM114-Status: UNSURE (   6.91  )
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

This series adds DTS and defconfig support for the eMMC controller
on Black Sesame Technologies C1200 SoC, split from the v5 MMC series [1].

The MMC driver patches (dt-bindings, sdhci bounce buffer, BST SDHCI driver,
and MAINTAINERS update) have been applied to mmc-next by Ulf Hansson [2].
These remaining DTS and defconfig patches are submitted to the SoC tree.

Changes since v5:
- Patch 2 (defconfig): fix CONFIG_MMC_SDHCI_BST ordering to match Kconfig
  position (between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30),
  as pointed out by Krzysztof Kozlowski. Confirmed via savedefconfig.

[1] https://lore.kernel.org/lkml/20260123095342.272505-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/CAPDyKFrcXFAiYouOpjDx3NN-xWACU9jAzEfTU2m_-yvQ9SpC_A@mail.gmail.com/

Albert Yang (2):
  arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
  arm64: defconfig: enable BST SDHCI controller

 .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    | 19 +++++++++++++++++++
 arch/arm64/boot/dts/bst/bstc1200.dtsi         | 18 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 38 insertions(+)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


