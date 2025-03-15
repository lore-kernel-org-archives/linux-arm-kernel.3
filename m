Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F803C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOSxaiCNgkguMhmOsgtIM1pXf1qRsgQMSyGwNzCSHvc=; b=ZYUJPQeE9Bgttx31CNo9Itk/XI
	om5CA3JJIb8zMWPUpeVGP0R4Qm9h9cQVcywPCPc8HnJB9SsatzDv/zAe7y/vEHTEfXetMhnUFlX6b
	5uhhj6OueBOM/+NsfF1k8y3STtCWFHw1zsYtmxywRKPdFHPqP5+gTEodmEwtn+Y5pH6fLIhTxNo/I
	x9V3rgKLF97wTI6sJJRknctIU6dWJN31C3hVD4z+2lltzblstN+yJa8WomR4q15fzrPYwd84w2203
	/DAIsmASZDfmtC2g0xGNoMD2X2UFsLX8EKgyN8iBsTXwWtHpVX2UMnpbCLqKlEGE3Uk7U15b6Z97o
	gHOxNO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTpC-0000000GYTi-4BhQ;
	Sat, 15 Mar 2025 15:53:23 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgt-0000000GX1a-0pjd;
	Sat, 15 Mar 2025 15:44:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso4045155e9.3;
        Sat, 15 Mar 2025 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053485; x=1742658285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOSxaiCNgkguMhmOsgtIM1pXf1qRsgQMSyGwNzCSHvc=;
        b=CVXxFDZfDs7dUsOu0qpHKI9tTr1NtgYcEDwWGiXkw20faXL2oCaFWSGCWQWkyXbBO4
         WlFY6vZNoVo3gvtQ1I6Purc+MekCO+GhWCfJZxiZ+heF4URZIhCc1Uj+GTMKxMOIqu2x
         6t9B9xs98Ge8rXyXKRKhFWXxPd7mjxHzpjYmMrcGvVveYFo7aXw44GdnsyR831zd/NFg
         im2QBrHvcZ4wWJF+N74WmFaETjNj6d71knnNogaP7zJHSkUwDsNoPn4ZrLoYccLIc57w
         zx/t36EUVzAaxYtwWg35emhrYYUyo+y0me+YDXOHolyUE7CBelQdIm7M/a66PEGO4Qup
         1XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053485; x=1742658285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOSxaiCNgkguMhmOsgtIM1pXf1qRsgQMSyGwNzCSHvc=;
        b=FKdl5rzgXVIGQJzjkMyZliQ2JTwdGOjIuKAS8ZUsYyopZm7Ag/6kNh7eNtESzzcNbr
         dllP4PgHdLR5QRjskDXYnqquH6fMH5jJS1ECvoxb36rfZZ/XAq8fSnmQ0dR5pfS3WIGj
         NuUyX3E8QQSdPOmlveG/HwBjQY7N/hHZ193FKn7+nDFOy07SEucRzFsU4QgDe56pSVn1
         yhR0sZuXwiIq0pGegb3X+YxaJCrCwKeeN3mWi2YEA3r5QxdvgGou6Rfay/b1bWKqX3Ky
         Qr31uqgVIeIU7ehtM1pcAL00SGKmZI86VcBO0+9VZuKeCirJskji1cmFbA4Y21fsNAoE
         zwWg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMjN4o8yd8AXJ8hkpPYAv09w4r7WICwnCR7aQtDIhvje5TwXIvkpmpl6surujLcKfQSo4kE+IQtrj57/mQoE=@lists.infradead.org, AJvYcCWWDmpsY598KOeRNAD9Jmkj+RtSRgX2lUfzSysomKITGQKEWar/TjcQCSRP1qUzFLSwVwddORFQZjleCqkIXUf9@lists.infradead.org
X-Gm-Message-State: AOJu0YwTpVFpwbartQ3Fmtt4aGS4mnghIzfMVxEZ6OG/jSlBU06glZhs
	1pTv6O4gSQp8fyKv8yFmyWvH7ZGG1XSKdbg2UTTgW+0j948bYf49
X-Gm-Gg: ASbGncv6xC7esM35hDR/mDwlQW8mvGTx8h64vcYGOEU35ZmMaZ3aEuGAq3IXwJ60Owu
	MklyN3J/C120QLXCYDl2lYf6pZE9p0zm1PGQq15Ddc30OeoG/MpYPxbZhFoNcX4tAGJRzPlSw9I
	eWpwrs6Eay2yKKPxz8nRILG9YrUwb2wEiNtn8c2LP1dWQTMBYeuNAIRvYyPblLym93gQxO+xOyr
	4Cf1tDoe6X66Xs5FXabdK5hCJZae8whdrDl2lvEDDf6bd8YLUN8TAKNjqzuOHQxlmdTnC3d2/Qp
	oy6ZFknfK7eJdpABl7wTYkiTyzKD27ghQRQsLzY6GqqDMuAp/oxt0IwCB2wNK85lHA/7lsAbh8v
	ymH/eIaQ7e6q+XA==
X-Google-Smtp-Source: AGHT+IGsWcjc1hDGEO8cxnzByykp8hNWR+gBAlcKe4nhtYmqVcy+n+X4aKOrFdK8VFw4PIbyBeMzjQ==
X-Received: by 2002:a05:600c:4f0d:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43d1ec71e13mr74675115e9.8.1742053485345;
        Sat, 15 Mar 2025 08:44:45 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:45 -0700 (PDT)
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
Subject: [net-next PATCH v13 04/14] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Sat, 15 Mar 2025 16:43:44 +0100
Message-ID: <20250315154407.26304-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084447_248800_227EF404 
X-CRM114-Status: GOOD (  17.73  )
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
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 84 insertions(+)
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


