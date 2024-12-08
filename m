Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB70AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 00:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KidHH5eUrRS26Qq2Z1EbeJ29f1SSzWyXfw9ndMX9gzw=; b=GPuylAGiSUcuihb08SAJXz8w1k
	z6VKsdyESvrTtdyrNfafbaGi8ZH86+dGDYmOVvofidZ6ajGfzBlLczxsysz0aTYOdAlTGgkuUWJYk
	G1PJwjGdn7VvCqTlWHtrUXjsTjW9J4t1WgD6j+ZTWRH+CY+xj8qXj52lGvCewdVKZ3QwH+R/3OLDm
	uZ0fY66jHECxk/ts+10cwtf88i4zFUkYzvTsUVvfyz7yBKD/d89s6q89LVuTi9Ya81Vkrdo2YJgks
	yKWDPBTIFJxjIIXJgdGnHMhXyedcpLwHKjUWzJ9u1/X2i0jdPaNj5A/4LzCG/vcMsdVF6DHWQZS8V
	n+5sUCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK59T-00000004cIc-3Iro;
	Sun, 08 Dec 2024 00:27:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK53b-00000004bBA-3La5;
	Sun, 08 Dec 2024 00:21:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-434a1833367so18892165e9.1;
        Sat, 07 Dec 2024 16:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733617311; x=1734222111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KidHH5eUrRS26Qq2Z1EbeJ29f1SSzWyXfw9ndMX9gzw=;
        b=WWNBJJgtm3TjK/ZvY1DZRmV9dknDq48eWNV5bkfJ/QYFF8LIQ5XsmvN60AGed4WbNE
         i+glCrfsnvDCBgHjRRlEZZBOfiLjz2KVs468PNI2C+nmkrwpB0Wz4Cl3YgYKwncxm6/S
         UafP+zVgcTkMuzDClhNqzn0poJqYDwjqGIVfVN6RxL1QwpZMKhDJa1laOksUDhOd9blW
         H3TxombvxV6sWaqZ9OagAEfa1bKaUVBYwtyOgbSAoOnQQiKd+WPPdd2jqHYQQrfcAe6a
         lxupfZd9kFDoI7J3M1ICJU1ghLad9cHMtoljZkfMpNoGc9P1tHYVctS/YlE/jDzGnnFb
         4uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733617311; x=1734222111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KidHH5eUrRS26Qq2Z1EbeJ29f1SSzWyXfw9ndMX9gzw=;
        b=MMV2p0d1ObpiQ3LWhgAUrObJuc0nMk0kPDF4D/yR7R0QPBbimgx3JwrVFFUahM6S84
         dxdourw6aKHAQFvbtzQUVy5xJgoJvmPqFlbBnmnGXQZfDIu3XLClr6jEzbT7/U6hvoTk
         1wOYz2wUHazfjXOjX9N2li5bzuPRAHe00KmeLGU9gPJJ/9TfHCxRZAhJ3CUp30JMyzdD
         mpHic+5GeZZyN+SRRA6oFLf4lKJ/7iwDxy303SSWQdrrin3B0mU05J9GtSHE0Wp0L+Uc
         5tUfVoRglmCjjYFv70plKveNAcUpdY2NFFz1ka2G3SwukrbAOzrpiBPoUjymPMhADmTW
         SV+g==
X-Forwarded-Encrypted: i=1; AJvYcCVUF0Gx8p2Q5ydwn1MVl8SruLyybQy8wUi7iCwGvYofLxZUUPeaThBtJPiZ1lrO34m+J+6c4NfwYLsJ+nwpHqKj@lists.infradead.org, AJvYcCW5kW63jeVoNkHPcY8EUa+xGy2GnxQzu++aLE20d7jOkOsZknFyUDGSYAEXZZ0C5pyTMAV5TpdfRz5bc7pXRuA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw01ZqYtQqKMTsc4lK1fkHdzG9frW1YUi0XHBFylSrbugm6YtBi
	kmo7SA5XK6I8QlcDdTagkRIBCSbLIF1WKwiGKpkigc5aQ+szxeHR
X-Gm-Gg: ASbGnctluGtWa3LFBwQZVleMMdvB3R3A1P3eVhIGc7nN+/LUxbZmbyyX+QA2yeEBqGW
	lYjx56RDVThlGju61wpkRsMH/CafIhFG2Q0pYl3dlQLpVxb4XehUKfcgzAyGppkWwJtv0QMdcOA
	XWY3k1dSDht2YKv3oDxb3cI1ndgsfyl8HjtWsgmlEdi9oew8uOWDZ0tt01i3M5KQMSuT9WY8it7
	TGTNANLPqI63VSYF5WyhImd6aVw/QeoSqKmson6onrOB4ltHmBAoFgaLjKomeIxvqKnz7IpC152
	UjVoNbPQnti6idNhWX4=
X-Google-Smtp-Source: AGHT+IF4OGyTTXkJj4ZIw4zicje56qIvFhU/yR3H8OHLmXzA5lA1dfBzdZjEahmdHmrKDRCZhlDGGQ==
X-Received: by 2002:a05:600c:6046:b0:431:9340:77e0 with SMTP id 5b1f17b1804b1-434ddeba4ebmr57301565e9.9.1733617310820;
        Sat, 07 Dec 2024 16:21:50 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38621909644sm8719170f8f.76.2024.12.07.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 16:21:50 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v10 4/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sun,  8 Dec 2024 01:20:39 +0100
Message-ID: <20241208002105.18074-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241208002105.18074-1-ansuelsmth@gmail.com>
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_162155_861784_728FF33C 
X-CRM114-Status: GOOD (  16.05  )
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
 .../bindings/mfd/airoha,an8855-mfd.yaml       | 185 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 186 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
new file mode 100644
index 000000000000..5d1ed5e7a52a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855-mfd.yaml#
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
+    const: airoha,an8855-mfd
+
+  reg:
+    minItems: 1
+    maxItems: 5
+
+  reg-names:
+    minItems: 1
+    maxItems: 5
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
+  - reg-names
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
+        mfd@1 {
+            compatible = "airoha,an8855-mfd";
+            reg = <1>, <2>;
+            reg-names = "phy0", "phy1";
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
+                reset-gpios = <&pio 39 0>;
+
+                airoha,ext-surge;
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
index fd37e829fab5..f3e3f6938824 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -717,6 +717,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
-- 
2.45.2


