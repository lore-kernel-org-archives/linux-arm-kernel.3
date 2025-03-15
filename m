Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EDEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=; b=cvADnJIjGsOEatPF3pSocrRY65
	d/N8lD79U92o7blAmP0wKzLy4wF/WakI+F6SETyC8ChQBin0Q1UK7U9rfjMoZN9erQZWSg5rxM/2K
	kzyVk2uv6FwtcxWBgEM0DMY7/UGOSv7pvTok7DxG1PHwqBV6hxgTi6uvcLv/7ciKmPLqFozwHKEvs
	RGsbAQet02azMjOdYj9QmuKsp+ZxckLS2Obh3OEixwazs6iwBt85YieY0V4GODmsRb4VeLT416TL9
	OvyWMRQXr70Xd/Q6d2WCUlfRDWMdkQbRV1Mki/lE/lLJ7R5Hi4s1kuso5FYLMlF3zrRXapjz7pt/Y
	Aej4vNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTk9-0000000GXlu-2ggm;
	Sat, 15 Mar 2025 15:48:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttTgp-0000000GX03-1QlH;
	Sat, 15 Mar 2025 15:44:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-390cf7458f5so2553429f8f.2;
        Sat, 15 Mar 2025 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742053481; x=1742658281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=;
        b=mg7bWDL79Nu80JznaYY1zl3yivEqB696yk8n1vxar+nT0f/4HI6RQ2kdRETQY/2uNb
         5CuNpU0nyQwpb11MHI5Lb4MS/jvTu2z6owCxZ+BeXPocr8iORDku00uTO8D5OwwXLkSp
         Cou51U5plShWPahUAMPvzDET3r5M1PHTp7rfdCTQz7qUI46ztWd6HtMn9KXzBzsk9uhu
         OI7XP+G7PO1nEbzpzfVyMW9h86SDxXwI6AEnGdlfmskxxfCrR8OYjf9+k6hdhImz7Xd3
         2WbLwlrJ0GzB8cfPMNrvnr1DwyOf65GaIMcNl4L549KZ03ogiCloBBVry4fcixe4SeBu
         zhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742053481; x=1742658281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=okDifKvdAt9bOzQUyi7HcNUDD0Vs7iNNXK17iMvuX8c=;
        b=nMU0hTMQ1SRk44slQZ9tUF0/UVRViDJTwbz8d8N5YElJV4bdWlT86msLEGLnDVmFe8
         Vm1cfOG6K8LxJy5TZD1r+0Lm+vP4eUneF/gtC3ipAP3GbUXUdkdtbK0qm5STAe8ZvsWv
         fnMnZ1NaAR66esJOFYhEmXwcQ56PaajgTTrlDgVMOM96d7r6wQOQHfUEN+S+SSWllUfC
         ce/lxnV8bUYuaDRKPRUnrqjLV4M7VtlpqElR2hGBSltxdjnnTxyp0xqDBm9qsMIXFZ3J
         PyC0SlWlrO3es9eoFLE4pap9/pzhggLVqr+MyTevEVZDhCtUsDnHQlGmQAxSAND1keDI
         UgPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJRS4uj9pMwDQa7dtRTAjw0oJ6mvSmfyv8/y6SsaIyqJGdMuzXi84fuJy35/tvUIsAzIBh6ZQS3b4a4R9u4JOy@lists.infradead.org, AJvYcCWbf5wCUTsu1ceXcs/SEbRQ2MrNkpNRo4ovoWFKHYqQw7fZlaL6kY7RTolz9GkJyc9Yiy+iUibUPTr5j95jELY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyAtz022hgsxRTus5NsIPl1RLgl49fCl0wcXHOvdJfC+YXFXpTq
	sgKdBsdZUdJfFL/wEFoOe2nVmnshwz0UjaoYfmOmO3VzMo4DeAVT
X-Gm-Gg: ASbGncsQr+54TMi+u8LtednfswrDXySsRhp/KHaw5PSUcXfN/b7jguFdV+sr62vyFIA
	2uJdIOkNujU70ku3dLgE0yjXje6O8M4bnPIol05yr3DmpIsmMa3jlkX08bwlOfiOi2eAl5GIqN1
	tLMxEbHSMMdFtBw0g/yTPCnhW4WTU01BRgrjpLNkFjEhN9qKSODUIsPOLWV1i+UlvJLmwHvBtxZ
	ZZLoJtrmiIRDy/xvwS1zzkqYvzgguGceYl86pHVJKC/8xQhYMPOFMJ4K9cDuMgcS4CpA0nonBHr
	t0TK12ydZZaD31D4tTU+H5PLyLrBagx4XDXq5/z7UazEFqgPX9ifb0KA8aZYfeYm/jTw7aFi5pb
	VBlVhRNOhDBlM/Q==
