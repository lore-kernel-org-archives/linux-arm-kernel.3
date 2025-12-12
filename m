Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21A8D43368
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 02:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOomKoeMRCZL/RVwJS857wTEET6uvXJzeFvf+PzShl4=; b=1KUhkZ6m6Sr77LEmHJ9LGnqUeJ
	nE2v21fUCq8+dLE6HMURNkaIDmLE0aW8jClHRw6JQWste6NYvQsKUSrw3SupVyRwEkmMmVUX4PH9k
	9A2gLMjRYUB7D/9zgq8FLmyyuhEp572F5JGq9GB2UcIrJfPH+iCyTS/d8xwr14CmnTm4kEq01F/ze
	Feb+YWWHkkMjqUwTcF3Kn1EMqPFzn1NqcBZECiavAbzqiBwVOPwodDMJOD9GJi3G3PdDMBQh/xdmU
	eNyP/W5odhYRvTmYuUgN07pv0gS0HUBsHMrL71+45TDB1C7siyS8Pz88oT1OKxrkPPfkLd7GkeJBm
	bVGxfx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTswd-0000000HYPQ-2npp;
	Fri, 12 Dec 2025 02:31:47 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTswX-0000000HYNs-27iq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 02:31:44 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71090201E6A;
	Fri, 12 Dec 2025 03:31:38 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3BE07201E5D;
	Fri, 12 Dec 2025 03:31:38 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A0E281800095;
	Fri, 12 Dec 2025 10:31:36 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Date: Fri, 12 Dec 2025 11:31:33 +0900
Subject: [PATCH v2 1/2] dt-bindings: arm: imx Add FRDM-IMX91 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx91_frdm-v2-1-4dd6d289e81d@nxp.com>
References: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
In-Reply-To: <20251212-imx91_frdm-v2-0-4dd6d289e81d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Justin Jiang <justin.jiang@nxp.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, qijian.guo@oss.nxp.com, 
 Joseph Guo <qijian.guo@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765506694; l=885;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=Gy9TlgJnCmm6TOU+C1vsyNLI04jFbpgfKBDibUHLi+M=;
 b=U6pV2LnRwk9vvUuUntCBQXJp4xWl3D1sfBtvgpDRst2y0d9m/0HFclA9+VqZop2gAHeXmajRj
 2e4gcFoDSYGCPnwSK8a7SSrVprl1Y8aAGPbT+o++3I+5Bx54BFIduhR
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_183141_699493_A5C53664 
X-CRM114-Status: UNSURE (   6.38  )
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
Change in v2:
- rename 'frdm-imx91' to 'imx91-11x11-frdm'
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


