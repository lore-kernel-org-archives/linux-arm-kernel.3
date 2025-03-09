Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63867C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7rAztQuL1fqEwNhgIxMbKU2YwJ5HINRdQASSAMKL28=; b=nQpviK5t6n8HoYNsLS6YxU3XCN
	VeWie5D4gHCMw0qPD5XQ8PLEw6fvLKQe6XKLNYw5rENuSXLlJ8gsIu8lbK3hO0Jp69qV/ZfCwgIeB
	zaB7hjuYVWiyf2/n8WX56z+jzp7nEb9oRgWYxOjdhs5f5MmM62jfPG0fS8dFzCEXWuFQ/iYCJ/jEH
	cYMCvalJB9U0qNr3obIDkFrx2cFHjeAUsO2+ZgC849Hs92DNni9auIhMUlr2uTOS0rpsk/FXEO2SF
	Z6jRFpsESrVA5M9VsSzXdkI3CEhQNRqNTomZSTDKHqgOaGfg9rsj6Pwvr+NB7zUIcjK1f4w3ppGoi
	ATo9LJ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGru-00000000bip-2D2m;
	Sun, 09 Mar 2025 13:39:02 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGju-00000000aRP-0vxU;
	Sun, 09 Mar 2025 13:30:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3913d129c1aso598352f8f.0;
        Sun, 09 Mar 2025 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527044; x=1742131844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7rAztQuL1fqEwNhgIxMbKU2YwJ5HINRdQASSAMKL28=;
        b=ewXodrbadtZ2r78GlteYvHMvpByVhiF1XPzjT7bPd80ftsouMrjtBfp2+iRz3T22Cp
         ZZwFgQ9WhRxDQL3VimVis3xzb4oKsSTh9gszvR34b6zD/9nG1NHZrrpL2T0it50hyS0w
         wrneM+/LyWtByv7Y4zcIXV1FeK080A9KFpTiX8duVtpjPOEaaSzwn/SX+uOr7WJ6odQF
         Ji+A86nLkdhYgriPiDzpBI6l00vmkoiWZS1HsZxvH6GE4zJeP8X+ddu5rdnozCTSbUfk
         RYfxPdPGBvEzHAmHpWAu1hsznDreFqVLPU7Al5wjaKRYDg+FAvKhVGxN/a1CX8Yxetdo
         I93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527044; x=1742131844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7rAztQuL1fqEwNhgIxMbKU2YwJ5HINRdQASSAMKL28=;
        b=ETljoxiaYDKKBcvtUUnxqR6owekuKSbTDI1S0WQkaFOsMvnESrX7QprR4FLmmH9LMU
         3xExwlSL8TLOnxlfAqx64yZK7xj260qkrRnIZpkNF3/LN72N+WEplV5tv8uek3CHhlcs
         JKoKiX4aNhKool9mDipGU3wJumdpGqjAL91QozL3eMJP+dkDOFBiwUa5MFGQJ7FhAB/O
         RDVg58FedfMiQKPngyfN9c2kGNUdvYnI7Jmlfmeopt+39b7DRxCsbLlccLMrrz91SJqc
         Xx6sBI7q5DQNRtlU293DcOFaWkvwVjABLDlvBAcxkVB5OaqQJd/e5gQ//B0h5lwFE/xJ
         fisQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNAormmiOtly6QvywGeyVGTTlnf+2jTNYnmrPO3vJu1A1bvCEuVsiGtzF6UERJ0rytQDWxV7gXdHs2XzvgXzQ0@lists.infradead.org, AJvYcCWYVix7M8ZQYyYqAjqHnIbe13+qg4lGC7U3UPOb1pKAixp1RxMdQYF2xDUKnchUY5rNyBqSM5zKi0epmUhtjiI=@lists.infradead.org, AJvYcCXwvj+dbd+95vfUkRqiD8zHNhKqzZxBVUUUYuCaAZJYBMB2EqLgMUaIfx+RIpD62praBD06Gi9Gh7Y1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn0JDN5M9chSoGyj933m3prQrehLx9QYH4NguyoJ8tI7HoNwWf
	JA6cBd2+PeKIOBI+ZoviRlSWFTxcAaLVxHEjERaFfcSaS5JjQlHr
