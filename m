Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F735C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxVraOdaNDoa+gL84QMf+jc4LDKQyFyDdKOVrhJTQNU=; b=DhbYOqmb6g4fg2
	CH4RLNLdh0fFZAMKY23MNZ89FQsAFNwMI2XzMZtr4wgDn6c3ZL2tYzs2KLsRIFI5CZshMj/IYbRct
	+rJ/OejnBiAoGJWVe/QuQvl0h+iLc+VkdreL7yXGEB8WqHSXvqZGyAW9uchLIDDNzYH0RRXy4hygN
	nzbDDp8tGFjNfVRicOSWjCwvzgfkrP03eCEYTtSTcrYKE2unqZ9UxiCtQMiCNJRHY0c5JIpe2Mh/R
	FG+UD71v37cWw9SayGBsURL9ChaT76as1ZfKYGDJOSGuZ8zsAFzY7Gz/+mjouJyAe2DqAQ1HIqImv
	FFCnzhqQLH94BmaCDZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thX8L-00000000cjC-3mTt;
	Mon, 10 Feb 2025 16:59:45 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWuq-00000000ZUL-39ph
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:45:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD53C1480320;
	Mon, 10 Feb 2025 17:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JxVraOdaNDoa+gL84QMf+jc4LDKQyFyDdKOVrhJTQNU=;
	b=mt+s6AcAI14JX3eZwDjERM8NyrjFx+5WuXH238XMXaxWVLeZ7DgMKY7ipf84kiRGqCHUJi
	FERQ3cjmDy1cnVGCXBATXKBXaj/gaqnP3i5QsqYOAaRVbrOh+8Sn6ZmApR6hz9xwmuNdAb
	8Zbd8cfM2P3eZV3jOW3+snM/g1cyh5HCe6WSd/+3QtONJnaIErcHgbVCuf5jWBscMhyScU
	wIiMN1/BRmIbINqqmb/sDMHFlOunGmcw7M5d5cuNxRTin1TdNzTQywB4PX/ols3QFOki04
	/axBkI/mbF5FKp/5mGgLUQwnbACzIyP/2QVIUO/YHUiGtGDGdq1CuYfDPbV31A==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH v2 08/16] dt-bindings: nvmem: microchip-otpc: Add required clocks
Date: Mon, 10 Feb 2025 17:44:58 +0100
Message-Id: <20250210164506.495747-9-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_084548_952540_C5BAC777 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The OTPC requires both the peripheral clock through PMC and the main RC
oscillator.  Seemed to work without explicitly enabling those clocks on
sama7g5 before, but did not on sam9x60.

Older datasheets were not clear and explicit about this, but recent are,
e.g. SAMA7G5 series datasheet (DS60001765B),
section 30.4.1 Power Management:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 .../nvmem/microchip,sama7g5-otpc.yaml         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index 9a7aaf64eef32..1fa40610888f3 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -29,6 +29,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: main rc oscillator
+      - description: otpc peripheral clock
+
+  clock-names:
+    items:
+      - const: main_rc_osc
+      - const: otpc_clk
+
 required:
   - compatible
   - reg
@@ -37,6 +47,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sama7g5-pmc.h>
     #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
 
     otpc: efuse@e8c00000 {
@@ -44,10 +56,26 @@ examples:
         reg = <0xe8c00000 0xec>;
         #address-cells = <1>;
         #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
+        clock-names = "main_rc_osc", "otpc_clk";
 
         temperature_calib: calib@1 {
             reg = <OTP_PKT(1) 76>;
         };
     };
 
+  - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
+    #include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>
+
+    efuse@eff00000 {
+        compatible = "microchip,sam9x60-otpc", "syscon";
+        reg = <0xeff00000 0xec>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
+        clock-names = "main_rc_osc", "otpc_clk";
+    };
+
 ...
-- 
2.39.5


