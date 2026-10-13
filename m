Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D37CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=; b=2TIekGNGd0wXY7YLAR/5a1KxYV
	yiKAJlMTNgz+2xopIS8S5/1TOzVR8rl66WbhtViKdUfWp9JdGXmHHru04P3G6zjIinruhgoQU2RaQ
	1BImRzYj1u1Y5K8nmzAnXsxcvIXcGfKBFcg34FxGhQ1x3yE2hPQ8/H4xZF3t+tycbmN+ijetsfUtk
	97aSUI04wQzNWeQKe95LSKofxOa758KyTQZLxIBbAGe9x82PjeERediuuD8SK5I5FXuUHQPHugT29
	waD+oPYh2xxSdRLEfbmIu/Wg6mn2cdoUNQR/OgjTvbjfgW9qOPt7A9WsCNkoPtLciT6Hco89OkwjH
	5p7rOcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb36-0000000Ckdp-12bK;
	Tue, 13 Oct 2026 11:52:04 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGb33-0000000CkZb-1QvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 11:52:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791892306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPeplPkVfjQbU+WDmS7ovub5xCS4NSxvEFYqSztNHkI=;
	b=Ib9l6c8Uepb0LhqKr7Gyhb2VrQ9RROTcoQeDtySWb0Q+gq2lf+g+nxnDlFZ1UCtOk3VX17
	2n2exJwK25eBoJdfRMEv4oEMA8sD0gtLDYaVkyJwFOi2rYlkjK0SvSpUrKq+4odMfb4enb
	WrXRkmsKyCvPu1EigfpgK+IagQ8mC7b7VBFf09wQVPzLihdXL3X3T1IrctdNtyVs9+DqkX
	UuQbRxSRe3xHwO7ninbnY151zsPj+F8WP1FK1FPiqY3q61I8nQzBjhmsN4Dg9gmWDJGAKH
	oqTr/hFv6vQgkJcW+uSPr449dZqJdlGzk4kKAEfogB2mSkaY4rGeO1VMCKbXXw==
Date: Tue, 13 Oct 2026 13:51:12 +0200
Subject: [PATCH v2 7/9] arm64: dts: imx93-kontron: Fix ETH_B_TXD GPIO
 labels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v2-7-d464ca652c91@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v2-0-d464ca652c91@kontron.de>
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
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuctB+Ln9bd57VRO96r36p8tbd/x5mLv05v3N6QyJJ/r
 u/1xdVSHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABNx02X4zcLNpTvLQEVt+5Nf
 mxTN2ALc+Fee2ne3KTj5zAKVOUf69zD8D5W7JbTT+KFE57nlNo4SlcbT7T0PPPOcbRT0oFLpzIk
 DLAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_045201_533044_7CCAF896 
X-CRM114-Status: UNSURE (   9.53  )
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


