Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19DCCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqz3k5kjgGcX4yGUb0pqq+L0xCtEa369g/C/u/vRTd8=; b=t6psqSgnOdUUELTF9acnEU1rYb
	y0T0Oc1wAU2oovnlnWAR9J+yt9L0T7V88QRFWRf5EMi9ekMt6jpVXEW1z+XmwBza5JIPIHibo6MEv
	uvyeYLBVQzNxQQABc7ywVPMtZFImnWOMtJG3hXXFgW+gN8F+8m9R3HEhGi/SPKpC0hDuqd/7x1xJ9
	BmXfsv0xE8I2KmRrd1W0HmiRjQx7ECMAAvhEdrRdhnw5QfWNwhB8j27J/Vwd4073EfMzON8+FA6xH
	saYKFge2iPdMJfJsulqnRfcFE1g9EI10FFJ/lyZqVXsN/dehOQ9+Viiqy88OB8hLFPhn/fLoToNtx
	gKWtJNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAt-0000000Djw1-2Ppp;
	Mon, 27 Oct 2025 11:14:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLAe-0000000DjlB-3La1;
	Mon, 27 Oct 2025 11:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563630;
	bh=ucrpNpirVQvPM327pg6rTANwRDYsaRl287bHhoFYCAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FCs0ednoSHr8wECBLTOdDOvYrQt2Qrw38wbiQycTkb1wWBRKSAS3ZoZfMatuoYb3l
	 aAK3pKR5dqgNdCG+svR4/JFHSVgp0xavNfvMcPNoTtGDTam1yKsf/J7cyvxGPWO3QZ
	 sphyvUi3rEfETvHN9cOl+OlUOAs4SnPve/4dnEQMISWMB1r18OZmG4lofATZrmCJtA
	 pU7zDZdWVObi20/YrUDuLgDYwv7Woy3l325lRG8VRx78yydJ3glukod4QvZ/oTPu/C
	 S3ek2WNLCeH8OpNlwOUzOvjbHNtjOkIaRLKpx8n3AaKiBZzvVX++AtdOf3v5gbFrK+
	 B9WU8JNA9DPxA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E30C17E141E;
	Mon, 27 Oct 2025 12:13:50 +0100 (CET)
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
Subject: [PATCH v2 6/7] dt-bindings: clock: Describe MT6685 PM/Clock IC Clock Controller
Date: Mon, 27 Oct 2025 12:13:42 +0100
Message-ID: <20251027111343.21723-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_041352_991095_700F94D5 
X-CRM114-Status: GOOD (  11.23  )
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
 .../bindings/clock/mediatek,mt6685-clock.yaml | 36 +++++++++++++++++++
 .../dt-bindings/clock/mediatek,mt6685-clock.h | 17 +++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
 create mode 100644 include/dt-bindings/clock/mediatek,mt6685-clock.h

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
new file mode 100644
index 000000000000..fb8703f7ee61
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt6685-clock.yaml
@@ -0,0 +1,36 @@
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
+                  muxes -->
+                          clock gate
+
+  This device provides clock gate control in different IP blocks.
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


