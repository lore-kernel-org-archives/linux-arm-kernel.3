Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC89D735FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnYeEZQKc514oW/D93U265GU2rsHFC75xDoB9Sg5K94=; b=tvseqgW0HOqtRzo5JVp3bv+dM7
	7LMbvVPsP+KnGFuVZs9yo6hXlU5s/DsED1yU5EoJsA7aWXnvffr8vBTKF+zqOq7Q2kHY2/jxvRUpW
	sBDv5k1S7Dk7b80KTvX+GleoQM63rCBo9q1cmTIm6fx9uU86EiKeNgvobrqZJw+k2Z4te82FeOY/w
	9VqHZpiItmk/9r0gYbm9PGmkJhuCoYcynBAs4R7kd6VB4dLvhInnqfjGIahO9BTr8kO14KuXwilZc
	UvzNaPHxT2kx1j3kGZ/QY029yroX02S83c9PnW2W4VSzkIFrOvJFns3kqWwA1u3w5Ywkee5l1ssu3
	2FzrCsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLnG-00000001yEU-2cEW;
	Sat, 30 Nov 2024 11:37:46 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLmH-00000001y3z-0cCJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 11:36:46 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 8E3741F00036
	for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 11:36:37 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 02208A66A3A; Sat, 30 Nov 2024 11:36:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id C5D45A66A38;
	Sat, 30 Nov 2024 11:36:35 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Cc: Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] MAINTAINERS: Update own email address from Bootlin to sys-base
Date: Sat, 30 Nov 2024 12:36:32 +0100
Message-ID: <20241130113632.3227864-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_033645_376686_D421BED5 
X-CRM114-Status: GOOD (  10.78  )
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

Update my email address as I am no longer working at Bootlin and have
started my own consulting company: sys-base.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c1fcc56bf2fb..ce165fd144ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -816,7 +816,7 @@ F:	drivers/media/platform/sunxi/sun4i-csi/
 
 ALLWINNER A31 CSI DRIVER
 M:	Yong Deng <yong.deng@magewell.com>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -824,7 +824,7 @@ F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
 F:	drivers/media/platform/sunxi/sun6i-csi/
 
 ALLWINNER A31 ISP DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -833,7 +833,7 @@ F:	drivers/staging/media/sunxi/sun6i-isp/
 F:	drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h
 
 ALLWINNER A31 MIPI CSI-2 BRIDGE DRIVER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -876,7 +876,7 @@ F:	drivers/thermal/sun8i_thermal.c
 
 ALLWINNER VPU DRIVER
 M:	Maxime Ripard <mripard@kernel.org>
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	drivers/staging/media/sunxi/cedrus/
@@ -7219,7 +7219,7 @@ F:	Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
 F:	drivers/gpu/drm/panel/panel-lg-sw43408.c
 
 DRM DRIVER FOR LOGICVC DISPLAY CONTROLLER
-M:	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+M:	Paul Kocialkowski <paulk@sys-base.io>
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/logicvc/
-- 
2.47.0


