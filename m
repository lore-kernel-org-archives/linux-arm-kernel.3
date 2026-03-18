Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D62AFCD0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0WB9mI904vn3AVHofU+qtTtXlb8K/5+XLKCE1igDII=; b=nkQ6PbGqSXwlvATKQ8qXobdRlp
	ALPYyecyL53Ro4E1vIhjW6t8cevPHx1IKniKpd6ixeKeA+cOlVt+1T5z1DYyq4ocYw+T0+nRVM8ZT
	QyBMw4KN9JNEkpOozXdjIdRYsHdhtFxHcpDWX5te+Jb8fEEpfT+ZPJ/xU3cTeSaW5zMaYPAt5ElBn
	qQSk28aWcay42PD1Lb+Pq3iv0EpZz63NxZSZ9hB61r2PrxcSHyNafe91z5neLedaiE7F1p3I6G9U2
	/N8uI3pX2Q57IgNLnrl/KNXz/IABsQJJQO4US4LHeBvXPaKGrPReggOkpeHpHsizgjxlrhLZGFQmZ
	Opd1Z71w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lt3-00000007yxe-3NpB;
	Wed, 18 Mar 2026 08:04:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lsy-00000007yvq-15dN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:04:13 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B74E200B58;
	Wed, 18 Mar 2026 09:04:08 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 16215200B6F;
	Wed, 18 Mar 2026 09:04:08 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 53690180217B;
	Wed, 18 Mar 2026 16:04:06 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Wed, 18 Mar 2026 17:04:02 +0900
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
In-Reply-To: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773821044; l=975;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=OkNhGYKxsXIL01q2f6JRoPSEa1slCn/SvNtBwWjeuzs=;
 b=E21/L1U5WBhU5pXwH89W4acVNE48yugfgwbmNSjNqRR44OJHl33Gucg3fh42P/R9mvKZ9lOtN
 Xk+u0p6+3WwAM1R932ve6SHFo+9qLMDnjHYROrl1nAHVSZLDDOKIcGU
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_010412_454863_1BD445F6 
X-CRM114-Status: UNSURE (   7.29  )
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

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f5d3c08369b92987b2cb01e36c26f9f72937f557..9f50b4bf67bc2c0b0e11b1ae615151aa4d5f0d09 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1485,6 +1485,7 @@ properties:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
+              - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 

-- 
2.34.1


