Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77362C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JmBeNWQtgDqQzs2OitvZrmbZzF8f6zng2BUORZmEOY=; b=WxNDGBienEQSPgdryqLVyEtrlv
	Vd2MJMzdWGP/qXnoiMo+4uS6BJN4W5uv/LcFbyiBS62gdScREKQWlzlkPQCSZ+4A//uOHfzvno2wl
	uVo8Pbx2CXnNSEeu9UGe/MvNdYM5apDdD1SQMoydHyWuuBbB9JpPJhAmctQ5U5kmtZ9B2OCBPis2O
	pRffVZ5Z7/WUTsrrl8nQ5cFvFhmdig1yjjA9kEOnqSQIqwETzHPkAGjDCdedIhL8kdkr91+62VuhC
	NEhdG4DX+e3QnPsLORVrTTfOomKpkvAQxqDWrhRlrMkn6Foyppb/fDVooJdmZAv5rSxM8zbbWwRJ1
	6JFcniVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThPG-00000002tv1-2bU5;
	Mon, 23 Jun 2025 13:40:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfqm-00000002adK-0Dqi;
	Mon, 23 Jun 2025 12:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680034;
	bh=2uQyRTyYImsaB6rg/eF5AnNWNFNbbx7EBqAYScAL9oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JupY+hcRSm70R2EaDl3rvNIfdeDsGMmppJrxTvFLnfjDS0L+aUnjD7MpW+RFrKirW
	 TJW3AMRY9rSFRR6VCmqq+MNqLIRUryhi1U2jME/LL+Ar9g4/kYkQVjDw9HazHKGIhi
	 hT4t9DnLqxPv7wmtSU1RfLwX3BE3LbFB7t26PELX0m4EvtSDCWpf1G4UVjADm99apJ
	 blFzznnp6D+J+DDCIFxwjfcnH4oYedSU/LFnoi0LXnUjwJLqvwTL9kiHSSlPdhd4Nm
	 6EHozb44q1bKdLKwasACeQztXCWZShIqBs6Quz64dfbHQORs6s8C30RffG/Ll/6kfF
	 5iKOqHmZIfKyA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3C8D17E1560;
	Mon, 23 Jun 2025 14:00:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/5] dt-bindings: iio: adc: mt6359: Add bindings for MT6373 PMIC AuxADC
Date: Mon, 23 Jun 2025 14:00:25 +0200
Message-ID: <20250623120028.108809-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050036_270368_7B6D04AE 
X-CRM114-Status: GOOD (  11.07  )
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

Add a compatible and channel bindings for MediaTek's MT6373 PMIC,
featuring an Auxiliary ADC IP with 15 ADC channels for external
(SoC) temperatures and external voltage inputs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../iio/adc/mediatek,mt6359-auxadc.yaml       |  1 +
 .../iio/adc/mediatek,mt6373-auxadc.h          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index a94429477e46..5d4ab701f51a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -23,6 +23,7 @@ properties:
       - mediatek,mt6358-auxadc
       - mediatek,mt6359-auxadc
       - mediatek,mt6363-auxadc
+      - mediatek,mt6373-auxadc
 
   "#io-channel-cells":
     const: 1
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
new file mode 100644
index 000000000000..17cab86d355e
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6373_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6373_AUXADC_H
+
+/* ADC Channel Index */
+#define MT6373_AUXADC_CHIP_TEMP		0
+#define MT6373_AUXADC_VCORE_TEMP	1
+#define MT6373_AUXADC_VPROC_TEMP	2
+#define MT6373_AUXADC_VGPU_TEMP		3
+#define MT6373_AUXADC_VIN1		4
+#define MT6373_AUXADC_VIN2		5
+#define MT6373_AUXADC_VIN3		6
+#define MT6373_AUXADC_VIN4		7
+#define MT6373_AUXADC_VIN5		8
+#define MT6373_AUXADC_VIN6		9
+#define MT6373_AUXADC_VIN7		10
+
+#endif
-- 
2.49.0


