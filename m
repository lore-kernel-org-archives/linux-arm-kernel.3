Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF6E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 14:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x0YNPUa/QyNmpUUdhtbFeSWJj7vTaV8GXi1D2/pwFZI=; b=2L14tYDiI1LqJ3iS/srFBdrMaN
	M5v6z8cyYq1zc/zKQQJNBSuouCxymURxYVyqIKBd8x+8fZ10aF8cdI7HbC6sg9K48Ozp3Yl/YkWfJ
	wprRDQMucvAvHdA3P1Y3ySAUCrshnb68LokwqLwx4bb/LAujKjZJTUqC6OJ+kh6hsPaHAz1SyvRxX
	iSVFLAL3LmJGHBHMTHRSHeu4l2XHk67fxwWmyCeqoCpLm701VFrwu5uxTzY1gVH2IjaJ4gDfk3Nvq
	jO7E/AE4qOzU2c6rPx4Whu569h0JwOlWJVOeAOecGrwL/oMIc6AayfkUyj/5G+JVSySu8PjmVYQB1
	TUWkNPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuZ4-00000003VcD-3HtF;
	Sun, 29 Dec 2024 14:46:46 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuXs-00000003VYr-3bn6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=x0YNPUa/QyNmpUUdhtbFeSWJj7vTaV8GXi1D2/pwFZI=; b=qRt7JLU1UCBRXf834lEY5Pnete
	j6Ya2+RJ7NDyAazQc9evv3OWG92bwDoLMX2Y5h61qj9eZdCAtQHBlLNspbkq0j6E74+bo39tVG/Uz
	+mnvaw4lAOQv5ytvj0ebp1/NJq2RBxUSPMdjNe+3Ral+2rF8PYXvAwO3tRzLLc+eCE7WiUNKEY4NA
	X0jDIxHRAei4xeq9V08tVuUcTQ4n+iInf9FcMi9TQbYS3iBExfwNRoKb1Vp7pmdCIyFTbK48lXXMZ
	lv73Exv3KjcMn5odbQon5Fkzp+CVG2lDwanDsXLpBAlpxHCI0ZftLPgTIDWUfm46aOghlvVNAhCI1
	GtL9BshA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: enable charger of TWL603X
Date: Sun, 29 Dec 2024 15:44:59 +0100
Message-Id: <20241229144459.9742-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_064532_909852_59075EF0 
X-CRM114-Status: UNSURE (   7.50  )
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

Enable the newly-added charger of TWL603X in the defconfig since it is
used by the Epson Moverio BT200.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd..6de45d7f6078 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -428,6 +428,7 @@ CONFIG_POWER_RESET_GPIO=y
 CONFIG_BATTERY_BQ27XXX=m
 CONFIG_CHARGER_ISP1704=m
 CONFIG_CHARGER_TWL4030=m
+CONFIG_CHARGER_TWL6030=m
 CONFIG_CHARGER_BQ2415X=m
 CONFIG_CHARGER_BQ24190=m
 CONFIG_CHARGER_BQ24735=m
-- 
2.39.5


