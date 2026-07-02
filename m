Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CC5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VIkEKXeS781X9UXvIVpzUMsHH8ZIgSjKYS0SPq/4ak=; b=3C2zmGgEUGK1PXwg2ckX/0h2pv
	POIkMGJmszxjV1eLPfoFKhmgVo9qNeKmDlGAiHabH1Xpd8bylbVn4KYS1K+m2Zpi5qE4NvVQO+TVF
	TFNv2oMCHvm3potrGoPyqqi7OMhjpoEwlGBJjyGoJ9UlaW9G+x4UgZ2xyrDbnPE/HKAG6g9rySjT6
	7tukM/nNZ5LX3DgCX8XjvpHN46G7wczB6V3RUdH1NX2y/695+CaKG3XmxDK1AWFnxCyTOoHMt7AWf
	JBwMrrBpEWlOo3Ns8Q6V0b7t7hwDo+PyGCU124raI/j9mAR7lZCWXNz8flM64TTPNuTBJJq8ZKzQJ
	8p0aHbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEAf-000000046bW-14Ls;
	Thu, 02 Jul 2026 09:57:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEAd-000000046a6-1qGl;
	Thu, 02 Jul 2026 09:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33A8443C51;
	Thu,  2 Jul 2026 09:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6F62C2BCF4;
	Thu,  2 Jul 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782986243;
	bh=mdko54FYHW1Y4Fx45AjmFQXhB8/L+lPNnWi64EUhCbo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cSxLkMwA+1v8J6sbKgIuDA+k7WXE3nBxR00coS1kORu4MLERM+qO0NHOZi8czD/r9
	 xMP30klkiTpSJd2vxayYHO3dRMGqbq7TRpcPgBiCb7cjInGqQ3dySrcSahWO/HbTW2
	 +C6E8dJJBYuhDf72xknq5sXaOAKURmLwBQiGZmzclcjuCw1ms5oWszGEQBxam1tRSB
	 CD6NmSCWY8qaEpB0BqA+QSIIeDMyH+DcVB3nGc1eKG3PBjyY8KKyvA8NLQ6KRG3YY6
	 K1agjs6l7v0hSxCNJQIPCRvkwuzXjMHD2z7TVXmCI+4OuUBinAsc+s8DiLCc3/pr5p
	 Q9lq0ma1/3XOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95E1C44500;
	Thu,  2 Jul 2026 09:57:22 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 02 Jul 2026 11:55:55 +0200
Subject: [PATCH v8 2/8] dt-bindings: i2c: amlogic: Add compatible for T7
 SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-add-mcu-fan-khadas-vim4-v8-2-244feee91a36@aliel.fr>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=UhqbrsqWdh/iR+BhkbanI5uJd+ofvIkQdzdIbbn4Ngk=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ5ab6Y9Xykrm1T41a5nvHOs4Eh2d5Lbxpkt+oMb7NeXTO
 FrjT/N1lLIwiHExyIopsvTPtTzx7vLRM1/3qKfAzGFlAhnCwMUpABPh5GH4nxDqkpAx7/Lp7QKz
 m/k+nEx4cMUjVaXmw6K5Gmo9ujvmZzD8T3o7X3HN8g9fnse9fX59S8PXlxMSn8XO28myZyGT05b
 eCTwA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add the T7 SOC compatible which fallback to AXG compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml         | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index c4cc8af182807..7b59b60b62e5b 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -16,10 +16,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
-      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
-      - amlogic,meson-axg-i2c # AXG and compatible SoCs
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,t7-i2c
+          - const: amlogic,meson-axg-i2c
+      - enum:
+          - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
+          - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
+          - amlogic,meson-axg-i2c # AXG and compatible SoCs
 
   reg:
     maxItems: 1

-- 
2.49.0



