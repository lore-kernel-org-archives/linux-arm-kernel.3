Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EACE9C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cNPhfn56hhnyntPjEfHke2lx/LZF8+QUZgYQm+CWUo=; b=N/5heIKlUl46/sMp62jaFxHDlx
	COtZEQIaGU9ydWuP1Sodq2f2+ujs1kPuF8MxRBvvvHdRnnJZEqbjfDxEBfxh7et/s+6wvz4jk62us
	DDNOgV5Xo79jKHJMtBmz17+f0ILv7rVXEDY5XMYz6YGkoYugXhHC9EO9ai0Kfy2Ke13Hn31KVHlH9
	6T0kCGZbiWcEBWONmN9C//otADq9ZNFJKzs8ypB+J8z+G4JhT+YzBtyd48HWsE0wPWNUou+7nLOze
	1EwzpOlxEUjwSNRlHHIVHLp0swnQ0JzqpuQLnDKnNg01kuYJxA/EvpDJXcUVPmrqtzwn3mPMwNe+B
	lRGKanew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCRt-0000000BjOZ-2SM0;
	Thu, 20 Mar 2025 09:44:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCQB-0000000Bj8a-3WU2;
	Thu, 20 Mar 2025 09:42:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BD786157B;
	Thu, 20 Mar 2025 09:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9E8EC4CEEA;
	Thu, 20 Mar 2025 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742463759;
	bh=rcZ4hUqkPHAzf/+Hghm6DmFVxWHcdR3LRlMwrsk358A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HoMar0kaMGTZGFgYdsA/6xkvd6Jg7nxJRmZW5ySz4BE3YaZaywvZTjcuLHOvjM/12
	 KlDh7utBbWi/EV3HfEDrFE8X09gs6riSSJnEqWir+rCGcBXfiTcH6tc5BGld7/tLTJ
	 HGmsXUuQwx3Y7n7+9S19FqkvKgU1OFYgZdtkCtxkvb0w/gBPmnn3ta+DOwVufTq2gc
	 8WGq8HBBM6FfGJsjEaxXKU0aiA82biWDXs3CqWaNwxbMKJOiYkgIJ/SIZVV64xINpD
	 H9Pr1KOtTy1E4wcatLTpqm2rHkHtuW7JjzhIBIKWO0MjRCjAAKTqHZ/gy1KTT6YoNJ
	 OJG2FQLhBIddw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81C3C36000;
	Thu, 20 Mar 2025 09:42:38 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Thu, 20 Mar 2025 17:42:08 +0800
Subject: [PATCH v5 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-a4-a5-reset-v5-1-296f83bf733d@amlogic.com>
References: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
In-Reply-To: <20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742463756; l=2254;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=RBPG6lp45fxsEDVQ6Y1mIySEYTUUWfsM6OujOhVw3vA=;
 b=1iO6XQAAFeNeL4r0duOu23ksrBakwUJYF2Vj+z4zoFgsQqeIlbRVKMe2xVZqS+g5rZ/CT0RwJ
 0Xv7AQBqwweD0XX5PoEdJjlX9ggKLsGYWz7wIL7duhKXRJ8hXNgC1wO
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
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
Reply-To: kelvin.zhang@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add compatibles for Amlogic A4 and A5 reset controllers,
which fall back to 'amlogic,meson-s4-reset'.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -12,14 +12,20 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
-      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
-      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
-      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
-      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
-      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
-      - amlogic,t7-reset
+    oneOf:
+      - enum:
+          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+          - amlogic,t7-reset
+      - items:
+          - enum:
+              - amlogic,a4-reset
+              - amlogic,a5-reset
+          - const: amlogic,meson-s4-reset
 
   reg:
     maxItems: 1

-- 
2.37.1



