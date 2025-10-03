Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C827CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 09:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM3tI8mY+kGsTe04xj2cVMzBnTs9+D3oQzrLghj3T/I=; b=JuXaWCrJyEQ8V7q+UYjuA90Mi5
	sZo+cKQRq5hotdgnd+iE3BbuOQIyaf6gy/x013tSXO7W2g/EXt5J7jP9dCbM6h/sKo/bYsnaorURQ
	BO7DcLePYxrGJ5jOnNQzq5hq6lwqPWW9xUwukeA1QxIi/pzzMvYLSmg24HhONSj/Og5aa8Ne/kQGP
	O5zdvO6ZSH/g9qV+SoWYHt/rw/r4sP6Bq3wbhGcaT7Qcgo2tTXhMc4K3mf6V+WTEMsav0wKAv0bDu
	bk5rFhKWEtRK3KDiK54oU5S4juvcj6NktRKFV/1pY1B9UoaceogvrudAtevIXSg5udcPNnFQFWfs/
	HrwApK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bpo-0000000Bvkz-1FPJ;
	Fri, 03 Oct 2025 09:12:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4bpg-0000000BvZB-3Lqx;
	Fri, 03 Oct 2025 09:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759482726;
	bh=hXxs0guUv2+YNHky2gE0MkQPs7q5vu8jR9rLRZw+U8E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HF/W8Eg0w9KCJhLOkOZrdGHTUmOUiW174ezeJ4/GN0FYmjZFzQntC2WDzZiBJjjgg
	 Kqw6K6faghJpoDIGq8cwC5iRIeNl+zm07yKCwJzHiyelc3Wqwt/ol3XgRP0fQ3LIua
	 B0UjV3fJV8m3nDvl0X2egvz6mHc4eSVbtAz+PeqrVo89cPPIEHfSX42ik+GCmra/YW
	 lP0r9zo5jwl9QGX9wOlknrxJmpC3jiiuNXVVGP3iC10lNr5OVsXl4ZB58dT8FEsSBg
	 R79zMD8H449kMMuE6JNk79MInKVPyC8BKvSWCNswTQTQRunCpeuN38mYE6kOpeU3m+
	 jahypwFme4LRA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CD5817E108C;
	Fri,  3 Oct 2025 11:12:06 +0200 (CEST)
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
Subject: [PATCH v8 7/9] dt-bindings: iio: adc: mt6359: Allow reg for SPMI PMICs AuxADC
Date: Fri,  3 Oct 2025 11:11:56 +0200
Message-ID: <20251003091158.26748-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
References: <20251003091158.26748-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_021209_011273_E62E2276 
X-CRM114-Status: UNSURE (   7.77  )
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


