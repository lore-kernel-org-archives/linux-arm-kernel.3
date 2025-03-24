Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD367C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rHuROZnnYS52NtcI84OVTo9RCXp2wpkeXDDVlfPt4bY=; b=qyQoUc+xtn7YLV6MtCbvJkfWMU
	5clx8AKZVDr/brVEdemsyw/ECglgdMsvUOVscmPjiSyXPJmUELDKKC4ewI7eUcEpWmjQb+hPBrj+8
	+9qspPDHA1dPLoRH7gf8TPwVsQ2N32fN++QP0phckMpON7hrYc169V5pSEi/1+XhFXX/KOPgzceQ3
	UoP2jUj6zzT3ta8RMSxkft4eNDQQybRXbslYrclCKkVc6BeRovKDV3jiAJM4a7k+zZdDXNVhmowGg
	0Sw7donsqjv5R7tJNrsT+FdOJ0q3n0TJKdcNrWGKaOhafaLaxGUGsXkvFzmxfAEwWUHyGjixN+BJr
	Yu4c0cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twfZo-00000002uA0-0UQq;
	Mon, 24 Mar 2025 11:02:40 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twfY1-00000002tuw-2gGX;
	Mon, 24 Mar 2025 11:00:53 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742814047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rHuROZnnYS52NtcI84OVTo9RCXp2wpkeXDDVlfPt4bY=;
	b=mninbDkJMZh1hKxGonj2VDg1jotY3Rbe7BbbAYgxm1amZz1zas26XyE1/2CfsgLVgqT2YT
	xII3MVh+AD0CxKqlSUNoiYIwONjWjt4vZqwLvReT+8HsgowpWv/9bhwpPvu+n4Lw/ZbeNL
	fqMyeLrS0Ypyem7rfeFKgf+c3MS5QzaWZBWO0k1uUk6dRr6DGL5Vy2e2H10ykRCCvj/J01
	mZWYgCNw+g+BNGNuMeDI5RflRISP7u6tfjSbaIEUor+H4Ofz2R6TfSClkJDfYQh3JeCC+z
	Gbz6+S9XzLdKSdcv+htFZt4+D41SW/SUJfIJUxPoP0UQjgUBPf0P6lOxbIVIjg==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	stable@vger.kernel.org,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v2] arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dtsi
Date: Mon, 24 Mar 2025 12:00:43 +0100
Message-Id: <eeec0d30d79b019d111b3f0aa2456e69896b2caa.1742813866.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_040050_056930_F0CEB320 
X-CRM114-Status: GOOD (  18.40  )
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

The differences in the vendor-approved CPU and GPU OPPs for the standard
Rockchip RK3588 variant [1] and the industrial Rockchip RK3588J variant [2]
come from the latter, presumably, supporting an extended temperature range
that's usually associated with industrial applications, despite the two SoC
variant datasheets specifying the same upper limit for the allowed ambient
temperature for both variants.  However, the lower temperature limit is
specified much lower for the RK3588J variant. [1][2]

To be on the safe side and to ensure maximum longevity of the RK3588J SoCs,
only the CPU and GPU OPPs that are declared by the vendor to be always safe
for this SoC variant may be provided.  As explained by the vendor [3] and
according to the RK3588J datasheet, [2] higher-frequency/higher-voltage
CPU and GPU OPPs can be used as well, but at the risk of reducing the SoC
lifetime expectancy.  Presumably, using the higher OPPs may be safe only
when not enjoying the assumed extended temperature range that the RK3588J,
as an SoC variant targeted specifically at higher-temperature, industrial
applications, is made (or binned) for.

Anyone able to keep their RK3588J-based board outside the above-presumed
extended temperature range at all times, and willing to take the associated
risk of possibly reducing the SoC lifetime expectancy, is free to apply
a DT overlay that adds the higher CPU and GPU OPPs.

With all this and the downstream RK3588(J) DT definitions [4][5] in mind,
let's delete the RK3588J CPU and GPU OPPs that are not considered belonging
to the normal operation mode for this SoC variant.  To quote the RK3588J
datasheet [2], "normal mode means the chipset works under safety voltage
and frequency;  for the industrial environment, highly recommend to keep in
normal mode, the lifetime is reasonably guaranteed", while "overdrive mode
brings higher frequency, and the voltage will increase accordingly;  under
the overdrive mode for a long time, the chipset may shorten the lifetime,
especially in high-temperature condition".

To sum the RK3588J datasheet [2] and the vendor-provided DTs up, [4][5]
the maximum allowed CPU core, GPU and NPU frequencies are as follows:

   IP core    | Normal mode | Overdrive mode
  ------------+-------------+----------------
   Cortex-A55 |   1,296 MHz |      1,704 MHz
   Cortex-A76 |   1,608 MHz |      2,016 MHz
   GPU        |     700 MHz |        850 MHz
   NPU        |     800 MHz |        950 MHz

Unfortunately, when it comes to the actual voltages for the RK3588J CPU and
GPU OPPs, there's a discrepancy between the RK3588J datasheet [2] and the
downstream kernel code. [4][5]  The RK3588J datasheet states that "the max.
working voltage of CPU/GPU/NPU is 0.75 V under the normal mode", while the
downstream kernel code actually allows voltage ranges that go up to 0.95 V,
which is still within the voltage range allowed by the datasheet.  However,
the RK3588J datasheet also tells us to "strictly refer to the software
configuration of SDK and the hardware reference design", so let's embrace
the voltage ranges provided by the downstream kernel code, which also
prevents the undesirable theoretical outcome of ending up with no usable
OPPs on a particular board, as a result of the board's voltage regulator(s)
being unable to deliver the exact voltages, for whatever reason.

