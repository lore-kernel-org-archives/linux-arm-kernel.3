Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60A9CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIZ2hOJajcjLjoWN/laW04PrffXmHp1XQ28aoOjrd8M=; b=K7FK9TtmGj6uzLEtm7J4QK8qgA
	cjwiWD9M1qovS2+KVWk2qCBiyBBvocdE5BbrvBzt8+3THp3iXfiquz0jamEq7+jPHHVEIkUIl4whD
	Lrw9M1U7iLElCqr7jOxw9wP7cdrweLF4YkzUfF4ESxAcejjAGEERTnsBsUI46B6sl+EgDVh/Psn+t
	ux4Zc99VGmHqmRArPclxQK8IwUzIFNBJZRQq2TSTGQ7jlq3eT0H32qtADezDDB5QOB7AhgYQhpVe/
	hvcNWAt2xu7mJ2h4IF80U0HGWD4lKkMa08nUOPuTMc7Ha/Ju5/DSYoDjRtsg6bIV61sgV9kKvR1nc
	A/UEaRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbHy-0000000H7uB-1xp6;
	Mon, 08 Sep 2025 12:48:06 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaJc-0000000Gk4v-27bQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 11:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oIZ2hOJajcjLjoWN/laW04PrffXmHp1XQ28aoOjrd8M=; b=nX3A6GQnIFnL0Ni9B488AD6ftt
	U6ORBx/mwn0CUZTLjfIbeyI2hOEiAkjtsNX3Z9pkukdWhF8G+1JxnR1RpG2Kvmjt7GtxYu6CeFnF/
	nVHCGIwPyqmlaYO6x7n8ZWh1jKM+mzlOiAEGXd1m+qt+oiwnXmqe72B3ybTVJ/JEyRdbDUZOda2yn
	3d1L7h6Et3xQ9O1boIto4PC+5bguv5DDaNYoCY0vP4wHVRok++h+gQE99TyQvr5/YZntiJXBmczi2
	oHXrU1bBgVGRfXotjjEYRfg9t0zl8t0xcuvTkPcKAcXCDQU7dkPs/BftlE7i21lKZouM2xPVOxwj6
	NYtF6D8Q==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:38132 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uvZrv-000000076DT-0ZkQ;
	Mon, 08 Sep 2025 13:17:06 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH] arm64: dts: freescale: imx93-phycore-som: Remove "fsl,magic-packet"
Date: Mon,  8 Sep 2025 13:17:05 +0200
Message-Id: <20250908111705.2956825-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044545_007408_0D03B449 
X-CRM114-Status: UNSURE (   6.64  )
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

FEC WoL (Wake-on-Lan) functionality depends on using Ethernet PHY in IRQ
mode. However, on phyCORE-i.MX93 SoM, polling mode is used instead for
the FEC Ethernet PHY. Consequently, WoL is non-functional. Thus disable
it by removing "fsl,magic-packet" property. This allows us to save some
power during device suspend as PHY is not kept awake.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 89552ae70660..3f069905cf0b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -67,7 +67,6 @@ &fec {
 	pinctrl-0 = <&pinctrl_fec>;
 	phy-mode = "rmii";
 	phy-handle = <&ethphy1>;
-	fsl,magic-packet;
 	assigned-clocks = <&clk IMX93_CLK_ENET_TIMER1>,
 			  <&clk IMX93_CLK_ENET_REF>,
 			  <&clk IMX93_CLK_ENET_REF_PHY>;
-- 
2.34.1


