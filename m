Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7522C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnmIHWM+Lbqf4+D3+/iGghV9O8TS/xzNV2+LfpncC5M=; b=AgwCWwy1caITWP3hBi/cymHqT0
	e6uWMKMAZbNmcdjGHmcKsnoiA9acwi/ZlUtNzZwUoBtcnIjxkYm98NXmlpMWDR1sOOyyVv1ZEbXXn
	WRQNfvRWnoS9RIzTnsmHDv3B3hKSJm4piRSxZ4Z6v/VvvZBbFzf46moy724/oAZGf3wTRbrWuZeCA
	xnaO+Th3IDYszFuWP7Abie1+R04oPl76A5T7dMToX4jmxvfab62u6qgC0K4KlOE7tMymlxON5IoJp
	TMv9Y0C/XdiccbBdrZbeLwb6/O+mDdm5lDzP1Z1FnuYWXqvnqNBnEX0Mu3dU7FssfM9hlyBXIuhfP
	65+4J7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCji-0000000BGX0-1x0O;
	Thu, 06 Mar 2025 15:02:10 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCi6-0000000BGKK-2spd;
	Thu, 06 Mar 2025 15:00:31 +0000
Received: from localhost.localdomain (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d2dcd17e;
	Thu, 6 Mar 2025 23:00:27 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 1/1] arm64: dts: rockchip: enable SCMI clk for RK3528 SoC
Date: Thu,  6 Mar 2025 23:00:17 +0800
Message-Id: <20250306150017.488975-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306150017.488975-1-amadeus@jmu.edu.cn>
References: <20250306150017.488975-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSx1JVkxNHkMdTEwaTU1MSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktISk5MTlVKS0tVSk
	JLS1kG
X-HM-Tid: 0a956bf8e0a003a2kunmd2dcd17e
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MU06TRw*KjJOMjM#DTU5Eg4j
	GCgwCypVSlVKTE9KSUxISUlDS0NDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUpCQ0s3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_070030_903295_9AC4B61F 
X-CRM114-Status: UNSURE (   7.56  )
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

Same as RK3568, RK3528 uses SCMI clk instead of ARMCLK.
Add SCMI clk for CPU, GPU and RNG will also use it.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b1713ed4d7e2..476b83f98834 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -59,6 +59,9 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			assigned-clocks = <&scmi_clk SCMI_CLK_CPU>;
+			assigned-clock-rates = <1200000000>;
 		};
 
 		cpu1: cpu@1 {
@@ -66,6 +69,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&scmi_clk SCMI_CLK_CPU>;
 		};
 
 		cpu2: cpu@2 {
@@ -73,6 +77,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&scmi_clk SCMI_CLK_CPU>;
 		};
 
 		cpu3: cpu@3 {
@@ -80,6 +85,22 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			device_type = "cpu";
 			enable-method = "psci";
+			clocks = <&scmi_clk SCMI_CLK_CPU>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x82000010>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
 		};
 	};
 
@@ -88,6 +109,18 @@ psci {
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
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.25.1


