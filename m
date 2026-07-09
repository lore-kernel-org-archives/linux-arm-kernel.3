Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9AAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ2jE+i75NFFeO5EqgPV8Of0JEStuuBBd4YT4uPReQw=; b=e9bMRXYAPGs/ev5KGrwvWGN79O
	kiAECOO3a87sFo8vOiJ64BjbV7xLfgppmB3oHriu15G2zmuykwrLa+joS92GzAOJ4U84sK4Ib3KPm
	tNje+gq9KiclKrW6p5uT70NaM9pw44Y82d14ODkLLTOOBbiIycvYJwZLwgRfw6T5Y5n+Ue4kK9lJ9
	6VlHJhOpbc7xbs/adICo526Uc5uuVzozbfKtlxsIMYDEpJXOEiGWUy/j70J4LfAFYF2lGCACnaLGc
	2gUdZFTD/8pNOKYruXXaN0joYzLzdQw45eRQJvn2/tf9usUurusqxtwF1DEIaIytP761qdwr4PM5o
	L7OZ4/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNC-000000021Lt-4A4C;
	Thu, 09 Jul 2026 10:52:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmNB-000000021JX-1aco;
	Thu, 09 Jul 2026 10:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67F5A6132C;
	Thu,  9 Jul 2026 10:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10DE5C2BCB7;
	Thu,  9 Jul 2026 10:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783594372;
	bh=gKXHXT/BZxB3nU0OX4AxZCUG594qb7Z12M++kdXyObI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y93Nxmkl55XEe2wC5K1x3IsN+/tLu+T6sTDyaJ9FwYcmXzizIkE/BV5wsMN4Y74Zk
	 8vfrB8VISgjr76KoDvu02KHhUBc/NJUcMrQfRg18tyaTDs7LMN8+w1up06IzR0v2RJ
	 HdPNv+o5N0FPd9ey1Pi0xkWCWJhFpnzIo+enpPrt5szcpjvzlAXpdFGtrHZLrtbbNn
	 Ski7XohB1OQuazlrabVAy1okNItz9eGWamKqFW8kFjOX8tSD4EiDbAVvuOpg+giGYp
	 eT6gskolbhpN6XcIVmX3lbnEVAix3gz7uNz3DTow2uBgHukRRnaeMlsqeDUZRSRr+/
	 WxDKIrvb5wK7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2315C44501;
	Thu,  9 Jul 2026 10:52:51 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 09 Jul 2026 13:52:47 +0300
Subject: [PATCH v5 1/4] dt-bindings: iio: adc: mediatek,mt6359-auxadc: add
 mt6323 PMIC AUXADC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-mt6323-adc-v5-1-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
In-Reply-To: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783594368; l=3438;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=n/hF2O+RwnHtBK81eU25NI+l8k8bMhAH5e4HlMk9vTE=;
 b=Keqle6zd1F0cGtaIi1/ktJGgdgQbHP+ueqk6wC5uoAsI5NrJI+M6IhbqVYzkXdeFPsdmAJ/8A
 kZqSTyJ7l8YCMwH+MtB6P2RoqImv6ZtrSoLZPshUky6MTCiohqdLyoz
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
temperature, and other internal measurements. The IP block is not
register-compatible with mt6359.

Add the devicetree binding documentation and the associated header file
defining the ADC channel constants.

Also change the description to 'MT6350 series and similar' because
the binding already includes more than mt635x series PMICs.

Finally, add the MAINTAINERS entry for the header with ADC constants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml   |  3 ++-
 MAINTAINERS                                        |  6 ++++++
 .../dt-bindings/iio/adc/mediatek,mt6323-auxadc.h   | 24 ++++++++++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
index 9936aa605c7b..c2f7387e4bfc 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt6359-auxadc.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MediaTek MT6350 series PMIC AUXADC
+title: MediaTek MT6350 series and similar PMIC AUXADC
 
 maintainers:
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
@@ -20,6 +20,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6323-auxadc
           - mediatek,mt6357-auxadc
           - mediatek,mt6358-auxadc
           - mediatek,mt6359-auxadc
diff --git a/MAINTAINERS b/MAINTAINERS
index 47cfe6531719..86b9a35c3d20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16578,6 +16578,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
 F:	drivers/mmc/host/mtk-sd.c
 
+MEDIATEK MT6323 PMIC AUXADC DRIVER
+M:	Roman Vivchar <rva333@protonmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
+
 MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
diff --git a/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h b/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
new file mode 100644
index 000000000000..6ee9a9ecffc1
--- /dev/null
+++ b/include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
+#define _DT_BINDINGS_MEDIATEK_MT6323_AUXADC_H
+
+#define MT6323_AUXADC_BATON2		0
+#define MT6323_AUXADC_CH6		1
+#define MT6323_AUXADC_BAT_TEMP		2
+#define MT6323_AUXADC_CHIP_TEMP		3
+#define MT6323_AUXADC_VCDT		4
+#define MT6323_AUXADC_BATON1		5
+#define MT6323_AUXADC_ISENSE		6
+#define MT6323_AUXADC_BATSNS		7
+#define MT6323_AUXADC_ACCDET		8
+#define MT6323_AUXADC_AUDIO0		9
+#define MT6323_AUXADC_AUDIO1		10
+#define MT6323_AUXADC_AUDIO2		11
+#define MT6323_AUXADC_AUDIO3		12
+#define MT6323_AUXADC_AUDIO4		13
+#define MT6323_AUXADC_AUDIO5		14
+#define MT6323_AUXADC_AUDIO6		15
+#define MT6323_AUXADC_AUDIO7		16
+
+#endif

-- 
2.54.0



