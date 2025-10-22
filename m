Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61140CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiheuTVax4+hSuxolo9C8Og5sfrfQWWuqiehsxFJDm8=; b=P/3Vz1kMBf5ylq8dTmIMBqDAI3
	aSKQCHDRdCWUNKLKSNXEmAVdn1KtwX1i9IFIWpK2oy50t/SppmgjtGeTUJDwjSeMEo157PBuAkmlG
	smTERlU0OZmrFiueKiJZphKR411V5sEmQBmzr7BHKJrc1v4/b4Kgfr1K+r6mhJHV3GJLpkDK/NWSq
	MquxJ+v5O5OGfqjCwQLiEZ/t+oKjlS+RF4KoROmISZL7rZnMamUbp0dQqzEUJcwsQnGWJF1G6NKJ9
	fSCWO0JPpSnz0tDtcWxuR7s4wgVtMqedYCEPyGC8+uTSLnG+KtdUF0swya4KWvXtLu/zogTQU0oPn
	T05s6Cwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTR-000000038lT-0HfN;
	Wed, 22 Oct 2025 14:05:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZTM-000000038k6-1TN1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 14:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GiheuTVax4+hSuxolo9C8Og5sfrfQWWuqiehsxFJDm8=; b=D4wj4yCFF/ova2aMv64pY4B+M5
	8OPRkZp94GrtYbTlI4pBAt61LSFG+IcJJ/oLnSRapDbObgGPV8ioZ4RZibuh2mMSz6ADXjEDQCkca
	OCV+XlyQWtqjWL0v2pziEgYF/STdz+Sfn3HbEF0ykQx6w0OeyfZe3eRVvZ4ugNHzz0LxXgrGD836q
	goCGDoRp5o+H+rmLyADkE/eVpKZ5Ah1veF6dL7KK4/YA3ay8w5x3r5RAAFq4gPc8H++Dq3o2Ku+Bg
	7Rkb8S5lfZwErK2nrx+dzTXdueBYXY+gtvQy5nUy7UaSk9Kc44IOiP+8BMfm+2yCFLcTTeWVyfPpS
	PSgy6Fdw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYbd-00000000bwY-2E8H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:10:23 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1vBZTI-0000vR-CZ; Wed, 22 Oct 2025 16:05:48 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Wed, 22 Oct 2025 16:05:22 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de>
References: <20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de>
In-Reply-To: <20251022-fpg-nxp-imx93-frdm-v3-0-03ec40a1ccc0@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_141021_697522_102C3E8E 
X-CRM114-Status: UNSURE (   8.52  )
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

Add DT compatible string for NXP i.MX93 11x11 FRDM board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620..c47407640e995 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1416,6 +1416,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.47.3


