Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E9AFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLe/JUqnW5/3GA47FWix+U9BvqXd61kPAp78FpLV5z8=; b=xjy9xCuogp6+CZ2lCJqlx90XEN
	/Sguv7jHi2sqqNPMuIaV2PsZsKqK08qYWKlR8YMEqEMCC+2VBgo1ZBLZYVtwNZ7EMNsyawt9hNR1C
	QKFmkI5dxuAwhRHFqpOvnmHr9gowWZjcAnjE0IL2bJZpmyo98mmJcRGSlQ4ZEuVyBRTRLWxzz9g0H
	BnTWtTmeGU56wHo3bdbo0RQhMlXpTymrWxc9RRiWUNzpiwc92Hx8jnfeByTqbny1RlFQwRoGGK8AI
	l45C54x1ssGmITuTP0xGnrZJhA2zM3pRKbtDrhpkxTL9O4ZuCpupQnBDSe0XSZkhRrYn6Tt1G78kS
	0mZjLV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFNd-0000000GFpv-3NC3;
	Mon, 27 Apr 2026 06:23:41 +0000
Received: from mail-m10134.netease.com ([154.81.10.134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFNX-0000000GFmL-1ZAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:23:36 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c40faa12;
	Mon, 27 Apr 2026 14:23:32 +0800 (GMT+08:00)
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
Date: Mon, 27 Apr 2026 14:23:29 +0800
Message-ID: <20260427062329.3715925-3-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
References: <20260427062329.3715925-1-yangzh0906@thundersoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcd9b7bcb09cckunmcd249b321a30e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTUoZVklMGB5CQhpMGhlLSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=kWNXW7hE4p3PjGCbDKhGT7cqTDPgKQ5L6RN6Rm2+wzQeSs9LmfPaMsXJzfI3ix3VNh3tBkXvGo/RWKEhhm2AFGF7stN8NHO3WQVkCHcAORCtiXyIxHWB3jllLP0sQGOCi07xHkVQ0Yx4p3U0i1VsmtIX/4jHOKDHLYyrWmK+Fbc=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=zLe/JUqnW5/3GA47FWix+U9BvqXd61kPAp78FpLV5z8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_232335_619510_C908B79D 
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