The above-described voltage ranges for the RK3588J CPU OPPs remain taken
from the downstream kernel code [4][5] by picking the highest, worst-bin
values, which ensure that all RK3588J bins will work reliably.  Yes, with
some power inevitably wasted as unnecessarily generated heat, but the
reliability is paramount, together with the longevity.  This deficiency
may be revisited separately at some point in the future.

The provided RK3588J CPU OPPs follow the slightly debatable "provide only
the highest-frequency OPP from the same-voltage group" approach that's been
established earlier, [6] as a result of the "same-voltage, lower-frequency"
OPPs being considered inefficient from the IPA governor's standpoint, which
may also be revisited separately at some point in the future.

[1] https://wiki.friendlyelec.com/wiki/images/e/ee/Rockchip_RK3588_Datasheet_V1.6-20231016.pdf
[2] https://wmsc.lcsc.com/wmsc/upload/file/pdf/v2/lcsc/2403201054_Rockchip-RK3588J_C22364189.pdf
[3] https://lore.kernel.org/linux-rockchip/e55125ed-64fb-455e-b1e4-cebe2cf006e4@cherry.de/T/#u
[4] https://raw.githubusercontent.com/rockchip-linux/kernel/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
[5] https://raw.githubusercontent.com/rockchip-linux/kernel/604cec4004abe5a96c734f2fab7b74809d2d742f/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
[6] https://lore.kernel.org/all/20240229-rk-dts-additions-v3-5-6afe8473a631@gmail.com/

Fixes: 667885a68658 ("arm64: dts: rockchip: Add OPP data for CPU cores on RK3588j")
Fixes: a7b2070505a2 ("arm64: dts: rockchip: Split GPU OPPs of RK3588 and RK3588j")
Cc: stable@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>
Helped-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Changes in v2:
      - Reworded and expanded the patch description a bit, to include some
        more information and to make it more clear what are the implied
        speculations and assumptions, and what are the available official
        statements from Rockchip, as suggested by Quentin [7]
      - Collected Reviewed-by tag from Quentin [7]
    
    Link to v1: https://lore.kernel.org/linux-rockchip/f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org/T/#u
    
    [7] https://lore.kernel.org/linux-rockchip/71b7c81b-6a4e-442b-a661-04d63639962a@cherry.de/

 arch/arm64/boot/dts/rockchip/rk3588j.dtsi | 53 ++++++++---------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
index bce72bac4503..3045cb3bd68c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588j.dtsi
@@ -11,74 +11,59 @@ cluster0_opp_table: opp-table-cluster0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-		opp-1416000000 {
-			opp-hz = /bits/ 64 <1416000000>;
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <750000 750000 950000>;
 			clock-latency-ns = <40000>;
 			opp-suspend;
 		};
-		opp-1608000000 {
-			opp-hz = /bits/ 64 <1608000000>;
-			opp-microvolt = <887500 887500 950000>;
-			clock-latency-ns = <40000>;
-		};
-		opp-1704000000 {
-			opp-hz = /bits/ 64 <1704000000>;
-			opp-microvolt = <937500 937500 950000>;
+		opp-1296000000 {
+			opp-hz = /bits/ 64 <1296000000>;
+			opp-microvolt = <775000 775000 950000>;
 			clock-latency-ns = <40000>;
 		};
 	};
 
 	cluster1_opp_table: opp-table-cluster1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-1200000000{
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <750000 750000 950000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1416000000 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <750000 750000 950000>;
+			opp-microvolt = <762500 762500 950000>;
 			clock-latency-ns = <40000>;
 		};
 		opp-1608000000 {
 			opp-hz = /bits/ 64 <1608000000>;
 			opp-microvolt = <787500 787500 950000>;
 			clock-latency-ns = <40000>;
 		};
-		opp-1800000000 {
-			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <875000 875000 950000>;
-			clock-latency-ns = <40000>;
-		};
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-microvolt = <950000 950000 950000>;
-			clock-latency-ns = <40000>;
-		};
 	};
 
 	cluster2_opp_table: opp-table-cluster2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-1200000000{
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <750000 750000 950000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1416000000 {
 			opp-hz = /bits/ 64 <1416000000>;
-			opp-microvolt = <750000 750000 950000>;
+			opp-microvolt = <762500 762500 950000>;
 			clock-latency-ns = <40000>;
 		};
 		opp-1608000000 {
 			opp-hz = /bits/ 64 <1608000000>;
 			opp-microvolt = <787500 787500 950000>;
 			clock-latency-ns = <40000>;
 		};
-		opp-1800000000 {
-			opp-hz = /bits/ 64 <1800000000>;
-			opp-microvolt = <875000 875000 950000>;
-			clock-latency-ns = <40000>;
-		};
-		opp-2016000000 {
-			opp-hz = /bits/ 64 <2016000000>;
-			opp-microvolt = <950000 950000 950000>;
-			clock-latency-ns = <40000>;
-		};
 	};
 
 	gpu_opp_table: opp-table {
@@ -104,10 +89,6 @@ opp-700000000 {
 			opp-hz = /bits/ 64 <700000000>;
 			opp-microvolt = <750000 750000 850000>;
 		};
-		opp-850000000 {
-			opp-hz = /bits/ 64 <800000000>;
-			opp-microvolt = <787500 787500 850000>;
-		};
 	};
 };
 

