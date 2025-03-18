Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7222FC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5HB7O2zhf9k5PDHGyjQDylrX/O//96forEKvCV37O0=; b=TJM5kByI853E5pjBNOxrHyVtE/
	rPYj9Py1tRtEZz5xpCReL47JmwkqBfAyVcKAOdZVOwdXg59fDr8Ml5UEh9UNwKY9eXBax1AI3j3Wh
	AyZHWoru4TAod6YcQSHS7sqcW0TEyptVZEPJQfMbwNXh5wNExxaUvXM1jXnEtAMHP4Bisbp2JNN3G
	czw6MspGscBMpjMpCrngNKxutrVVlm1tP/6zsvljzb90WdTEJJLZA2u9qpPl9OuR+r7HcOt2tM9kS
	0PcpgSUEJWKfBQ2LqKaaKKAEb3Ibvwd0F8lD430ptsrqH9hyB8Rn2rfD2/EXkKEml7e+KJGLGvVli
	/z/ylSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufRU-00000007G1d-1Aqt;
	Tue, 18 Mar 2025 22:29:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufMY-00000007FAZ-45Xj;
	Tue, 18 Mar 2025 22:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336681;
	bh=ebGgU8hC64Kx1MeaVNKAzJY5DqxxZk54iPOshavrJOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H85OROV8YeghJXytIplf5CcPOR7ZCEqVXqfu6vLBY8AfJxPraTyWE5X1VnOcGRLf7
	 j45/TRpM1MxGTYrfZUOQwPUp+yzdrugLE/fRdcgHesoAleL8B91N9iY+BmhvpZgvis
	 g/VkOlq7XpOCelkbpo/oFreA2TM/GkniSaA7Ei6WyosFrMBW5rB2owyQ9nBmOMdIdq
	 kiwDi0N/AkmCCKgmM40xmcb+69WQFeHxMzWuJltOq/HRXF0mWy4QTx/nAJeZMiMFHs
	 P6nAxzD+3RDQvH4qzoqzaSN+Z1vWaY1TmDVUrfNsuhEAWzNbOb+L21/0BHjeYWw1Ho
	 mEIMworYuAP+w==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E27C317E0FD1;
	Tue, 18 Mar 2025 23:24:37 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Mar 2025 18:22:16 -0400
Subject: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_152443_182727_4918935F 
X-CRM114-Status: UNSURE (   9.42  )
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

The SCP present on MT8188 does not have an L1TCM memory region, but the
binding incorrectly requires one for the dual-core description of the
MT8188 SCP. Remove that requirement. Also update the minimum number of
reg and reg-names to 1, since as this is a multi-core SCP with no
L1TCM memory, only the CFG memory region is present in the parent node.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../devicetree/bindings/remoteproc/mtk,scp.yaml       | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index ee33c233e44f3d51f0851b35697a24208c87f68a..04348cfcb0424dc78ff1ddd77665285a052925e9 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,6 +171,7 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
@@ -196,16 +197,28 @@ allOf:
       properties:
         compatible:
           enum:
-            - mediatek,mt8188-scp-dual
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
           items:
             - const: cfg
             - const: l1tcm
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: cfg
 
 additionalProperties: false
 

-- 
2.49.0


