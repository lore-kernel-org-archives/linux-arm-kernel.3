Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE52C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 10:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; b=kQ/EzP41zm/Y1rnQbt2DfH8+VH
	yDkpAAiDiC+j9pggk1Xw0KDMVRZqL4kD0QBuHHcIbgwmvH/8AVEwX1VFN+2E1nFlMleG4ua8gZeVf
	9A9rB/d98tNuhHFU9H6I1PPrtVIIsGtaKGCUAWF+Bq2+2N2+59/gkovySIbghzODNbfCwOaZL6r6d
	gESeKre5IM3QHDokhCt6iQ47Z6KlGgSiIqNUqgxUIZGLYhigUsz0FtaMWf8p2D1q3P0LnHlsZ7N9Z
	iTrgBLyQwm6LGfKpRFMLO5hTQOTs7KUOI37gh+0SBYcqVbATopjtDkf9aaGlQtOnf/7i3TL2CZlfY
	8ZvTd5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79EJ-0000000B5XE-2xzy;
	Thu, 17 Sep 2026 10:20:35 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x79E5-0000000B5Sy-3KRT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 10:20:24 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 78B2D22831;
	Thu, 17 Sep 2026 12:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640420;
	bh=oqLenxL/19HM/21oW+/2Rvt5NkH8DxDP5vg8uKDbrNU=; h=From:To:Subject;
	b=B53ACcXvI7XqUZL9siGF4NLr9kXTQlVlhYQuZ7eWVulsznG8I77rjStkphKwx69b5
	 FUL8IQGV6plHXL+/BGFpeZK3yqC//ytp+QueXX1aSB7v+RzoUbrx05PhP/RckkelN8
	 ftj6NiE39tehF2MWvNqs8qpUf7X972x6XOYEliO4th5c10V/hC8ipoDPW8ivNI0IZC
	 f7spaSbIwA7+pHXtu/IvKXq+OPhUBjwBONN7Xst38UmRG45DjBzA6PFP+PhvpRat87
	 hjOQyaUVJohWWZgfeljSW3X/JDnvi/OWG+GAec3C3xUzcQCIhoSlmtEYagsoGz0J3I
	 GujHODXikVj0A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Antoine Gouby <antoine.gouby@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add Toradex OSM iMX95
Date: Thu, 17 Sep 2026 12:20:08 +0200
Message-ID: <20260917102011.69071-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917102011.69071-1-francesco@dolcini.it>
References: <20260917102011.69071-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_032021_978129_829154F1 
X-CRM114-Status: UNSURE (   6.36  )
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

From: Antoine Gouby <antoine.gouby@toradex.com>

Add Toradex OSM iMX95 SoM and the Toradex OSM development carrier board
it can be combined with.

The Toradex OSM iMX95 is a SoM compliant with the OSM V1.2 specification
from SGET using the NXP i.MX95 SoC and is available in Size L (45x45 mm).

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx95
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..9413c3e225ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1578,6 +1578,12 @@ properties:
           - const: toradex,aquila-imx95     # Aquila iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with OSM iMX95 Modules
+        items:
+          - const: toradex,osm-imx95-dev # Toradex OSM iMX95 Module on Toradex OSM Development Board
+          - const: toradex,osm-imx95     # Toradex OSM iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
-- 
2.47.3


