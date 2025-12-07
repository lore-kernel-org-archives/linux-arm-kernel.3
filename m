Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A9D3B7DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e5pkymtfQ/Y+rYac0XiXfvjTXjO8L3JudphYp/OyS0=; b=4iYOqrx4mplRvBoEQWjllaHZdp
	Ip5NpTRzzuMRn35V0lLJ5+KhBgMaVmi7fH+TVGHOGBPoQK7o34+iAi9SpTYTeuzQzD60pK6y+YqtB
	SoTVQv+XnlDoLJl2kYQCPGlQVCqIwDqNOb8iQV95A40P7UkQtvRf0i+pRJ3bMmBlM8V12ZVJzkAtj
	Ilfc0+e9rE7VRRxXfL9pqiqCAwxao10+NQmmf0siAoAY1ipyw2XgNpAJaJ7TWnjS6DTfdkKg44Xie
	Yf40YuLau+D38eMSTVS+ceeWiMawO6YojOiFR1TTrSBTVteB9PRV3AT01kfPEYYEV5knpexYn6iL4
	WeeUcjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSEmI-0000000BxbW-0I2l;
	Sun, 07 Dec 2025 13:26:18 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSEmD-0000000Bxa5-47VY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 13:26:15 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 20C08200181;
	Sun,  7 Dec 2025 14:26:09 +0100 (CET)
Received: from usswic1srsp001v.us-swic1.nxp.com (unknown [10.114.8.222])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E5F382001B9;
	Sun,  7 Dec 2025 14:26:08 +0100 (CET)
Received: from lsvm07u0000156.swis.us-west-2.aws.nxp.com (lsvm07u0000156.swis.us-west-2.aws.nxp.com [10.45.140.59])
	by usswic1srsp001v.us-swic1.nxp.com (Postfix) with ESMTP id D3A641800303;
	Sun,  7 Dec 2025 05:26:07 -0800 (PST)
From: Lei Xu <lei.xu@nxp.com>
Date: Sun, 07 Dec 2025 05:26:05 -0800
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95 15x15
 FRDM board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251207-127-v1-1-5a2eeb69f150@nxp.com>
References: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
In-Reply-To: <20251207-127-v1-0-5a2eeb69f150@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 justin.jiang@nxp.com, qijian.guo@nxp.com, lei.xu@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765113967; l=980;
 i=lei.xu@nxp.com; s=20251205; h=from:subject:message-id;
 bh=Ms1VMn38PurnYbLCOaj8g6RLXsCv4SE/y4RWiYGa0xI=;
 b=3Qpr8GhKWzvDuemhut+WgqOIj7zL9qH2FK9sbgCY+K3m4Y2qxQoOztfYK8RrHhlvo5Ipcvfbi
 X1CNChqqGX7AoMi1CrvZCNnPOgsj4opSsiFJ0qNuUu+esq1MT+xhYcx
X-Developer-Key: i=lei.xu@nxp.com; a=ed25519;
 pk=faUN/3jfazJOPNYhE9pN+nzvk+lrEm64ZRf42Yeum6U=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_052614_215605_B8BBD02D 
X-CRM114-Status: UNSURE (   7.37  )
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


