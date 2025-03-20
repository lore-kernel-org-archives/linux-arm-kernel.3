Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963B5C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc3dKjde0rLVyDC0QPLc/14aVKYKizi/3+LepGRxWFU=; b=djjwewdDaYULJcX7VX/GjR46SC
	DBvJxBi//nvcBL1R4bBfYi7cy1WjwqqUi1g/31Cn/WpKDFvDF0DUsUE3ehzzGsEp4bM8dWZbvjA0Z
	m0iZ8NPckeShyBWq04rmc6bVcqJj33TcDnkx51p9nbt2oi2qzXGEckMZ1hfQBwDTgNyLp+9ThAmWn
	3dBeuUsmTxKQvc/x1KQLF0WFQ0OF+tLsnQSqudujdeE84xnXv66R0ilgMfgaCO+eYBalBLFVlihPp
	o3LIBV1Dl0IfgZlRvb4AkPPe+N33/xVWa8lLIFOuE3qbQj6mxlN5puJvSQLZ8IhBA/kiabK5JCafy
	BYxfA85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFil-0000000CCQD-2M6f;
	Thu, 20 Mar 2025 13:14:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWr-0000000CAfJ-20dZ;
	Thu, 20 Mar 2025 13:01:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso4556795e9.3;
        Thu, 20 Mar 2025 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475704; x=1743080504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vc3dKjde0rLVyDC0QPLc/14aVKYKizi/3+LepGRxWFU=;
        b=Csi2zum1XPkTORecvpN2iWPExWO3KCJQAB/jYG2lBf1hx8lXg4trDDQJMynDIZVlGp
         +bu8vw6YYuUhfswBdYLFImN1H+TM8N6lQ22uU3vI6MoJZS1jejXQe6PRj+1b2p437qWu
         Rocu2a5yi6cfADIqKQ6iPnR1xhz0aa4G+0F7kCmS7txbWqZHkY/j8AGOexs1SbkkYJ+M
         LyaThJfeMGiQ42EbpglM0Hvo2m6M3TXR6NLuoeF6VNPSwH9XguDJGIxy/7Y+5t3NFUSz
         HVuP19krtD6ykeIKnCzmXA2Um05gMrRJKhamGBam995Sa0bKZVW2GqdAyqMREaWXSoWb
         /vCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475704; x=1743080504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc3dKjde0rLVyDC0QPLc/14aVKYKizi/3+LepGRxWFU=;
        b=V5+kginZTSkMuwMcIlQ0j5qIaKA1W+v3gwOh/Gvz6WPIpvwISFMzM2oVH8gcNGlZL/
         NVB0zyAgtTSQtUqrQXVkvj7WWee4dxXMlBqzaL/ZXiysirPFWNf0v3Mi8GS2NYQnR5Wp
         3S2dbrImMMnBUx1EAkzhnkCJFyeW4afMYV9g81sSxfXwlQc+ilrlVITh+PHlE+cUfTqq
         CYUHiH0jkmH/tLsXOCpXqY1GpednIvOg9yKtp8Mf7AW9RtnEEGjOedowBmi22vTy2LVd
         Zdieo6/ytnVgcTQ7/GU7YJRaIlamjV/wmD10yDxd4E6TgBndyJrcK0R74RSPKFqSBazE
         7NNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2UHNAQZSoZGc3YxfSjAhH0CtchsK31wLVPDnzr3Z/8EwmLSjUCpMgKxgbzj9uuo36ti7iUcq6jafX5LSQ3tA/@lists.infradead.org, AJvYcCW6cTp+NSMJh+4wvn17AS7kjo9FqhbYIHHnDBWhcSmR+Bc9buGx2dYXq1ejr7co2JkFOxsBaumdz/216ShJuHw=@lists.infradead.org, AJvYcCW9a2hMmkEE2w43CrrgUsecJHgyJFF+mSpfRYF6gW3zjyeYMLPgEc7zYrrf6EwHE4ob5Ih8R5MuGqxC@lists.infradead.org
X-Gm-Message-State: AOJu0YymjcIMFNRylgYPRicKHeDkb8C+Xj+BzmnYpDlsfQrzXrWcSaUo
	rudn/fRTn9OIFGHlR2eSDDUWWPG0Z/ziVMB3/vUU3XCkuLO2+3o7
X-Gm-Gg: ASbGncsUmN4XXbCxf1cwReuR4hmSKA/otiUCcoLV1nwsaXlUhbdb/xjzHOkraFwtzXy
	HS91QLu2x5tiOMinrJi29DRf4YrJ3ERQ7Bq+r3eipB6pD4pwf8QCVTUdLb/yTnOGjHH8tzC13AX
	QOBz7h6PBxpeylAEPPTxdji3hZ2YUKiuxUl2VyEIoCqK20rGufoQ+6y7X48Vu/seQSo9KEra8C2
	A2H14SL03kKPwcxSS3K5+nfcScwTfz9nmDHczHhI48+0hFzOnefwgCr3SBNa41z630DvRlcEOUa
	j1p5AigGaegNZ7mSvlsyU9+28+c9HzLN3XiwCVAfnSvuZreLalTirni9Ar5y6XQPcbTbnou8HFt
	sTelyx6JqWbedug==
X-Google-Smtp-Source: AGHT+IF/l6XMrjHci+BW3RGcUAaz5jM7jX2EkvkrL4ZuF2YFu9cX6Xupx/UFNRAGRB5FWZYiIkaFbw==
X-Received: by 2002:a5d:6d07:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39973b32cf5mr5739209f8f.42.1742475701698;
        Thu, 20 Mar 2025 06:01:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 07/11] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Thu, 20 Mar 2025 14:00:30 +0100
Message-ID: <20250320130054.4804-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060145_521585_04D2A319 
X-CRM114-Status: GOOD (  19.80  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the USB port.

If the airoha,serdes-port property is not declared, it's assumed USB 3.0
mode is not supported, as the Serdes mode can't be validated.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 83 +++++++++++++++++++
 MAINTAINERS                                   |  7 ++
 .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
 3 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..39ceaded5d0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,83 @@
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
+  mode currently configured on the system for the USB port.
+
+  If the airoha,serdes-port property is not declared, it's assumed USB 3.0
+  mode is not supported, as the Serdes mode can't be validated.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  airoha,serdes-port:
+    description: Describe what Serdes Port is attached to the USB 3.0 port.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  airoha,scu:
+    description: Phandle to the SCU node for USB 3.0 Serdes mode validation.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  '#phy-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - '#phy-cells'
+
+dependentRequired:
+  airoha,serdes-port: [ 'airoha,scu' ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL1>;
+        airoha,scu = <&scu>;
+        airoha,serdes-port = <AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
+    phy@1fae0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fae0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL2>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 7cd54c70aeed..c4a374da2b12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -754,6 +754,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
new file mode 100644
index 000000000000..efbb0ae75e3a
--- /dev/null
+++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
+#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
+
+#define AIROHA_USB2_MONCLK_SEL0                 0
+#define AIROHA_USB2_MONCLK_SEL1                 1
+#define AIROHA_USB2_MONCLK_SEL2                 2
+#define AIROHA_USB2_MONCLK_SEL3                 3
+
+#endif
-- 
2.48.1


