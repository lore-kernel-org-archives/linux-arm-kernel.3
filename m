Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A1FD637B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 10:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NWE/yr9JgikBUHp/cYzmcS6sDLAyosvzbVnIE4GZ/xs=; b=s8WJ5TTmglnd3wCxuX9k+u19Ds
	D7fgjrz2RMrqEw8rPl3AO5syUYQTxs0NwyymJKt9zI+Jud+8GBUcU6Pjzkxv/jRFaeaskheqiutWF
	LgOhTN4UAJ+75mk64FigFH6XK/JXU8mrX/8RIb8o+hU7E/bDLOZBPtKPyy2JtasT2XkoeAvRXjJ9T
	/UMWNh655jNwWuVuDNFwjXiDFRh004xiSlihS60wnY8cbKfs5DUvORdcsHsRIxp2cKeiVhUEeIcTW
	Mqxdfc65DAdeFbIeK3gLWfCH5a82CckpmF2R5dXdeckpkN8IESykCQMlF9R9RUOvIQIowAUFg69pL
	jcDCiNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtlN-0000000BTqd-0snW;
	Sat, 20 Dec 2025 10:00:37 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWtlI-0000000BTp4-2P25;
	Sat, 20 Dec 2025 10:00:34 +0000
Received: from localhost.localdomain (unknown [119.122.214.229])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2df715f9e;
	Sat, 20 Dec 2025 18:00:18 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: remove rtc regulator for ArmSoM Sige5
Date: Sat, 20 Dec 2025 18:00:08 +0800
Message-Id: <20251220100010.26643-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b3b33f23803a2kunmb12117682b9085
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkxLVk5CGEsYQh1LSUIaHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJSUJZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0xVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_020032_771839_75C28643 
X-CRM114-Status: UNSURE (   6.62  )
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

According to the schematic, RTC is powered by vcc_3v3_s3.
The vcc_3v3_rtc_s5 regulator does not exist, remove it.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 3386084f6318..392ba83ab05a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -156,16 +156,6 @@ vcc_3v3_pcie: regulator-vcc-3v3-pcie {
 		vin-supply = <&vcc_5v0_sys>;
 	};
 
-	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc_3v3_rtc_s5";
-		regulator-boot-on;
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vcc_5v0_sys>;
-	};
-
 	vcc_3v3_s0: regulator-vcc-3v3-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_3v3_s0";
-- 
2.25.1


