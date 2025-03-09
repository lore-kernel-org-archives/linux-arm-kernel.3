Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92068C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzS4hzE7zDkztDQBx5YAH+xKOh9ZedPuSQIim2JNdCQ=; b=eVYn5PPz5iG4aMqZ2g8T9vyBLi
	GQWMuRT5RibdTHah7pfBUm2Yj+gc2JgQ4iptXWav3j23BsJswwpV6OQaNJYKU4mnEy6quO19KA6kk
	fhriLmXPfepDuD9MpjVfKOtr5nYG2WSMk6Ud41XktAMWvPvhbwqzHdsVWe1ROvbA7auyoGcRO1MAv
	vZ+HTDESQkNwGiUATgbWgrQym0XuAr8cMS89XVIdEAO2Q1SK/Qk2EIpSdoo1Fm4Fzu9mSRsGM2Ri9
	/l5P6voiko+xHjllpsOKmVZJt1x2vWgCV2/37bRbbKRWT6UvE050ZBQu1RKp5dHzb81lYRuww7PN/
	2oFmVHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGtW-00000000brx-2g8A;
	Sun, 09 Mar 2025 13:40:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGjv-00000000aSg-1qlm;
	Sun, 09 Mar 2025 13:30:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39104c1cbbdso1597613f8f.3;
        Sun, 09 Mar 2025 06:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527046; x=1742131846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzS4hzE7zDkztDQBx5YAH+xKOh9ZedPuSQIim2JNdCQ=;
        b=dJrQ/kvFNgy1L+8kyCqiNPNlA41f6VZ7IsTng1yiYLRXe+1gXMBryiOeQrVz2OjSq9
         Ev2Nc5rrCVKtT1go/WiJZmOgU87JsWDUh13X5mtXgj9XLeuFe419mu5qCVuFIdagJNNQ
         gAp2cdE1TKWLjwfJqaLG66/Nbb7WKb02gScxfklzmpAEyDKUFjyxJSlU1QplNVhX4UeK
         VtwLF+9c0okicchdWJjJXDIuefBIouTNEDEJkHa7cZpQ+Pe3ve88tD3B3gDl6e6b7T+h
         HN4b6NHeMJvPoOxd8DaBTUThfzyLzqsbGO+f9rR1htiiLPK3sC7dSxTuHnIJNHjXkrMi
         8Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527046; x=1742131846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzS4hzE7zDkztDQBx5YAH+xKOh9ZedPuSQIim2JNdCQ=;
        b=RSyHWMaJQ+xNN6alY5Xzej5O6ASxHeGemasYPyFUfQdpGIkNRQFrL1FJYCIirKItwy
         AkCC2lVR10BPWJsLAX3RR80SGOT7bqpwpQ2ILQXPGuoID1TQRd3HevHK5guHWoWO9m1g
         FKIuDfI4cbGrdGO1NSOr+uopptTAFOMCJH1QY+JIbxbbqqSlP7RW+tfonNfy/2FAXAFB
         rmTowAdLtpLVc4RAThXpsjZGcfDL7IxyYLOFCZOoYKcGlf7pvX+lrziPl/RoXCMegS3c
         SBMPry4fFYxONw4siPXLNvg1x8h41EHBrXc70FSA1vzrR5MZhoG/zCAsDVwg3qZUp8nv
         WRVg==
X-Forwarded-Encrypted: i=1; AJvYcCUGja3iyToL74vee1YMjhUxo47Cqyjq7KOmOuiTRAQeJer5Xf4UbkmmZsb5hE6fDj4TpCw3C/bwpE2sK/QEmT4=@lists.infradead.org, AJvYcCWz09HBh9A8WeLNWR37xjAI/PS8iT6Q+yHyr0Wim10/HhY2O3cgh2e5RYBnzNfaljA7qlpOtIQIbCwV@lists.infradead.org, AJvYcCXkjU/enQLMpirb+2IE2kvNsBuJZgRKdswlHhNw6RAbRcT5iwE0mUakoy3SbIU3gIDwBMSc3r2gvR68NRcgzLvv@lists.infradead.org
X-Gm-Message-State: AOJu0YwgLA1tEp8qZaKVzpp8i3RGQ3fh1x6rdEQOAjFeYxl4SNh+nKjn
	2289hdDJmBp9ok92JrvkPoiXCdefM0k3wUh/oyZUz9/LTx/lLY+o
