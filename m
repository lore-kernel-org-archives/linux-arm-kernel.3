Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4418DD26296
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/bBSUNt9C+YQXx0MO8a6nuIqtnT6HJm6C41ibJCNrwM=; b=kTs9F5uzXEQhdIwiUqEFXCADWS
	DZGYzkqSgC8wNPCz9jmWZeSHpbKJiq+VoU5H295cEGPcae+SUFZNPb+2EXmOjWGAxEQclQOkgHusc
	p3lQPW1TED+VJj1gbqj5qpeB1ueAjyzMMXhat/2nDZeqTou+P+Z/0e7BqVjYtgxeCjSrVGu35jZTM
	PP9+nwsxGVJmM4H+Uji4KEhKj2PvpoxFdUu2cgH33W9PcZ4pIoL9NSr+yBlm2dpy3ybqfrUTYQKhu
	lKzejVnF5Mbp0MgzECbAlW3uCKbZg76qsNNU621MGdlzy9S6ZE92bYXHFaA0TVpblmiEfWR017YiF
	wBGcPWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ4y-00000005aK7-3NX5;
	Wed, 21 Jan 2026 14:21:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viZ4t-00000005aJd-2rUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 14:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5EF643F16;
	Wed, 21 Jan 2026 14:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB22C116D0;
	Wed, 21 Jan 2026 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769005257;
	bh=jeXEgpP+V9qFmcpgwhBun21iImEiA4QYpWK+iPST8oY=;
	h=From:To:Cc:Subject:Date:From;
	b=cQIsxrqH1U0dsS9PCEKkOM5Gek7TfdO1z4VzudwuizC4ywmQzcotq+A9ztr0rH6lA
	 CYp8+0Br6pJ5MpfDGU6ygt9ayyIstPao9MmexDdh32ubLqvNL2T+Bg09qGxKT3499o
	 FeBaKhL+RXIQy5/hb1MAHzBNaryyqrCD2gWwM8qDxL+uYtRMd3J6tpEICAM9Q72JtN
	 LU8RjLsIR+rDI7E4VU6KQJ7RxNBu0iXJnhO2TuNuLgIrAEg4Kyf/cq1AzbqYGz52pP
	 h0bIZVIbTF3brY0Dg1etlWDt9th0YSpEN6gTOwQsdz4wb3IW82xyC92MZzsAe4KoV3
	 Scr0egsL8TnNQ==
From: Shawn Guo <shawnguo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] MAINTAINERS: Replace Shawn with Frank as i.MX platform maintainer
Date: Wed, 21 Jan 2026 22:20:47 +0800
Message-ID: <20260121142047.10887-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_062059_758921_C4A2E807 
X-CRM114-Status: GOOD (  11.34  )
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

Shawn is no longer interested in maintaining i.MX platform, and would like
to step down.  On the other hand, Frank seems to be the best successor
for this role.

 - He has been one of the most outstanding contributors to i.MX platform
   in the recent years.

 - He has been actively working as a co-maintainer reviewing i.MX
   patches and keep the platform support in good shape.

 - He works for NXP and could be the bridge and coordinator between
   NXP internal developers and community contributors.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..a294b4e952a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,14 +2745,14 @@ F:	arch/arm/include/asm/hardware/dec21285.h
 F:	arch/arm/mach-footbridge/
 
 ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	Fabio Estevam <festevam@gmail.com>
 L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	Documentation/devicetree/bindings/firmware/fsl*
 F:	Documentation/devicetree/bindings/firmware/nxp*
 F:	arch/arm/boot/dts/nxp/imx/
@@ -2767,22 +2767,22 @@ N:	mxs
 N:	\bmxc[^\d]
 
 ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	arch/arm/boot/dts/nxp/ls/
 F:	arch/arm64/boot/dts/freescale/fsl-*
 F:	arch/arm64/boot/dts/freescale/qoriq-*
 
 ARM/FREESCALE VYBRID ARM ARCHITECTURE
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Sascha Hauer <s.hauer@pengutronix.de>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	Stefan Agner <stefan@agner.ch>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git
 F:	arch/arm/boot/dts/nxp/vf/
 F:	arch/arm/mach-imx/*vf610*
 
@@ -20562,7 +20562,7 @@ F:	drivers/pinctrl/pinctrl-amd.c
 PIN CONTROLLER - FREESCALE
 M:	Dong Aisheng <aisheng.dong@nxp.com>
 M:	Fabio Estevam <festevam@gmail.com>
-M:	Shawn Guo <shawnguo@kernel.org>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Jacky Bai <ping.bai@nxp.com>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 R:	NXP S32 Linux Team <s32@nxp.com>
-- 
2.43.0


