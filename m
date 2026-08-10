Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA49BC5B570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1bl5TRx5KVclJwrg6OtzlAq+Gv4jaFbltysyAbgn1g=; b=uk5dU45Fu7LD3jPRLZRsVc3mlw
	USeUT9uojEXiv0MoMT9UkFoI00uSnXyiHPdOHJqK1YkD+hKEk8HF3KRR/3+VmE5BhMpEr0zP/FHxD
	NSjTEExMuXlVuEjChprugAhB7UMasECrWgDFi9O81TazmqWnEkVATL7wOHL/UW4L9Pjo8oVj99mDj
	iZxXtOVOhdu712aDOZ8YTOffIGKHEKkonnOsQidfEytY+tmH8/LQzAju/OnMXzgYEfBBHokCNEsQ7
	wqflJKLfrGZNhBAsWpGPCeA7WC2qxSh8DoArGVtJ+M9lper9o0C5sLc3a7KNRpAX4nbzPcUYbUD7s
	UH09yx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUOC-0000000CaSP-0D0Q;
	Mon, 10 Aug 2026 18:06:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO7-0000000CaOq-3TPC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:17 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63FDB22EC;
	Mon, 10 Aug 2026 20:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385098;
	bh=ZeScdb4oJF+A/LIMfSApO6l8o7YsUnzDtpfrJMZIsfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TWVXW+0mvz0DAJ8T2TY/29+FAN8UJO/qLp49r49jtAs7G8drk3cUt1ttW9/9DXoKh
	 znYfYM+yCM44YSRp92NIrD7tfn1do8TP9Vnx3ItBs4PiQABg6Q3n/35K2m0YJXTc0z
	 LqHkPHxUezB332V4HQhWRMUpUd5g4pZvTaa7HvvI=
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
Subject: [PATCH v3 5/7] ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:06:02 +0300
Message-ID: <20260810180604.3034255-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110616_029228_32EC95BD 
X-CRM114-Status: GOOD (  10.00  )
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
 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
index 7db73d9bed9e..97e9eae2b60e 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -792,7 +792,8 @@ cam1: camera@3e {
 
 		clocks = <&isp 0>;
 		clock-names = "extclk";
-		clock-frequency = <9600000>;
+		assigned-clocks = <&isp 0>;
+		assigned-clock-rates = <9600000>;
 
 		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
 
-- 
Regards,

Laurent Pinchart


