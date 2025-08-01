Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4DCC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9utFtjmeNqL3bHFV9lskKkmY0Kq9z2PHSNN8PhkCHw=; b=eryHCJbBMJ5TCIum6UArF4VHz2
	5l/oN77heX6i1vBK2UvoLCrtPxrQzofdQU9KgAAPoZIQ5RvpnlMsJStejJ2AsbMRAWK8tZrxooUwf
	v1b9rdpV3DzKygjtlGEqccDUXPG2qXXo1+93G/r7G/48HGKOOG5Gwv5giNQ1o+fPmRoTaHpkF/hsS
	KilcDaNJVRure3OWLYP4uB9QHv8pJsRihl2UeCfebwnqbwo7iIGIO3LqkxgAsT7lqyVMd+4izbjgd
	PbUsMFfvU3D8qFccZVLLPLWnTcTw/TEM5IMruoinHOeW+grkDAWOGBwOEDX+fT47Uc2Nn4FrqAscy
	9MmVWO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkwx-00000005E4U-163P;
	Fri, 01 Aug 2025 08:17:11 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkgz-00000005CQv-1unV;
	Fri, 01 Aug 2025 08:00:44 +0000
Received: from localhost.localdomain (unknown [119.122.213.139])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1dfa26365;
	Fri, 1 Aug 2025 16:00:32 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri,  1 Aug 2025 16:00:25 +0800
Message-Id: <20250801080025.558935-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801080025.558935-1-amadeus@jmu.edu.cn>
References: <20250801080025.558935-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9864a5a04803a2kunm02af6e1563592
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ09IVkJNSkxIS0sZQkpPS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKSEJZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_010041_681389_F7850059 
X-CRM114-Status: UNSURE (   9.64  )
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

By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
voltage mapping to the device tree to enable dynamic scaling via cpufreq.

The OPP values come from downstream kernel[1], using a voltage close to
the actual frequency. Frequencies below 1.2GHz have been removed due to
the same voltage.

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528.dtsi

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 001a555c83b7..15fd9f99beaa 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -53,6 +53,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu1: cpu@1 {
@@ -61,6 +62,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu2: cpu@2 {
@@ -69,6 +71,7 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 
 		cpu3: cpu@3 {
@@ -77,6 +80,7 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
 		};
 	};
 
@@ -95,6 +99,41 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <925000 925000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <975000 975000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1800000000 {
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1037500 1037500 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-microvolt = <1100000 1100000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+	};
+
 	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
-- 
2.25.1


