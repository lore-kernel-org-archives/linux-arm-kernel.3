Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA0DC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=; b=CiB2QYDc9SNp2+ZCRSPQcmcP6L
	13JYfjcEqBwCEVI2NithURzrL+CpSqioKqWltvhjnskKLCWc8K/BatWLfhln2yTUcwe9m2tIG0OzE
	jZR3iMppfts0jBNSuU2gj66UcJnyjTSkSVXqa0FsAR0izjSxHrIXAKtX05yLRqCYnQ7ASmkh1ouBR
	/AUID2xl1Bhtuc7+FlBwgO4zgzClDViaeBiroApPwGwyPgEfKOzOSUbD9yy6eGR59446uyWQv6oCI
	5XqEbffsxKPvgpX4pnRM6M+qp9IwmQhKidvVQfs1T4XgaXr2mMg1qa7Xlie6ouMbiqwknKvX3wb5j
	Cm1EKJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlI-00000008VAR-30UU;
	Tue, 08 Sep 2026 09:05:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rlH-00000008V8X-0ugZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=; b=j8B5yYyQG4Iq22CaocfH1OBXDv
	HNQ5fI7QBPhOGvXh1vzhq9oLdTQ+yvP6Pe4kn/HuhGZo1TjS/yGfjSh4yvhRq9YeEx2DKt4RwY+ew
	r5QRyaHdfeEi5aiOG6e5h6cvtVT7rwvWdy+gI6MePrXSdRjT26zg6DB4ovIqgbq6ODp22691kVuup
	84glmVq9Wq3lgrhIszf94ysJ5r45ICeMteKP/3r+Oltg5N2uxcyGzjm0uLFYEJHmpWuWywyXb+Fr8
	WXTZlkzqsP3VdunB65eIN2f4GN9LErNxluwQ4CxAhFTYiGCx4mEEjI0gDUUdWqWJ+QeS632xoNjrX
	FBnaIgvw==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rlD-0000000HADJ-3iHn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:05:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47fe89fb333so2848436f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858298; x=1789463098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=oai+8ej2110M4Ks7pH+RfHEOpmK70GD0jKYmBWcQZebZjz2AvT6OMqqslwjiFZJzQF
         7bJNvSaHt3/FnRbcf8q/3FQTNpF4SbWasJyX+gviJr5PaZmFkuF72Usb5hFkc0I6EiWN
         bsAERNWY1UcHETULB0SE7JCoOexcnQsbA2VR4Enbr7xGs5qWn1FGe8zNE0Ff6AsUYik9
         YpSNV/ay0dfQXI12/n4cYTOmnwKnngM3NQDfaqQRN6ahBdTcZTlkDxbbqsqb1B5e1P6A
         2JHpIvtDEz90RGQa9D2F/645F1ncaFcy4srcyE2VoxYZb6Fmdz3HHTEIljzA3VGPUia0
         KNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858298; x=1789463098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XiNHpVYuqEREvxb2cZ27NaECVLCJPPbGo8j+h2MHZLo=;
        b=RFYLfLBsBoaMcEeo6hVzteKTkgaaweaU3/ta0Ss7i1MMlQ4GZpH/vz8TfOkMexN6IM
         TTdbYqICWDomvMzd6tO7Qd3F8kFSn7RkzVZr8OYs00I94DYlx4M9eWcSBgZEZDfGJKJx
         swFGGSj8DEg2Tmg6azb0egKiutlPkWBiYCplbdLCcj+vNjth96mlQgEfB9w/QD7wdM6D
         c23wuwVknd4P4znMH4IHj6NFN/14THAy+WCcWZ+hyrnQ7H2bnL/4w7mbopEyBerKs2zc
         IUQRE1o2h+a5StZkU7bm4hXWuleQj6bOh4Z7z8saGnwfO3K3mGc0NSdAsr1+QzZhJO55
         U7nA==
X-Forwarded-Encrypted: i=1; AKwUvBwvzmxh4A5Vn3xyXUVaMxqO+1PjbVPixZ38OD9NQl7duLYTpNBc22h9YyLqlrfSVYlUUEmew949lYcsXtWGuqPS@lists.infradead.org
X-Gm-Message-State: AFuF++lSO5YBI9RqwnuuOfeT9taM8EOG0vFc2roeN8WRXzNgqt1fADvu
	TDhRlb1mzDTAwyg1dAn8shbxpM8DvcYEYVkJOdgHkMr8FR1iVkV+e0+N
X-Gm-Gg: AYBFou27tnNqXccvMiK0ZpSKlFzd9ZFPdtjjbAJ7JL1gbGLvI2oIMa1QJ9ys6PFon1M
	hwPkuFJIFhXtrHkc9lTgJXESZ8Ldo+DmgD+5xRDrV3Mf4xjZ14QtecjMh6kZoZJEYlGrF/6s2Lw
	ARQ1iOdUORPtFjFHwks79FKA+RAQlR+gNlykqcX+1c8L+usAsFMNHdXFkjCHiqSGb6y92/YQr5v
	IiHU1FEBo1g8w8Uz/L9/Y1SDDEC7QqFt9tNir9S5ZDwrTzBARghi9iJRw69WuvmnPJznCQy1zI7
	lixtjQqz1+LghXEj/NZzRhQ9v+PjO4rC00CkSd4QZ7sxsQvpbuT0kKspBjQ1Pj/5+9CDiDTCRlb
	FCsFQFx2S5DLWEIHQWHbLDbu9rWdkhW+AdDTrGFmw1D/VDjQtYiMFJGY8/xbJc9ylvEBvbDjNq6
	LZ3GWBOqiQLw0dCBXflLl9afNXk1ItM3ammX76hVJXufm5MR4gByQLRTSQX2JgZUCX7TqUETZHj
	fn45abQ8RBWknaa8B56KG6+MnI/jQVNOM2saZg0Z+ev+tLZtBaMmEzMr6Ti/Mk=
X-Received: by 2002:a5d:59c1:0:b0:485:a46b:bc13 with SMTP id ffacd0b85a97d-485a46bbd19mr4173287f8f.0.1788858297632;
        Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 1/5] ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
Date: Tue,  8 Sep 2026 11:04:43 +0200
Message-ID: <20260908090448.3332-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100500_129767_AEEB8362 
X-CRM114-Status: GOOD (  14.90  )
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

Add YAML schema for Airoha AN7581 AFE SoC sound card.

The AFE handling on this SoC is very basic with clock always enabled
and all the power saving feature not available.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-afe.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
new file mode 100644
index 000000000000..80d9e87f1470
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AFE PCM controller for AN7581
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    afe@1fbe2200 {
+        compatible = "airoha,an7581-afe";
+        reg = <0x1fbe2200 0x9000>;
+
+        interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.53.0


