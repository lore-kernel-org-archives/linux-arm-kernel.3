Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2353FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QiLzIZX0BYLiz73cVxR+m2oxNcIlhqb4JWhtNdrz7g=; b=jgg+WqLkMPPXlZOgYjvH6wg2GM
	qoB3YpBly5FwpWfcsf05pUMBCLyfjt4Thi7zQb30oRYkwbZf0YuQB82TiRK1n4fC1pkIJkdbJY5PK
	y5UWpKV9gYpGme5D7Q1zOCaM9Dhuy1LSvQ9pI/FtgI4AHeNHw49lQdvQUiXa2m2PerT+Wn2nRnPle
	qLcDbRenO7rkCGFwbY6d8qEL1alEK/3StXZhScVa+n/hQtb27pZWV3vJDZboer2FKcU++CvJRpbaH
	p+IBeevZFp47YtYTHUTyViV5nBUGWnFgRVFqANNolbTSCABBNb6MlsfNBH/2fQPdjelKK9h4lRXCy
	bqo1XBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcnb-0000000C4cz-3J9T;
	Tue, 14 Jul 2026 13:03:47 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcnY-0000000C4bC-1Rtr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:03:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gzzyP1NkKzKw4l;
	Tue, 14 Jul 2026 15:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QiLzIZX0BYLiz73cVxR+m2oxNcIlhqb4JWhtNdrz7g=;
	b=qsdQJtWQb+d2QU7wO5SgqY3MeVj9rb+NSxQVuLbV3d5dCSJSJa+jF5LcwnOpGQ0kAw0Evw
	BEfSw8eDPl+Tx7rHWVNtTBvIawdw/i/wZFc+rPJR62F/nLY0Zn2DQtkkcm0X8dU7eA4uoj
	ZkG3dHR6zBlvr1ma4Ll8wBdF3nyx2045CXu/Y2HotnyVUMc4C1q6Lc2kbCAFMnCVBJ7ZqY
	FftJyKBHIKJvzt33h4OGUpDCQg2CDAf/BCeuxKf0//nnp/3ndwxy53fgz2AKEISGMJv67V
	0T3zcGs0li8Y8s9Ahw8pFpzoRumCveyeM5RltgE5Nc5/7KsXyEi8iTwQzj/0ww==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6QiLzIZX0BYLiz73cVxR+m2oxNcIlhqb4JWhtNdrz7g=;
	b=nWg6s7KMB9MqZBhGSHGUOJykW0o8o23Ar0UnJP3IOxY7GOV9KKCu4veTe7Xq8bq6Cyi61r
	dDVBLrzQiLtn4kVrozrgDyZQxjhUVGfXM5F6OhlFz8DvOLfO7x7oeo7WPAxncWUN/nR4kt
	QmnrW1Dgkb2k2b1VMy1BXJa9/c03SlJNmoYHfKLtcSbt1oCY2oHKHyXz4IcF0INICDTGo/
	DSB8yTxJysf1ct6o8dhqERlkz5+Y/Vy7oJhoJyCYvIaxcAv+P3kRW1v4Uph5T0xDaXHUTz
	zvnLlMo5RcByOCCxW1lPZrwwVA4AouEF/y9cYmTRx/JwJ7SEXBqD5E8R/QW1Rg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm: dts: renesas: armadillo800eva: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:03:02 +0200
Message-ID: <20260714130325.11080-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 877d854e8eaeff3eff3
X-MBO-RS-META: ue93fxosbyq8r1y5c563e3rwmo5wqa49
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060344_539884_BEE4C695 
X-CRM114-Status: GOOD (  10.60  )
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

The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
long should the system wait after deassertion of the PHY reset and
before start of communication with the PHY via MDIO. Opt for 300 us
which should cover every timing option, including the 16 us delay
required for MDIO to switch to 25 MHz listed in Note: in Chapter
3.8.5 RESETS.

The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
supply voltages to reset high is at minimum 10 ms. Set DT property
reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
spell out how long the reset has to be asserted, but this at least
covers the worst case scenario.

[1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 1d56bdef54539..eb65a54d0e511 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -194,12 +194,14 @@ &ether {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.c0f1",
 			     "ethernet-phy-ieee802.3-c22";
 		reg = <0>;
 		reset-gpios = <&pfc 18 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <25000>;
+		reset-deassert-us = <300>;
 	};
 };
 
 &extal1_clk {
 	clock-frequency = <24000000>;
 };
-- 
2.53.0


