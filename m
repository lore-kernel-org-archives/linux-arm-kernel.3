Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A87CF65EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LwJ8Ds2Zx7jHku23Og3so5VtuSKUUECnuXT3uP7CuVs=; b=egiSXciO1NXzCT+b0V5/2k3+BN
	5hB0+A6RVB1o8j+ODGXAHhG6uZ8Kv2Gaywwlpo2sviepRudvdkIE23sAOED0EOD1uJVr/QP+as5se
	DwWr7YHaA30HTC+83uzPguJXM49Ca52+Fu3yn6xTccg5dl+Lp9J8JDvo/yXFHhuv8KywJEtMQ5cdV
	+TIOG7bQ8pICjjiO8UPZpLEhXyTKeX2NFISPLL0n8Q9H/qCadE3om6PmmJPapTsabWRxfwekzRtPD
	sPUjfp5UAFRYfSYihRFFHGEsZdkpGVkbMSeiyoySDIhSLkL2nAUzJr/DK5653aosdHR2SlVDYTemY
	jsIKqrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlP-0000000CXYO-10zM;
	Mon, 26 Jan 2026 12:32:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlM-0000000CXXz-46Qx;
	Mon, 26 Jan 2026 12:32:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6D1A339;
	Mon, 26 Jan 2026 04:32:04 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B97B3F5CA;
	Mon, 26 Jan 2026 04:32:10 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: Clean up NanoPi-R2S Plus
Date: Mon, 26 Jan 2026 12:32:03 +0000
Message-Id: <94f66f34d6023887111884093f31a8980e993ef9.1767111968.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043213_084943_C37775CB 
X-CRM114-Status: UNSURE (   7.54  )
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

Apparently something went wonky in the refactoring, and NanoPi R2S Plus
has ended up "overriding" the GMAC properties from the base R2S include
with all identical values. Clean up the redundancy.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts     | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
index f72b1518c14f..4eff0503928a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
@@ -29,20 +29,3 @@ &emmc {
 	pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus8>;
 	status = "okay";
 };
-
-&gmac2io {
-	phy-handle = <&rtl8211e>;
-	tx_delay = <0x24>;
-	rx_delay = <0x18>;
-
-	mdio {
-		rtl8211e: ethernet-phy@1 {
-			reg = <1>;
-			pinctrl-0 = <&eth_phy_reset_pin>;
-			pinctrl-names = "default";
-			reset-assert-us = <10000>;
-			reset-deassert-us = <50000>;
-			reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
-		};
-	};
-};
-- 
2.34.1


