Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4680EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 21:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XP1MNEQIFS/15FmvgwBeVhstHa8LWxSKOwtOogdACw=; b=4Ap8kZsBray9iNfHkL9ttGxLdr
	VJe7YFk4ZMQ3zEp2iAhmYhGnc70DVxW/3nxPS4C4hjSH/ApwK32t9ok/7ZXwQcCuAdMJ6kDu9gjT2
	5I9EilAuNnt6+Y0qIiK3b4a9vNmZtqRLGMIJRKmmF6bKs7X05PmYizs6EcoVYuFas+ltzG9/pIvhi
	XWJENnfMHNzqIsvJXX5XT3CX6Xs3FA1y+iHtNTBy/Be8//MZsuIsx6xRZNPYYFeJnXm1Gyia4X58V
	lrN1Th0dW2nGprYs/IDk6/HYlMWo0WBZB13Aed5QZuwnzHG6K8eUAPRObEipCXc+hRu/vBfRKCs1k
	BvTe+5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x049J-00000006RoD-080L;
	Fri, 28 Aug 2026 21:30:09 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x049G-00000006Rno-1oSE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 21:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4XP1MNEQIFS/15FmvgwBeVhstHa8LWxSKOwtOogdACw=; t=1787952606; x=1789162206; 
	b=PHAnsp9nHZiWEoYzMr1zd0x6H44ic5GpZlaS9GBF55AGoRjTqYwrUOY9Pwn8awg6YaIF79cf7ir
	68sIBpRiBXewvuFWXzbzH/NyZ60MYwXlGPqy0T150pIg1RMyHgNjx7VQirbiFYeDD5O5qUiwvSaKn
	ZDHFpsoJSre3Aq0uKe6YStArYiGrXkEQFeGOUsuJ5BuKpuEXCyHgd0wgnbx07exc3N5b22L1BNJja
	khU6C+Cq/zIckQT5WLExxt3phcyZIW4ybLKIvyuRN5KXx3hFEp7LVdU8GwWfENEl1MP+AcwehIstK
	7WRGtcNr3mtvB5ReVYbkdGHTfUHPsNGT6rmg==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	terrelln@fb.com,
	dsterba@suse.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap2plus_defconfig: Support for compressed firmware
Date: Fri, 28 Aug 2026 23:28:43 +0200
Message-ID: <20260828212843.614296-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_143006_492813_B84C3F07 
X-CRM114-Status: UNSURE (   7.61  )
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

Especially zstd-compressed firmware is at least the standard in Alpine,
so enable it to avoid confusion when using firmware from such distros.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index f827f89567fdf..01b834d4b7106 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -268,6 +268,8 @@ CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_LOADER_COMPRESS=y
+CONFIG_FW_LOADER_COMPRESS_ZSTD=y
 CONFIG_OMAP_OCP2SCP=y
 CONFIG_CONNECTOR=m
 CONFIG_MTD=y
-- 
2.47.3


