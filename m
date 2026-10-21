Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580B606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PWNQpYsc;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=GPql0afa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GwYxX1wk58u2mRJeMPK0eBJeUORqabGvuAvjULQKsPI=; b=PWNQpYsckktWbCVSLljsN0Dayj
	r6TxGtQK0E6y4WlUa51Inlo34Jhz59oqGw3gO025FFIrgF9te9ej0KgC7R2ZtxAZeq0tvDF93euq9
	uXabcAqKRMrC+Y1QNK4oDK0gEXAdMWgDX38MbmaJ4Clxqnj7j7rO1qGZPCajnSCxLuVCs+x/ubBUt
	cZVOZdxNatlfum3bgGa5zMf7AZGYidh9yV7fs1BN7F7lXTBtJ0zr3q0lXApiqJRShSl9To4cpzdz/
	IaPOBAeh9zdfChuydoV1taa02XU3VDLCB8nzgJRBi0U5F7YxLgruFjhcUZXasQKKxiTTKAZLXDdoD
	i2ZHZ1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWdN-0000000ByPs-2EOX;
	Wed, 21 Oct 2026 13:45:37 +0000
Received: from mx3.securetransport.de ([2a01:4f8:c0c:92be::1])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWd3-0000000BxWN-01SI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792590294;
	bh=GwYxX1wk58u2mRJeMPK0eBJeUORqabGvuAvjULQKsPI=;
	h=From:To:CC:Subject:Date:From;
	b=GPql0afaXz3KvtX0jWuuLVZm9xr+e42VbE+OOBRuTufjjkrn/ECrHgaXzhWEUZHhe
	 hDhkpnf5uK0mccZ1mJzjWmI8HjHtn10YcefBLxHdYqScM09PqFRiGdNr91xQR3pnx9
	 3YE3U3SsMX89Rt35CSXu6u+FnpWyU4hE1mf/BBliiRUahmuiiiYp42CfNkYofXFQXM
	 62c924b+NzmvmBr7cYanchI4aPKbo1xoRPUDiRCAaF/dfb/m/d5dMCRQ01E4R495I5
	 fW5bcpEhbRYHNH9ipZLWhNuml6g4QUk0YfKqfM9U4v2lrxVsiM//CuUthXh3mUtaVu
	 /9g0TttgrpLPw==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
Date: Wed, 21 Oct 2026 15:44:34 +0200
Message-ID: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_064517_351532_F26B8343 
X-CRM114-Status: GOOD (  10.33  )
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
configuration here.

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
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 047f7b2d8526..eb0b91040110 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -60,14 +60,6 @@ &ecspi4 {
 	pinctrl-0 = <&pinctrl_ecspi4>;
 	pinctrl-names = "default";
 	status = "okay";
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


