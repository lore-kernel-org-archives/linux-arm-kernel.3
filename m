Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D906BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9NDCwlC9t4pV6apOxhp/Woh5xsA/boRS4RgotHWwmw=; b=14+a7RpXQrfqprtREf8oFnnZS1
	HRhqN3vIstxODDwf58Ikt2Zu2xGZCbqTkpA207qUfmg/ajn7AOViB9OzbfqObtMYBaUM+1c9h9/uy
	bQbc87gdwIePo7MmCgbcptLFD6Csc2HBLhIOrmOHfrCQSOM6zNNzsZhxsGDfNCtLqLnU4mQ3h+AQ8
	UEYIqAMjZcO7ZXN82brOkCoasi+ZnSrVjiWUK5hvkGSqydhDTZZvFyALFyg3tAZh5g1jqtiL34hX5
	OSdK5ICsbFbI3U4Qeq9S89uo+AVYZTSBkyzot5cuVRbDIcltsJUenPuaqkaYZO1CTp/VIa5QIEe1C
	casBH6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFr6-0000000CDZK-3Kgt;
	Thu, 20 Mar 2025 13:22:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWf-0000000CAb6-3zUo;
	Thu, 20 Mar 2025 13:01:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso7903095e9.3;
        Thu, 20 Mar 2025 06:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475692; x=1743080492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9NDCwlC9t4pV6apOxhp/Woh5xsA/boRS4RgotHWwmw=;
        b=ALP7cn2Uga2qYBE+IZabvMWqs/iYkW/60KOTwWyG3R8UpabZsS7tdHxFJsMuKFI5Zz
         39qejDRYFwcZfl/+PwgDQF8+H7X8a/kjvWLXwBHnO0vswhY+gIBOCmUT8kiZE4QVHoTc
         BDOt161rLi4TaLr7NZdOGcKlJzdCPjFasqW9nPkO/I4boRQ/eeCcJ5pKj+VjM0hRFXFu
         qb+iE++uIXYZsuxkL+4TtvEGWnJG6xQfXgfRw9/U7EDnXanuLqgPSb9FMhsfR2Ip2ThA
         hrDXDFVXS0KjhrEf4GH7sRqBP/epmS2BlHf4MGC/71fAF68ur5FBvysyfvZUMCr65fW7
         rUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475692; x=1743080492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9NDCwlC9t4pV6apOxhp/Woh5xsA/boRS4RgotHWwmw=;
        b=hbgOd+4hqU7tdb8EOn/A8rDxykrlK7vSTluvNG7U2A/piSWCNxDI8/gZD1Do+K5LxN
         i1AXUm3Sex8w7A5b/S6UAmIw/kUSvE5FmgjeNIlt7jmaGCgHgRjDhYocyp4ZbfZ0WqyM
         f2bkviMVR2IZCHQo+MsJNwNDBw7i+liflNclpxQxHPUc8GVu5BNw0Tk/mH+2Z63OQI4u
         MXdQ7JYRQGsvjfFt09rzRPeckJDuPWTacdlMsXZVow8cB+YCxPk1TmqyKpxbWSL29++0
         aIdSBDFLcsAWHi2BAY7s6o5RBzbzOHoUy2Baw/S/xngE8zL0JlOghneKickyveYHKote
         /50A==
X-Forwarded-Encrypted: i=1; AJvYcCUICXZoKlr/Kl0WIR7ag0r9GRXFAqjTlmRXJU+YtIlCJVYFaBsM0Z+J1xEZYc23kzB9ra3dFv+E384XO/oTzuNa@lists.infradead.org, AJvYcCV8txN6fL8a6lM3970caGRJLz2Wyj/qJeYBHTtJh5eH4ZWvxxpIKRBG698qCEwHcyrUhZhIzdSJEFA4@lists.infradead.org, AJvYcCXMgaeO8UXPcpoXD4z3SJtFSCG4lML4Rb0CEC3eLGmpnP1YScnjAQM5BiQ8nLizvV1yiaI5pz5V+uzvgewjuOs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxakJ+B9RHJVoPh6/ijohMjtCfisilL9VHexheIi5JRibr/44Q
	om56RYAmnRC/8Eo70S81STPSgpruW12SVl0AfnUayrVuvjwY1ZAX
