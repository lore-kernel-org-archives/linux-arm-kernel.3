Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F0FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efvhBIKI7yRYjgKzdnapFzRDqJruP+cFsxx0GxF3eYI=; b=afXgzZ4kS78rNzVjcxtGM3UITI
	YubNOdC/J+QZ+ZkJ65nM0ZpCNcDxLcpbdD3ujYJNNLxaZkZ7UEGgY9lK+2tJzDjq3aDlKIpGGRsMD
	jBBN4lFfMIEzur4vJmIY9vVWGmdy47HYIerO54s9f16K3iwtxkoh7jHfGb0EUFofGmg/c5C1ZlQ/M
	cbjkyO1wv+ClrqNaZxEI3Yl3pcbyzL8EHmg0OhMQLcd3Co6q+mHXI+FMPWKc984Jez+oKxNlVU4n7
	LVkzXjImZp7XmQVY30EmjYssr4D9itw0MlKDuYnFQ6wn6oYnTfPj+BFWJUvm1sATNNA0xK0oQGfVL
	iZNteyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1U3-00000003N4O-2666;
	Wed, 29 Apr 2026 09:45:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Ts-00000003MrZ-2DnV;
	Wed, 29 Apr 2026 09:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455918;
	bh=SAHaTTN0o8iSHVoz4k1Wj+QoNXNDXkB6el3hzjXShiY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RwUA7zhmGWrujBV3Ks2QMSYQCwgMBX3XSb0gyhqfKluPF8qp1tGUCU30pRHa/i4dx
	 wJTKZB1kWEEct4950wrozu9DrdSztcM5Y7CwEhsMavk+6r7gPYaStlxS3V/63aRjMp
	 mwxCv+5q1uWWYyyrZQk5t8sSOsWwVhNgde4ZXnA6vO10iOWnC/XPOfLh5TFgxGzLGM
	 4z40dPVNae4VDndrX4GEwl06klEQEB0jYR4zEQTJI+0wRImQ+VUsxKRdLIMP3HQYRR
	 WrkGusjbFIkzA/xlwu5/EZMFMao+OS4WyYmaXKpWWq7rHQx3+NOHaASE4LQ9AG6ik1
	 u0fgNRcYpB3dw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF87617E12E5;
	Wed, 29 Apr 2026 11:45:16 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:21 +0200
Subject: [PATCH 8/9] arm64: dts: mediatek: mt8395-genio-common: use MT6365
 PMIC definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-8-6f43838be92f@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1686;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=SAHaTTN0o8iSHVoz4k1Wj+QoNXNDXkB6el3hzjXShiY=;
 b=K8Jf6OjYx3bqGDaaGsaioQRvIxXwQ+xH0j9faGjPlJV1UoLf3/6NJramdtuPmoxX/n+rrAyaX
 1gi555dXuOgCQhv9V5dLvsaPNoHHXT6/ybwPuxe4sUave75hnDXLq0Q
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024520_722345_23F7AD3A 
X-CRM114-Status: GOOD (  11.50  )
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

Mediatek Genio 1200 EVK board integrates a MT6365 PMIC, compatible
with MT6359, but the board common definition include file (for the eMMC
and UFS configurations) used the mt6359.dtsi to enable its support
since the board support was introduced.

Now that mt6365.dtsi has been created, include it instead of mt6359.dtsi
and use MT6365 labels and pmic key compatible too.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 62c336e21500..6df614c471fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -7,7 +7,7 @@
 /dts-v1/;
 
 #include "mt8195.dtsi"
-#include "mt6359.dtsi"
+#include "mt6365.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
@@ -728,7 +728,7 @@ &mt6359_vsram_others_ldo_reg {
 	regulator-max-microvolt = <750000>;
 };
 
-&mt6359codec {
+&mt6365codec {
 	mediatek,mic-type-0 = <1>; /* ACC */
 	mediatek,mic-type-1 = <3>; /* DCC */
 	mediatek,mic-type-2 = <1>; /* ACC */
@@ -1151,8 +1151,8 @@ pins {
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


