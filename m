Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1785CCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE4c3YaJR7jDFl2y0TbFLq5M4OnIWzzs/dF5WjR2wKg=; b=H6DE5oHeWdvK9adhk0++nq99eX
	8xbcb/KKoKfuhlbNzZq729dmgaUs/cDFQhXSuO+Us0aWzvd0aUi2l07VRCsTztKOnrl9aLLFY4m4V
	LAVCFelFAvYboKrZ4MqDn6bdSoNBYkmxOvBOGinGIqIlJwX5WdPiWj07aVP827fiafWVp6vfldJhE
	/kzobaQlfE7HDuNFWFtn8uDLC65cxjH+ngcRsRMQWUktdJGwHjq8JrRvY5n/CGw81WK5JK1/9FinE
	5CUXV7xvcCsed78QlyYg+TOpZWE2w1/U9WEtFyiS1o+4077j4hYaWYlr3LD9Cqs4Wowm9/v3HWREP
	Gf7AB1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrL9-00000005hRG-36Zb;
	Wed, 30 Sep 2026 10:15:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrKp-00000005hBB-1dpI;
	Wed, 30 Sep 2026 10:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A005F6024D;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B1C6C4AF14;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790763286;
	bh=ZIK0xCkexQBqyQJA96xFqjCpNT9qXiTKF+FxrGI34Pk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gWFgsGtgDJuUZLReQVjIFnbU3pZqrkWc/c4PksKTHTOC6jOH2kUv9iHmqrwb0QtG+
	 GxFcfry+GkkbhVX8h1t3eNR7c8tt57Yy+O7c+LuyQUhQdWEiB1SntMwifnhOXgVX3c
	 mhGuteI/3splkI0Vop46/FGH7Tf5pzJ3kT/vKtpn1DGMnnDAsx8D1MYy7jD08TtIdb
	 N2uYWzE/Wg2aDZd/r8VJN6hmB1eLA8V2k1Xs6p4SIK+St+MV7O/2KuDYWlYG8h/aHe
	 /X1Tbz4OvJqygzhSEuDwofje5ZGEBaURyHgam4pU1hz1DcSZRM08+i4eB20/6V97sS
	 C6kQZzwYjNrBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2D2CA5FB1;
	Wed, 30 Sep 2026 10:14:46 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 30 Sep 2026 13:14:27 +0300
Subject: [PATCH v5 1/4] dt-bindings: nvmem: mediatek: efuse: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-6572-nvmem-v5-1-384d2a3a1770@protonmail.com>
References: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
In-Reply-To: <20260930-6572-nvmem-v5-0-384d2a3a1770@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790763284; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=5K32Q1swD4S3cSggeXC/0toQquH0mxZvBxfpkIPi+IU=;
 b=M5/+WU7HpaDQSfcWxQZiRaA9XqEdJXJUf99cACRJWf9sFJsmkIkc1oQnfBjYsGTIQgqAQypN8
 aQWVac7lxewCQy2A12P9ZVN2Dij1muWKQwR7Zu0KCJX72yqllDEF1UO
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.55.0



