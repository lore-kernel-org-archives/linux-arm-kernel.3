Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D202C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmEvnV8BcXRhDLiqMxfGryQ1V4DpLIU/JOkIeNjibRs=; b=dTiucOQnvHpAg0PW/4NyKBfw+E
	Ry4aZnyBGo8XCYGQO4zO/NunW48lMQ7XiIPSwjuJPGQJOiONeup8E3oMC/GaFqNdJsqT1NzEQoIxw
	E3LpPT5taMFtHTUwFb618VQH71xE1fDgBUdmjG3UCmxlezJBhuNNwPOLxPBaq/Sn0usiiAj9J6l1I
	7hHcIFdu7sEIud+HDB7JkzLywpsOPAVPCYfOow+psQBFV4m8BNHl8ObBgO9ukvDHj44uJSWg5vFF4
	nJue8/Ol1rP78C2w1VOwxRni689g2krjo7wZcgpLYjUpPeLG3hVPw/pFoSF6JuXlB+lPllbBQ7atD
	t3xrbFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQt-0000000GFKD-2cU8;
	Fri, 11 Sep 2026 09:20:31 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQl-0000000GFF9-2sZR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:20:27 +0000
Received: from francesco-nb.. (93-33-8-46.ip42.fastwebnet.it [93.33.8.46])
	by mail11.truemail.it (Postfix) with ESMTPA id 16FDB22DAE;
	Fri, 11 Sep 2026 11:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789118421;
	bh=pmEvnV8BcXRhDLiqMxfGryQ1V4DpLIU/JOkIeNjibRs=; h=From:To:Subject;
	b=IA1th1MIFHI3o41x3a8IM5xNJHcQbd3fMFHh4TkNatqZn6Ag+R08/fe78U5GPiru7
	 mP5jIX6DG1qTjHSm5E6bPCOPqmPF6QTz3aEB4IV02m4q+uGbQXhMc+tjurn7LjyGeA
	 iMi0fPIsFr6SMW6m6YvPFqL0/vAdZZB5LiuX4dUGmL02JNnkbMnQfTStqsskVfPE2L
	 +IDkfCoDYy7+A0gPl0iX46QdjRRs5VysO6qZTJRrBV+x+DH8eAF3Fs0UNtCbipXRRM
	 L8RN7hZa3A/iO9yTand0ugHmR1npfJLK2YOHMRWIeePFylv96Vc46vQByAI5X6vp5I
	 09TuMQre8tc/g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Date: Fri, 11 Sep 2026 11:19:44 +0200
Message-ID: <20260911091952.96233-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911091952.96233-1-francesco@dolcini.it>
References: <20260911091952.96233-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022024_336495_2379B032 
X-CRM114-Status: UNSURE (   7.60  )
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

Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
the NXP i.MX91 and i.MX93 SoCs, respectively.

Lino SoMs use two board-to-board connectors to interface with a carrier
board. They can also be mounted on the Lino-Verdin Adapter, which
converts the Lino interface to the Toradex Verdin family pinout and
allows the SoM to be used with Verdin-compatible carrier boards.

The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
Ethernet PHY and a GPIO expander.

Add compatibles for systems consisting of a Lino SoM mounted on a
Lino-Verdin Adapter and connected to either a Verdin Development Board
or a Dahlia carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..a32f779f02e4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1511,6 +1511,15 @@ properties:
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx91-verdin-dahlia # Lino iMX91 Module on Verdin Dahlia Board
+              - toradex,lino-imx91-verdin-dev    # Lino iMX91 Module on Verdin Dev Board
+          - const: toradex,lino-imx91-verdin     # Lino iMX91 Module on Verdin Adapter
+          - const: toradex,lino-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1522,6 +1531,15 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx93-verdin-dahlia # Lino iMX93 Module on Verdin Dahlia Board
+              - toradex,lino-imx93-verdin-dev    # Lino iMX93 Module on Verdin Dev Board
+          - const: toradex,lino-imx93-verdin     # Lino iMX93 Module on Verdin Adapter
+          - const: toradex,lino-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


