Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3810CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yp4+FZjZt/4eu5VITlYnjQ95+judrNZR/YSchTyOmRU=; b=SYWR4H0EfZ+Vb1sx3kzhIxrqEG
	oGMMDBdkf5Un0Z/VQGeQLcXrA5XlzLa8ukhCE0kI3/yPnr4UrMIPWI3mBS2Lj1SAFORkyPHnFVsrg
	tEW8qFrdM+0Oq2pNp14dLh7/C0JdOiw0ktJRy6bZ5XwxkMkA/8/w0mZQIpe3hrSTRn32XscSHtCGw
	FPclg1aM3giOEMWG1ayJD85F9y1QM1cUN0MvJiCbCYUgfy/EGODV8mfJTrRLPeIXC1mI7oJxYOuat
	gXzEZlK/nfLr+5XznIll2d2rzblb9JWGCmDGejPsFL/JrtT3D2yfY5GMtuD++dW3KMW7XSaW7XHIv
	R7Y2lZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAPY-00000007NrP-0DzQ;
	Sat, 01 Nov 2025 12:08:48 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFAHS-00000007K4H-079D;
	Sat, 01 Nov 2025 12:00:31 +0000
Received: from localhost.localdomain (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2801cc492;
	Sat, 1 Nov 2025 20:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Hsun Lai <i@chainsx.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
Date: Sat,  1 Nov 2025 20:00:05 +0800
Message-Id: <20251101120010.41729-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a3f4a23ca03a2kunmfa682f8b2d365c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0gdVh1LHhlNHU0aSh5PQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_050026_288861_69796A38 
X-CRM114-Status: UNSURE (   9.33  )
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

Add missing MMC aliases. Remove the max-frequency property
from the MMC node, which is already defined in rk3576.dtsi.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
index 59c172573cf8..9cbd3fae16ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
@@ -19,6 +19,8 @@ / {
 	aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
 	};
 
 	chosen {
@@ -735,7 +737,6 @@ &sai6 {
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;
-	max-frequency = <200000000>;
 	mmc-hs400-1_8v;
 	mmc-hs400-enhanced-strobe;
 	no-sdio;
@@ -749,7 +750,6 @@ &sdmmc {
 	cap-mmc-highspeed;
 	cap-sd-highspeed;
 	disable-wp;
-	max-frequency = <200000000>;
 	sd-uhs-sdr104;
 	vmmc-supply = <&vcc_3v3_s3>;
 	vqmmc-supply = <&vccio_sd_s0>;
-- 
2.25.1


