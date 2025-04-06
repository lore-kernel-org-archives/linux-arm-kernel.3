Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22B0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGytfW8G6gwhO327U2YL1/GYm/l6ThozJnofzfzJ7Fs=; b=WfkTxLHve3RXHi3CbKTlnzGaDK
	OSisRCSv6P8BOMeMG6THzKJt4/IdGhdgi695gcz75ziiA7T0QnkBB+UUN1QRvtYBRyu0bJMm38lFk
	21rPutm2LVABO6v0owvz0WuxgciQBtINcmC/W8D/0euCHPRPHTu+UM/YLNLbTgAGBlyxG12cgtz5/
	WuNyW2dh3408EWxKKTJWKvdoewCtXpvPk3U5Mf05GHWfwnK0z83+YSFR/VN4FMQLovUXyMw8tR+Xz
	5kQ79BOJyDsnx43AFtwefeV2n72jF+cdE+l8B1KUJvF2g04ae2RIGEAM/87DxEgZA8QvNavQe9NNJ
	9H+FG8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YYa-0000000FwBZ-3Qx0;
	Sun, 06 Apr 2025 22:33:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGq-0000000Fsy1-0NqX;
	Sun, 06 Apr 2025 22:15:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so24973235e9.1;
        Sun, 06 Apr 2025 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977714; x=1744582514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGytfW8G6gwhO327U2YL1/GYm/l6ThozJnofzfzJ7Fs=;
        b=H0o/Ffaei3QbnABBC48NsfdkXE3+Q595PLVBjEUIyhinzBDMPVbmXLTExSrwhtngvV
         J7btwS52dV1SOtBPvd1NTQfBUGJ5vZC0GjmU6l26a7FhpkTuHn/gyJNmtYyiHi4OwIO+
         gcIy36IUUVAHXBtjIqiICMLRjbZT70yxrh8xHYatcCEMjpjv62mVEY3LIlrHveszOy/9
         92B4M0w15Yx2xIfvB5lsshTmdf8AJr1CD+MAwgVx79L319b9qly03OLOBKE1lkiVmzAU
         OHc+LmZZMP3sZMNGaRM4OcdEby58aEp8ymnlj4/wDkXsDFauXC/RtVN00duMFCerLCaf
         kyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977714; x=1744582514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGytfW8G6gwhO327U2YL1/GYm/l6ThozJnofzfzJ7Fs=;
        b=Yy/GrEbToJ45TDWljLE3OsSJ+7WraQGKZnSeYC0JNnHTkchjBUKdz4Go5B2VgIK8sM
         pEgS9Vl6V9ARdqDCih1m3n9P8UYADBM6ymbcYY+1DEqwV/ZMEUCg64uNTzG3FcHkcptv
         7uezrFlWMTpkThla4/5UZDZrq2Yw6xitZYpbCi/Xv5C3uRkir8QV6M5G/BQU+KLoKctD
         /RMntc/O2J0VKpTzV15/NcuBeIvuK7DjYmQEfZQ3O3e/jVrzGVMQVP1jJ88a8TtCzf1Z
         v4w5dkBlne7e9nHqkXfGdG0lQZI8ByfUhGmLXjVayDdsgGpwn7kuTN5wXCHYYe73+mZE
         CMbw==
X-Forwarded-Encrypted: i=1; AJvYcCUSeBzZ0pKz2ZBpCEi+zbImKkYTN6RJI82Ilmvjed5E7xWeOuZrjd8HYMeTr+3AgI8/3LHU6QWRDzeoeIShT5A=@lists.infradead.org, AJvYcCUnDmANSQNRoRzuIAWPiwvC/B9y4p9KEOi87Tv/MIdZioz7OqH4ve7ajUC3wRWyWAc0bS9H44nCeVgvs6ORNJO2@lists.infradead.org
X-Gm-Message-State: AOJu0YzMPUrNmRwkHJcGz5Cu+r3qSEJC4OIqgB3M4K4Avp+vJRhAVoNs
	c1JdcsxFLsdZecxwIEi5L6zYqwlaS/YMT+cE5/LoACujafGkGtHp
X-Gm-Gg: ASbGncvDmv6jhevBu+wuB0RTC13rb5Gnc+45Ba8h15/FcxtN6/9kE/RSwAhscVyptEU
	t5pQOWrySTo/l+hzG4dEFmSVf3TWB72E8ZNXLtniDhu0uCAyAo4qohjYeyJ+JTlfXqpgRMLfQg0
	4kKQo314qWguxl21RMwx3eg3vWAYH4vt8Bre1svoHn9PA2SJWdWVeZkTnbsaF5BRR7P4nwsEXTP
	95c5B472d9P2Pt6K4NEKv9atpuSoKLGmww7aseE43ZKo2nge+/CWQtSQelXSVerJ4M2LYY4nvjZ
	7HG5R4kUfay949OUGK6jN0FVgUhBu1oUICIsCModx6jhVHVoaD9uaFWXGVQXM4u7NOX/QnB+Or/
	Riq2cNhsYLX079Q==
X-Google-Smtp-Source: AGHT+IHf3hR2LUO2pSoHA5YRJXlajHrhcin+0UjxBL/5XqhdoqEDVFhBZWmKSGSo0LJNPC3tk0VNsQ==
X-Received: by 2002:a05:600c:4f4f:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43ee076d88cmr58173825e9.26.1743977714232;
        Sun, 06 Apr 2025 15:15:14 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:15:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 10/11] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Mon,  7 Apr 2025 00:14:03 +0200
Message-ID: <20250406221423.9723-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250406221423.9723-1-ansuelsmth@gmail.com>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151516_131131_072E85BD 
X-CRM114-Status: GOOD (  14.32  )
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

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
(for Rob, I didn't ignore the comments, just want to
 make sure the driver side is done, please ignore)

 .../bindings/net/pcs/airoha,pcs.yaml          | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..8bcf7757c728
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+
+  reg:
+    items:
+      - description: XFI MAC reg
+      - description: HSGMII AN reg
+      - description: HSGMII PCS reg
+      - description: MULTI SGMII reg
+      - description: USXGMII reg
+      - description: HSGMII rate adaption reg
+      - description: XFI Analog register
+      - description: XFI PMA (Physical Medium Attachment) register
+
+  reg-names:
+    items:
+      - const: xfi_mac
+      - const: hsgmii_an
+      - const: hsgmii_pcs
+      - const: multi_sgmii
+      - const: usxgmii
+      - const: hsgmii_rate_adp
+      - const: xfi_ana
+      - const: xfi_pma
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: mac
+      - const: phy
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcs@1fa08000 {
+        compatible = "airoha,an7581-pcs-pon";
+        reg = <0x1fa08000 0x1000>,
+              <0x1fa80000 0x60>,
+              <0x1fa80a00 0x164>,
+              <0x1fa84000 0x450>,
+              <0x1fa85900 0x338>,
+              <0x1fa86000 0x300>,
+              <0x1fa8a000 0x1000>,
+              <0x1fa8b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XPON_MAC_RST>,
+                 <&scuclk EN7581_XPON_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+        compatible = "airoha,an7581-pcs-eth";
+        reg = <0x1fa09000 0x1000>,
+              <0x1fa70000 0x60>,
+              <0x1fa70a00 0x164>,
+              <0x1fa74000 0x450>,
+              <0x1fa75900 0x338>,
+              <0x1fa76000 0x300>,
+              <0x1fa7a000 0x1000>,
+              <0x1fa7b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XSI_MAC_RST>,
+                 <&scuclk EN7581_XSI_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
-- 
2.48.1


