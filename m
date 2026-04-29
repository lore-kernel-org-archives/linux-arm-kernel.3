Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA77FF8877
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xglSOnb4dsPiB+AykM7ESrsv6H2eEhWcMgp8A5PAKCg=; b=ni3V9bQjtZ8xLDQT7iVPC//uge
	WF9WMbb8VTVsgMLaCbvg1knXXDMN1kab+e4vMmKM49iqfGkYKpLHjgaaeUdvvOjIVEL3ozQPWgpuX
	iOOyAJS/jZI9vmh6JcLG89q/tGpw/VYvL2OuCoOVsmkJF9w5F3cNnA9wfTzyA6VIFEJRAwSE64o6v
	hye6MjTJzDB0LO5uZM8hKuV2/ijHx7UbUrnxUUHSGzjm1Z1ljB1Ggfy2lD5MqGk/+5BxRAVVSHU0C
	AVYJ8CzQbre+cqNwmNAVdXPRh2KhB3nVS8TMiBoKotZlC9CAwrS7i9JaJRJ1ho38jaGuOLOnBv8ni
	23FakUZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1U2-00000003N2L-0t1L;
	Wed, 29 Apr 2026 09:45:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tq-00000003Mpz-2I7P;
	Wed, 29 Apr 2026 09:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455916;
	bh=YuHpf07kf4Uild2asVXBk4zqPo/qFzS4X/u93cN8vB8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vu6mnNZoSmzzxVa17f/idLnZUvmamt5+q3xdXwhqyA2fVGbyYhN4QBRY5SGzy32z0
	 mPEVTHtjdvMAeJ0elKiB2LQmnofVOKn/NAs4qQ5K1AsMrLXxjZEGrHkaHRhzAjaY7r
	 FkSlC2mBI5Di3lZcZotPXYZrEP4oB56GxioD5Z1Y4MH/0i/yHQl5CGYjgASz9gPp/X
	 SHCLhCyojt964uez61CYm7o6pkCZpE1unJi+SKnTZ5rtjt41gDmMfX/rmf+kQnGbko
	 +ijDLz6J4MZi7lEg7CIgOU3nZJg565+b7yRbIHzVsg2rrC+vQPlZ1N9mYx0frPh0BL
	 uq7IfPGI2TiPA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E8B417E1513;
	Wed, 29 Apr 2026 11:45:15 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:20 +0200
Subject: [PATCH 7/9] arm64: dts: mediatek: mt8390-genio-common: use MT6365
 PMIC definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-7-6f43838be92f@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1671;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=YuHpf07kf4Uild2asVXBk4zqPo/qFzS4X/u93cN8vB8=;
 b=lccIymyIWB3mM0xwUsTTgcmQHl+tFqmI89WYeoWyV6Zrkmr1u93/VOmHGSvZ9fnL0YfTNfZ0h
 cpRi2u/bCmVDLnl4qP5D6GZw2xQVYQKXjLCmEYhA0BWOCd4TjNbqDq1
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024518_736592_371F797A 
X-CRM114-Status: GOOD (  11.54  )
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

Mediatek Genio 510 and 700 EVK boards integrate a MT6365 PMIC,
compatible with MT6359, but the board common definition include file
used the mt6359.dtsi to enable its support since the board support was
introduced.

Now that mt6365.dtsi has been created, include it instead of mt6359.dtsi
and use MT6365 labels and pmic key compatible too.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..5303add717bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -10,7 +10,7 @@
  *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>   
  */
 
-#include "mt6359.dtsi"
+#include "mt6365.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -695,7 +695,7 @@ &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359codec {
+&mt6365codec {
 	mediatek,mic-type-0 = <1>; /* ACC */
 	mediatek,mic-type-1 = <3>; /* DCC */
 };
@@ -1281,8 +1281,8 @@ &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
 
-	mt6359keys: keys {
-		compatible = "mediatek,mt6359-keys";
+	mt6365keys: keys {
+		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";
 		mediatek,long-press-mode = <1>;
 		power-off-time-sec = <0>;
 

-- 
2.54.0


