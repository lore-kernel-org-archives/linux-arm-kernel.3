Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5121CDE017
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MLBEvJtQerWrRoEMg9CcXhmst3LOnrxDaKG+uTBOz0=; b=o9U8nZNXJrdgCMnMFJMGdDVAOK
	L0DG0vahg8dfvW7UhTEabPJ04TUyAgAOERXzM56y2jdDydGKaQiXJDJ3YDU65YRaUGPBixU2Ewmrs
	r6UR4u8JKilLIfRv7PeZByLfzUucB9Mh9FZaD0iZzLXyBwTyd3f4DmCAEdGIyZyNQ6VJg7SIAeiCt
	JmOFXxvtQ6gnzqRNWZ1zIzwiyTUmD2TZ5wjdtFVxEG53ucgqjM07hBr+hErBMJPH0HFCZ4II5cef1
	FN6VX5hADneFFCk9TJFNz7EHVBaU/jPCVhUP1H29JTfgGoaYVKD22EcmNYXSMp1IgjeF/kLfGxbnv
	qgwzAetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnio-0000000Bh1l-1CLV;
	Fri, 14 Nov 2025 06:55:50 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnij-0000000Bgzz-3a6w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:55:47 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6928D1A2BC9;
	Fri, 14 Nov 2025 07:55:44 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BCC71A2B70;
	Fri, 14 Nov 2025 07:55:44 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2EE77180009C;
	Fri, 14 Nov 2025 14:55:42 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 14 Nov 2025 15:55:33 +0900
Subject: [PATCH 2/2] dt-bindings: arm: imx Add FRDM-IMX91 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-imx91_frdm-v1-2-e5763bdf9336@nxp.com>
References: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
In-Reply-To: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Justin Jiang <justin.jiang@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763103338; l=820;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=tCjbGDv0zR+0FQ29xgeHeLnHMYNA7V5Gz0dijDuORK8=;
 b=PPEOpsKInLPPTySm5B45oA0BCYDWopdm2srTsJC/s3DYHSQFVICpLY28y2oHJamBqcc5iH7D+
 x6qAqsYUY6SABjwihwU7MP2reG55ntDJBxNZ70jYQ2GcoNfkwlWWnG5
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225546_028053_6466DEDC 
X-CRM114-Status: UNSURE (   6.81  )
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

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b0620bf537330ee9342a197f13c8c8ab..402c735bafe97236a2f4790f914ef56a4156b0f0 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1409,6 +1409,7 @@ properties:
         items:
           - enum:
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
+              - fsl,frdm-imx91            # FRDM i.MX91 Development Board
           - const: fsl,imx91
 
       - description: i.MX93 based Boards

-- 
2.34.1


