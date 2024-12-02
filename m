Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DA5D78313
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGxVt+qQLZJkkFVJS2L97CoPUefk9As7+zZxbYek0c8=; b=wd7a6xP9FmmA52qX7HXBPuMtUb
	K7hdgGO94I1xCHgmV+LuGnrpaXBum2D7UwWQViTu3+EbmwoPZufU7QLGf4oMa0p/KJL80Ns9Z3Juj
	arN1j2qgebrHvR0QA2tWeSKx/l2zPOqS2nC/KIQV/kObYPlTvWQ6ZhaWy6ac0N/KRFVrL95BF9YCR
	exw9+9t4dvxfGjvvfrFTiiTy6by1g33sHNfXx4nsx9t9RwEBuwK5zM58scmGy+8x2ngV3wu8VRbe3
	OYuQ05z8BX8Iitka91AJ0YTlJfL9W1h/VMrBuL8pM0/PPU9Ioss2BPHatdJj/vZFN6oiSRCpFPCOW
	lHtcJhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5es-0000000667J-3WR8;
	Mon, 02 Dec 2024 12:36:10 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5VJ-00000006494-1Uwx;
	Mon, 02 Dec 2024 12:26:18 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id F1D62100943;
	Mon,  2 Dec 2024 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733142376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGxVt+qQLZJkkFVJS2L97CoPUefk9As7+zZxbYek0c8=;
	b=po4mQBHYl7lFfmFdq5DxcaZX8ZmcVwp9Bgw8a4GYvmCyzvdvRW9/h3NRb+9B7q7Oevt5oT
	mL/G+xE1mR6NsgUFStHYiQNXOUedUweP2q/G96sv3yM5PnRYyJi+fVC9MWW18jK4vXVGKW
	C3MMHecOcjWjaiCvPXAaOmaB2a4stPs=
Received: from frank-u24.. (fttx-pool-217.61.149.104.bambit.de [217.61.149.104])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 48496360211;
	Mon,  2 Dec 2024 12:26:15 +0000 (UTC)
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
Subject: [PATCH v2 09/18] arm64: dts: mediatek: mt7988: add operating-points
Date: Mon,  2 Dec 2024 13:25:50 +0100
Message-ID: <20241202122602.30734-10-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202122602.30734-1-linux@fw-web.de>
References: <20241202122602.30734-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: dca3eac9-8f12-478a-ae0e-dd080f463b3a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_042617_534069_64A642EA 
X-CRM114-Status: UNSURE (   8.38  )
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

Add operating points defining frequency/voltages of cpu cores.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
changes:
v2:
- drop cpu-labels for now
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 2af440510c86..5609e3619be9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -21,6 +21,10 @@ cpu@0 {
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@1 {
@@ -28,6 +32,10 @@ cpu@1 {
 			reg = <0x1>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@2 {
@@ -35,6 +43,10 @@ cpu@2 {
 			reg = <0x2>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu@3 {
@@ -42,6 +54,32 @@ cpu@3 {
 			reg = <0x3>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
+				 <&topckgen CLK_TOP_XTAL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		cluster0_opp: opp-table-0 {
+			compatible = "operating-points-v2";
+			opp-shared;
+
+			opp-800000000 {
+				opp-hz = /bits/ 64 <800000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1100000000 {
+				opp-hz = /bits/ 64 <1100000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1500000000 {
+				opp-hz = /bits/ 64 <1500000000>;
+				opp-microvolt = <850000>;
+			};
+			opp-1800000000 {
+				opp-hz = /bits/ 64 <1800000000>;
+				opp-microvolt = <900000>;
+			};
 		};
 	};
 
-- 
2.43.0


