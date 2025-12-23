Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEAEE6FE25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oK1IffVG2CPnfvTGGdHy1OT+9sPDiuPZUecdFiwUmc=; b=XV0/xa/AfuRPezi++hWxfJQ0QZ
	3BeFxHSj2crZvqJGbiJ9NoqKxwjMRBuqOglYqCzdclP5/xA8DKevd/JriezssUCW4LG68tR2RJX7e
	Veej3W1k4sFzNgKAurVLTXPEOvG2fueepo+Bj2Cfy539xbOYqRAeRdSnLAhk6XG6aPH6UTOYyBUr9
	crzBgjujBE+xBRpBb2D97SY2MtV67vWpUxO+IQNnzcoQv12SDou4v6z7OUNNI1uWXyqaYfKbSLn4y
	j3qVGnKvf1AtsfJ2S1UbCT5qdSOtPwvuIp+vFnR1s8yweiOJ73PhYC0YUPjex9NYyyl12b0a5dlhp
	xFi9HAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fl-0000000FlAu-0Hgv;
	Tue, 23 Dec 2025 16:28:53 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5Fd-0000000Fl6F-2JXw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 16:28:48 +0000
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 053571FE0B;
	Tue, 23 Dec 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507322;
	bh=3oK1IffVG2CPnfvTGGdHy1OT+9sPDiuPZUecdFiwUmc=; h=From:To:Subject;
	b=yWHopKvJ1ptTLiqfw4v4LBpnD+S2pdhJJKyNhjR4xzwz0wrIOVnUGF/XltwLsQPZA
	 BnSn8AF/kFimgsAwGbvMRMECRan4kHFbZPpOsZEfP0+vG1fYHCABlJSeDwG0uDncBQ
	 O0Y9+9wDibPktgFY0GXUfe+OIWM3BVyj7IJ84EZrntUwu/oSaVo77M1IBBjemguU0r
	 d97v627XQZKWQ2CxkFV7yzszYdujwJTf2JRBfkIvrTd2D/53ZXINjr1x3hCNvt+n2i
	 ROXcczZmbrpMiw8vOqyVYu6zH/vaAw8hVnFcqx1gw3sbGOLDyZXr/lLt0P+5QMMORD
	 gCn0/oDUL4KTw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Apalis iMX8QP
Date: Tue, 23 Dec 2025 17:28:27 +0100
Message-ID: <20251223162833.138286-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_082846_601115_5AF3948D 
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add binding documentation for the Apalis iMX8QP SoM mated with Apalis
Ixora and Apalis Evaluation board.

Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
A72 core instead of two.

The two Apalis SoMs variants share the same schematics and PCB, and the
iMX8QP variant exists only on revision V1.1 of board.

Link: https://www.nxp.com/products/i.MX8
Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..611fe36c2884 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1333,7 +1333,7 @@ properties:
           - const: toradex,apalis-imx8
           - const: fsl,imx8qm
 
-      - description: i.MX8QM Boards with Toradex Apalis iMX8 V1.1 Modules
+      - description: i.MX8QM/i.MX8QP Boards with Toradex Apalis iMX8 V1.1 Modules
         items:
           - enum:
               - toradex,apalis-imx8-v1.1-eval       # Apalis iMX8 V1.1 Module on Apalis Eval. V1.0/V1.1 Board
@@ -1341,7 +1341,9 @@ properties:
               - toradex,apalis-imx8-v1.1-ixora-v1.1 # Apalis iMX8 V1.1 Module on Ixora V1.1 C. Board
               - toradex,apalis-imx8-v1.1-ixora-v1.2 # Apalis iMX8 V1.1 Module on Ixora V1.2 C. Board
           - const: toradex,apalis-imx8-v1.1
-          - const: fsl,imx8qm
+          - enum:
+              - fsl,imx8qm
+              - fsl,imx8qp
 
       - description: i.MX8QXP based Boards
         items:
-- 
2.47.3


