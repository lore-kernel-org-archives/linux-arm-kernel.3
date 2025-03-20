Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F45C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45MCYdDuqvuWrehVrmrC2FsHTGKtcRN9eXNdBztZj7k=; b=ZpUXYfnU1q2NvcAyWma/wuJ8go
	ozibyUvmD6FBnzCQkDANyLqf2NepzoHDWAH5BSSNPCCRmXvNyJ5hyTqpSxJrL4sHRAA0WQD/yJQlt
	LT8sf+2su1vkyXftZsYccpzaArwdBeaL5E43U6UoKilyFyoD4sdKcWYZzwWzlJnC+rowHCKM4IH+B
	wTCsnlXkPt8h4Onwzh6aOeTBETgNTLkwPM2oo9wNooxf0QARTJPLzyuLSWThmC2AZUbqrJqP4zKgL
	TGQ7CrZxu9BGNVxvUyht/3qvabOhUJrTlT8Rf34VfDsyuJEF57QHWhJC2//UZKHQPpONpN2SLjDlU
	vHt1zOgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCkX-0000000Bm6g-1GTt;
	Thu, 20 Mar 2025 10:03:41 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvCh8-0000000BlGN-1Y9V;
	Thu, 20 Mar 2025 10:00:12 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:27b0:1bde:abfc:3838:af13])
	by smtp.qiye.163.com (Hmail) with ESMTP id ef1b293d;
	Thu, 20 Mar 2025 18:00:07 +0800 (GMT+08:00)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Thu, 20 Mar 2025 18:00:02 +0800
Message-Id: <20250320100002.332720-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320100002.332720-1-amadeus@jmu.edu.cn>
References: <20250320100002.332720-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0xLVh5NSh1LSkIeGk9JSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlMGUtBShkfHkEaGR0YQUhDSENBGh1KSFlXWRYaDx
	IVHRRZQVlPS0hVSktISk5MTlVKS0tVSkJLS1kG
X-HM-Tid: 0a95b2fef1df03a2kunmef1b293d
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NCo6Ojo5IzJREEI1TRYUMSoV
	NDIaCxFVSlVKTE9JT01PQ0tDSEpNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSUwZS0FKGR8eQRoZHRhBSENIQ0EaHUpIWVdZCAFZQU9LTkg3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_030010_597598_59E9856A 
X-CRM114-Status: UNSURE (   9.23  )
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

The OPP values come from downstream kernel[1], and voltage is chosen from
the one that makes the actual frequency close to the displayed frequency.

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528.dtsi

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 621fc19ac0b3..9dae18c3c770 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -61,6 +61,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu1: cpu@1 {
@@ -69,6 +70,7 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu2: cpu@2 {
@@ -77,6 +79,7 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu3: cpu@3 {
@@ -85,6 +88,7 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 	};
 
@@ -103,6 +107,66 @@ scmi_clk: protocol@14 {
 		};
 	};
 
+	cpu0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <825000 825000 1100000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <825000 825000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <825000 825000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <850000 850000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <850000 850000 1100000>;
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
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
-- 
2.25.1


