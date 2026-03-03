Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CC1EC1433
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 11:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a+aiHDCu9PmrUI+7fcpYIkd7HMwZLJ6c7k9ZHHUYCpA=; b=mYVgHD+6KAdYzFvG6SgWIfppue
	07NidyzVgaSw60ZNtoPSKp7VASjGTt3BjraHs6P2iQquj8zz2YYvR77TUopgAeGNQIfJIFvfIlJKO
	LbGohe/74uGkHmjEw9f/1JoBpMj6b7OoK4Kw92LdKN4WLa339VT/EKW+bhSDTWihGGMvgB0K6ma7r
	0xAp9eftNcReTJhvdXapiPB2DdXOdWgAWNGJCAL4Vo2CZupZfKluA9OjLLnqdcLI43CLHsB4dfVst
	TfaBG0E3hwc46+JjKElMTNVfLw06rYHNarOTqK8qHngcoYVlz9xaM7GCHjCf2mPH1pJ6e8r8PTevd
	7FJaiaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOOO-0000000F7I5-0C6K;
	Tue, 03 Mar 2026 11:58:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOOK-0000000F7Hi-3Qe6;
	Tue, 03 Mar 2026 11:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772539097;
	bh=aODRgbbjQIg8M73gNMETnXa7r/KLRoXLOm+tPuOfZPg=;
	h=From:Date:Subject:To:Cc:From;
	b=ctoNr/v9Re7nFK0WqnA/WyHeUitF2jx6LlM9JXwgMuNA+uMvU/jxUxAz9pdjoqkN7
	 uWHg3qqsgyH5AJ9q1AZgJfU8gfJdeKU/fuF1MY3CsSAGfO1GbupECf1i4qSLASJqlb
	 YYscBZd9yWiyci5hUD1TBt13WKpzut+0vl4bEpqjL3NVpPo0habFYDQpkn8a1QHXzg
	 ytrO2Zdx3UDMp2n44xooSSGEH4C9p/nEPUJGt95/9jnk3mgrCZ/ij3t4Nko7yJl9fr
	 Zk+RxeK3e/cyoz1vEIWLZCIpUtHhg+dsA112PIt/RSFIMTd6+SkcXM8pjUkxZ4aNXF
	 FVAQNMVhb1/Qg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A340D17E0454;
	Tue,  3 Mar 2026 12:58:16 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Mar 2026 12:58:05 +0100
Subject: [PATCH] dt-bindings: arm: mediatek: audsys: fix formatting issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-mtk-audsys-dtbinding-check-warnings-v1-1-e4e1b62f060e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTumtIlGrmJYDO0IE0LRTkEN4
 e42svze4v0bKCdhhabaIPEqKnMsqE8V+IFizyihGKyxF+OMwymPSEvQr2LIncQgsUc/sB/xTSk
 WKVJNN8umI1dbKE/PxA/5/Cv39nDi11Ji+RihI2X08zRJbqr1ejaYvIV2338WB6WzoQAAAA==
X-Change-ID: 20260303-mtk-audsys-dtbinding-check-warnings-a1a92e0ba312
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772539096; l=2932;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=aODRgbbjQIg8M73gNMETnXa7r/KLRoXLOm+tPuOfZPg=;
 b=RKhLJsRCHhqkx4Pswn7tNHxP8qIGxM0Xo5xl48hxS+sW6xU52EWeNQe4iGjV6cENkJyVHwvcI
 iW0SClS9hcnCpwozd4yQoWGrPiqHo0o2VLYcunQN9NV4Ase8EXknNsY
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_035821_055725_1AE59452 
X-CRM114-Status: UNSURE (   7.87  )
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

Fix indentation and drop duplicate newline to resolve the following
'make dt_binding_check' warnings:
```
./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
  [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
  [warning] too many blank lines (2 > 1) (empty-lines)
```

Fixes: a8e3d66ff5c0 ("dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/arm/mediatek/mediatek,audsys.yaml     | 63 +++++++++++-----------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
index 09a6c16e7e8299c5a271df24f18f7a585046a7c9..9aa39b002361d9f6fbaacae5823b3a811a0043ca 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
@@ -49,38 +49,37 @@ required:
   - '#clock-cells'
 
 allOf:
- - if:
-     properties:
-       compatible:
-         contains:
-           enum:
-             - mediatek,mt2701-audsys
-             - mediatek,mt7622-audsys
-   then:
-     properties:
-       audio-controller:
-         $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
-
- - if:
-     properties:
-       compatible:
-         contains:
-           const: mediatek,mt8183-audiosys
-   then:
-     properties:
-       audio-controller:
-         $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
-
- - if:
-     properties:
-       compatible:
-         contains:
-           const: mediatek,mt8192-audsys
-   then:
-     properties:
-       audio-controller:
-         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
-
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-audsys
+              - mediatek,mt7622-audsys
+    then:
+      properties:
+        audio-controller:
+          $ref: /schemas/sound/mediatek,mt2701-audio.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-audiosys
+    then:
+      properties:
+        audio-controller:
+          $ref: /schemas/sound/mediatek,mt8183-audio.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-audsys
+    then:
+      properties:
+        audio-controller:
+          $ref: /schemas/sound/mt8192-afe-pcm.yaml#
 
 additionalProperties: false
 

---
base-commit: 9fad1d148df6f36105159c2503d0ecb1397bc89a
change-id: 20260303-mtk-audsys-dtbinding-check-warnings-a1a92e0ba312

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


