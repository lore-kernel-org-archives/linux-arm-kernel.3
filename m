Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E34AD78314
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bf0wU1/QYkNghuSaTTJ0zcYOBhFOpXxvLvBEJ3/2A98=; b=0mSQdoDx13eTnldocDESodD7dm
	ZhTKlSrbQxRqsBhwvL+VhOCRGZPufoy39LrCFifA/bLKFeJSbyhxEMDmzpaBEIndHZrQqK5N+/XCJ
	2jvGKzB7o11hMUHjhxnGpPMAAQG+rzbH349FmT1JKoy13sScqlq+/JYZdOshs3cvaWXKa67fs21js
	aZAHxECTF+U95rtEsw2O7i6otBN92UhRGE3j7cvUmu76yZGnSwFDwGO2sZNWQwiRj5V1ZqANdicxD
	3Y6qIKipr3lecd+mZhUIbXXmlQxiO3uYxILZayeYcQzOFHajv62ibh8RzMmGgLm7j0r8fvTghU2Qk
	xpjK+EqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5dv-000000065x2-3tTz;
	Mon, 02 Dec 2024 12:35:11 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VI-0000000648Y-321f;
	Mon, 02 Dec 2024 12:26:17 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 5B48541A25;
	Mon,  2 Dec 2024 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bf0wU1/QYkNghuSaTTJ0zcYOBhFOpXxvLvBEJ3/2A98=;
	b=oo6MRp1w0dDlv1cyvERc+WtxWDJjQ5EQmyrU0/s4eLaE0PO8hbf85iEnSkIwZRZ74SPXUh
	5+49RC9NU1l9lpWhYy9N8X8IqCS0P/tdnATn3kWrra6Xr5u+IX/kOoWwliVSrjD/zZW4QF
	CVfrsvVk6cTzOC0tXB1MuhHzzWlPmSo=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 5D32C3600C0;
	Mon,  2 Dec 2024 12:26:14 +0000 (UTC)
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
Subject: [PATCH v2 08/18] arm64: dts: mediatek: mt7988: add mcu-sys node for cpu
Date: Mon,  2 Dec 2024 13:25:49 +0100
Message-ID: <20241202122602.30734-9-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 1636f77e-5670-4746-b648-6f76788a7fe4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042616_903041_9E09BAF6 
X-CRM114-Status: UNSURE (   9.12  )
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

Add mcu-sys node which is used later as clock-controller for cpus.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 1cf801486e61..2af440510c86 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -192,6 +192,12 @@ pwm@10048000 {
 			status = "disabled";
 		};
 
+		mcusys: mcusys@100e0000 {
+			compatible = "mediatek,mt7988-mcusys", "syscon";
+			reg = <0 0x100e0000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		serial@11000000 {
 			compatible = "mediatek,mt7988-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11000000 0 0x100>;
-- 
2.43.0


