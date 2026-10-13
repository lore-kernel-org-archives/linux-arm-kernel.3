Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5828ECC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=; b=WIfiWOw2HSrJJQi60W/WzimJGb
	6wfo+XEdPDz/Jkpd4RSL4Yse9VQwU+jtNuXntLKttd6nGAJK8SKECeRAxfxl93LY4qGn9dgaEAcAz
	l348iSsqwYRYap/fCGiKsn2tyU90ilJli9Ai8HQb8nZHpxMxVSmTQUfGu6s6edbuR3k0/n9oAe4l/
	nsNPzmBJP1ILuY8nN/lLSn3JMiK2ByOIhiS/aNkCNgNtzRhEkUXwhNJadztL0GpEr5J1Q1LTb4Xcv
	un4zTOoE4Jh3JUx2+Kc9q3+0kxaYb/cMVadu/XHR5/XzRceRpwQp2Y0l69TqTqWd9M7LL3ULzRRy4
	hcarYFmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ54-0000000CSY3-26HE;
	Tue, 13 Oct 2026 09:45:58 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZ4w-0000000CSTC-3q3i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:45:52 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=;
	b=Ei0SRqI6rLxwSlVG8ELYbnxrSIKOdVbjKL5XKHQM/bQLNHTZwgLq6XvTfoQhKzobeRDN9c
	9P6DAKDKZbNz2DPLzT3z4qGTcGaRMWNm0ATa067I36vRerf3bd+qkib248Le7MX2uKvtfF
	0DN82/O038xEvFG/rBBVP1GC8SPvV4efhp2ghc5adc5JTlqOUDCWFttVq2IooA6FJsJOzn
	Fk2jN8UFPZ9WAu9MlUwp4YAzDkiOkLMKin221rAqcpJEDxT4iV2hZy9vq2rbdgMqULGCQn
	IuPz/jiT851yAzQTmc1zUavVrnX4DWcTnDQAzIOCWd6yEuiCuPwtqAFbsEDKUA==
Date: Tue, 13 Oct 2026 11:44:51 +0200
Subject: [PATCH 6/8] arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-6-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=NaDCXQ5UyNlXLm2/p0aKHGTYTGZWj500zS6hbQ5zc2Y=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs36NLItZc+dv2/v21eU03Z57dHNx15pWWXfZ7rYYdl
 v7raxZFd5SyMIhxMciKKbJI8Vu8tjWL9ZE/Vh0FM4eVCWQIAxenAEzEdyEjw9xPq372a+bkSCnq
 T9hdvjFaS1SJ3+vrLC+LDy/Z9N6qfWD4n7xy8bTCOwdk2Sp333hXxXmeXzUm3yLjEOuPizea33K
 zMAMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_024551_125515_7318E5E8 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The labels for the ETH_B transmit data pads are off by one.
ENET1_TD3..TD0 map to GPIO4_IO02..05, which are the OSM-S pads
ETH_B_TXD3..TXD0. There is no ETH_B_TXD4 pad. Fix the labels.

Fixes: 2b52fd6035b7 ("arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board")
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 36548d9181695..a6b6128f22ddf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -83,8 +83,8 @@ &gpio3 {
 &gpio4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio4>;
-	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD4", "ETH_B_TXD3",
-			  "ETH_B_TXD2", "ETH_B_TXD1", "ETH_B_TX_EN", "ETH_B_TX_CLK",
+	gpio-line-names = "ETH_B_MDC", "ETH_B_MDIO", "ETH_B_TXD3", "ETH_B_TXD2",
+			  "ETH_B_TXD1", "ETH_B_TXD0", "ETH_B_TX_EN", "ETH_B_TX_CLK",
 			  "ETH_B_RX_CTL", "ETH_B_RX_CLK", "ETH_B_RXD0", "ETH_B_RXD1",
 			  "ETH_B_RXD2", "ETH_B_RXD3", "ETH_MDC", "ETH_MDIO",
 			  "ETH_A_TXD3", "ETH_A_TXD2", "ETH_A_TXD1", "ETH_A_TXD0",

-- 
2.55.0


