Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A9CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtV5SUvwvrg8UyimeLpd/uaLqLj4qfz0Gapl7J7dMis=; b=r/w9dgxHCoi0krAhHFy7KbIVQV
	JF4WnsCz7058L0iUz6u6eEIrPDSSLyyXEZXypYGJ1nHddqj1PP/yjmFKD2lXMlncYoWWkp4JriAKz
	bW1tN2T/QwYVuPbD60TW5kGAfcjkLun+ieFt5tur6NHgki1wcfOs3wBjzD3EmhUDGziPBQsMU/3cM
	t+Sx1Hpx/A1wh4uPa0TCkdxJquNtdVrdYa7hUw/nCH0TsifhopF1wzKI1K1+3B/JFrrIU5gfmtV/8
	KOSDy8iM/PHay3Ju+lWavDvzU+vRiIjRv3E4/KZQV5NdB8WWXW4E9CI8APd0xaUVWW/KfhB/EXPL6
	UK/E7YJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDFM-00000008i0C-2ouj;
	Fri, 24 Oct 2025 08:34:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDEa-00000008gvv-2bIA;
	Fri, 24 Oct 2025 08:33:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761294794;
	bh=Pq/WVq/FGnJf2qadaqsCrtJV3uFB5eNBkvBYl74ASqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArIb3gttdjn8noxzoE8GYtvAKDWjPg0sw7ynaiy9liIGxkqY/aVXv2WZHqHdLWqyh
	 xXmTcCXJQLoifGNHkWBhsRT+zzXxQfOtvBPKc3eAe0ThB94EkccwEG6Q+v3ucmquIE
	 f1cnzrEyFqzLThek1qjVoLnNxE9r0z3YHGKhbchvlVliF8VMs6bgzqevA7bMkBef6A
	 AvM+LJoGfr5p91gEaziyoqyLdKyaL2e6/arDFJRjjshrdcvFcLu8URfRLTtmcoiQwn
	 CHLUqdAKiQxcLworG88tEHojiBt7+N010Kn6KA4WaPChIULKSfG5n5i0+sfbQKqwuv
	 QKOSrZ5KhM7Cw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 134F417E141C;
	Fri, 24 Oct 2025 10:33:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	laura.nao@collabora.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	y.oudjana@protonmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 6/7] dt-bindings: clock: Describe MT6685 PM/Clock IC Clock Controller
Date: Fri, 24 Oct 2025 10:33:00 +0200
Message-ID: <20251024083301.25845-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
References: <20251024083301.25845-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_013316_975609_6A636B9A 
X-CRM114-Status: GOOD (  12.72  )
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

Add bindings to describe the SCK_TOP clock controller embedded
in the MT6685 IC, reachable over the SPMI bus.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

NOTE: This does not contain any example because the MT6685 RTC
      will be added to the mfd binding for MediaTek SPMI PMICs
      and examples will be there.

** For reviewing purposes, this is how the example will look like: **

  - |
    #include <dt-bindings/interrupt-controller/irq.h>
    #include <dt-bindings/spmi/spmi.h>

    spmi {
      #address-cells = <2>;
      #size-cells = <0>;

      pmic@9 {
        compatible = "mediatek,mt6363";
        reg = <0x9 SPMI_USID>;
        interrupts = <9 1 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-controller;
        #address-cells = <1>;
        #interrupt-cells = <3>;
        #size-cells = <0>;

        clock-controller@514 {
          compatible = "mediatek,mt6685-sck-top";
          reg = <0x514>;
          #clock-cells = <1>;
        };

        rtc@580 {
          compatible = "mediatek,mt6685-rtc";
          reg = <0x580>;
          interrupts = <9 0 IRQ_TYPE_LEVEL_HIGH>;
        };
      };
    };

 .../bindings/clock/mediatek,mt6685-clock.yaml | 37 +++++++++++++++++++
 .../dt-bindings/clock/mediatek,mt6685-clock.h | 17 +++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
 create mode 100644 include/dt-bindings/clock/mediatek,mt6685-clock.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
new file mode 100644
index 000000000000..5407ebf2f3b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt6685-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Clock Controller for MT6685 SPMI PM/Clock IC
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The clock architecture in MediaTek PMICs+Clock ICs is structured like below:
+  Crystal(XO) or Internal ClockGen -->
+          dividers -->
+                      muxes
+                           -->
+                              clock gate
+
+  The device nodes provide clock gate control in different IP blocks.
+
+properties:
+  compatible:
+    const: mediatek,mt6685-sck-top
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
diff --git a/include/dt-bindings/clock/mediatek,mt6685-clock.h b/include/dt-bindings/clock/mediatek,mt6685-clock.h
new file mode 100644
index 000000000000..acc5e2e15ce1
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6685-clock.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT6685_H
+#define _DT_BINDINGS_CLK_MT6685_H
+
+/* SCK_TOP_CKPDN */
+#define CLK_RTC_SEC_MCLK		0
+#define CLK_RTC_EOSC32			1
+#define CLK_RTC_SEC_32K			2
+#define CLK_RTC_MCLK			3
+#define CLK_RTC_32K			4
+
+#endif /* _DT_BINDINGS_CLK_MT6685_H */
-- 
2.51.1