X-Gm-Gg: ASbGncvT7S5xwlRgz714ZvHUsomhpaQttIDVU+SjJt6pTWFAAUTnsOnIqxde7rmcHki
	esgZJ6iPNNXkbX1FwvZAW7psnv/llV9XAXwfYXoQVPX3gmlrJ/R9eoWH3AO0EW3Z37DQEHi3qoF
	FRmZvEO7o4+tnrk6+voxMreyhNF08yesCVmK9ObMPih26174erw+EE/63HLHYmQSpWf4UAcpxpe
	jB6A26/FNo1l8uspPCI0gUh0JhJJuRRNOXrjRsrhxwzQwzNhIlHXzrtOViuFZxlX43Xsa4R2TeK
	ZDG+wnwSb0mz+JDGuQq3h7viyKV8NNBaMxglpWaxSpVpxhC0LuZiSL1/uASQUUAkbUZzvVWsKzy
	1j4if3gFe+JZFNw==
X-Google-Smtp-Source: AGHT+IEuhfvObU9vao062mg4FvmF1NzkPbIvIIx2h56yBlcCJSeWP0LGYj1OCWvIasRINrETP+XnDA==
X-Received: by 2002:a05:6000:1842:b0:390:f116:d220 with SMTP id ffacd0b85a97d-3913af09864mr3103348f8f.17.1741527044465;
        Sun, 09 Mar 2025 06:30:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:44 -0700 (PDT)
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
Subject: [PATCH 04/13] dt-bindings: soc: airoha: add Documentation for Airoha AN7581 SCU SSR
Date: Sun,  9 Mar 2025 14:29:35 +0100
Message-ID: <20250309132959.19045-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063046_287080_05E4BD21 
X-CRM114-Status: GOOD (  19.89  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../soc/airoha/airoha,an7581-scu-ssr.yaml     | 106 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml

diff --git a/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
new file mode 100644
index 000000000000..4bbf6e3b79a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/airoha/airoha,an7581-scu-ssr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SCU System Status Register
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC have in the SCU register space particular
+  address that control how some peripheral are configured.
+
+  These are toggeled in the System Status Register and are used to
+  toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
+  or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).
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
+properties:
+  compatible:
+    const: airoha,an7581-scu-ssr
+
+  airoha,serdes-wifi1:
+    description: |
+      Configure the Wifi1 Serdes port for:
+      - 0: PCIe0 2 Line
+      - 1: PCIe0 1 Line
+      - 2: Ethernet modes (HSGMII/USXGMII)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    default: 1
+
+  airoha,serdes-wifi2:
+    description: |
+      Configure the Wifi2 Serdes port for:
+      - 0: PCIe0 2 Line
+      - 1: PCIe1 1 Line
+      - 2: Ethernet modes (HSGMII/USXGMII)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    default: 1
+
+  airoha,serdes-usb1:
+    description: |
+      Configure the USB1 Serdes port for:
+      - 0: USB 3.0
+      - 1: Ethernet modes (HSGMII)
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+  airoha,serdes-usb2:
+    description: |
+      Configure the USB2 Serdes port for:
+      - 0: USB 3.0
+      - 1: PCIe2 1 Line
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        airoha,serdes-wifi1:
+          const: 0
+    then:
+      properties:
+        airoha,serdes-wifi2:
+          const: 0
+
+  - if:
+      properties:
+        airoha,serdes-wifi2:
+          const: 0
+    then:
+      properties:
+        airoha,serdes-wifi1:
+          const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    system-controller {
+      compatible = "airoha,an7581-scu-ssr";
+
+      airoha,serdes-wifi1 = <AIROHA_SCU_SSR_WIFI1_PCIE0_2LINE>;
+      airoha,serdes-wifi2 = <AIROHA_SCU_SSR_WIFI2_PCIE0_2LINE>;
+      airoha,serdes-usb2 = <AIROHA_SCU_SSR_USB2_PCIE2>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d3125268d63f..9944845ae9f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,7 @@ AIROHA SCU SSR DRIVER
 M:	Christian Marangi <ansuelsmth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
 F:	include/dt-bindings/soc/airoha,scu-ssr.h
 
 AIROHA SPI SNFI DRIVER
-- 
2.48.1


