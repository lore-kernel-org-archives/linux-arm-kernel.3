Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783BAC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euhK5aUqaffH+G9dA4WDd0lpqQb2ew8KsLySzOQtZA8=; b=0yjda65B/ETLtbJMbJzYUOlDes
	HVrQGCtwrK/JfmreqaKvS4jMsLpM+5zB59oxvJT4fppmC5ZW7t0BDK4wCWrlbARfnZm/aIr3ilbPS
	QJ3Dz5ttFzQUGfn1lMFLvawHqxhbmymsCeI+XIDM1nZ86tsiFceR/KnMxnHB7e/TcFWhtzEFvlPLj
	ZH386mlN74RHHEU10HhvyKTkhJJ0gsbc+9EqW2Pskg0LWUKKR17AyLujxm82BCTQJlNStZxyNIuwH
	/kiMMy21PPHikOMK0ERqNeJL+GZJSQixTe6DMe/ZtXivEUWOi3FghCu/DFZcQXTZwiwtit89DPdmF
	kSxUFD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUG4P-0000000CF2V-1ptx;
	Tue, 02 Jun 2026 03:45:37 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUG4M-0000000CF1V-2s2t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:45:36 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A65461A32D2;
	Tue,  2 Jun 2026 05:45:31 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 640081A5692;
	Tue,  2 Jun 2026 05:45:31 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0860C180007B;
	Tue,  2 Jun 2026 11:45:28 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Tue, 02 Jun 2026 12:45:15 +0900
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-imx95_frdm_pro-v5-1-44ca5dc30a14@nxp.com>
References: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
In-Reply-To: <20260602-imx95_frdm_pro-v5-0-44ca5dc30a14@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780371926; l=1080;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=V2r/pRfA2wVYSkIHq1h5ZWGhTxUSxmurkgusfcpjU5I=;
 b=PuyRKHqaOVgHSts5/QrBsPb8OnCoTmkyK1rCfy4CV0DYIsb/FBVacytxbDdNKEsx1x9pSfd/n
 l+1f1gQJsHZA2RWWtsCWxY1gHeD1cBzpYQSTNetYDl9Rtnagj3XJ3aa
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_204534_856054_3156BA66 
X-CRM114-Status: UNSURE (   7.14  )
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

Add the i.MX95 19x19 FRDM PRO board in the binding document.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 279e9a7e5f9e7e5c8c87a371c6ad14676474dfa8..a2cb7e43d657abb517c98250f9ce273180feb3db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1498,6 +1498,7 @@ properties:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 

-- 
2.34.1


