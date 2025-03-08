Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6153BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpW3RTHrfPs5zZ9oBlA5lEMbQKxW+E5CLf7PMMfGE+k=; b=RYSPLn2r7ml6TvZX35E9Gu8atK
	zT4gBOhH982jndXgKkrnLFfBDQRoQUW778MCHqxB+3WKp0yil26z1G/I5J1+DNL+AUbw0uwiwfuMe
	alJFCaDoq01xfll1lBRSfKOXUaG/XOkytIo2zWipXUWvSIm7xNGkOkcJZ8a0EF5JnbtU3DrE9FZ33
	MIqm5tnuS3JBA22i7jAAadNWtL4fSyw884GjYNDjhxxWJoByZFKt+t0eKT4eBJ3NFPcbPJlQJv5JJ
	yj00+RKwmn3Q48wGy/FRNVN+O89oV8yyHliEXXoEJjtNI6F7NBlNDh+uD1mOyE9O2QYkAJqhS3NkU
	WHsqqHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqr1m-0000000GTMf-1OM3;
	Sat, 08 Mar 2025 10:03:30 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqqyX-0000000GSzk-3CYO;
	Sat, 08 Mar 2025 10:00:11 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:3300:217:f42e:f419:35e])
	by smtp.qiye.163.com (Hmail) with ESMTP id d8ad0332;
	Sat, 8 Mar 2025 18:00:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Rob Herring <robh@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: rk356x: Move SHMEM memory to reserved memory
Date: Sat,  8 Mar 2025 18:00:01 +0800
Message-Id: <20250308100001.572657-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250308100001.572657-1-amadeus@jmu.edu.cn>
References: <20250308100001.572657-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGB5DVkIfSEJKGkpNTEwZSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUhIS0tBSUpMQR1PSR5BHU9KQkFITh5ZV1kWGg8SFR
	0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg++
X-HM-Tid: 0a957532a0cf03a2kunmd8ad0332
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAw6Eww5DTJWECkIPCs9Dy8V
	Qk4wCzdVSlVKTE9KT0lDS0tMTExIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSEhLS0FJSkxBHU9JHkEdT0pCQUhOHllXWQgBWUFKTkpJNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_020009_963583_DD4005ED 
X-CRM114-Status: UNSURE (   8.59  )
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

0x0 to 0xf0000000 are SDRAM memory areas where 0x10f000 is located.
So move the SHMEM memory of arm_scmi to the reserved memory node.

Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568 SoC")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 4f11141ea146..fd2214b6fad4 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -174,6 +174,18 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scmi_shmem: shmem@10f000 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x0010f000 0x0 0x100>;
+			no-map;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
@@ -199,19 +211,6 @@ xin32k: xin32k {
 		#clock-cells = <0>;
 	};
 
-	sram@10f000 {
-		compatible = "mmio-sram";
-		reg = <0x0 0x0010f000 0x0 0x100>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x0 0x0010f000 0x100>;
-
-		scmi_shmem: sram@0 {
-			compatible = "arm,scmi-shmem";
-			reg = <0x0 0x100>;
-		};
-	};
-
 	sata1: sata@fc400000 {
 		compatible = "rockchip,rk3568-dwc-ahci", "snps,dwc-ahci";
 		reg = <0 0xfc400000 0 0x1000>;
-- 
2.25.1


