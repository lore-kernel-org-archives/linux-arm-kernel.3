Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27082CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfgMEUF+Fw0qOI2z3NuCRJaeDMkJbrHyQvlbCPr4av4=; b=bPuAsgrztdq+WniPWZK0qeHkH5
	FHaw7/+0dJw3PtEi4X51NB/aYloO01CVDwedGTkskC4CVLrVk5no9rMoJxEGXb0w93SJ14R9yIFvz
	Btw5OHs8lCfJ5b0P8lXnpFYP1o6MB6tG6UKveM2n/s6wY/oPOAcMTvZvrGvZbw1/6CuWpiDxBK7Pc
	bKE2sLrmZPtYrDErS3kohvja2nyXyFszoQlW67vanJOkh+mjE/8w2TXpuGkkSAtJ/x5/tit7eW9aa
	j1oChBrmqUQM9jJpxJ0+5cQMLC8wGkLDRxAaOyIVOz8fsDZ71kGQAsEaHyLGTjk3G3AxgrZWnmNKs
	HPU1dT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZA8-0000000B3Lh-3jA9;
	Fri, 02 Oct 2026 09:02:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZA5-0000000B3KT-3Ibq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:02:39 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4365D1FA8F;
	Fri,  2 Oct 2026 11:02:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790931755;
	bh=OfgMEUF+Fw0qOI2z3NuCRJaeDMkJbrHyQvlbCPr4av4=; h=From:To:Subject;
	b=HD0syKCxyO7pI/3K1fG+TXZMhYEcypAIjoZCL3siMyKIONN2VO6xeYJmdn6zhzsny
	 DYgpcRHZWwbi7M5c/s0RTFY6Nz8BGRabzH88jkBZUlUxcMwvhSNBHbG5syd8OMooyi
	 GgRd9I61fTQ6CijkphkJZdtbk4xGnZROwS8zQSsjc7R0N8Ww2JIXgNiHQHCyjB6lm6
	 fxeAiTfHkvxQrsWkshN20MP4WIunj6ZrtnvWPN2xexwFfqJCSeDrKvFaBTVY9MMNIi
	 urXgT7KCYO2Ri4cMyrhm36i2IaYcRi3V9rKnOxz6xAuoLcmTbog0prIccHleMaOTux
	 FZUL37p2123vw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx95-aquila: fix i3c2 pinctrl group node name
Date: Fri,  2 Oct 2026 11:02:27 +0200
Message-ID: <20261002090228.41445-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002090228.41445-1-francesco@dolcini.it>
References: <20261002090228.41445-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_020238_006857_3FD49FBB 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The pinctrl group node for I3C2 is named "i3c2cgrp", with a stray "c".
Rename it to "i3c2grp" to match the label and the usual naming convention.

Fixes: d5c082ba23db ("arm64: dts: freescale: add Aquila iMX95 support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index c5f4cf0541f2..287b7bcebc73 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -932,7 +932,7 @@ pinctrl_ctrl_gpio_exp_int: gpioexpintgrp {
 	};
 
 	/* Aquila I2C_2 */
-	pinctrl_i3c2: i3c2cgrp {
+	pinctrl_i3c2: i3c2grp {
 		fsl,pins = <IMX95_PAD_ENET1_MDC__I3C2_SCL	0x40001186>, /* Aquila C17 */
 			   <IMX95_PAD_ENET1_MDIO__I3C2_SDA	0x40001186>; /* Aquila C16 */
 	};
-- 
2.47.3


