Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE8606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zmUlolLu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcDOekh4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=; b=zmUlolLuym/Q0+
	oIouQg2jsPfruvN3q4KWMSIgykx4Ub1+fWUH4HROyzrwXXH3SQ/sUn5CfQ5GgeXBungIMe5ufZ81p
	V9N3IdCGlviiJLbHa8/zCoAkPJiFIyCOoW8aG8EhCqJhMkUgG8X018PD/rR4XzkydDRlo7QPUfp98
	OENpIPUCSX0FwU3/cwKxTUIo4Z5tMAGjBjcFOlD3WGBv2Aq2wpep2KYFyie3XUR608ODsR2T/SZ2m
	F1OLtRmpXZM4wgp2fkOkL5dwEysiM/nWYyofHgRYCocNdLo0ll88IVNiLxJEH9RqKNF8tY41cVk53
	Iv9m/7DpIngCjHB/dFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKQl-00000003YCl-3PLI;
	Tue, 03 Nov 2026 19:44:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKQh-00000003Y8b-1Xq8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:44:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so34795665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735061; x=1794339861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=YcDOekh4vqMFEdqg07eC0n8UtvfWkNPDyEB3InD1IFHAxMUDqR+PmeJdnfXP2Z1Wa+
         ZHRQrJsEC+FsD032P1M2pdpCYS+i3oM/DQTOGBYrAzO58ZG34li6hu6IaBr5D2OtGPPt
         9ycpWTBUfrfocyDoLKoQwx0lMj2igQMsS484m76RBP5s45TI3Zf1sF+OXw+kgOAEp6vo
         V4BanAYEuEQHSBXyB6KCFDyB+Egc1lYCRxCBzY8SqfaFASZQP6z8WfJ6izXIiXMKRZQh
         IbwrZgkmTU6sS4pfc4wAQ9gZdYigfLDiLw0Ialfzwtm5sG1x4BV4XMYVCjrA29HRYSg2
         KKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735061; x=1794339861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jpkCkqc5hTdS5axI8qi6Lbo/rJIC7+WdDh/yv3kaPI=;
        b=mqqaFYabR/+prEDZkiFWsvhZ5eUaecAu+e7uCtIrSWyr9pnA35QpkntyIwocG+mwFm
         AMdKzC0J9PILPjy9KuSRswUiubfobhpHwt2sIwUEgg5muXnbOeDSxdmU1HPCqC9ELMN+
         wrzJ6wxDhX+QnwTy/EbDjXhIrflIkTYtebhV3XBKxeKnrU2a5G3Hq4ID0kzfNmnEG9EC
         Ma6r5vDVLiLndzHQ71W0YrXrFPGCps1s7q8TTCDbC9ubJE75F0ELFR28QCEmzrj7tAf2
         NSV8YTV3exYZc1Q+OSydJ6c9hyCjeHcCMpNmWwdeQvrF0MgZt6AogJcacW1/Vqesgv49
         4/zw==
X-Forwarded-Encrypted: i=1; AKwUvByf1H/YqYabLbAG0x/V0iUuYqSmzNu4lM31bbzTjAuBNOmPfH0YIDsx6z0Iae08aEflmwCXefDPr/xznNp7Bh0r@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZrrT3bvTLqxpWEhLLMm6qboOJ/mynqo4YsTZMhm/yH9kVPwmS
	EKiegcRcdxYo9lZlc6o7aRcUyV5RylKGTZIdvrv1TCu6cY+LnOJ02lYB
X-Gm-Gg: AYBFou36VGDWLgpUMiNfakzIEEu6U6VkxWRej6Jmie6g2keGHUnTBVbFO/6ozFq5T+D
	TO1Ypo1DCQoXOEka0oPRtQ6MbNOsSt6f9UkHCUQQkdTE3N2MghLS2uxDK0RZFloHteAqf8tfcGU
	UhCffFhEuiw3abHqqSeElMYnfTw0iGiXmoisCAvum9BvekAx2sF2pjX98C3w6LO/5zxSQHapJrg
	LoIp8lggEu8pgcwqmSaboRjyaP2jT5ySLLNM1tPaG2HaoCdfac6QH2Eh5paDGL6bIuxqLIXpHiG
	aaoD9ZLTcGDwgZ58FkO+89OlKoDbExmgDsfHXbqspT5VpZ0xsrQTGsWW8IFRKqHxftx2gRneEJ+
	ITTmBjYT24rVsLM+5ne/1DWvDVlRI6ZTlJr2V4bIhPpNoU0/oDBgUyGRs3TLsRm/XqrImYs1Yv2
	cbndkkZDO31THTRaeGLe8KOSUuJw7mMRSJQxhuFl5XzeGSKR3uZV9/KAqZ2HuUZ/H+HwUIWU43N
	twoJAyuoKrE9TMGC/HIy9WrpwuFpV2P3UxVMiiyqWMS1G1ERONSvZ5bfcZ/AiCWVQdZrBw6WsSe
	7M19pSe/sVvRk/1zuta5AOB61VHlcGOmWGl6VIiEQ9R4cPbgx6doFonqF01ACjcJ1APTIA5oCfP
	3rm5GrsWFKqtWAkYoHdHfkKU7IQpsAY8r+w==
X-Received: by 2002:a05:600c:a4c:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ac17d16ba4mr320226935e9.9.1793735061345;
        Tue, 03 Nov 2026 11:44:21 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:20 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v15 1/3] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Tue,  3 Nov 2026 20:44:06 +0100
Message-ID: <20261103194410.6632-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_114423_436366_33B78CB9 
X-CRM114-Status: GOOD (  19.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
property is required with the phandle pointing to the correct Serdes port
provided by the SCU node. Providing the phys property is optional if USB
3.0 is not used.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..61a8d773f207
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  phys:
+    items:
+      - description: phandle to Serdes PHY. Optional if USB 3.0 is not used.
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        phys = <&scu AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..a9c78e635764 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -805,6 +805,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.55.0


