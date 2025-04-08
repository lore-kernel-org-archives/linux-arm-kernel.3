Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBF0C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=; b=fS6GL3/HwX+tLZc4QHKrYaunhM
	V9xWUyuNWASKqaWnRajWaeeSgzK+EWerHVq3yCW+7lALLQbJy284ugCw3/nKS1AUMrGOG0wLM+iWH
	L99EtSn/idpqeC3viwRNcaLtUuVPsVXQLbh4pyPxtc0wvMwpqnpmBEmmwxq6yzuAo6ed+fEyOhHlF
	aHCRhBHdmjKtr5aMJlx0G8TDgYGDQpHyJ28t3puc5hLgklviiKDqF0qXsAH+SHkcMRDP7KY3CLMk0
	PESZzHekrPXRDc931RbGBkoBAq5FIB8FkiCLmokO7o+yjLo6jv34djuzjA/EWG1syu9tCvG/B4ws1
	JOAQET6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25mb-00000003Ygt-0IhM;
	Tue, 08 Apr 2025 10:02:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25cx-00000003W4N-0Ynl;
	Tue, 08 Apr 2025 09:52:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913b539aabso3109960f8f.2;
        Tue, 08 Apr 2025 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105937; x=1744710737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=;
        b=BHg2x4Wh5iGzT6ooz8Piqow9IBosEaDPiB9IFoQrj3bbxnNTzPjyjdJApRdjK4Whuo
         hQZiylS8schQs64BJBq1HPZUZVlu6yDC0MSTMfRZA++JMTEbKtTOGpfc/sCLbMYmwTOl
         VignqcgV++4Fdg2iStaAELejlpMgC0f01QEBzKn7RJcUAs+zhck/2QaKJ5dtZsSNvHRu
         1Ln7QhVewD0kz8n2eQ8cADJ09txI8XEbgJ/1NOJvzA4AQVzKbHvza8IMgieoRtqKOAXS
         WRUTJYUGfbxE5YYaekfUe+keh2bdFwfqTSLOylzCGZPQBnrotWrxddq4+7JF9DyZ8h78
         JHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105937; x=1744710737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMfOxJ+ivVKCbrvfLFliBdEaPDrw2fQxzA5hHL8RHBE=;
        b=pjrcfC784hHXDbklLef92MZc6ockwizatrtu37CVFcfWFKOkEoJjgeCaQt82MgJC3V
         y4+5KqLqu/MNQFTTFc1/gRymb3xdMEZ08LDwp/EB8htFUFr0l3jz+bx1a8jvKJJcu6kS
         5t39MjOzN0yJxWvzCVJWgMwyO3eYB8U5pI8bHxt0hQnrX6hlunygqDsGMrliPEm89pkF
         zXbMj+0yEvzszgx2l3I6T+NEF/s6RSvluHwFRG9OOCOkhxe/k65E+tCHb1Bi/3VgdflG
         nJybTRni9nDudM3LDZHIls7fj8r8RE+ahUcf2B37XbiGNG5TAfwntr+NRWjnUuXgeaFC
         LcdA==
X-Forwarded-Encrypted: i=1; AJvYcCUF8eQD2cdtKDyviuntcGi/2iW4hLRPEEu9TKonaFzo+lMr7sGXkDVysPoJVRkkLxQr4GW+uQwUbA03IKUAGVQF@lists.infradead.org, AJvYcCVni8K2ijsPJgOIsZrju6FipJWmuvjhxt3VmmWjHCM/pSjZbIyBAd+L2k5M6Wt+IOLu7hdbYpeIod1eLD0f2n0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPUFlNupmKbl6XQqlxxaE1KhASLsPLE9feloC4y/JVNTzf0Kn+
	he2f6WBr/xKZk192lrKQMDHzxlsKkKqeljMKUZkWvc4A3jf62FNW
X-Gm-Gg: ASbGncsTz0KYTyEzBYoQzWRDjlZmOKHQRkOSAqE9KEjn434808yrh+H2VzQnmunuxBu
	g+NkaV7M7pwbsR/e/WdyIZDN0ce3klaedV9S140aFOCxefkuZSMsb1DpVcgxqKEuLZoIib2xYcr
	BXTshiuG2Gvvtl9PlAtujaHRqNxuLLhVla1s994IxS8nbHMmvgEQsDLWj145FwHNaM99h2lhQ8U
	JnxFH20Vvx3hwpWvgBdMw5oqtVA3MyiSrkNHUgcC6B3lK9CFYWxrXeOC//G7tMHWVzMm96MGNsT
	HMtKtmaroKpMCzZbY/a+nPMhW6riSROIzNnfV5EvXB7xQlUa7ladAcDSWb0X9BTmkw/3GjRKhb4
	u87b1c9cNu4YAdw==
X-Google-Smtp-Source: AGHT+IEXwpGN30PUlfHaaWGCiZEymBLvKdCoOgEM1azp0/BEOQhn10oJuQ7dwscnj+583gxofkLISQ==
X-Received: by 2002:a5d:64cd:0:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39cba93d7e4mr13535785f8f.55.1744105937328;
        Tue, 08 Apr 2025 02:52:17 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:17 -0700 (PDT)
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
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 04/16] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Tue,  8 Apr 2025 11:51:11 +0200
Message-ID: <20250408095139.51659-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025219_174767_6C2ACAE1 
X-CRM114-Status: GOOD (  16.22  )
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
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
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
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
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
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.48.1