X-Gm-Gg: ASbGnctQlKnLQsLp6TjXFZ/kI3hd+52Sq8XDbFcsqxKy6yGoKLcGnJdttJHfK155oFj
	DFxQZcXp474cZxHIh8wPmdSomBBV7rk8RQ2sgKhVtjME8JJL0RYwoT9ou51QncWNuqZTqEnZkvN
	OnpgThFTUTV+Yq0IIW6EVvj3BkSIdPVG30TejP8ASA41q4sz9HqUMJXhxRxV8hvBBxG97nKmnxB
	rfirVOA+NwQuebnWg+Gv3zePDzn9TwqBJqAF77XxjhBWbvTCT6u6K/Wy4te0EDqmwy1kbVDivce
	XhfIaFYp+dYNirWUPE3qVMZ8jkMHNpXMEY9iCkyWI7yrMzZqqtHzb3NJcvCslx5NsPLGkOUTlv8
	GFlP+oa4s5UTr6g==
X-Google-Smtp-Source: AGHT+IHeiWUjZYzxtkXpntYYlsW6atQC3N/FUEVhxccbCxLV+C3rtXXpoHMzxMjkwdKTi2hGl7WWew==
X-Received: by 2002:a05:6000:21c4:b0:399:795e:d899 with SMTP id ffacd0b85a97d-399795ed8b6mr2509291f8f.14.1742475691925;
        Thu, 20 Mar 2025 06:01:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:31 -0700 (PDT)
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
Subject: [PATCH v2 03/11] dt-bindings: clock: en7523: add Documentation for Airoha AN7581 SCU SSR
Date: Thu, 20 Mar 2025 14:00:26 +0100
Message-ID: <20250320130054.4804-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060133_993566_0BC55492 
X-CRM114-Status: GOOD (  21.94  )
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

The Airoha AN7581 SoC have in the SCU register space particular
address that control how some peripheral are configured.

These are toggeled in the System Status Register and are used to
toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).

Modes are mutually exclusive and selecting one mode cause the
other feature to not work (example a mode in USB 3.0 cause PCIe
port 2 to not work) This depends also on what is physically
connected to the Hardware and needs to correctly reflect the
System Status Register bits.

Special care is needed for PCIe port 0 in 2 line mode that
requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
mode.

Expose these configuration as an enum of strings in the SCU node and
also add dt-bindings header to reference each serdes port in DT.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 101 ++++++++++++++++--
 MAINTAINERS                                   |   7 ++
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 ++
 3 files changed, 110 insertions(+), 9 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index fe2c5c1baf43..637ce0e06619 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -9,6 +9,7 @@ title: EN7523 Clock
 maintainers:
   - Felix Fietkau <nbd@nbd.name>
   - John Crispin <nbd@nbd.name>
+  - Christian Marangi <ansuelsmth@gmail.com>
 
 description: |
   This node defines the System Control Unit of the EN7523 SoC,
@@ -26,6 +27,23 @@ description: |
 
   The clocks are provided inside a system controller node.
 
+  The System Control Unit may also set different mode for the Serdes ports
+  present on the SoC.
+
+  These are toggeled in the System Status Register and are used to
+  toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
+  or setup port for PCIe mode or Ethernet mode (HSGMII/USXGMII).
+
+  Modes are mutually exclusive and selecting one mode cause the
+  other feature to not work (example a mode in USB 3.0 cause PCIe
+  port 2 to not work) This depends also on what is physically
+  connected to the Hardware and needs to correctly reflect the
+  System Status Register bits.
+
+  Special care is needed for PCIe port 0 in 2 line mode that
+  requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
+  mode.
+
 properties:
   compatible:
     items:
