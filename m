Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EECC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgkJtfg2Oa0pragjuJeKN0nu6XEm/dV1W+4SP0dFvKE=; b=c5MT9rwzwSoBR8xe57i/xUddDb
	PSu+0d1XmY44hF3dDxHpaLdFMxqRuBZQMCRN257VXHCaomZtxmf53Um1YKXkVjYsm/WQ6gxvsHdkg
	PPFqCoiISnL7xLqmQ8VZYMQrS3l9hqflht0NdFTsLbUX27+XdGIAArgNG0OCpzMQpkKsvZBLXE9VK
	0z96hduG3IsO4M+9PrdR6/uPQdxF7cyXPPdDVMqVptz7nduVvHI2YXblVnNq/D/BffsRfMybo76H+
	conplMcqecM8RG9O2ghyNLtuFJ5kES3PasbvzNy6bD9dImaS5XMw4M1UiIAb0yAXQ8V1ObE1HOpAC
	mkkFL5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDh-00000008ovy-08hE;
	Mon, 31 Aug 2026 08:18:21 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDU-00000008ooK-00ky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:18:10 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 00624201BD1;
	Mon, 31 Aug 2026 10:18:03 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 31 Aug 2026 10:17:39 +0200
Subject: [PATCH v8 2/5] dt-bindings: arm: fsl: add compatible for Skov
 i.MX8MP revC Touch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-2-e2e635452ba9@pengutronix.de>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=RZyWgtpU70jBz+JvuDuOLnn//DJ1hx2GrbobllffPFg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi51du0/9OOj4zrZI1Uln43eluSczr0asMDjrfmXJj
 sSvJaz7O0pZGMS4GGTFFFlUFlbwiXp88IycJsIFM4eVCWQIAxenAExEnY3hn7nS7uqFi1hrzmot
 CZ0r3jvtvfJNzUPR0yY4X879v+zxD2VGhk+WrCYZy65bFKubr/eaIS/nOLHgUFKBx64F1SYnG/T
 juQA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011808_190939_97EC6471 
X-CRM114-Status: UNSURE (   7.70  )
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

Add a compatible for revC-based Skov boards with a touch panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..55d0b682a7305 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1149,6 +1149,7 @@ properties:
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0


