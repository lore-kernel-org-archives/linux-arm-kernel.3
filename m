Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEEDC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMx3NvzHovWiMY19VYFSvdYypKIi0vhlkSjmkk+9bHU=; b=xy0qke/2weNrLfT2lZLrRFcFFS
	lfg/jIl0y4mn/7s0Y/AgOAhbP+fgQuUdnbqx3rg3alLEikZE4Q1IMiKwhixvqh1wbp/xkL7U4a3ZS
	cYTupT1MXUK/8zxM0Qzz58XGWuGEVqAWHB4n4usmcntZ5lw5ubGMn4lkoJ88icstBTOQguezILsTm
	Vnq58yZ+opT9/sz93Walvk9hB1LmstNQBr4BKwgoDMPm004igaqSoiq6h6fGn6HurepCziuwBfAJX
	9FLIie7pchyEhoHcgMDy/qsYbWWQXiEGttVOkI+TC2N9CZDvFdk+lueQYcwPmCRw2BmdpgPeOoY1m
	vt2cXfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO7-0000000CaOt-1JKw;
	Mon, 10 Aug 2026 18:06:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO4-0000000CaNX-47D1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:14 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2485513D3;
	Mon, 10 Aug 2026 20:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385097;
	bh=xjNm2BWeE00PHyvJRjfE7hktMpltcv0ocuIcwkJfQJs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aQng3LkfQTQUC6EkoO1aiIjPag6z/HA/K+k+kGC8wG0gOa7ObxGMmbKqAQT+wSzLJ
	 AgaZAJA+edwyUKHk4Ku9YZNQdz8fMRxsLrZlCvB9ApD4nKxRH/hO3oKu587IzKhn2+
	 uoeFsBMpy/FVTOhDxC83Zb7yu7IB4IJnO1urWBq8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:06:01 +0300
Message-ID: <20260810180604.3034255-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110613_167037_9C64A474 
X-CRM114-Status: GOOD (  10.97  )
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
 arch/arm/boot/dts/ti/omap/omap3-n9.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n9.dts b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
index a3cf3f443785..2edc1933449b 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n9.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
@@ -21,8 +21,11 @@ smia_1: camera@10 {
 		reg = <0x10>;
 		/* No reset gpio */
 		vana-supply = <&vaux3>;
+
 		clocks = <&isp 0>;
-		clock-frequency = <9600000>;
+		assigned-clocks = <&isp 0>;
+		assigned-clock-rates = <9600000>;
+
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
-- 
Regards,

Laurent Pinchart


