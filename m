Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F13BCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 09:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM3tI8mY+kGsTe04xj2cVMzBnTs9+D3oQzrLghj3T/I=; b=4OZay0fB63X0lKo/U4NUdd8VEe
	Byd2dNGrO4sau79EB2uDGzqhfbpW16uMF/RM3K+5YQUUd670bUIaKeYIYO7jcxO/u3rVQMc0h+XW+
	0hJjbm8CYovomsji8WEeR2Ot2Fotet1Jp6nh+1zsyvpOlOH5+wJl9muhaQqYX2JKTrYIUXPJdH2O9
	KLM/YYQzGzXIOFuzckrt0mDZKBAwoMFEI49Ryk+wugPaigUHHwP4a/CPWTKp4TwtnZchJAhzecCYm
	v3tZ9pz8BqTzF0Hvx5YxrZtNccVk2HDTfjyCfbXcASCfbIKhpc15ZCqFGrD0/+kRFilwIed2FD3Ta
	kaz/cxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKk-00000004ClK-2RXj;
	Thu, 16 Oct 2025 09:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKO-00000004CL8-0Ujq;
	Thu, 16 Oct 2025 09:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oM3tI8mY+kGsTe04xj2cVMzBnTs9+D3oQzrLghj3T/I=; b=JBQHlEEBSGETPevb1ASv3NB0Co
	QQmuwxYPWImIw4bMJTpFNT1O4uQcL9961hz8+TZ8Gvj5MdRvMb9STvkTNE+N5AcFy/OF3ZyX2kTge
	GlzEQhpxs2ImT3VTqMqOFRfqXGnVx/WoBDBsiCFGN1FYVNJUg4lQZwOp9YVPS2hPK9L+pBD75ChmT
	89I0KYUMIag31Z2M9rLvu5ZabQ8OFQhnTkaBYa1yRSW+9omnuavgO2XdXOMgOJDxuk5BbcnJ9JB3X
	b5oG46vVRrcMoAwCY7PEqhkEyf7FojCWfgafXLoA63vg8ckfpSMGpgGmIxGnNeGEqDTs9RhJb8Us2
	Q0Ps2ryQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KKK-00000006dQO-0dOA;
	Thu, 16 Oct 2025 09:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760607067;
	bh=hXxs0guUv2+YNHky2gE0MkQPs7q5vu8jR9rLRZw+U8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iI7VlmQFRd8nZIRKd6RZhkFPOMrNkQAQb7ek9vLK6B95sRDdzBIL3G+wpwAvCsFaT
	 Qob3cNTCDTRZ5QklfcnihWaQf5ziw6q8uahr8+itVdrJ9ZFPd8CMzDacsfMWxWak6T
	 WoR7wv04cYXBkfVHC8cmIk9f7upf7AYkLJFLF1fgxl8zDQAzxwmfy4rHBm8BZPTKmJ
	 Trk6av/BgJIyBOdzW291UJ6YVE68nwabdqJHBn6bblxyjx0UdT8n94IkOjZVMxxlSJ
	 3DT/9A2MNqocMjWUEtMR9qCYlLWPP6lPputN5dypSNc2fgisuoHOsc1r9iEvu2r6+f
	 G9BGSYpyVX2ZQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52B7E17E1407;
	Thu, 16 Oct 2025 11:31:06 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v9 7/9] dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
Date: Thu, 16 Oct 2025 11:30:52 +0200
Message-ID: <20251016093054.126293-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
References: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_103116_416094_812F3E51 
X-CRM114-Status: UNSURE (   7.50  )
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

When one or multiple Auxiliary ADC IPs are embedded in a SPMI PMIC
it is reachable at a specific address.

Allow specifying the `reg` property and make it a required one for
MediaTek MT6363/6373 PMICs as those communicate over SPMI and also
disallow it for the others (as it wouldn't be applicable).

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml         | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 5d4ab701f51a..e685e5ee224a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -25,6 +25,9 @@ properties:
       - mediatek,mt6363-auxadc
       - mediatek,mt6373-auxadc
 
+  reg:
+    maxItems: 1
+
   "#io-channel-cells":
     const: 1
 
@@ -33,3 +36,17 @@ required:
   - "#io-channel-cells"
 
 additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt6363-auxadc
+          - mediatek,mt6373-auxadc
+then:
+  required:
+    - reg
+else:
+  properties:
+    reg: false
-- 
2.51.0


