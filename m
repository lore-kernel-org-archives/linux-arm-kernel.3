Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02076D41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrF4LFmOOeDNHhqyFo6bU0DTscUGWVbCo1mKKqWDM0Q=; b=wyQkCzZl54MMJphbZ3SVIhQvDs
	lCip+HqTE7v53ev0bNwC0hRuVSNOaHTZoHVciFqH1wopwqiDffAuvMXDvw+NwcpwQ/t6x4fh4bhws
	Y5SPs/sMCOSObIiMrRrVUvWcsVLc851XW6eiDPbDsqPW+kLTiB36OL9fHni+8hEevJvFM1mY8fEyY
	+qN8EPENpDrhgcXF1HPOLvWF8E6ZuKeGVC27Ogtdx8pfoXzYKHEltRgDtrrvAR8OGkcD8NyT1BsqM
	DEtzG+bq257Ng527gzMJsg4VftT4MZVuzrFxqgOnWWbHoR5WMvcW4h/GaQWQX5Ppwuz16wfkAl3Uu
	kjzvpySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeWv-00000001iA3-0IRa;
	Tue, 12 Nov 2024 00:13:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeTQ-00000001hZo-1H5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 290EAA40E9C;
	Tue, 12 Nov 2024 00:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986EBC4CECF;
	Tue, 12 Nov 2024 00:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370175;
	bh=O4BlBK5ortkbTpACDTtrxOHXjUi4e/RFV4T0bXUuIpY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MoZjLJJun/eGaE9oEyAkvEzm/5Cj4D0DMOFPE1W/2UdludZBq6GD6QwIvM1qEmD2b
	 LQWejKXq2dZ6HtreltGQlFltxfgh2CsOnTlV4VDG2hUmzoqFEkcrL+jcGHN/9tf9U0
	 xYd/SVG3zPwQZSwvplb93S0VGrCXBcos90dju/kll+xm+0w9hQ+7rocaiVhDRxn0CP
	 O+8yLmIdjAp38MsAGd/woBUBnKG7WimDsSX0/xN8RR8QAfRbCEzfcYIkohMrQJ+Lye
	 /x296qf0gtjXVwPmrSpoNWSV5UTx6EH8y0q9udA7HyWurSg94o3eLOdzu8zy8Q07ZV
	 /NXmvvWWxWLxg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:48 +0100
Subject: [PATCH RESEND v2 1/7] dt-bindings: clock: airoha: Update reg
 mapping for EN7581 SoC.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-1-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
In-Reply-To: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_160936_614086_7D84D8B7 
X-CRM114-Status: UNSURE (   9.65  )
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

clk-en7523 driver for EN7581 SoC is mapping all the scu memory region
while it is configuring the chip-scu one via a syscon. Update the reg
mapping definition for this device. This patch does not introduce any
backward incompatibility since the dts for EN7581 SoC is not upstream
yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml          | 23 ++++++++--------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 84353fd09428f4c9af6a1e39c04b5abdee602a55..fe2c5c1baf4332984369fdf0271a95fce7ee5f85 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -34,8 +34,10 @@ properties:
           - airoha,en7581-scu
 
   reg:
-    minItems: 2
-    maxItems: 4
+    items:
+      - description: scu base address
+      - description: misc scu base address
+    minItems: 1
 
   "#clock-cells":
     description:
@@ -60,9 +62,7 @@ allOf:
     then:
       properties:
         reg:
-          items:
-            - description: scu base address
-            - description: misc scu base address
+          minItems: 2
 
         '#reset-cells': false
 
@@ -73,11 +73,7 @@ allOf:
     then:
       properties:
         reg:
-          items:
-            - description: scu base address
-            - description: misc scu base address
-            - description: reset base address
-            - description: pb scu base address
+          maxItems: 1
 
 additionalProperties: false
 
@@ -96,12 +92,9 @@ examples:
       #address-cells = <2>;
       #size-cells = <2>;
 
-      scuclk: clock-controller@1fa20000 {
+      scuclk: clock-controller@1fb00000 {
         compatible = "airoha,en7581-scu";
-        reg = <0x0 0x1fa20000 0x0 0x400>,
-              <0x0 0x1fb00000 0x0 0x90>,
-              <0x0 0x1fb00830 0x0 0x8>,
-              <0x0 0x1fbe3400 0x0 0xfc>;
+        reg = <0x0 0x1fb00000 0x0 0x970>;
               #clock-cells = <1>;
               #reset-cells = <1>;
       };

-- 
2.47.0


