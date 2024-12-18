Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35FDE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ocZBPnafeUCd5ECMCcY13CuBJv9nszWBok5zbKtnlA=; b=JvnQOe3DyO8MzjFXDkd9iU+ufI
	ALq3Jf6JdBt7h8b34jijkq0u0xHoKWzFA+SBYi4mWLYPZH0jpw0HblBlRM7ceiX33GQiq7AkT2230
	/jyDk+XYDGTrvS6gg+XTJ3qCtz9Jdhg6wndsgfL5frw2C0WTIpyaWYaUcEvuoBKMrjlCT/b9G8lVK
	1IIrOwEscJG3y/RX+F7o6BTh1K4XZtEz9VQELYHuywo87r1uoFM1CQ1/WZMAjDeaPXxxCX0N5wdTB
	OI9j3ohylX1OyH12Hw5kET9F9sBG4dSmJlX59E5eqEoD+O4z3WJC4Q5bAb0l7krXmUkiNvEaex8td
	HITgaTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtja-0000000GfG1-0ZP5;
	Wed, 18 Dec 2024 13:05:02 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtgM-0000000Genu-31pt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=dbRntCcysjyWQKNhElLiLOYa7JbXJ3OynAD/dcTgifo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RM2Wdl85WA2w8Ld1a9Y2a0V1odPL/fHAuVUo3YWRWNb0anN1phJ/eDGSto30l9+xU
	 HlPIRXFxMLhlO+TCu9u3fzd/0rVST9Vygt/T+X1qW6DMEBT/whcAtk+xV96iHJwMMG
	 Jnh6mqRr5IvXmcXeM4/a2FkqWQGkokcfLUX6cNE6zaEtAtu0mARUJhY+WbyglOzKRo
	 FOUTKJfIn1gp2ursceY6HRU27lsLt0caJQKPyGdyzgUFIMVRL8IhqfJ3YxH+vdGfCj
	 rj29yEzYY+63tdeOg62kenmJFTloD4d/enOIGiLnSrbYigHylI34BDd/FP2TMHbtXR
	 pd08WEbKodcfA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Wed, 18 Dec 2024 09:01:18 -0400
Subject: [PATCH v2 1/2] dt-bindings: sram: sunxi-sram: Add A100 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-a100-syscon-v2-1-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050142_827219_2C0661F9 
X-CRM114-Status: UNSURE (   9.25  )
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

The Allwinner A100 has a system configuration block similar to that of
the A64 and H6. Add a compatible for it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index d9322704f3588e036280d08deaf59972f1dfeb7f..a7236f7db4ec34d44c4e2268f76281ef8ed83189 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -47,7 +47,9 @@ properties:
           - const: allwinner,sun8i-v3s-system-control
           - const: allwinner,sun8i-h3-system-control
       - items:
-          - const: allwinner,sun50i-h6-system-control
+          - enum:
+              - allwinner,sun50i-a100-system-control
+              - allwinner,sun50i-h6-system-control
           - const: allwinner,sun50i-a64-system-control
 
   reg:

-- 
2.47.1


