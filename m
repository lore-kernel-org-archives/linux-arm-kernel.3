Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770ADD0C84F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9pHlsVVeZpxMIuezmmTJQLg3Gzv7LvrExjdhx0LN0Y=; b=yddbVk7seLudH+fuQiUQ8RtJe6
	CGxVX9EBGvcQvEOL3tiuxE+3Cs42jR5+LaadDyXGApkVrxr5Z5FjPPYLgq1ZAGq44zBF7r7Ub3Zsx
	AgQZ7qcuJkLKXHW31mEAdWZ3dgVCcSF23zhuHIJ+thTB2+177bkmRjVNfxKfiOXaG6Ujo3TntjDQu
	txFZK62feZYW2zVtBXa2l/2RFRQA1WgPWDxiTKCAjzaETvy3nNTLDuOJh2KYYM/Zb3r7hTSUGqJue
	dqyU9Q1vnIsMChDJp80XS8UzHmtUdfTSGhuAfnQO7xUvQd0S+lP2sFWBtMZuxfqTejfWq/+jiu/Tb
	WCqoMO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8q-00000006xcw-2VCc;
	Tue, 13 Jan 2026 11:00:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfc8H-00000006x3p-2ndU;
	Tue, 13 Jan 2026 11:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768302015;
	bh=Tr1QlgpyH4V/BMEcHr0IvsfySZs0/Z/SUCzxP2lKDwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kn6uZ/m7jSwNQJqMNHb9+Hpuon9dUySJ4tnP5xf/piraEdEWy2U4zBtdtK7XfKarU
	 yhRnB8nm37ohZO8c3Cl9f2d5yt6/GspLDbJubfkw29Er72Jz9vTV6k1y6vMn4ucZiF
	 O13NDxJhj3VjaPiR54HjOo1nV54lhwrnzZOpCGkEjJEwXCkXZz98tIGFqxiSTsVRv4
	 L/+bcZ7FKDAfaAO7ZzquHDt6DT8s/vSUsOHg/v80hivxiM5nudJwm6I+PhQdIySHMF
	 JcEGdC/rCJcMIgUMJMnp4QvOBEqavclPCjrN7DMv1nmj/7fqXYFh+fwWq/YQeO7Zgq
	 GwIdfBevb8R4Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE62217E10C8;
	Tue, 13 Jan 2026 12:00:14 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/5] dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
Date: Tue, 13 Jan 2026 12:00:08 +0100
Message-ID: <20260113110012.36984-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_030019_849598_A8458188 
X-CRM114-Status: UNSURE (   9.25  )
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

The PCIESYS register space contains a pure clock controller, which
has no system controller register, so this definitely doesn't need
any "syscon" compatible.

As a side note, luckily no devicetree ever added the syscon string
to PCIESYS clock controller node compatibles, so this also resolves
a dtbs_check warning for mt7622.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
index 9c3913f9092c..c77111d10f90 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
@@ -14,11 +14,9 @@ maintainers:
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt7622-pciesys
-          - const: syscon
-      - const: mediatek,mt7629-pciesys
+    enum:
+      - mediatek,mt7622-pciesys
+      - mediatek,mt7629-pciesys
 
   reg:
     maxItems: 1
@@ -40,7 +38,7 @@ additionalProperties: false
 examples:
   - |
     clock-controller@1a100800 {
-        compatible = "mediatek,mt7622-pciesys", "syscon";
+        compatible = "mediatek,mt7622-pciesys";
         reg = <0x1a100800 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-- 
2.52.0


