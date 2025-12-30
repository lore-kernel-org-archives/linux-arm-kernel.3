Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695E8E94109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8nEIbexSmkx9F9cfoMHXrdrP1Wx3AbGEcQe/70Ww+E=; b=jiSkviy6t0eEgN4WX8wtegapiE
	/7xxEo5RrtuV/dOLvR3wkWrgbMbqvjBEXKzXf7DPCmKPIf5hHnXjIzCBIdA5wWNOtSjNw4FWKo7WT
	zr8UTcPwYTK8G63yFpPHWKmDEhWMJvkVLfWJvOvT6BuIUFjYAl17WBZLYC5slq6SDNEM10oZFJQoe
	0RHK6+BWWTZbokoLoQc0Zemvm+/bbtURAB++8dLHfGx1KQBg5RwcWnvAZNrCgiyZik+8Z9uDFMfka
	ai23JvhGzXxIgZoSrSLo27WHYrjbi3jAClaZSu2+0TYAzqWzamTEE7/Dt/9IEjTc4RAQVOJpRf+7p
	efRAkQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUdN-00000004XTZ-4Axw;
	Tue, 30 Dec 2025 07:59:13 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaUdK-00000004XSU-3tdX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 07:59:13 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E745A1A1872;
	Tue, 30 Dec 2025 08:59:06 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B0E271A1112;
	Tue, 30 Dec 2025 08:59:06 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8B2DE18000AB;
	Tue, 30 Dec 2025 15:59:04 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 30 Dec 2025 16:58:53 +0900
Subject: [PATCH v3 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-imx91_frdm-v3-1-60cac61c96ec@nxp.com>
References: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
In-Reply-To: <20251230-imx91_frdm-v3-0-60cac61c96ec@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767081542; l=1154;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=YSyTVSaQdn2NwJL6GxptFOuj3Q635X7g7eHgWWcCa3E=;
 b=6Af7zRJwmY1Yp9Cm0J5hRp6L/KoKoIYMEKQfQF1ZNi5QUbdil1mhgQLribAb0Gi+tIStgC9IZ
 /b9Xwohc9C6DY99Nxk+zWW8/XZBHK48g6EilO6uI4qkbU+xDCH1V4r2
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_235911_119398_2DAC6D81 
X-CRM114-Status: UNSURE (   6.75  )
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

Add the board FRDM-IMX91 in the binding document.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Francesco Valla <francesco@valla.it>
Tested-by: Francesco Valla <francesco@valla.it>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Changes in v2:
- rename 'frdm-imx91' to 'imx91-11x11-frdm'

Changes in v3:
- add code-review trailers
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b06711e2efce61ac1fc2794b79bc..12d72057b1b817283754a2857d8106a409b594e7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1412,6 +1412,7 @@ properties:
         items:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+              - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.34.1


