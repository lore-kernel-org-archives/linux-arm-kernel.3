Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF2C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=; b=VkJ73HptaPc2ooUPcBzx8bXujv
	jRj/oZlP3+kO5K2MROEUGaTArZqcP1JnsXwqs3c7rh8s1NYUk2kt/BNEjFarsB/MXWvRL5eac/Lx9
	+rDqWL95k5hKFlVVdoqgT7UCGOB0zPeWfuLrypoFqRJkHd4M5y4QKPrzP4VlXV8JpFZ5DbhBM2RGp
	5PzIzSElcigDRPn0KzjfY65Tita9WyW7vCjb9jmGKwOr/CA6VICeKcavun4o3pP4NmNiyQVZMRI/a
	Ux/W0NteYkEni7f7IwBGKp8Zen37H4UjdkMvHQ/zSXiY+XOJVeDPk52iI6OuWUBOBQejxK8zY+P4E
	/Ik1AvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25km-00000003YHI-3xeX;
	Tue, 08 Apr 2025 10:00:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25cv-00000003W3s-2fs6;
	Tue, 08 Apr 2025 09:52:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso58276595e9.3;
        Tue, 08 Apr 2025 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105936; x=1744710736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=;
        b=Znbou5n73QBu7gEbdEpUIjYei40mlYGoLyczt3Grn2Z1pWGJImQ+JchV3OyIDK6o+/
         YpdBzwfjGu6SGe2i3DFxMrfqfKzfmhB7T1pie4Xrf+K/IUV5FNJ2ShQqev7RZq3Z9U56
         BjwkrqBBXN0ARe1NRnHSCc8R4uiL6oC9vtEE0Vjb0GOm8A7MntaO4IDhBxmoR0k5b47m
         xRJgPz44B61zBTAkTUC+LBxKzENlt1BnSOcQJu1d95OJVYJcCOGmStCb6LEzJxM7hY5q
         7GXxh0xadXT09/fu93J2r3KjqO7b0NYrr1wu1AtNBtnCYNh0hdLNytVN2guBZsexMKgk
         POFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105936; x=1744710736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byJPrCHf6giAb360kl2C62a9VTaGkIRY65ltid6z7nk=;
        b=YvpunJkgeEyXTNfdJQ7CtS0gT6P9fHSi4dy49g/9qV3GbdvvLIs29bE1BwZd6uDVut
         eY7OxSg3+agEMrFTlLl7smqVQLPZDpUKH1BdacOdTt2P9xwXJPaFN8Q2daThYHMAmQ8F
         TowTIblh9Y5T/+GByEzoyQpsi1pxhwRYLS4Tz4pivDVzumsKHBn1C/Ctew5JrwT4BYOC
         0ufT+/UdIJ1LD5X9m0GO/F0gzAeFeTzzD4cRupyfrPGC82F0t/XtNEnXc+QDRAU/ma3y
         iTR9gWQsfSluql0ItN0BCy60iGo+csJnvuf0Y8Oy1y8FXEJvwBsp++MrD4WpC5wCgSs8
         AtXw==
X-Forwarded-Encrypted: i=1; AJvYcCUaq37jWbB2HWPjGsN40gZQTPsyH0SdAJob8UdRGCSrSb105V2cYV3HOinsFp0BhMAf0Y7lb+DcZRVzk2nRQIlR@lists.infradead.org, AJvYcCVnTq6CIcR3OVU3s+3uId4e4x1Xn/RYqQTn/4/mgU0CjTPpSZQouMxkGNXNU+WZsg5qxx0D2j2N7ZFBPQguq9c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxabiOqARWiqISC/ro3djJRLp2tjE0H9Qy6MAhvc+yxIDxPDzqE
	GlIJCaV9f4O+Pe8kd+PRH7O8RI2dtjdifuvfjhKdlReYIWUQPlks
X-Gm-Gg: ASbGncsylvQy0XAz8WCAqVD/MRoig8FM4yZHvY0XmX++c0sLmYSRyQBeIZ84armon6j
	oEMeDO7fp/nRFPbkoPjU8rwmS/y0hqmFzI44QuJfvhJq1nk11KtqRhAV9Gjtz79VxgEJvstDjrU
	2Ebf0gfVZoz5JkcSewOBjiWCC74ZBi8JAIxd/g4dz8DsBN0NXf9L6GlcCKvPPSGrLPNPbKYh9I6
	LAlfyAxVkEfzclyBeTi4TF7PFZFTCLF4KR7ObT4jtwwuemuAwBnL0t9PqwfQvGtckc1NTqWtgbi
	XAcmSjp3RxyU8rPTj8T0My2cC4f2y6S/Ek647fMHnUrD8OO+TucSjNQGQrK12zRfKRwJpXu/R6/
	nMjA5I/HP7t9Gcg==
X-Google-Smtp-Source: AGHT+IGo880VawF4/5TDQUaFDegWLI9yM3ZULhdWp4WgfxOq5TQRzqsaKPB2/AwFAxQmOfQoB66hEA==
X-Received: by 2002:a05:6000:2285:b0:394:ef93:9afc with SMTP id ffacd0b85a97d-39d0de17c21mr12141377f8f.18.1744105935819;
        Tue, 08 Apr 2025 02:52:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:15 -0700 (PDT)
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
Subject: [net-next PATCH v14 03/16] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue,  8 Apr 2025 11:51:10 +0200
Message-ID: <20250408095139.51659-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025217_675229_0CFE42D5 
X-CRM114-Status: GOOD (  14.66  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configurting the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..fbb9219fadae
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configurting the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.48.1


