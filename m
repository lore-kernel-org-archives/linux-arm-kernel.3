Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A406EC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVDeO5APEsQZzhVQ1M0xMzbJWE1HXOlbdXixFNuMeLg=; b=ty3SkZosP3sCxamLJrMd3pSbAk
	lKHG8LEPb8zQ7epnRQ776UjqYjSp4Hlznp1uwg9Bf6w0z8zLqXpmq6WZIuT4/t3LH5iw5a6vXIz2U
	LwctYtzIzYfXbevXSn/6iC+jr9+t03Rg4JwSe/Q/WK/TliBQtF7F3NwhNp6fIpEin3mcdLwSqJzzH
	IHkyi/9JNtdR5MlgSp+x2dnB0Dy9ow4VaLNfVpTh1ZQ3LYT7r0IXnENdR6BgijT7IhwHzY+QdoaVV
	06AfvJzFIVLnWcfLx7VWTctiDGWDUgkrMyf1kTz21YK8yIliHRyhkarS5za7RkTx6hH6MvuFmhf+n
	v9WOV9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKr5-00000005JY0-30Z0;
	Mon, 13 Jan 2025 13:51:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKis-00000005Hss-3pgV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:43:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-0002p2-Dq; Mon, 13 Jan 2025 14:43:01 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKia-000Ghx-1W;
	Mon, 13 Jan 2025 14:43:00 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKib-00GZFh-1s;
	Mon, 13 Jan 2025 14:43:00 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 13 Jan 2025 14:42:53 +0100
Subject: [PATCH v3 3/6] arm64: dts: imx8mp: add fsl,nominal-mode property
 into nominal.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx8m-clk-v3-3-0d6e9bdeaa4e@pengutronix.de>
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
In-Reply-To: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_054318_954219_A9D465FC 
X-CRM114-Status: GOOD (  10.47  )
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

The imx8mp-nominal.dtsi is meant to be included into boards that want to
override the default overdrive clock settings with settings suitable for
running in nominal drive mode at its lower required voltage.

Specifying fsl,operating-mode = "nominal" informs drivers of this fact,
so they can sanity check runtime clock reconfiguration to observe the
limits imposed by nominal mode.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index f9a82a663033a1dfb72163eebb62e4aee66cee2f..a1b75c9068b288a2fba73bbd96b1519a50df85a3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -21,6 +21,7 @@ &clk {
 			       <800000000>,
 			       <600000000>,
 			       <400000000>;
+	fsl,operating-mode = "nominal";
 };
 
 &pgc_hdmimix {

-- 
2.39.5


