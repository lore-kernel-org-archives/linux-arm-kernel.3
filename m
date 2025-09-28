Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A4CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Sep 2025 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnnxBO/trXxFdYV+mLFnB0D7KCLEBJYTl4aWicE4Wa4=; b=Rd8ejWXidym6lhs9B50f73cwWU
	Q1a8ESynFC5XLYe+rxS/960CJhWhbKzNxcDrK2aerfzfRrYT3tPgAFV7JK970XaS/mKUt+V8hQsjf
	PO/+g5t11g/TUAAvuy8B5nT5xYpWm+VDul5p0HVb9ghxj0vYfrmFiVV2x5wX2iIokw8LVa2ohqsF5
	Rt/1LPqbzwTczwl6YbM0NX+VPNK5eIHp3kggXGWuL9NFNI5sKsxC9dZKsO7s/Y5Mbrde7HrXHbcg/
	/nbcFsVbe67GnOSxqxMW6GWoJsL+MQFoLMsNrAYOkEBsIIn6ojpBYqFVJh9ydOxQBMzPjeiO0MzLF
	WYdGbdFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVw-0000000GexR-2ams;
	Sun, 28 Sep 2025 16:44:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2uVt-0000000GetD-2FWh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Sep 2025 16:44:42 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EC646209E1;
	Sun, 28 Sep 2025 18:44:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-bgODHrDlbP; Sun, 28 Sep 2025 18:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1759077878; bh=ksoTUkd6e56IfHNaydxIqPi7FDPhrc+WNf3R95tILQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b+3c+N47kxW5mkMUiwDOJtWtkH/9CUql9yPk7yLn0xiTud7jUqu2PafGm2AxJMLRq
	 2ljrUowR5meoW/l68rCUMsoUxh6ytpmV8T7c3htDK7iS+gti6gghry5alVuhQIdPmg
	 QvGIni5DXdWZB4V1Rh6WvwwnMWEi5FTT0hPbCWN6BlFIkK2vXgu9NPWxQB0NMuGluI
	 LSRol3AxI91FKG6K1Sgz2ejNdfakavGaIbRBSOddqUN2hnH2TUrOYLNHC2bjotyG/I
	 l19Ey3gWZr7Pmjp9xK11rU9P0MRqxyMu6gPgk+EnwiQ69GuAzJ4Gru74besk4DbF0a
	 55Q+z/7fGIfvQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 28 Sep 2025 22:13:57 +0530
Subject: [PATCH 6/7] arm64: dts: exynos7870-j6lte: add bus-width to mmc0
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-exynos7870-dt-fixes-v1-6-a40e77a73f16@disroot.org>
References: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
In-Reply-To: <20250928-exynos7870-dt-fixes-v1-0-a40e77a73f16@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759077839; l=1055;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=ksoTUkd6e56IfHNaydxIqPi7FDPhrc+WNf3R95tILQY=;
 b=siBZbTKsPqnPyE5bdSEYk4L2JwO/0vWzC4Fg0i5oGGrY+qdBzCX5qrnOv04KPbJLHtmZqQVFy
 I7g/Nj3Uep6A3mnP4gv2NlR2pE/+iurU1ng5V8mb0dnCeWQI22lcQbT
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_094441_778970_6EB31C3E 
X-CRM114-Status: UNSURE (   9.75  )
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

Add the bus-width property in &mmc0 node. The Exynos DWMMC driver
assumes bus width to be 8 if not present in devicetree, so at least with
respect to the Linux kernel, this doesn't introduce any functional
changes. But other drivers referring to it may not. Either way, without
the bus-width property the hardware description remains incomplete.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index b2990b5466c949c18a61d1b1c4427986b19804ba..4aa80ea3a1cc94e69d88a5e5a135eb7ac5510fdf 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -430,6 +430,7 @@ &mmc0 {
 	vmmc-supply = <&vdd_ldo26>;
 	vqmmc-supply = <&vdd_ldo27>;
 
+	bus-width = <8>;
 	fifo-depth = <64>;
 	samsung,dw-mshc-ciu-div = <3>;
 	samsung,dw-mshc-sdr-timing = <0 4>;

-- 
2.51.0


