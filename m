Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B6EFCD9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C4auocGsq6h1s0B01awTJE/9wuwQhaFwfnc5Akdl9jE=; b=rQvyOEcom9Q0ruNvWa4ZsEK8NI
	JBiSN9Rmwvcfj/in2K1ZqOblQT+OCh7G692WCTqdlvqqfGsG64q20zgMawB5HSF7s2iF7v5HMAkVC
	xaPpvilxbk/UCZAcQLuG12DOuQFzdbQh7MNyHdi+s8KrR9fegsNAV8CTDZybuEvxMUa5dgyv5NEiu
	qUGmZnNpwkbrqOLieie5967DaeG26KCzVIBBBwj8X0t6aDKFeu4noCsv1nOyGEoNM2cboVEUwFLeJ
	yZomUg5hPuErjFLtOsVB0AdVYc33AXXRKCmffEQfh7de7XpypjBk8ZHW8ki/y0dJM7t4xDAizmRyN
	aLhKkWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8W-0000000937R-31YV;
	Tue, 10 Mar 2026 09:12:20 +0000
Received: from mail-m49243.qiye.163.com ([45.254.49.243])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt8U-0000000935v-044z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:12:19 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36651043c;
	Tue, 10 Mar 2026 17:12:14 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org,
	arnd@arndb.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	gordon.ge@bst.ai,
	bst-upstream@bstai.top,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>
Subject: [PATCH v7 0/2] arm64: dts/defconfig: enable BST C1200 eMMC
Date: Tue, 10 Mar 2026 17:12:09 +0800
Message-ID: <20260310091211.4171307-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cd704afaf09cckunmb723260ce6e85
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGRkdVkhOSU9PT0tISB9KTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=iMpASpCtPY97574A6yd6P0Pdv10PXJBVhUFbslof1TKyhdIC/y/3HCODVLL7MVsMBOBoegXb6R2jLprpsDS7h5g7ZT6VqhXEDPDG4yZCjkr6vy4bYNPVaRufAMNOQUd4vHn9wlAzgcyv+C+YKaqshJRSOmZOozn3esfAWSoo0ow=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=C4auocGsq6h1s0B01awTJE/9wuwQhaFwfnc5Akdl9jE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_021218_236359_5E2E766A 
X-CRM114-Status: UNSURE (   6.69  )
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
These remaining DTS and defconfig patches are submitted for review on the
mailing lists first, per Krzysztof's feedback on v6 [3].

Changes since v6:
- No code changes. Resend with corrected recipients: send to mailing
  lists for review first, not directly to soc@ (BST has a platform
  maintainer in MAINTAINERS).

Changes since v5:
- Patch 2 (defconfig): fix CONFIG_MMC_SDHCI_BST ordering to match Kconfig
  position (between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30),
  as pointed out by Krzysztof Kozlowski. Confirmed via savedefconfig.

[1] https://lore.kernel.org/lkml/20260123095342.272505-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/CAPDyKFrcXFAiYouOpjDx3NN-xWACU9jAzEfTU2m_-yvQ9SpC_A@mail.gmail.com/
[3] https://lore.kernel.org/lkml/12058c14-67c7-4b43-bbbc-ef0ccb813e61@kernel.org/

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


