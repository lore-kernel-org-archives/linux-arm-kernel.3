Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FC5C83F28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYrgPy1M0hEN78QRGx5C1qSiC9wUqe9W5/Vxqt5DebA=; b=FS/su8gSJREKpkm3ttnf7Uev+G
	rmtnLmIZnvGIsLnfE0u6+ZaEN5wiDI2wBNWi7JcS8OLA4jlb3JrfPBNnbmIK+Ii8mb7GhHKuSPcFp
	/mHhwmlHefVNv6urMnD77UBfRxxJIX4vvW2yX8hJpjIIYAYLqZ0sF4pxrFqUFH0rwd6GBGwASkjjG
	r+BVykoRYt4AdIhwToH3ERsMgc2m/K6iDnf9fVAQZQN+vYFbGMWgbXFNbnD6jMZgtT5aNET78DmEz
	suZi/2aH2oCifXk9vj9mlCwdLeMY/hfFkrNDU9vjUasqxaRknvE3wHUdEkBKLJu66KiZMLOl/IXK4
	Q3XRevFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyHs-0000000Cysh-3hw6;
	Thu, 10 Jul 2025 20:54:36 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvO7-0000000Cd30-1Rlj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:48:52 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 34DD7B2B;
	Thu, 10 Jul 2025 19:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752169701;
	bh=H6gCI+dSz+/ay7cOpe6r3BToafJuOw8KI1SU2yBdPMQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZiyHS4DPKa9s6MtDpAXtEWnGxHYpTY8o2hp6eU0tzyS+FvNj6KmQ5VJYwidBtRXj
	 6iLXe20SLrA0gb7PonqirTlagqHjPjbOtr1rWJwUlG2ZQaOLwpHCuVWKuTEUvHOgWs
	 9etmHBOxQH4CmRLetq1jY+C0u6DHCQY/3lNWFHLA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 07/72] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
Date: Thu, 10 Jul 2025 20:47:03 +0300
Message-ID: <20250710174808.5361-8-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
References: <20250710174808.5361-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_104851_517989_38FF6BF6 
X-CRM114-Status: UNSURE (   9.55  )
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

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index 0d8495792a70..cdc768a87757 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -169,11 +169,14 @@ image-sensor@2d {
 			vdda-supply = <&cam_io_en_reg>;
 			vddreg-supply = <&vt_core_15v_reg>;
 			vddio-supply = <&vtcam_reg>;
+
 			clocks = <&camera 0>;
 			clock-names = "mclk";
+			assigned-clocks = <&camera 0>;
+			assigned-clock-rates = <24000000>;
+
 			stbyn-gpios = <&gpl2 0 GPIO_ACTIVE_LOW>;
 			rstn-gpios = <&gpl2 1 GPIO_ACTIVE_LOW>;
-			clock-frequency = <24000000>;
 
 			port {
 				s5k5bafx_ep: endpoint {
-- 
Regards,

Laurent Pinchart


