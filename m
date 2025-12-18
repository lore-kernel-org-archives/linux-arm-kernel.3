Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CC0D68BDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 05:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MniPJZoU2haCypLkuo2dF0VnSKWTnv0CQm02a5RI4t4=; b=TttLSaql6I2iEpZeUoH3oSB/rs
	DY39wbHozgtrKl/3x/5TJn8L7RUJjJC/GJia+vr2S98i9VI1wJkk6IDPeW4V1CLOMkgTDGmVJRf3b
	CQqzwMUccpwCX7Jp9pHAEuC522UE4vq3HgtDkgZLj5YSRpjtCVPupjoAFkaikZmryOqMR9DqZbBDU
	9xQZ8YUEevAkWRtGt1XdPrr6zfhvWGZBn5gvg11lwBCztS4hpG1gxfkIyAHlSe1bW5X2qqUFQkWNO
	/rjyl2CGXFaKPhiYjqAjjGjahZBI+edHWfrQ8P73i6yZVTi2RKJ4hni0jBAUNIatxqkl9Lv6xyNgM
	fOWS/PBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW70C-00000007rQG-3oNp;
	Thu, 18 Dec 2025 05:56:40 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW70A-00000007rP3-385r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 05:56:40 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D1CDD20209F;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A165A200736;
	Thu, 18 Dec 2025 06:56:34 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id 845AA1800315;
	Wed, 17 Dec 2025 21:56:33 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Date: Wed, 17 Dec 2025 21:56:28 -0800
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-127-v2-1-67cb12e56242@nxp.com>
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
In-Reply-To: <20251217-127-v2-0-67cb12e56242@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766037392; l=1050;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=NDUuTAe6GnI9jj/43bSUGHl8qff3+dIFGK9G4CqLQpA=;
 b=tfreaao2sXgbYa/vMHu2xsfHdr4KtQ5cnC7kNg6+jGlowA5tzLxX+pYusnpgyFXq1KWa04PJz
 KKgwQt83SfwBpkosYwrOhN7bRyB+GiAJnpuueKm7Mu1B1FRQw6enFHl
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_215638_920074_7F210AD6 
X-CRM114-Status: UNSURE (   7.41  )
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

Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
development board, a compact and cost-effective platform based on
the i.MX95 applications processor.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Lei Xu <lei.xu@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..4b6188d39be6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1432,6 +1432,7 @@ properties:
         items:
           - enum:
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
+              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95

-- 
2.34.1


