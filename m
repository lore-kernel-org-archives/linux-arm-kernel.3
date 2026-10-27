Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1558606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gG4GdMgN;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=wziq8Nkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Cz+uk2hR6yCGHtN1VfGttHBuW/qw2YpAIGGSpByVGN8=; b=gG4GdMgNVjw/644XhL+dbo+VjE
	oO3a6Ne/9EDn3GRWxrRQbsppHXFS9b1k4dslKMhiAiYZHGPDzIEkoWQ4UPKBrQ+gcRMgYO91OvU+l
	LIObmyzM3/e2PCo0w9mzq42uydSoHIuBnQUZ2tOcLPxD7ZQzBXQHl2kVi2SsSp4a/zAgY30UStuOk
	5/VZkZQkPnoObCQwYujg0okCfNEuviNwy7a3B/0k1vxgIY1ivMZCGAAPFBdUylJPLVU6HwomFolvD
	ugWf4ZJ7xpPQ8j0JmIcsmOZWy5E3UqL1Ds/9+8KpXd9uZqINj7ZNrY40qGNEFuNsgCNd35cnxJuUk
	kwM5ZE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfBa-00000004SvU-3MmY;
	Tue, 27 Oct 2026 11:17:46 +0000
Received: from mx2.securetransport.de ([2a03:4000:13:6c7::1])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLfBY-00000004Sup-0JtO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 11:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1793099857;
	bh=Cz+uk2hR6yCGHtN1VfGttHBuW/qw2YpAIGGSpByVGN8=;
	h=From:To:CC:Subject:Date:From;
	b=wziq8NkkQGHKOkhhVT8bsvyWzJSKCswS0POnp+rBUtwdm421caCVLCK8r3O8NBCSd
	 pP3lkvT4ODs+q/dtQ+KMAnRgXWdo9FWtHDP1mZrZIV/v+v6jh2AA92G4Dw5XbNuqoI
	 CPXeXfuQTjlmWoSykEyNE7v54ae6H7abUB4QR5VU7Y1F0CN72eomRzZmv573L25nOg
	 f3Szja+QJs/Ucx7hpBLpzDBD2d18XSzxo9uYbjwPA68LuOnhfUEDid+eJg+VOPrbhP
	 NF2Mh8LWTIyTrJ45tLQmEb9ulEZdL5zW1arm493tiFqvwqfirlRUUMrm/QSblxJRRb
	 ynRYusSiqUeIg==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
Date: Tue, 27 Oct 2026 12:12:00 +0100
Message-ID: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_041744_267723_4A6AA557 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the maveo box, the SPI pins are connected to connector X10,
but no device is connected. The device "dhcom-board" was used
only to test the hardware, but was not removed afterward. So
remove this device to accurately represent the current hardware
configuration here. Also remove the okay status, since there
are no longer any devices defined in the interface.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
V2: - Remove also okay status
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 047f7b2d8526..0b48de79c595 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -59,15 +59,6 @@ &ecspi4 {
 	cs-gpios = <&gpio2 15 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pinctrl_ecspi4>;
 	pinctrl-names = "default";
-	status = "okay";
-
-	spidev@0 {
-		compatible = "dh,dhcom-board";
-		reg = <0>;
-		spi-cpha;
-		spi-cpol;
-		spi-max-frequency = <54000000>;
-	};
 };
 
 &gpio1 {
-- 
2.30.2


