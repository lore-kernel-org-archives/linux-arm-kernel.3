Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A151FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebmhm07Z4B+P1+sX9uf4GFsH9ixtfu42gfvtAQMjYL0=; b=CATBQVzp39xWjNZv4brcRKgu4B
	CJ4TkKV/DcRkYcR1i2ypv3+xWPycPE7Ox5CMLwejTS6OhVsmEy19xXFPp5sQLI1vK1phxRjpbl5Tf
	O3Yj6tcYqdYwu584KIBqFTMf0uKbkB6U74cr5pcaXKqFIugirqg3Wv2ybUafAN5ra0nw0JjOv60q0
	hW30I/c/AzwLqlz295mz77SEBXslw3FWKnKnqqRst2YeMIlWux14+t6xsXI7mEDadUO3S6nozJxT0
	CAbGKh/Kt3ZfOWN93x5U/+u9MTnLEXCIqBLXZmPP2fnzoAEEe/m4Y53FaWk4NHDJ2cbg/dhM456tF
	13aU1ouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1U5-00000003N6k-0VUI;
	Wed, 29 Apr 2026 09:45:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tu-00000003Msd-02Bq;
	Wed, 29 Apr 2026 09:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455920;
	bh=LZSXpva6oG9AsEcsoWrDUJOYVDYzK7Fn+c63sWst9h8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yb7VlYqzkY8wc9ZiMP2UgMZSeqTGRBU6WPJAZV8/bPbS0mH+meaLDWkg3ABDPS29/
	 QwY2C2ViVBqrJAjGqc4fZu3iAtRm3jtnKSWTXlxRKP06w8SneZsD+Apcn+lula8Y3S
	 bfLogmbk1NJ6j8BZOiqPze4qgxjgIVf+p5KtcbqF9cYwk8C7oxvb+3He0na8G5SG2l
	 SIYdKBfxQhXi0wq79rBnVJC30yBSzaRjxgSM+PkvYw6zCBR3ufGwqq6n6dm8ePg3c9
	 1TYSErcMS4THzJX3wkrEvKHmy5xoqO/FuGJXy5wZu26XuChYA4O4zGe8IXmtD+yUs4
	 4TRQJOZOHVLDA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF30E17E131F;
	Wed, 29 Apr 2026 11:45:18 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:22 +0200
Subject: [PATCH 9/9] arm64: dts: mediatek: mt8395-radxa-nio-12l: use MT6365
 PMIC definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-9-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1354;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=LZSXpva6oG9AsEcsoWrDUJOYVDYzK7Fn+c63sWst9h8=;
 b=PiLPTEDUjttvvITHiqe0IzMQ5Kj84Yl3Crww3pY7fvSDjC3aAVrBqpErDRIWSgvx1NBwz1mOs
 RZtAEl6k8KKDzZxn9QhmCKqe6G8Os4clkfk8CiFrLEbaIHeJw2gRyqE
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024522_211320_367003F5 
X-CRM114-Status: GOOD (  11.17  )
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

Radxa NIO-12L EVK board integrates a MT6365 PMIC, compatible with
MT6359, but its devicetree used mt6359.dtsi to enable its support since
the board support was introduced.

Now that mt6365.dtsi has been created, include it instead of mt6359.dtsi
and use MT6365 labels and pmic key compatible too.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a..8bd3b3250b87 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -6,7 +6,7 @@
  */
 
 #include "mt8195.dtsi"
-#include "mt6359.dtsi"
+#include "mt6365.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -1034,8 +1034,8 @@ &pciephy {
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 
-	mt6359keys: keys {
-		compatible = "mediatek,mt6359-keys";
+	mt6365keys: keys {
+		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";
 		mediatek,long-press-mode = <1>;
 		power-off-time-sec = <0>;
 

-- 
2.54.0


