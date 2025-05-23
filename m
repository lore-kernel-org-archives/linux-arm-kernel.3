Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BA2C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBk0a+sNZbfCHS7MYhaImm9JISaRylRsK8WDCMs4y+k=; b=RwUZ8R83vWNUKiLKDYX2UOtMMc
	7bUtauwcRtyCQFqHFUBNLwAqYsTml4rMR/ALq6C82bvwjGV3986Kzm2FtLeMrZzhx+F5idQ/UlWBD
	iUrt+8Y7rCo63Q1Il/hS39jdu/DzfQqvxsUFZOGDm5KfvpBSZ9ahEnK03BN+Fs3YItkfjrQuwTFtM
	RGC+XBYt+jZMMG8gDxjCYC+QkyfmQfEjvLLDFn1yMzwaqC/bTIZ+aKGkOZwOr0dT4ViQgSMTg5dyn
	jcUz0H++B4pO0SeMqkGhD5tDaSS8n2Sw/SypWS5cwTehi8xV0JY590+gIyxTWSA5K4apk2/ynJPUb
	/F9tEmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIX1k-00000004f3M-1ExJ;
	Fri, 23 May 2025 18:21:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIWxc-00000004eXF-1ksG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 18:17:38 +0000
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <f.pflug@pengutronix.de>)
	id 1uIWxU-0003Td-OG; Fri, 23 May 2025 20:17:28 +0200
From: Fabian Pflug <f.pflug@pengutronix.de>
Date: Fri, 23 May 2025 20:16:49 +0200
Subject: [PATCH 2/2] dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-fpg-nxp-imx93-frdm-v1-2-546b2d342855@pengutronix.de>
References: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de>
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-0-546b2d342855@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Fabian Pflug <f.pflug@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::5c
X-SA-Exim-Mail-From: f.pflug@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_111736_465382_1E0A57DB 
X-CRM114-Status: UNSURE (   8.38  )
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

Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..948b87150be813d24fce795b737723c20f512ec1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1344,6 +1344,7 @@ properties:
           - enum:
               - fsl,imx93-9x9-qsb         # i.MX93 9x9 QSB Board
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
+              - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
           - const: fsl,imx93
 

-- 
2.39.5


