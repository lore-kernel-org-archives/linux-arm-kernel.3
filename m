Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D12C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XwCBDRrAPmyT5I0/lNkFXdSDA9X9+Q/6WkKBr0Mblf0=; b=nFLm2/edHt1NlCLvRWmZrHbYPH
	uY1UYPGIk7pmebWWLsedtesJTM0B/jrka4l6OOzASd22N7ex1CQAEp1P8+gKSEXkmfYvrUBXbkmOq
	CDj28MH5kqoXWJl5FSoSskfMKGKWLZicyN60yePoahBv7JfIS5HaCSTWIypUIh443E1CMKwaq/KjJ
	/2xgienNozpJDsmQOevomY3eSHcqfTwjxNBPUGNb1LVT4obGcKv9DHe6QXPAF738BZ2MixBr7ZrN3
	iDeSWKdcfzIDPl+L0RshzfSgt8zxW/SS0mfSMdaYTt+lTVR7/qokn+fALKRSdmXmY0X/lpYUGWKDj
	tAEz4k/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Oz-00000004Rps-1bTl;
	Mon, 16 Jun 2025 12:57:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8JE-00000004FQw-0WOY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D931614B8;
	Mon, 16 Jun 2025 11:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D6CC4CEEA;
	Mon, 16 Jun 2025 11:47:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v6.16-rc2
Date: Mon, 16 Jun 2025 13:47:18 +0200
Message-ID: <f04a2b0e2c9128b4fa644850270b55493358be39.1750074375.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Refresh the defconfig for Renesas ARM systems:
  - Disable CONFIG_DWMAC_RENESAS_GBETH, which defaults to yes since
    commit 461f6529e5946d98 ("net: stmmac: Add DWMAC glue layer for
    Renesas GBETH"), but is only used on Renesas ARM64 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.17.

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 7c3d6a8f0038c5e2..e4cb33b2bcee2215 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -58,6 +58,7 @@ CONFIG_SH_ETH=y
 CONFIG_RAVB=y
 CONFIG_SMSC911X=y
 CONFIG_STMMAC_ETH=y
+# CONFIG_DWMAC_RENESAS_GBETH is not set
 CONFIG_MICREL_PHY=y
 CONFIG_SMSC_PHY=y
 CONFIG_CAN_RCAR=y
-- 
2.43.0


