Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FACD78315
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ufaR+T2J5dHCsyUEG18rn+qRf8TnwgZpnHT8JFBy00=; b=M7paW/H+R6b7K36O/8AHp+z6Jd
	dZYrW45C+KZN+/xn0p4FonsPpk7hN5MePxDZIxX2UbkMbLpt0krXGnJKcikrcJb2c8D29ragvv2+o
	YE1IuBsdXvlFNr/nzncKIKhe1qMWk+rPog8bncZj7HCjnoMjbMaaY4ucOCiCoSEbARYlFYUYGCNuf
	B7B3ZEafyJ5L/kYjB+GWrXrrBIsIVBUXQJD9ePIqx9SHSpoRfiVKrJZ6bq1UblP+iZgcYwR7j3Vcw
	8ad3/aWcOjsVjrumJKMvwc94cR651Zsjvxi9fLsYCuz4nbgBl9MQPrFRyHoABSgMSQ/v98iWfkuQ+
	jAHDnugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5ii-000000066eB-1jEm;
	Mon, 02 Dec 2024 12:40:08 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VL-000000064AL-20Ej;
	Mon, 02 Dec 2024 12:26:20 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 1C20B60473;
	Mon,  2 Dec 2024 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ufaR+T2J5dHCsyUEG18rn+qRf8TnwgZpnHT8JFBy00=;
	b=MQoQcayHUt9U+r0GqmPlWNHiI7Xo7LVFkTl7GDeyfv/CYdJgWvigs81e7Gj8LU1x+0m8yC
	f2dAkRzzQ83s8IpWB/VlSNPzFLEwQLxs8aeLYEFmRwRFBxUEagYpcI68KcEv1B1x1r0yGi
	39UpIAXI/fgmMOXWFP4KmE68YSNCqMY=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 8B9FF360211;
	Mon,  2 Dec 2024 12:26:17 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 13/18] arm64: dts: mediatek: mt7988: add i2c to bpi-r4 board
Date: Mon,  2 Dec 2024 13:25:54 +0100
Message-ID: <20241202122602.30734-14-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8adef2c0-690e-4a13-a2ba-5a41995967bc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042619_666726_91373ABD 
X-CRM114-Status: UNSURE (   9.54  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add basic i2c nodes to bananapi R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts    | 12 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi            |  6 +++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 1c2a806f6f6c..13ca016d6a67 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -61,6 +61,18 @@ cpu_trip_active_low: active-low {
 	};
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_pins>;
+	status = "okay";
+};
+
 &pio {
 	mdio0_pins: mdio0-pins {
 		mux {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 956f2be600a2..eebbdfe55774 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -269,7 +269,7 @@ serial@11000200 {
 			status = "disabled";
 		};
 
-		i2c@11003000 {
+		i2c0: i2c@11003000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11003000 0 0x1000>,
 			      <0 0x10217080 0 0x80>;
@@ -283,7 +283,7 @@ i2c@11003000 {
 			status = "disabled";
 		};
 
-		i2c@11004000 {
+		i2c1: i2c@11004000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11004000 0 0x1000>,
 			      <0 0x10217100 0 0x80>;
@@ -297,7 +297,7 @@ i2c@11004000 {
 			status = "disabled";
 		};
 
-		i2c@11005000 {
+		i2c2: i2c@11005000 {
 			compatible = "mediatek,mt7981-i2c";
 			reg = <0 0x11005000 0 0x1000>,
 			      <0 0x10217180 0 0x80>;
-- 
2.43.0


