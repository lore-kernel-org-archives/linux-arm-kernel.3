Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701E7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zva3FPKeFabbu2LtkeKWUVIEJqvYScNBl/WxN2/Nsvw=; b=u3mHnGimHDS7TH8xY8iRfVyH6V
	3NLrcGrtBnOBrkMm4g/5vmH33J/A6Fbx2PcaIlZINSzctI5zPGzWgCWt6lPOXaU6kXoU0zFufMS/s
	8Wx2n+ECkVC8YY54L0+KRKXtGvOO1db4E3QfCpdgE8jxPngHjFW0HmsO6WPtMY79KLCyDdTyGn67g
	JYEUnFbqlbAeULhc7HRF3cv2n341I9jvLOAUwIQMLhLICQUO9OxA4V7Hn9ESGhClLqThbUCkFKga5
	lgvcKhV5+uCJ3f+dc8f7xRZ4LMQWwbLo2cuiYVm10qFsGbXG9cf2gdje0lx1jaOPMiERFLzTn3qsN
	AxyKH8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ6q-00000009iFB-1QQU;
	Fri, 24 Oct 2025 14:49:40 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJ6m-00000009iDa-2Mbi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:49:39 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 37D6E25C78;
	Fri, 24 Oct 2025 16:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1761317370;
	bh=zva3FPKeFabbu2LtkeKWUVIEJqvYScNBl/WxN2/Nsvw=; h=From:To:Subject;
	b=BCZQjEja8kaPiU4A7pSr6CRYlMDXu+OBpYwswer+zxn7mOJ35Hr8HVmZaFHqY63Bt
	 XhXD0ao3G0BA7+kqXNcQuW9rLW//2blv2LF6nHjzjQNyihYALX5ZENi9teSfPLp0bK
	 LVJqmTxHmLH5QRLZD64Shedkl6qla70G1T7gYw04zHpUA0T8Zs0RTgSsdYDAgVc7lz
	 U+Elu4czZMmOIHqnNpE1ecb7Kl2qaUiohsoEcat3nS2sMQtDu9BJQjUbvimUyHU1Oq
	 Rh34YWZ8LrVoFqwkEHc165lHcBuYRyjGNOqnysnphLFTjAvqDamepUjU7+rN7BBJrC
	 iS/YAjnah2asw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX95
Date: Fri, 24 Oct 2025 16:49:20 +0200
Message-Id: <20251024144921.77714-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251024144921.77714-1-francesco@dolcini.it>
References: <20251024144921.77714-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_074937_650395_D1AFF4FE 
X-CRM114-Status: UNSURE (   5.76  )
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

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add DT compatible strings for Toradex SMARC iMX95 SoM and
Toradex SMARC Development carrier board.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..44dd93f1c674 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1439,6 +1439,12 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with SMARC iMX95 Modules
+        items:
+          - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
+          - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.39.5


