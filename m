Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C60C5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avBm9URCfPqZ4vZAPXDRabV58SJB3xWsg3mr1M4l4nI=; b=Tk0zo0zMAzYmW7RMoh8SalKP6k
	wLK8EDZBtUq9yRQUtCGTlyeQ12uwPg4rOPBT0QcCHz7TgtQXek5eZQJPyndk5p/R/LBS6Uiru33L9
	eu5l8wCMd+uc0rRUZx29ldFuQKd1esP0pe8HX2epzDBtkcikNYFca9PsJ+44OsJtEIy1ymBqjpcDB
	9vD01CuqQKbDDFDwDG/hVU9mj+hvgxtE8JdnPr4hK2qlbO7FITtTEXIogIdhz0p0wsCHhohMqv21G
	qyR6dB2x+nhoh7kEit2NMXFmz+2gP+FwYnx4OrNRFTe64iaBi1xAwmMOZkbfiaNCJ1OPgEgxYT7pv
	AKLyXZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUOB-0000000CaRj-3Jds;
	Mon, 10 Aug 2026 18:06:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO5-0000000CaNR-2IXU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 359267CA;
	Mon, 10 Aug 2026 20:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385093;
	bh=G8H9Dl1uK5ID4BHhxZYuXgHaGIHDSo8WXQAFFX/Job4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bWpHhFi9IW6tX+2d6jrozjEpeuALY4v6CTcnoxv4SvW2lv8W+Cvd7gBKSVGClnv6S
	 CkSMZeeQRjfKyFBHil9NjnRxOIDdBPSk6S+UJcTRmYwg7Bbc9CevPYzY8Nzf/xKu20
	 xMT/o7MOkBmT/mAzF4qigI0+V0jFpSET2v8XQlGU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 1/7] ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:05:58 +0300
Message-ID: <20260810180604.3034255-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110613_728757_3A4F4A7F 
X-CRM114-Status: UNSURE (   9.98  )
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
index 8a635bee59fa..067a3264edf3 100644
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


