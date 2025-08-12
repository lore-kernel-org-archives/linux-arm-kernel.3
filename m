Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C2CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVJIBKoxIrRVQZORHAcghgHiro8lV59ncVp4Y8IHIHQ=; b=OebJN7vp35F9M3syRueV83+H1o
	ornEBlvgo3ib0+jmaGMWnvCFjApO6tSB7T/xxtbX64CHykuC4LilcbTy517k97IgPRDhWIy22IihC
	FYLqFFLsjP1vJjl7KFqZOz3CuEdV0kUlXNbPUUQr5Wnf8sKA/T1EnfDNCnh3SmFy6F1C/rbEglBzf
	7WH/Zn8Uq40WOFanVSwwhhDzbkyHKtp5q3g5BS8iV/kux4qJljhsp9IbTl6tx7z3qrK4KjKKbwf6o
	ebL7j0HSnoGl7oPqt+jZAuGDovePnZSNfXRyQQlfWuSVCmZv+rfazac1edBE/a55+5PqqRGsXt8Hd
	A720DTYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwx0-0000000C65N-37zd;
	Tue, 12 Aug 2025 21:54:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwr5-0000000C5Kx-21Na
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 21:48:28 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3E2E31123;
	Tue, 12 Aug 2025 23:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035253;
	bh=w7k9w4ZekQGz6lOWcEWmQp+qbPKROd/tHGoFsIB/Jsk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsCh++08O1o5kx96gsqNPVtqlYmqp2b/p52qzPZxcfb6fidxJ+rps72JbvZRGzquw
	 IcJroM4d9+8pyLy1U7fM8Te5UNkVaBLJ5YSrMcPPqWMh68ZpSUd4n7d2T1fZEkxMgc
	 T+SlmcDCeKQ3WC6eOt/Njo6myOIdq988ZDAV2PmY=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 64/72] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:12 +0300
Message-ID: <20250812214620.30425-65-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_144827_660115_2C4F69DC 
X-CRM114-Status: GOOD (  12.83  )
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
This patch can be merged independently from the previous clock handling
refactoring in the driver ("media: i2c: s5k6a3: Use V4L2 legacy sensor
clock helper").

Without the driver change, when the clock-frequency property is not set,
the driver defaults to a fixed 24MHz value. That is the frequency set in
DT for this board, so the resulting clock frequency does not change.
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 05ddddb565ee..3cd027a99369 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -638,10 +638,13 @@ image-sensor@10 {
 		svdda-supply = <&cam_io_reg>;
 		svddio-supply = <&ldo19_reg>;
 		afvdd-supply = <&ldo19_reg>;
-		clock-frequency = <24000000>;
+
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
+		assigned-clocks = <&camera 1>;
+		assigned-clock-rates = <24000000>;
+
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
Regards,

Laurent Pinchart


