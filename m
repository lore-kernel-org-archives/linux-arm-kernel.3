Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C34DC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 07:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNV1S2EKqoO/AcoN5O4wNdh795i6OD38hbqQKpN+pxM=; b=gFxDL4c/AMpUwwVbs8HoHl1rfo
	vNRTJ+1ertzALkIc17EK/p5rwtrRwBckC5Z1GXp4LrhdIz0imMFs5cmXPyqucQtVZBZF/N/jXE48x
	MgaXdsgz7MKOAqfCgjaXF8qZbO/zX7+M+553wKZSBYUwIDXRwLAy/W4FgOJOBO5nvrUECh2Xf9sIm
	dVKMsiFwQxNRS+aJSD5nlFOVklB+7KbKwhmU4HLEOOdprWL3a7PeRO87xb7kYckrrnm5aINOVivx+
	hhtaQL/cvYJjJeKJjrwOXLX/NGfsU2mS9sPfEcDuMS6on5TFCbZSex2Bzn8vhh0off2YPaVbIygjs
	syrTmFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmncm-0000000DcDw-2Zhn;
	Thu, 23 Jul 2026 07:13:44 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmncd-0000000DcAo-2ngX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:13:37 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3B9221A015F;
	Thu, 23 Jul 2026 09:13:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 058A51A016E;
	Thu, 23 Jul 2026 09:13:34 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id DD9A618000B1;
	Thu, 23 Jul 2026 15:13:31 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Thu, 23 Jul 2026 16:13:22 +0900
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add i.MX93 Wireless FRDM
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-imx93w_frdm-v2-2-b108a76b2e40@nxp.com>
References: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
In-Reply-To: <20260723-imx93w_frdm-v2-0-b108a76b2e40@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 justin.jiang@nxp.com, xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784790808; l=1342;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rIUO4rVG/YYP995nR+OcKZLSQoVP7DUjUlXUFgxS7j0=;
 b=hv4RhR1SGusEdrZXL/S4Ti4Kh1HUBL8TT7+2fH6ohxzVQXdwaV12M4k1cXBDjgaxYN5jDOuhU
 cvJcjbVJzavDVuMjWtIMoAhk3TxbTfvcT4KaRrEpMRbJxLAlcQmcGG1
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_001335_851059_F77D28AB 
X-CRM114-Status: UNSURE (   7.46  )
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

Add DT compatible string for NXP i.MX93 Wireless FRDM board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless FRDM board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 FRDM board, with some minor
functional and pin connection differences.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7b57a6ee1b50dc22ece292d6d9b53b5aa834ee96..9ab7af8c02d68c7f95cccfb5071662eafc8f93a0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1513,6 +1513,7 @@ properties:
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
               - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
+              - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards

-- 
2.34.1