@@ -49,6 +67,40 @@ properties:
     description: ID of the controller reset line
     const: 1
 
+  airoha,serdes-wifi1:
+    description: Configure the WiFi1 Serdes port
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - pcie0_x2
+      - pcie0_x1
+      - ethernet
+    default: pcie0_x1
+
+  airoha,serdes-wifi2:
+    description: Configure the WiFi2 Serdes port
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - pcie0_x2
+      - pcie1_x1
+      - ethernet
+    default: pcie1_x1
+
+  airoha,serdes-usb1:
+    description: Configure the USB1 Serdes port
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - usb3
+      - ethernet
+    default: usb3
+
+  airoha,serdes-usb2:
+    description: Configure the USB2 Serdes port
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - usb3
+      - pcie2_x1
+    default: usb3
+
 required:
   - compatible
   - reg
@@ -64,6 +116,12 @@ allOf:
         reg:
           minItems: 2
 
+        airoha,serdes-wifi1: false
+        airoha,serdes-wifi2: false
+
+        airoha,serdes-usb1: false
+        airoha,serdes-usb2: false
+
         '#reset-cells': false
 
   - if:
@@ -75,6 +133,24 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        airoha,serdes-wifi1:
+          const: pcie0_x2
+    then:
+      properties:
+        airoha,serdes-wifi2:
+          const: pcie0_x2
+
+  - if:
+      properties:
+        airoha,serdes-wifi2:
+          const: pcie0_x2
+    then:
+      properties:
+        airoha,serdes-wifi1:
+          const: pcie0_x2
+
 additionalProperties: false
 
 examples:
@@ -87,15 +163,22 @@ examples:
       #clock-cells = <1>;
     };
 
+  # Example SCU node with Serdes set to PCIe0 to x2 mode
+  # and USB2 set to PCIe2 to x1 mode
   - |
     soc {
-      #address-cells = <2>;
-      #size-cells = <2>;
-
-      scuclk: clock-controller@1fb00000 {
-        compatible = "airoha,en7581-scu";
-        reg = <0x0 0x1fb00000 0x0 0x970>;
-              #clock-cells = <1>;
-              #reset-cells = <1>;
-      };
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        scuclk: clock-controller@1fb00000 {
+            compatible = "airoha,en7581-scu";
+            reg = <0x0 0x1fb00000 0x0 0x970>;
+
+            airoha,serdes-wifi1 = "pcie0_x2";
+            airoha,serdes-wifi2 = "pcie0_x2";
+            airoha,serdes-usb2 = "pcie2_x1";
+
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3eee238c2ea2..9944845ae9f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -736,6 +736,13 @@ F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
 F:	drivers/phy/phy-airoha-pcie-regs.h
 F:	drivers/phy/phy-airoha-pcie.c
 
+AIROHA SCU SSR DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
+F:	include/dt-bindings/soc/airoha,scu-ssr.h
+
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 M:	Ray Liu <ray.liu@airoha.com>
diff --git a/include/dt-bindings/soc/airoha,scu-ssr.h b/include/dt-bindings/soc/airoha,scu-ssr.h
new file mode 100644
index 000000000000..915f3cde7c1a
--- /dev/null
+++ b/include/dt-bindings/soc/airoha,scu-ssr.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef __DT_BINDINGS_AIROHA_SCU_SSR_H
+#define __DT_BINDINGS_AIROHA_SCU_SSR_H
+
+#define AIROHA_SCU_SERDES_WIFI1		0
+#define AIROHA_SCU_SERDES_WIFI2		1
+#define AIROHA_SCU_SERDES_USB1		2
+#define AIROHA_SCU_SERDES_USB2		3
+
+#endif /* __DT_BINDINGS_AIROHA_SCU_SSR_H */
-- 
2.48.1


