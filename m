Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E97C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2bomu0aDGtFs04nywYlMbipXyb3n9cPvymFIMABLx4=; b=LpzQr+Hf+9dYS1YP+FOQRvs1Zs
	ZxlVPJfoXfFIaS78Rnb6id8zvdN3KLlV8FjoJa+5OLmKh474BiPOyiAmZuW87tquiy1d4cX5AlQ4q
	9cOjrtVJb/f+CdVBaoWiVDNDKIQEq+n918qPV5+hxBHxkDKeFMGdTNVIsK5O0fjtYlVhSPjGiW8qt
	Nk2uQpsWfnBz0F/z6QAx0rHKUTZndSmiKWCLwJ4mtb6zrk0zOjow8dqUx2ZuoIhyMGaI0Cnss6vy3
	4OnftFHXMdLTDNWfcBY+8kCOk27GCiEZ3fAbTaIqO4hLzgYg6viesq5lttiZpH1y7OZnma+TnZn2F
	12eXtmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTqr-0000000GYaF-08nO;
	Sat, 15 Mar 2025 15:55:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgu-0000000GX26-33hg;
	Sat, 15 Mar 2025 15:44:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so3652955e9.1;
        Sat, 15 Mar 2025 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053487; x=1742658287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2bomu0aDGtFs04nywYlMbipXyb3n9cPvymFIMABLx4=;
        b=atF5mY/DQr3jql3f6tW/2tWp/APE081iZr+p+/kma1wO8MNlc8LY3WRHqon6Fhil8F
         qe4b3OQUUd+/y1Qu1HY92To9mq05RG1tnvV7MPA+jkDcNKOpSeNF4kn3RsssXvcRGUxc
         PBuA04j5Ff9UKhAI1dNmdRlwPx11SyMLlzOmy7EkLR8/Gt6FEywUcGQxVOy5oti3ePTC
         rDKwFlJmWmovMH6Iw09XNpVOUgIb1aEtIQu8d9iSgCvtNCS0/rF0uhow/SYeScFzNvS9
         DujoEPkoKcCoOIgjw0PFWBaY6Pxidxy7Ost1FKUcV+xEm3nnOmQn7Lg/F7pJijQxM/Lb
         2YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053487; x=1742658287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2bomu0aDGtFs04nywYlMbipXyb3n9cPvymFIMABLx4=;
        b=i7T6cj48nHbdfr11mbC2t0W2WO6hYm8pROrVJxk1qZHmfiQNkdRqX4Nad3Ss6/JOLP
         vYuWlU//Ydf/308kVuNK/7M5gOLBKy2R4rO8Zl0j3lSheEaI7TCSHdijSOaguOU80MAt
         4Sc02H5rv0degcs9ssMlyzirNJAjeIOaFeVG0FtqrwApTZWnU+JdXX8ZRGtxe3m8jq5U
         sZR0GQhBUNeS/gxcbM7qvc9kZQ10w7fJgUotlc1WhJf4yTLXqS+qwIZAgPOCzcD5Fnia
         zdXxYumaQqUFeIhsMd1cwUa0fnfClIbnoBDYbR2tqVUcwH2zgRSeOf0F3RAaaew6tuDT
         Pcjw==
X-Forwarded-Encrypted: i=1; AJvYcCX75S2HCzB4YUNiwvWEVeVINUgKGJHLBcWXJTS7Ek/dr6gz1Xkti5VaOatYOe5h+m0LerymuBJWhj2KhRqdJJA=@lists.infradead.org, AJvYcCXrYQkDvZeu/5mRmgAs5HnpxlGg5boQYsyj8HqmT0MnYkKkwJ4XAWh0VrstczOEcY14ZaqV2jzOqYxkPAUX8Cmq@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+aaGe26tTW+dv6D3AulZg/5VQkRkwhdAxA/Earhw7WXnOTAH9
	cxumYg7+43824Dp4XK3V1FJrtY+G4bOMpGL2T4iyv4+aUgwJAtlQ
X-Gm-Gg: ASbGncvaTce6UR9k47F9JYTGTG/pbcbFydmBYHft+6TuzAycOfVfdaCfi389ZFsqhg/
	KnivGTV7D7FVAZkN7w4hV9vvxqCs98BIQQVsK7dMBRjxS9roYmKJrQbvuceqoXsk4RwsIfuX4UT
	AF++vJHpj0zR/jt/hXMXZFtDounVwC9/U+4/3uVZ3lYWXEyjH3SZxDZROtKI6RGj06qk2ET4Pjl
	WZOol3vNDF95PFQ+vmyyQUzI5m+ew+kKIVYhg8vLJ/VO5tL7EcAuR4tocU1/x+egi35Fg6AvI6G
	ATG90kGV2iPq7ws0CgIv7fS1hBmQaJ25gCIvbNNBweZx7Qr9fHEQXEKblETcFCdU+9LRslbmtkk
	ij0HAC8kcA5nyfg==
X-Google-Smtp-Source: AGHT+IEhCyUiyhg64g12SU6KmHgYBMBD6ll/U35SvERkYFCfc0O2UiPMXs8V+ySvepc/0dICSdJ4SQ==
X-Received: by 2002:a05:600c:1c9d:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-43d1f120201mr78301655e9.0.1742053486688;
        Sat, 15 Mar 2025 08:44:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v13 05/14] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sat, 15 Mar 2025 16:43:45 +0100
Message-ID: <20250315154407.26304-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084448_766961_2141FDD6 
X-CRM114-Status: GOOD (  17.01  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 182 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..a59a23056b3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios: true
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description:
+      EFUSE exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description:
+      Switch exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+
+  mdio:
+    type: object
+    $ref: /schemas/net/airoha,an8855-mdio.yaml
+    description:
+      MDIO exposed by the Airoha AN8855 Switch. This child node definition
+      should follow the bindings specified in
+      Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 0>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                compatible = "airoha,an8855-mdio";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c45";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c45";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 45f4bb8deb0d..65709e47adc7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -725,6 +725,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
-- 
2.48.1


