Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D1CEA3F3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlSUkZO7JlULjXUrO/nmZmEPA/LMg+ujUuhSg0UpZDo=; b=u15rDmAMdAvlJ+vIbbstvemt4O
	GyPuwrFLxiMjqy7AiSIMffK25q5VJcvAAVg57+b99Qp8Xr2nW+8khdV9BGQ2oVkSl/QCBFb0dY0Cg
	rGo6KsTFYJmb0WlBnZPxRr9tH9JoAJck08eIPpjypudihjS/xKPQBtQBwytDd803GPAPTTUjV2yb7
	U1nJ+8WntHLJesxIKlYmI5T9WQjiKv6MVKFedVOE8JdLm0To3g2Ai9ssqSZmL+R0LIh4dsb5PWA9H
	+ahZOvEiHrKOd0JQCeOXW2DWgIr03Y/tD0ty+QkPkFjiO8ap+7Qon8e2TT4TXnJqJVZs3qGYEzVLJ
	7RG2RmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplHy-0000000Gqu2-2Mlc;
	Tue, 10 Feb 2026 10:48:14 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplHv-0000000Gqse-2G9r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:48:12 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2990B200DA0;
	Tue, 10 Feb 2026 11:48:08 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E4FE5200D99;
	Tue, 10 Feb 2026 11:48:07 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id D34491800079;
	Tue, 10 Feb 2026 18:48:05 +0800 (+08)
From: Yanan Yang <yanan.yang@nxp.com>
Date: Tue, 10 Feb 2026 19:47:54 +0900
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-imx91s-frdm-v5-1-b3e9a67d2285@nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 yanan.yang@nxp.com, qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770720483; l=1588;
 i=yanan.yang@nxp.com; s=20251205; h=from:subject:message-id;
 bh=rkq2K4vqf9hNirrFzUI1hw9VHIjNt2I3rTBNXNHNOfI=;
 b=ecOGkMrHM9s63kKB8aUGMzkTyPfikrmfU3MHGGbjGiPLW3vj77SHFAbgCL2WOn5MpPve4t+Qq
 AE8vGUuhLg6DAakwggKrLSxqB/5aRLbzI237iHyINWZBTXv1NA+tDkn
X-Developer-Key: i=yanan.yang@nxp.com; a=ed25519;
 pk=d4hHTp5SW/PyyxexLEo/3c2RAaQDwym0zuYlifH95PI=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_024811_717208_5D1FC3B1 
X-CRM114-Status: UNSURE (   8.27  )
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

Add DT compatible string for NXP FRDM-IMX91S board

The FRDM-IMX91S is a low-cost, compact development board based on the
i.MX91 applications processor. It is a cost-optimized variant of the
FRDM-IMX91 board, with notable hardware differences requiring a separate
DTS:
- 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
- 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
- Single GbE port (FRDM-IMX91 has dual GbE)
- PMIC PF9453 (FRDM-IMX91 uses PCA9451A)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Yanan Yang <yanan.yang@nxp.com>

---
Changes in v4:
- Rebase to latest linux-next tree

---
Changes in v3:
- add code-review trailers

Changes in v2:
- Correct author name: removed extra period in "Yanan.Yang"
- Refined commit message to clarify board differences
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..3aeb81c43915 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1432,6 +1432,7 @@ properties:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
               - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
+              - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.43.0


