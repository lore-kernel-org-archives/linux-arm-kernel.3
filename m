Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886F2C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzIVvAbb5PHoYRQipnx6IM41Ral2jdEYKpFq7LLojm4=; b=upb3gtYc4gEGzEH5NsRYd9nVZU
	LmxvzrJ9MX+lfoXAU5xv9RNK4jlceYEaaGcOhgUsuUQ5VPavQIA5BD5ljZmIaEBsMoeqCHkuJZsE3
	3dsOHgML7mFLf7DrLJFA7A3kQx9pI4TAzzCm1ym9KT7U+9zFxUMM7gwh4o220T9lAumdwmFdO5tkF
	gKQ5q9APz9GjsGzo6Zm6RaAFObZuG68Mc032wI5Fa2g3g3u+ZFxt5s3hDPoCRXU+t4yTkF200PEIH
	62dQKBe9yRzbxiB2ZR8FaCuLMv+jGn9koSKtv1ahyddCCvU7smMWjDFrzYmVMtJo3x3xqTf5odMQH
	YD+aVdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZVw-0000000FQAk-1wUz;
	Fri, 20 Jun 2025 11:02:32 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYXj-0000000FHcR-3PW4;
	Fri, 20 Jun 2025 10:00:21 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:2eb0:2d06:fb3f:ec9:50ac])
	by smtp.qiye.163.com (Hmail) with ESMTP id 195ff8217;
	Fri, 20 Jun 2025 18:00:16 +0800 (GMT+08:00)
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
Subject: [PATCH v2 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri, 20 Jun 2025 18:00:10 +0800
Message-Id: <20250620100010.1291658-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
References: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGksZVkhJGUkaSU8dSENDTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUkeGUtBSR9LTUEdGUgdQR4YQkFOSxoYWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a978cc825cc03a2kunm2902750c11af80
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mkk6Kzo6NjE4HioLLTEICzMu
	SCoKCzNVSlVKTE5LT0pITUpMTUpOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSR4ZS0FJH0tNQR0ZSB1BHhhCQU5LGhhZV1kIAVlBT0pMSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_030020_020462_E684786C 
X-CRM114-Status: UNSURE (   8.72  )
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

The OPP values come from downstream kernel[1]. Both 408MHz and 600MHz
frequencies use the normal PLL, so use the corresponding highest voltage.

The voltage used for other frequencies can't be less than above (875mV).
Therefore, 816MHz to 1200MHz also uses the corresponding highest voltage.

The remaining 1416MHz to 2016MHz use a voltage close to actual frequency.

[1] https://github.com/rockchip-linux/kernel/blob/develop-5.10/arch/arm64/boot/dts/rockchip/rk3528.dtsi

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 829f980ea353..5cb7f10b79ed 100644
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
@@ -77,6 +80,67 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			enable-method = "psci";
 			clocks = <&scmi_clk SCMI_CLK_CPU>;
+			operating-points-v2 = <&cpu_opp_table>;
+		};
+	};
+
+	cpu_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <875000 875000 1100000>;
+			clock-latency-ns = <40000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <900000 900000 1100000>;
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
 		};
 	};
 
-- 
2.25.1


