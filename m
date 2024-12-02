Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521CAD78311
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnCQcuap27aQvWaJkwaLNH/UmeyU0Tp7uQ2SHxBdKYo=; b=A7BaAw1byZ54aDWMF2ycTtECs+
	H1m6rqpb4rc2nwkwlMO3e9Zgnlt12RHvn1iQc3dguz8VDFxBRV8zYnvv/DtfHCPqDsDCL0KgXPuGs
	vqPYKA9Mjtdv16S2G/KPkSyy17lWYOJ5axi57qU9JeKAhzI5ElPzF8PV70d/gM7mfLVk1IagURYTf
	rgUEXhFdxtdWu5kZf9FJNlD5v/671Lux4DQcdOnNzPukrBxgmElCPnt4ej2sj2x1wDN6DPvHnr1Do
	NMJdZXs/i34Mj7hpbmN2DW5RE/2g6dQwTtiXQM9VVwTpeZYeMy4oYt8zxrx23Ff27XBJCuDBP+nYf
	Zo5LnbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5nV-000000067Ru-1okT;
	Mon, 02 Dec 2024 12:45:05 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VO-000000064D4-1oZb;
	Mon, 02 Dec 2024 12:26:23 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 2B90B100942;
	Mon,  2 Dec 2024 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnCQcuap27aQvWaJkwaLNH/UmeyU0Tp7uQ2SHxBdKYo=;
	b=hrLB8VeH2sW2jHCznKzHfXlutYsYdI9gbBFN7R5KpeWJQEC3PwJXZgh/xXKBZ+yXdq1Z8Y
	rJgCEWrnUttDz3idjcFVDtcOgwQUxJZVyBr8VcbBcN5aI54I28Xk3dgu6gdE0Swrnq56xj
	WgC+gyRJhJpks9J2OD1Jq3vfcMELUZs=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 9D2A73600C0;
	Mon,  2 Dec 2024 12:26:19 +0000 (UTC)
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
Subject: [PATCH v2 17/18] arm64: dts: mediatek: mt7988: enable ssusb1 on bpi-r4
Date: Mon,  2 Dec 2024 13:25:58 +0100
Message-ID: <20241202122602.30734-18-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1f99d702-05b9-4d36-a621-a42fdbb3903e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042622_610984_E49EFE35 
X-CRM114-Status: UNSURE (   9.94  )
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

Enable front-usb on Bananapi R4 board.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
index 9ceefc990000..12b45b18955b 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
@@ -373,6 +373,10 @@ &serial0 {
 	status = "okay";
 };
 
+&ssusb1 {
+	status = "okay";
+};
+
 &watchdog {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 93c21a5248fa..2be84acac06a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -336,7 +336,7 @@ usb@11190000 {
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
 		};
 
-		usb@11200000 {
+		ssusb1: usb@11200000 {
 			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
 			reg = <0 0x11200000 0 0x2e00>,
 			      <0 0x11203e00 0 0x0100>;
-- 
2.43.0


