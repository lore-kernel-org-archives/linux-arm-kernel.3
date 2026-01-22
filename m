Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E6BD3EE64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QrWxvnoBH294DzZphh+ZDE1MeDqBwVJs1QP2cdDdLP8=; b=ovaOPOhAAjR2WBPlPZGDQ+f9r3
	TxN3JtQ1wQIeFtdCljcWiPy8N+lUSDS6B9njOVE2A8awaecJfZntlPGaO7OlYHeh9+Sk7pghanUYI
	rOD4ufeI+BlZ5EMPV019ct+ysfTjSdmbI0pFlGDiA99CGsBW21np6i3PNaXGIjtq/4RMd6+LH+k9h
	PHVqyPinzl2NIngfh9waQbn9674H5wy71VgF8NxPlu8R8797zwPhPw6l+d+cZm1rZEQF5aB/cEsIe
	ayBsBNUr59iDRhMmcc+agLA0ShlV1kkJxKT3tC9xTGrasQs2Z1zkD8KOHj9mSQ1rIWeTyui/M02P5
	vFGIq/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viugu-0000000796B-1RS2;
	Thu, 22 Jan 2026 13:25:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viugt-00000007962-0wOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 13:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 360F7600C3
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 13:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7D9C116C6;
	Thu, 22 Jan 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769088337;
	bh=Okir0R3xIu+S1VzwVKG7Y+G7aSI3BC2jqcJVPSkJfZQ=;
	h=From:To:Cc:Subject:Date:From;
	b=TtC5fY7inLZg70y9J8Yu1utpwP/PgjRHfobOODCmZKcUytFxdm3+af9+2FUidGfoW
	 hYfnrPf6T1n704xTaItn5AiBJECHH/35kIVZZ9wVezCpolzsirYZGRHiyLSfYAeRg0
	 EWSd1pBgUHP0sIK3uWpBNU6dqzuxiPvG1B0qM1NqjjxHmzHAynU6gnM57Wrg7oCoPz
	 mSN4LuLAgK/NEFWv3insMgpOZz6BJHbeMICBWalDVNufBVEIs8lOyWDFYXtxUgTEec
	 y8VHFrFynJes8zHyNvDcXOQ7vhFeFJyoPnsQG75JDXOLUmB2BNcWBCPBoXQ3lkU1E9
	 OOOUf4wSpmd/w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Change email address for Thierry Reding
Date: Thu, 22 Jan 2026 14:25:35 +0100
Message-ID: <20260122132535.3772231-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
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

From: Thierry Reding <treding@nvidia.com>

Use the kernel.org email address as a level of indirection to enable
transparent switching of providers if necessary.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 MAINTAINERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..0268186ab1c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8515,7 +8515,7 @@ F:	drivers/phy/mediatek/phy-mtk-hdmi*
 F:	drivers/phy/mediatek/phy-mtk-mipi*
 
 DRM DRIVERS FOR NVIDIA TEGRA
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Mikko Perttunen <mperttunen@nvidia.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-tegra@vger.kernel.org
@@ -20010,7 +20010,7 @@ S:	Maintained
 F:	drivers/pci/controller/*mvebu*
 
 PCI DRIVER FOR NVIDIA TEGRA
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 L:	linux-tegra@vger.kernel.org
 L:	linux-pci@vger.kernel.org
 S:	Supported
@@ -25629,7 +25629,7 @@ F:	include/linux/tee_drv.h
 F:	include/uapi/linux/tee.h
 
 TEGRA ARCHITECTURE SUPPORT
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
@@ -25661,7 +25661,7 @@ S:	Supported
 F:	drivers/i2c/busses/i2c-tegra.c
 
 TEGRA IOMMU DRIVERS
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 R:	Krishna Reddy <vdumpa@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 S:	Supported
@@ -25682,12 +25682,12 @@ F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
 F:	drivers/mtd/nand/raw/tegra_nand.c
 
 TEGRA PWM DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 S:	Supported
 F:	drivers/pwm/pwm-tegra.c
 
 TEGRA QUAD SPI DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 M:	Sowjanya Komatineni <skomatineni@nvidia.com>
 L:	linux-tegra@vger.kernel.org
@@ -25705,7 +25705,7 @@ S:	Supported
 F:	drivers/spi/spi-tegra*
 
 TEGRA VIDEO DRIVER
-M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Thierry Reding <thierry.reding@kernel.org>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 M:	Sowjanya Komatineni <skomatineni@nvidia.com>
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
-- 
2.52.0


