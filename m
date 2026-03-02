Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3BAE9B366
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJ+UBM4cCqdSApN+4ooGzM7lTrWpUtB4cpqXjwx+p6Y=; b=1cLT53uiq8dsZhP1FEi7uobajj
	V6CO0sFvYUPPJPC9tWaVqD9U9qUzCh6idLF3e1cT6hj33JsiopFoTFnOEjiC41Kk2Vxn+kvgkTo70
	445AY0gDHyZztScGgpAHmaMQC/KfWNd7CFyZoFwa5Dg6nYTBBt6GMj0DUnAPU26Rbv2Er/kf8LB5P
	/h8KBPrGuOJjk6b2n6zVuIUUkd/3AwfwjVJbS1Uj8gHgFhs/TAj9MVKfgpmr10Xu20/B0z1afXIGV
	sOASyGz9oGDPj/ZW/lmmG+Q3DiDHbV45eXtW+IN7c3UfZsfjKG5YFRGaY4++baprVpzcCzsBR47Kn
	YGPTqsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx14p-0000000Cm38-1ysv;
	Mon, 02 Mar 2026 11:04:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx14n-0000000Cm2q-2ulY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:04:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 390E460008;
	Mon,  2 Mar 2026 11:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241B1C19423;
	Mon,  2 Mar 2026 11:04:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.0-rc1
Date: Mon,  2 Mar 2026 12:04:28 +0100
Message-ID: <d5faca8fe1db69d584f3097c269be7813ceffd33.1772449420.git.geert+renesas@glider.be>
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
  - Move various DRM config symbols (moved in commit 22ba3bb3ff2a8e5a
    ("drm/Kconfig: sort driver Kconfig source list")),
  - Drop CONFIG_NFS_V4_1=y (removed in commit 7537db24806fdc3d ("NFS:
    Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.
---
 arch/arm/configs/shmobile_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index ef487eab17cc70aa..6f9696e9fe17ddcc 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -140,17 +140,17 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_EMULATION=y
-CONFIG_DRM_RCAR_DU=y
-# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
-CONFIG_DRM_SHMOBILE=y
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_RCAR_DU=y
+# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
+CONFIG_DRM_SHMOBILE=y
 CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
@@ -217,7 +217,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-- 
2.43.0


