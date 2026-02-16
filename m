Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2577E81A44
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4shwJoUO9d8ENJW9So15wjmkKwrv/QiVKV353yfZbgw=; b=MqusENdk1nzkvjH/8/8Nfa38Iv
	ym/isUlBLtrqoZe+YpGPrxAFi6BhOW/aLm+Wxpb2L93qak9vDFcJ7oZ0KwaLajOrgaj3wh4ZqCrbu
	0U52CYQukWNsRCqPV4csIhTAYPNZobv3BxPTFeWnDrAqX9BruTQUAuqHyG5k9Ld+bt2KFCK4M9k/f
	dO9Gf0Qo+ZESK5u0M/Jk97qcKIKF5A25xcFvWvfqyZSsMWIXTZm8eZY4PJuuRoDBDfkryQ16PrLya
	TzjHsbmmUooXQPPukqA2FD8INCXcJ7vpqRH+bbYbn5GY52Ysy3OikAiZ5cDkZdgrUcY+ojizbMbd8
	jCM9nD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1ta-000000073dO-3g2P;
	Mon, 16 Feb 2026 16:56:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1tX-000000073b4-0dtj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:56:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B24184E40E7B;
	Mon, 16 Feb 2026 16:56:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 88F53606CF;
	Mon, 16 Feb 2026 16:56:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9DD81036801F;
	Mon, 16 Feb 2026 17:56:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771260980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4shwJoUO9d8ENJW9So15wjmkKwrv/QiVKV353yfZbgw=;
	b=qmr6d71rz7cTuX+y2vRmcDRxpftFaq1BgbIP7ynUjJpWj98UbxpxEamY6BGizYqvM3ZNPZ
	Wxxta5Ux9iT6zSMTMMSUlMUHDSROL7/5Ab2PCpIF08SGMoAOGdi/5j7O+V6QCv9wzvs4GH
	gfWX9ddi69G+6Y1QKeFTUcVckY7Bw4HdWBwl8OknHJ0F8dg9h7dXdZBqMdo8+2IPdbnAN4
	LqdRd67fTvZ1W1358c+szPqM7F6Ya17rlzE1IV/GVtqQk9miV6YPJoqELnGN4hyxmEpU/g
	zPxtw/aOj8UxSI4IdFcAaZjjVxlNtHbO36zPJBKpZlDwyYhyDgwTfNZL9/PYew==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Date: Mon, 16 Feb 2026 17:55:53 +0100
Subject: [PATCH v2 2/3] ARM: multi_v7_defconfig: omap2plus_defconfig:
 Enable ITE IT66121 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-feature_bbge-v2-2-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
In-Reply-To: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_085623_329116_079A07B0 
X-CRM114-Status: UNSURE (   9.50  )
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

Enable the ITE IT66121 HDMI bridge driver to support HDMI output on
the BeagleBone Green with the Seeed Studio HDMI cape.

Enable CONFIG_DRM_TILCDC as a module on multi_v7_defconfig to provide
display support for TI AM335x-based SoCs in this kernel configuration.

Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---

Changes in v2:
- Squash defconfig changes in one patch.
---
 arch/arm/configs/multi_v7_defconfig  | 2 ++
 arch/arm/configs/omap2plus_defconfig | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f1fa9dd88c92..2c9587855f044 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -735,6 +735,7 @@ CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
+CONFIG_DRM_TILCDC=m
 CONFIG_DRM_MSM=m
 CONFIG_DRM_FSL_DCU=m
 CONFIG_DRM_TEGRA=y
@@ -750,6 +751,7 @@ CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
 CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
 CONFIG_DRM_DISPLAY_CONNECTOR=m
+CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_LVDS_CODEC=m
 CONFIG_DRM_NXP_PTN3460=m
 CONFIG_DRM_PARADE_PS8622=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 4e53c331cd841..cdf69ac2e5126 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -486,6 +486,7 @@ CONFIG_VIDEO_OMAP3=m
 CONFIG_VIDEO_MT9P031=m
 CONFIG_VIDEO_TVP5150=m
 CONFIG_DRM=m
+CONFIG_DRM_ITE_IT66121=m
 CONFIG_DRM_OMAP=m
 CONFIG_OMAP5_DSS_HDMI=y
 CONFIG_OMAP2_DSS_SDI=y

-- 
2.43.0


