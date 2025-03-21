Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB6C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 03:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvimR6SKo0jtW7eTJ4niI635OpzUmByoQ1ePS3vCVMo=; b=zJS++uGBolj+nXPEQ1m8SU2BDi
	I9/IN0KghTWiZ8LH9Sw7uIrXbILsQnWlVVjdIAxrsIunap+anSIjLLohZJwLW8FtksieuO0q1qd7C
	6/BrySrtmh/FyK+Go53l98xXHKseo4JLOHuU0HCgievpwK5v00jOToEaYnyQueLRatgKpEIgrJCiW
	DHrCpGqKxiQ2sAqG+pU9MWY2sW/ikBxcBhwZNg6wUgadV5tDLcHD1crMfqX/Fi7q0zPcBox3jJtnA
	6KSBnOsn+/KnMKEt78alh9vngtjsK2MAea9vdGL0MfaMjMDgdNGbNuwpux5+1plwRuHRJ/I0Jad9m
	0K+pTKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvT5u-0000000Dl3v-2bEE;
	Fri, 21 Mar 2025 03:30:50 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvT48-0000000Dkuk-1nSt;
	Fri, 21 Mar 2025 03:29:05 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1742527737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TvimR6SKo0jtW7eTJ4niI635OpzUmByoQ1ePS3vCVMo=;
	b=efsqqC+In51YqG17swWvtDJmtXPw/VfdVPNwfuCEPtWye0J0e3juf/qxyhpq6e38T9cmjx
	psIlggfq4gYjKmDY12xsnKMfzBUyPvcDgPbzZboB5JpXzv6VValNa6hnK/5DCCsVU2Boag
	+h3tq7LhyDyoFJSwTul01XrJ0ObfKkm1Nr4PP2YotgGcwntmOZdfNzN3J6aOX3vW0w0aEI
	i0ONlST1c908yXV9jfKeBqHf/YKasM6poA8P3cSmzKLFzXB88OY2M6uVKETwFQCdTM6zx8
	Yf3ZOuWUiCj4TujmlOBAdtgCmBsH4i6Sgojwu2rCOe5EOa239fQvs6/KIaSi9w==
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
Subject: [PATCH] arm64: dts: rockchip: Remove overdrive-mode OPPs from RK3588J SoC dtsi
Date: Fri, 21 Mar 2025 04:28:49 +0100
Message-Id: <f929da061de35925ea591c969f985430e23c4a7e.1742526811.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_202900_853555_09A7C827 
X-CRM114-Status: GOOD (  17.57  )
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
according to its datasheet, [2] the RK3588J variant can actually run safely
at higher CPU and GPU OPPs as well, but only when not enjoying the assumed
extended temperature range that the RK3588J, as an SoC variant targeted
specifically at industrial applications, is made (or binned) for.

Thus, only the CPU and GPU OPPs that are specified by the vendor to be safe
throughout the entire RK3588J's extended temperature range may be provided,
while anyone who actually can ensure that their RK3588J-based board is
never going to run within the extended temperature range, may probably
safely apply a DT overlay that adds the higher CPU and GPU OPPs.  As we
obviously can't know what will be the runtime temperature conditions for
a particular board, we may provide only the always-safe OPPs.

With all this and the downstream RK3588(J) DT definitions [4][5] in mind,
let's delete the RK3588J CPU and GPU OPPs that are not considered belonging
to the normal operation mode for this SoC variant.  To quote the RK3588J
datasheet [2], "normal mode means the chipset works under safety voltage
and frequency;  for the industrial environment, highly recommend to keep in
normal mode, the lifetime is reasonably guaranteed", while "overdrive mode
brings higher frequency, and the voltage will increase accordingly;  under
the overdrive mode for a long time, the chipset may shorten the lifetime,
especially in high temperature condition".

To sum up the RK3588J datasheet [2] and the vendor-provided DTs, [4][5]
the maximum allowed CPU core and GPU frequencies are as follows:

   IP core    | Normal mode | Overdrive mode
  ------------+-------------+----------------
   Cortex-A55 |   1,296 MHz |      1,704 MHz
   Cortex-A76 |   1,608 MHz |      2,016 MHz
   GPU        |     700 MHz |        850 MHz

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
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
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
 