X-Gm-Gg: ASbGncvEcZYbPPdB5ipNeDv9qdYwVOAV5n5NAnIebCixctDAam2Pn488D6j/T0L42pj
	RHOaPiEfOb0/lEJWdvYKDR3hnUDFHjfO2qz0zuDvu0kqvNrUyySjwObPq6P/p+lYYvKcREKhJl6
	KyKlBx3k8tGVPk8HSN5iSXK+ywBv4nMebwoMZAjoejVxfCb+5IIUdrYRPyEfbb8CaeuObWFbB9d
	SnPN3CF7UJTbfoCwAaLJcLG3NU46dW5WgrzdUE6VRM38AiRQcWpXB2mNQyUm2cDAXFCeLElaI1J
	+pemldOhMCfeuePP9Ql8RPzTeWsh33TGnETIQ+BJ8dXGQo3hvo6b1iKhF5SfAADxJO845FrEqUq
	MxEpoXhS7rdly8g==
X-Google-Smtp-Source: AGHT+IE6bIHxYXeJLeLHPL+p4IEp/6DdN3f/i6NZYTP+hM3wxLjboSsLeWZHA3qzqc5r29m1QI1i5A==
X-Received: by 2002:a05:6000:1786:b0:391:48d4:bcf2 with SMTP id ffacd0b85a97d-39148d4bd41mr353208f8f.12.1741527046061;
        Sun, 09 Mar 2025 06:30:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
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
Subject: [PATCH 05/13] dt-bindings: mfd: add Documentation for Airoha EN7581 SCU
Date: Sun,  9 Mar 2025 14:29:36 +0100
Message-ID: <20250309132959.19045-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063047_478794_116439C6 
X-CRM114-Status: GOOD (  14.30  )
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

Add Documentation for Airoha EN7581 SCU.

Airoha EN7581 SoC expose registers to control miscellaneous pheriperals
via the SCU (System Controller Unit).

Example of these pheriperals are reset-controller, clock-controller,
PCIe line speed controller and bits to configure different Serdes ports
for USB or Ethernet usage.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../mfd/airoha,en7581-scu-sysctl.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
new file mode 100644
index 000000000000..d7dc66f912c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-scu-sysctl.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,en7581-scu-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 SCU (System Controller Unit)
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha EN7581 SoC expose registers to control miscellaneous
+  pheriperals via the SCU (System Controller Unit).
+
+  Example of these pheriperals are reset-controller, clock-controller,
+  PCIe line speed controller and bits to configure different Serdes ports
+  for USB or Ethernet usage.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,en7581-scu-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  clock-controller:
+    type: object
+    $ref: /schemas/clock/airoha,en7523-scu.yaml
+    description:
+      Child node definition for EN7581 Clock controller
+
+  system-controller:
+    type: object
+    $ref: /schemas/soc/airoha/airoha,an7581-scu-ssr.yaml
+    description:
+      Child node definition for EN7581 System Status Register
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    system-controller@1fb00000 {
+        compatible = "airoha,en7581-scu-sysctl", "syscon", "simple-mfd";
+        reg = <0x1fb00000 0x970>;
+
+        clock-controller {
+            compatible = "airoha,en7581-scu";
+
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+        };
+
+        system-controller {
+            compatible = "airoha,an7581-scu-ssr";
+
+            airoha,serdes-usb2 = <AIROHA_SCU_SSR_USB2_PCIE2>;
+        };
+    };
-- 
2.48.1


