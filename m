Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F1C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjF+FG5kURVzKYBbwEeIffikatQLM1KjL+4bR5mlF44=; b=OUCcoaGhwLpowxtcplB6HTmJg4
	umEKHH2qjK5U1l1661SHXbxamiagOY2QZkcM2JfkOI013nniZ9chWrH//TQEhFDVKN6PEtNqz8cX1
	p2tBY7Ql+78gW1OpsawSBeAutcpcktztBpYydQuyHXfb0nU7H7zjG4WLEGemZTVD/jkAN1AMeP0i2
	SCZZS0FQgrfGMLmmtEQwx14V0aBGeY3Y0CEn9rQh1MwLB/CkBKSeKp2bhGNMqXmHS/Gq/gfWGwHl4
	LD/5f0CHpNDk+TJvRt/setsc9OPJlIrKJpNlH4siNpts1/j1YQrE41Cf1o6+p7A74p8EEHPe/YgNy
	vULum38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKZN-00000000rNz-3zZD;
	Sun, 09 Mar 2025 17:36:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRP-00000000pqU-1EPk;
	Sun, 09 Mar 2025 17:27:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-391342fc148so1336612f8f.2;
        Sun, 09 Mar 2025 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541274; x=1742146074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjF+FG5kURVzKYBbwEeIffikatQLM1KjL+4bR5mlF44=;
        b=edALtY66NwXANkL3RAutTLgLM6+OTSbvo6K6u7jF8Z37xBpdD3yK4yL2/wvJTersvG
         xQZrP1V9LHqDkjkvJcUBUIst0Gkq+70SnqPIDqSn+6IO/ASjjqBhQag3cjTMrDzBCt85
         ZF82xkfRTMPcR3+FpaolLSBkAT+MAJVAQ4cN4Jq6VTs7X3vhxu0X0JjKHPpLZtk5jBmM
         0QT8vGfdeMzI7JpLpYizi4UdTUIvFp9vrm0OjicqfgLT9uxD948cN/zkBOcyNkZptraY
         N5GhudavYGHRWSIg+kFX1GiF450T9QWE6LivgdmaQVsNu7ixBcA4N1PkS1z5XXW3/o8R
         l6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541274; x=1742146074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjF+FG5kURVzKYBbwEeIffikatQLM1KjL+4bR5mlF44=;
        b=Pve8YYo4v2kneD8yJyaUItWD5UMll8GvIspcOcNG7dSV6MBXdgPpXFhEJJRS+HAGTB
         4bG2JbBB/JfdFTyO6Nn3S8jfAqcn+VHfFHSFL225yH8LG+kFusEnJdLc+evvof5O2E6q
         lwn3roVQ+F5loRpbPHKpmxCqBaDhvvy+AVn+c9f/J8UBv4RfGk6wG4L3Uz0BbGqinAE9
         5d1FavF4aVcpvxSL/w2JoFD0UxBiGCRIUTT7AdyJ9cixZSLdqLxcIyuU6J70T2dp5aur
         8dYq7VcR3fnna6HCgogvmF34dIbDNZzR7CuXsl+xdJMMa3qwVpa88LmCgWHoHg/r5xqZ
         YUsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgxi6qdPzWRQWdYfo9LIEBn9rA6Z0UQG852Nzr3nvLSoFzWPaz3QHGwYM3NTHpJhYOkHhZWvh4vXjccTPhOQ/J@lists.infradead.org, AJvYcCXbSfSIZTZWk+kcM4qcWmN3hXqBLBW4FCP+AOPVB7Vrtrd3qokEoNrvjT+nkyvkOQxYGszYlpeXtjVEY5QR1jI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKfu2XlQtUMg0UVjyDNjJCZKiVnJIBmTPP3Ua5lEK08u7Ye81+
	8A0CTbrgRhmgpQaPsIszL2YcA6a8YQotiW6V3y+Y9vzvFMWJs9n7
X-Gm-Gg: ASbGncvw3sjHhTeQY+IYZC8WrMcl9TsegDy+JcH0bynVON606UiZ5n8juU1V8om+3td
	ip725d6lXc44abAS6hhtKz3tIZwnCRUrQVppShCErLiiYa9vUlsZcWvU54UDSdzUA7SwnNRPYly
	+v8w1C5qDjhny6yzcoXRqlbYyAYS95kus8H5YLTkH3T3Aa6ARkzT8X0tbO9udaAGXYMtM3Zx3st
	p/afjhn3clcT0k3ZZM7d0x6/by3nCTimaqLfKyp/DO9UHSAbzJuQMYG9FZRba1b54sVAowxJ7jD
	85mwi0lG5RkVAyuJmSlVlGVhvifQDErQJjKZ4El+2ggYShM9Jd1KzC3AV2mQ6niUXs1A0Eqmm+A
	X7iaUFj2MKvX9bw==
X-Google-Smtp-Source: AGHT+IFtfdxDqXXA2G5tQIVP+5A9JdGmDp4Wkxt7tLFZwMIvzj00ZbodCqu7F1y3Wy6pDAAUQBU/yQ==
X-Received: by 2002:a5d:584e:0:b0:38d:cf33:31d6 with SMTP id ffacd0b85a97d-39132d68426mr6145575f8f.3.1741541273432;
        Sun, 09 Mar 2025 10:27:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 04/13] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sun,  9 Mar 2025 18:26:49 +0100
Message-ID: <20250309172717.9067-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102755_333087_B8798EDB 
X-CRM114-Status: GOOD (  18.30  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the "airoha,ext-surge" property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 93 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..301c46f84904
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  airoha,ext-surge:
+    description: enable PHY calibration with the use of SoC eFUSE.
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+if:
+  required:
+    - airoha,ext-surge
+then:
+  required:
+    - nvmem-cells
+    - nvmem-cell-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            airoha,ext-surge;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                <&shift_sel_port0_tx_b>,
+                <&shift_sel_port0_tx_c>,
+                <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 696ad8465ea8..45f4bb8deb0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -726,6 +726,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
 F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
-- 
2.48.1


