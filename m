Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16440D3B985
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBw3BmnZutI/+0YAFeSFCKYgmHl76bMDmhmBxi0sBd0=; b=dghFBE0pmhfDIL/7W7qj7nQ6jr
	nrdPVcXWXIhcSgLW5C+7CEiW84GA+F4CuWlaSTOC5uxUkwD9FAL8dKmrc6kdrx6y885D7XUTyCw1b
	CYTmkjvXpxauU/w+bZctZd5QYmjw1FzIVgu5/YShP3RNlwpc/Hdfn2nkjppdpjKRErX74LzAuzp5Y
	z4D1xWWWpEWJHQqNHOfRuj+T4uSmTFDSXZ5IVptD05sJXBL69SHt2B8TZ132t43wTbna8Z7q3BuWu
	jy5znCmmHi7l7DcmCbeNGoS2vNYqqtam1tb/br15JelX9fJUC6872PSxB0N/5S3qvghnNvdFflJlD
	Dpsj6Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fv-0000000EWfP-1kv1;
	Tue, 09 Dec 2025 16:34:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0fp-0000000EWYP-3be7;
	Tue, 09 Dec 2025 16:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765298087;
	bh=D155m0dMAjWiokZAY7tsZUWjRlmivh1T9mFpxqvCODE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j+qrwXrNQGYEoW43YEXq6se8XNSsAjnX/kixuXIUDU74/DHpALB71ZkSB06ZZIAY9
	 szeoeb5GGVMSFik8Zs2Sq3xGh4yBTJAoD3AdKqzjaTZvU+k1vOut0xLTMyXAQNN8fz
	 BMRxU+zemYTlvYeUndmN3trp9Vt+kH88W3SmQ5MaDJF506lmiA5weqyBMmdTiJEmIF
	 LYXv21ATFzyRiFHxy81WrSDcM8trrrfKvBQCeBn0z21N1fpnQ7fcJVAnMqFyOj1R5e
	 w4UMYIBxBMvvLSo5MyPgfal1XLwkY3/HqOJZYDP5lD3RaSGvc+av9Hou7D2K5njXsV
	 IxCY9kjfeA2sg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4D2B17E153D;
	Tue,  9 Dec 2025 17:34:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 09 Dec 2025 17:34:33 +0100
Subject: [PATCH 03/12] dt-bindings: phy: mediatek,hdmi-phy: Document extra
 clocks for MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251209-mtk-genio-evk-hdmi-support-v1-3-9a6106effba6@collabora.com>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765298083; l=1906;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5hUKertYPrurznVcSH8uzvnKUCkTlAWRfoUyf3tOLDw=;
 b=yGTBS4qBLe2IPVOGk6LE9R661NMRTP144cZHShDIwPCuvjh95qxcTz+VZsNYzgulRenfyG7SE
 74uO8BYyyHYAxUnZ99zDWC4K8/g/eIfRbkDcR4GcrbTI6Oe1jkPRzJK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083450_090352_699330BA 
X-CRM114-Status: UNSURE (   6.84  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

MT8195's HDMI PHY block has 4 clocks instead of just a single one.
Describe the extra clocks for it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 36 +++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index cd4ac42ee45e4648ed512f68f6f28d1f3f2e1116..91f8118689d5e838c4d75264822bb09a00fea21b 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -38,12 +38,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: PLL reference clock
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: pll_ref
+    minItems: 1
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -79,6 +79,34 @@ required:
   - "#phy-cells"
   - "#clock-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt8195-hdmi-phy
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+            - description: HDMI 26MHz clock
+            - description: HDMI PLL1 clock
+            - description: HDMI PLL2 clock
+        clock-names:
+          items:
+            - const: pll_ref
+            - const: hdmi_26m
+            - const: hdmi_pll1
+            - const: hdmi_pll2
+    else:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+        clock-names:
+          items:
+            - const: pll_ref
+
 additionalProperties: false
 
 examples:

-- 
2.52.0


