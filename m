Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E860E98FDE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTCgxSY8g7O+dmDT3SEttIJvvi9A+fVxUT3Jnm4+5+k=; b=EP4JFWwwSf2kLW6mMMS7U01y4F
	qVwBOU+Tt89DUjyW/LB96c5CHW+GP3xv4GRGJ5D2v2JTDhOHPpK2lXLkQDvgkus7dsCzB//drEsMF
	zOUvFYwGk5H0DFgiM7DiKSQhEMdangSQa+qXy4NZ4Wc05aevQTwsnTyxxOYTs5rYQ/Fvwi85/4TKE
	650sEtn5JgdLn+Kmh/bBydPQeqr8pIcFHb0lGiFlz3j19wZLTFzxeQ68k1srF1nqwcGVEaedJK6xU
	MRDbfvZ2cbCjOJkBtZ3I+Fw2Ju7SAwBnSSuzT7jreUHVtVl9oHkm0kBt/akVXnodX4QG+nkM8bxch
	+t5ivqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAN-0000000A6Si-1Z5d;
	Thu, 09 Apr 2026 09:59:15 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAI-0000000A6Oz-06W8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:11 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B72542035C;
	Thu,  9 Apr 2026 11:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728747;
	bh=VTCgxSY8g7O+dmDT3SEttIJvvi9A+fVxUT3Jnm4+5+k=; h=From:To:Subject;
	b=QwkGgUIZOcpmIbn5RFOOMTbPyXVkKsIZJePywxwj7j86zRjOhCIoFMLM76IQBz77v
	 mthY05LZZisrsGwGMaHJk6fp63B1QovXLzTrWsVcpk8HKPA3vdvndSDv/EPSxCZ3gY
	 VXAr65DtP2r98x5Hp966ZKBxlZlHxO4hnSPOenSVX9QDE42FL6SqRZ67UDUWL5xi0u
	 07INBL96zXhXxj2l3hZN94xP352wZYHlI7LIfq3j7Z8kHaB/v0Fq3LYT9mDYNHPGBa
	 AYajvK9x2cnW4DufPGoAbxn/pWsRC4twYIfBs250WGJUZG3RF1FTRhux4XxQIoGcfi
	 vS6+jyvimBS0g==
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
Subject: [PATCH v1 1/7] dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
Date: Thu,  9 Apr 2026 11:58:47 +0200
Message-ID: <20260409095855.61252-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025910_374687_D475C8CC 
X-CRM114-Status: UNSURE (   5.91  )
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

Add Toradex Verdin Zinnia carrier board mated with Verdin
iMX8M Plus, Verdin iMX8M Mini and Verdin iMX95.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0023cd126807..f5429e6c86ff 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1025,6 +1025,7 @@ properties:
               - toradex,verdin-imx8mm-nonwifi-ivy    # Verdin iMX8M Mini Module on Ivy
               - toradex,verdin-imx8mm-nonwifi-mallow # Verdin iMX8M Mini Module on Mallow
               - toradex,verdin-imx8mm-nonwifi-yavia  # Verdin iMX8M Mini Module on Yavia
+              - toradex,verdin-imx8mm-nonwifi-zinnia # Verdin iMX8M Mini Module on Zinnia
           - const: toradex,verdin-imx8mm-nonwifi     # Verdin iMX8M Mini Module without Wi-Fi / BT
           - const: toradex,verdin-imx8mm             # Verdin iMX8M Mini Module
           - const: fsl,imx8mm
@@ -1037,6 +1038,7 @@ properties:
               - toradex,verdin-imx8mm-wifi-ivy    # Verdin iMX8M Mini Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx8mm-wifi-mallow # Verdin iMX8M Mini Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx8mm-wifi-yavia  # Verdin iMX8M Mini Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx8mm-wifi-zinnia # Verdin iMX8M Mini Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx8mm-wifi     # Verdin iMX8M Mini Wi-Fi / BT Module
           - const: toradex,verdin-imx8mm          # Verdin iMX8M Mini Module
           - const: fsl,imx8mm
@@ -1271,6 +1273,7 @@ properties:
               - toradex,verdin-imx8mp-nonwifi-ivy    # Verdin iMX8M Plus Module on Ivy
               - toradex,verdin-imx8mp-nonwifi-mallow # Verdin iMX8M Plus Module on Mallow
               - toradex,verdin-imx8mp-nonwifi-yavia  # Verdin iMX8M Plus Module on Yavia
+              - toradex,verdin-imx8mp-nonwifi-zinnia # Verdin iMX8M Plus Module on Zinnia
           - const: toradex,verdin-imx8mp-nonwifi     # Verdin iMX8M Plus Module without Wi-Fi / BT
           - const: toradex,verdin-imx8mp             # Verdin iMX8M Plus Module
           - const: fsl,imx8mp
@@ -1283,6 +1286,7 @@ properties:
               - toradex,verdin-imx8mp-wifi-ivy    # Verdin iMX8M Plus Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx8mp-wifi-mallow # Verdin iMX8M Plus Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx8mp-wifi-yavia  # Verdin iMX8M Plus Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx8mp-wifi-zinnia # Verdin iMX8M Plus Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx8mp-wifi     # Verdin iMX8M Plus Wi-Fi / BT Module
           - const: toradex,verdin-imx8mp          # Verdin iMX8M Plus Module
           - const: fsl,imx8mp
@@ -1515,6 +1519,7 @@ properties:
               - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
               - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
               - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+              - toradex,verdin-imx95-nonwifi-zinnia # Verdin iMX95 Module on Zinnia
           - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
           - const: toradex,verdin-imx95             # Verdin iMX95 Module
           - const: fsl,imx95
@@ -1527,6 +1532,7 @@ properties:
               - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx95-wifi-zinnia  # Verdin iMX95 Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
           - const: toradex,verdin-imx95           # Verdin iMX95 Module
           - const: fsl,imx95
-- 
2.47.3


