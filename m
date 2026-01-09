Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D67D16819
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7RoeaXiW7SSOxV31eCnqwkuwpR0MDEJ4ilSdB6lvJ0=; b=SfyyxI/JRaKmrxATTwPnkL46uf
	sTVofSq7YBpzK2EyziidVjzBdblFLQP7Yo0zUWh23GcQNOSv3m5NLqw5F1QdVr0yZY1bE/nLi7dqK
	/byXohEFyCJQcD6y+St8raVv/N4DwJU+EudTziiUtesQ/jgnk4dW7f2gdM2rw+Q7ZAjH4zEASdMgc
	QAiOqgczx8KfmqglXpgyusF30VOA2DpyhAe3uoKHGI0mK1j/LRsdwRuP2QCpOU567qm1yR8jO0Ewd
	s8vTnYAGM5p/hO27RcAzPvf2YdPodKs7j1BBMGFb+xtEBi5ap0ZA5a2nZyl7IPASF+QNaW6A01PCU
	JR9wUrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyQ-00000002F5h-0hPv;
	Fri, 09 Jan 2026 11:48:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAyJ-00000002Eug-1wvK;
	Fri, 09 Jan 2026 11:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767959280;
	bh=ubUoeKoK4MOEGAAlYGLs/9BWIBNNB4y4zBKteUG+WSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z8Ru9qqBDaW9nUs5mvn8SsTT6aLmL1qAYx+xr+3/n/w7kj+WiXXul+eDwSq9SvLSa
	 y/uDoUeNuusDCdeoh7jUp9hvrgTZxKj/AE/KtD8TegkROXcIJgieGeGql714UDHswo
	 TPj+XTqrFL6amlLy56x7uTFgz2sCQ3LX6zp6bN2cNGQpQmbWIYgXC03wHHKc324SM/
	 kHU3ZB/A7zC1rM4MhASkTIzMNl15iZSdNbGo8ukY/RVpBn3LmUTiQKPx82iPEr1rbS
	 3Mg1vkv0pS3FPyEPo5LIFD2A8V0ZXC+3F9grb8h9NdkP8SLpZxQJrI4Pt2KmmmuaWb
	 P0cP8u8V1ZLKQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E615817E1523;
	Fri,  9 Jan 2026 12:47:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sjoerd@collabora.com,
	hsinyi@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 07/11] arm64: dts: mediatek: mt8173-elm: Fix bluetooth node name and reorder
Date: Fri,  9 Jan 2026 12:47:43 +0100
Message-ID: <20260109114747.37189-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034803_685871_3F463F30 
X-CRM114-Status: GOOD (  10.77  )
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

Change the node name for Marvell SD8897 SDIO Bluetooth from
`btmrvl@2` to `bluetooth@2` to fix a dtbs_check warning.

While at it, also change the WiFi one from `mwifiex@1" to a
generic "wifi@1" and reorder the nodes so that wifi@1 comes
before bluetooth@2.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 9ec930058b92..59813fff7833 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -432,20 +432,20 @@ &mmc3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	btmrvl: btmrvl@2 {
+	mwifiex: wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		interrupts-extended = <&pio 38 IRQ_TYPE_LEVEL_LOW>;
+		marvell,wakeup-pin = <3>;
+	};
+
+	btmrvl: bluetooth@2 {
 		compatible = "marvell,sd8897-bt";
 		reg = <2>;
 		interrupts-extended = <&pio 119 IRQ_TYPE_LEVEL_LOW>;
 		marvell,wakeup-pin = /bits/ 16 <0x0d>;
 		marvell,wakeup-gap-ms = /bits/ 16 <0x64>;
 	};
-
-	mwifiex: mwifiex@1 {
-		compatible = "marvell,sd8897";
-		reg = <1>;
-		interrupts-extended = <&pio 38 IRQ_TYPE_LEVEL_LOW>;
-		marvell,wakeup-pin = <3>;
-	};
 };
 
 &nor_flash {
-- 
2.52.0


