Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DB3C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfZM4b53LuolQG26Kk9/TzIiMrmHVJoXvIUiyAFFkDQ=; b=2eYIgjrMmacjiw5dxCKiFoEz0Q
	e+BI7QVdkITVVOxz48oOesSXXggpG47j5kvg16lMLjDwgR6b9LGUoVnNmNjIGMsJ+ePC18KLZNTdf
	nj5yVHtohbZW46vmwIV/lDHLL/celoUumjMtlDC3/93OlooxhttcjzrB/ABcnDNPOYieKqcCzkRmm
	y9MlNqYcBEfXenFWqlztX1tCASV/3b1ENLD1ig4JRUVgPPW6hEMgME9j/+DRunfXLpVKAFmGVPiFY
	b5poFb4GiO7h1ynt9PrRJvx+cWNGjtv07DIc1sZaj8tEOIMW1zgchM8IKxR3iGNIQkd+fftep7+24
	VhkZ4TcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bpc-0000000E1C7-31aR;
	Thu, 10 Sep 2026 10:16:36 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4bpV-0000000E17c-2HRI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:16:32 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 9B92B1FA94;
	Thu, 10 Sep 2026 12:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789035386;
	bh=xfZM4b53LuolQG26Kk9/TzIiMrmHVJoXvIUiyAFFkDQ=; h=From:To:Subject;
	b=vX2b7eCrnziWc+PnldSFwKd2b7ITtBry2xu4mKTAwEX+nzylz+5eZXFMc92Gb8wRb
	 Q7qYck4V3RJZ/hO159JxbbyAHDotvc+RDhBGUvLbSe6K6jrEoWkUCrmKofkeJqFjDg
	 njZEmU9BWSh+pa1aUpW34VLR4x73yjGiGKt49AEUZptCfru32ol4AmNgPZPBug7i2L
	 RMZ3RRndwbZKZz+CfI7MY+KpwPRUzlzxsKxYqc4mQQKvdCOgWqvAVgeQ0nEBwqj3pm
	 CPMGEOo0Dw6JJltTR0wQhFoo6JqSNGQBCW62ODDmQYd8zADeJfLsN3HzoHXoKCRV3o
	 fUsXzlVqYfQsQ==
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Thu, 10 Sep 2026 12:16:08 +0200
Message-ID: <20260910101616.139270-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910101616.139270-1-francesco@dolcini.it>
References: <20260910101616.139270-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_031630_486816_C984C496 
X-CRM114-Status: UNSURE (   5.98  )
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

Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
OSM Development Board they can be mated with.

The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
on the NXP i.MX91 and i.MX93 SoCs, respectively.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a32f779f02e4..33ced11fa2a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1520,6 +1520,12 @@ properties:
           - const: toradex,lino-imx91
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx91-dev # OSM iMX91 Module on OSM Dev Board
+          - const: toradex,osm-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1540,6 +1546,12 @@ properties:
           - const: toradex,lino-imx93
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx93-dev # OSM iMX93 Module on OSM Dev Board
+          - const: toradex,osm-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