X-Google-Smtp-Source: AGHT+IH0OLRKrXpJrRaoJd0L3/pG0iIlC1HdRZdErik/X4m/88HEG/SGXSmlbLE3Y1ZZpFL0dkO6yQ==
X-Received: by 2002:a05:6000:1567:b0:391:2f2f:828 with SMTP id ffacd0b85a97d-3971ee443f8mr9152016f8f.29.1742053481230;
        Sat, 15 Mar 2025 08:44:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d1fe0636dsm53464195e9.11.2025.03.15.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 08:44:40 -0700 (PDT)
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
Subject: [net-next PATCH v13 01/14] dt-bindings: nvmem: Document support for Airoha AN8855 Switch EFUSE
Date: Sat, 15 Mar 2025 16:43:41 +0100
Message-ID: <20250315154407.26304-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154407.26304-1-ansuelsmth@gmail.com>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_084443_378071_39D2D941 
X-CRM114-Status: GOOD (  15.27  )
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

Document support for Airoha AN8855 Switch EFUSE used to calibrate
internal PHYs and store additional configuration info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/nvmem/airoha,an8855-efuse.yaml   | 123 ++++++++++++++++++
 MAINTAINERS                                   |   8 ++
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
new file mode 100644
index 000000000000..9802d9ea2176
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/airoha,an8855-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch EFUSE
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 EFUSE used to calibrate internal PHYs and store additional
+  configuration info.
+
+$ref: nvmem.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-efuse
+
+  '#nvmem-cell-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#nvmem-cell-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    efuse {
+        compatible = "airoha,an8855-efuse";
+
+        #nvmem-cell-cells = <0>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+               reg = <0xc 0x4>;
+            };
+
+            shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                reg = <0x10 0x4>;
+            };
+
+            shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                reg = <0x14 0x4>;
+            };
+
+            shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+               reg = <0x18 0x4>;
+            };
+
+            shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+               reg = <0x1c 0x4>;
+            };
+
+            shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+               reg = <0x20 0x4>;
+            };
+
+            shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+               reg = <0x24 0x4>;
+            };
+
+            shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+               reg = <0x28 0x4>;
+            };
+
+            shift_sel_port2_tx_a: shift-sel-port2-tx-a@2c {
+                reg = <0x2c 0x4>;
+            };
+
+            shift_sel_port2_tx_b: shift-sel-port2-tx-b@30 {
+                reg = <0x30 0x4>;
+            };
+
+            shift_sel_port2_tx_c: shift-sel-port2-tx-c@34 {
+                reg = <0x34 0x4>;
+            };
+
+            shift_sel_port2_tx_d: shift-sel-port2-tx-d@38 {
+                reg = <0x38 0x4>;
+            };
+
+            shift_sel_port3_tx_a: shift-sel-port3-tx-a@4c {
+                reg = <0x4c 0x4>;
+            };
+
+            shift_sel_port3_tx_b: shift-sel-port3-tx-b@50 {
+                reg = <0x50 0x4>;
+            };
+
+            shift_sel_port3_tx_c: shift-sel-port3-tx-c@54 {
+               reg = <0x54 0x4>;
+            };
+
+            shift_sel_port3_tx_d: shift-sel-port3-tx-d@58 {
+               reg = <0x58 0x4>;
+            };
+
+            shift_sel_port4_tx_a: shift-sel-port4-tx-a@5c {
+                reg = <0x5c 0x4>;
+            };
+
+            shift_sel_port4_tx_b: shift-sel-port4-tx-b@60 {
+                reg = <0x60 0x4>;
+            };
+
+            shift_sel_port4_tx_c: shift-sel-port4-tx-c@64 {
+                reg = <0x64 0x4>;
+            };
+
+            shift_sel_port4_tx_d: shift-sel-port4-tx-d@68 {
+                reg = <0x68 0x4>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ffbcd072fb14..576fa7eb7b55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -719,6 +719,14 @@ S:	Supported
 F:	fs/aio.c
 F:	include/linux/*aio*.h
 
+AIROHA DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+
 AIROHA ETHERNET DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.48.1


