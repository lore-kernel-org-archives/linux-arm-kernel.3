Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 303BFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ii8Rpl/uFQ8Tn6Jz+3FNiqIY9+Vonh/4EcNS3Y1tXFs=; b=oPdNnLFUqdsfZohAvouUozZT/P
	7kESdTlVhlyshjKgo+emXTI5mfDzIRCsihFy0rnWHkYlGZ41bin26W3T+P2oyA04GD4/LMgWQZ77e
	8sy20zRgsZn8aokQhwLlXl0NqwToyhcuMODoh0RHujYUmdsNxc0XL6FKZvuoTii83sRlwZxwjRNMK
	Zbj9ghuLgQkoGPlXZsbOvrUsT89TYjLCUaSLXji/GNBOmzktU5HN5T4g4GZiLxVta1GPeR+6YYZny
	z1R0xhxUAPgxwb4xaCcb01u06DlEZZBPdoxZyvZwT/weNgMWE3ufTCUq9BBOmVTOwpml6YokRrcXz
	QHYjLd6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIqC-0000000BHeC-1BE6;
	Thu, 03 Jul 2025 12:15:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHiQ-0000000B5sn-1Lti;
	Thu, 03 Jul 2025 11:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751540572;
	bh=FfEf8IjEzBgA7KdoP2f2VYa26/4KslWyDnI+7I3w8CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AtqbVI5qDXQmhh/Uz+G519yx06QVmReK+eFyKOSuSCT4RGTuxoQK7EmXzn5LnXllS
	 3OfYPzL4Becd92vdYEPCAuf7cxrUtz1lxx3nBs70f0z2rj+yU/RJzBIsDT31MdKxUC
	 IKsag2eTxFDgOixpcRaHgvCNG5zBeyzwLnsHwvZmlMSb6kN4hstgBLsZwUCNtZSENz
	 8lBSLaxiLMLcCh/X/kp8dBCF+5hZsjz1ZbYI1o7eyxKlrF5EScQAWu6BHORiIn0k/9
	 BGbHLRF1NE+IcL2XXjk+jo8jf5lUpocBHdNYqRwV/NbBATlf9LfG2xQuxETfy2YANw
	 FhaZ42q2omvYQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA0E917E09C6;
	Thu,  3 Jul 2025 13:02:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	y.oudjana@protonmail.com,
	fshao@chromium.org,
	wenst@chromium.org,
	lihongbo22@huawei.com,
	mandyjh.liu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 02/10] dt-bindings: clock: mediatek: Document #access-controller-cells
Date: Thu,  3 Jul 2025 13:02:39 +0200
Message-ID: <20250703110247.99927-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
References: <20250703110247.99927-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_040254_502912_1071E79C 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

Allow the #access-controller-cells property on all of the infracfg
controllers on all MediaTek SoCs, as this always acts as an access
control provider.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,infracfg.yaml         |  3 +++
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8192-sys-clock.yaml | 15 +++++++++++++++
 .../bindings/clock/mediatek,mt8365-sys-clock.yaml | 15 +++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
index d1d30700d9b0..27f1a31c3424 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,infracfg.yaml
@@ -47,6 +47,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index 1c446fbc5108..2a1bf9073b7d 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -36,6 +36,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -48,6 +51,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8186-infracfg_ao
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
index bf8c9aacdf1e..f1ab8b0e0a98 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8192-sys-clock.yaml
@@ -26,6 +26,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8192-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: syscon@10000000 {
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
index 643f84660c8e..b6f074f98db7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8365-sys-clock.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#access-controller-cells':
+    const: 0
+
   '#clock-cells':
     const: 1
 
@@ -38,6 +41,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8365-infracfg
+then:
+  properties:
+    '#access-controller-cells': true
+else:
+  properties:
+    '#access-controller-cells': false
+
 examples:
   - |
     topckgen: clock-controller@10000000 {
-- 
2.49.0


