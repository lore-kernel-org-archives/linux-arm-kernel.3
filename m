Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76839C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPOeT0UlkDB7bURmE/gi4VgTTsC5oEgCEAZwO5PY7hM=; b=qWX7HKnJn6usdUqipts+kUX1/M
	KKHCjYnl0xAar/HlEQhqEfO0M3zbM09mhjFYTYvf/KEyHL8hUyfZ8rKjjxzAPb2MfrNIg7vI5LtVr
	U+RfTvakeDA6RRV1fUOPiMOmMLTbGusG/GUVWO7d1drirzOWDR7ruBPv5S/DwV5QZ1N4mvr6xqq+b
	CI7MI46a5NniLw75iQNWa2M7jCVUqwlgXijMPoZ5ho5Sq4mcl/DKwzPjiQWaXIA/zn8IVOsysPmLF
	cIvy7nniI8adfOja+Ed5NTmyTsMC19fHnYPxV1R65AwEz/HmDMoKSSMJAuDroPybpKi2SFCR715i+
	Vf46jhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrevr-00000004IsH-22q0;
	Wed, 05 Aug 2026 16:57:31 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrevo-00000004IrC-2D8r;
	Wed, 05 Aug 2026 16:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785949039; bh=ZPOeT0UlkDB7bURmE/gi4VgTTsC5oEgCEAZwO5PY7hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rTP2MB8VN1LUPdnmON8tLZ/7fT6tkkhZtKH3vJGO/3G4+Rs62lPBNKdOyYh7gje4r
	 +LPnoJC+4y2CU1RMJLp6qcWewCou/N6GhF+lVn1GtJYDHQPiUrOdSnv08SnKTIZNgW
	 8oSbUJJ3AYssuB/p8FmtSHDorXS30UI0bYgdC6/A=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E509F079; Thu, 06 Aug 2026 00:57:16 +0800
X-QQ-mid: xmsmtpt1785949036tj1ii2sgr
Message-ID: <tencent_9C3151C59C077D547095ACDC1F08B481A50A@qq.com>
X-QQ-XMAILINFO: MhLcXbI0hPoHMGGAbEH+EabkpcEzS84YEckOoMysrLTZeDMmWWNlq/1vpTr4Dg
	 3xVE6gSA7ehjrtQGU1HpDNR2KspTxyAwHfj+JRXW+c+n14JN5mNsuIDNtuPExuISGp0bg51TESmg
	 prZFI7WTW/M8ECpqSWMdVoO/uX6LDRHQxjNNrJM8GJPEhQC7X8An+hDdrKoveYbE3G2KT7wTb9rX
	 Qa9W764Who91jaJT6bOVVc060H9CkzBRPb3mUka7fsEGQKRClMdUshiq93E+jr3UzMDsGMe1fNCu
	 hYi7KFybCkgFA/QUAgyepy45wnrjoGM9e8HNo/W2kgTkxqpYffvNySlmnbeK1AsYMjM0qjo0GLTl
	 ykn8ZoDnlUwqZvYvvoZAdBe9/TaHezOuIfg+ouM7gFYNJh7q2vCi5Fpr9aSDw3Sfn/r/LMUhsfcx
	 jdghoP7xHufh9X2pp+oP1tgWxhSaDg3qvALYznral//vFn1FJhuzwIwVryr5GYzxRmvB0pO2egTt
	 5dp0EYk1vfNiS5QXAa9LiU27mFBwQVJAfvr6SsCb/qB3yBBZjeu0XSf3ubfTB5I4cno1CxwVJH7J
	 llY88vpRofjheWcSB2mZ4iiCvKQpvZ8u2i+lSKf5wnK5wFwi7Hbbc2CfjLHjY0Sv2v8kqHicGMTk
	 TicXlJQ9WRJhN/BvXR6oMDpx2QBio5L2iffRBXBLu9SsogDXRovjEPW3KZdgC9fBx7vPPrZxq6J2
	 TWSkXVhqzmkoQ6nSR/u84UVi5p6rjqaVUVhgHEM+5GUilddDDTwT8Oe3kRLRHeyk3Y25/VqJyXzt
	 ittfCWgtEKFxx+ajxMJtFkBQgvryydD+5Ra9CGYvOJdxjYMB25LHhiu4nd8TDpeCl1LsbtigaWwA
	 3xM1hETWjnpSODzsQGTRQ5o5lTkgDJ7bs8iHiTyaCtCXrTXux21JF2KOmH5iQa2WbWmM59mb7RoC
	 HBXztE58Fhy6WTnru9BpWsqJ+6DZo1nU4sWL30iM+2Hq7oHTSgASVoyq6iHCfhf30t0ttKvd8+oL
	 gNUFRclwaus9UyBUkRu6JW0cwYIV9vANPFCmeg5nHHrancek5qpkvXSyWpv7rKDreA4W1UIjaFve
	 DZTexdBh8W4qu/cGjJ8jswg/VnUu8e1YpcS5Co1ub3/WdtzShypRqjcTWDmQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Pufan Jin <2254650260@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jimmy Hon <honyuenkwun@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: Enable the NPU on LubanCat 4
Date: Thu,  6 Aug 2026 00:57:06 +0800
X-OQ-MSGID: <20260805165706.137254-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
References: <tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_095729_102201_BE477768 
X-CRM114-Status: GOOD (  17.66  )
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

The three RKNN cores and their IOMMUs are disabled by default in the SoC
dtsi, so the board has to describe the NPU supply before they can be
enabled.

This board feeds both the NPU logic and its SRAM from a single RK8602
output on i2c1. The vendor DTS makes that explicit by giving the same
regulator node two labels, vdd_npu_s0 and vdd_npu_mem_s0, and then
handing one to rknpu-supply and the other to mem-supply. There is no
separate memory rail to describe, so npu-supply and sram-supply both
point at vdd_npu_s0. The binding requires both properties.

Neither property is what actually enables the rail: the rocket driver
never requests a regulator, it only takes clocks, resets, register
ranges and a power domain. The rk3588 power domain driver marks
RK3588_PD_NPU as needing a regulator, so the rail has to be described on
pd_npu, the root of VD_NPU that the three per-core domains hang off.
This matches what rock-5b does.

Since pd_npu now controls the rail, drop regulator-always-on from
vdd_npu_s0 so the domain can power it down while the NPU is idle.
Nothing else is supplied from this rail, and rock-5b describes the same
regulator without the property.

Mainline has no NPU OPP table, so all three cores stay at the 200 MHz
the SoC dtsi assigns to the shared SCMI clock. Clocking them higher
needs an OPP table to move vdd_npu_s0 along with the frequency, which is
left for later work.

Tested on rev 20241026 hardware: all three cores probe, each reporting
NPU core version 1179210309 and landing in its own IOMMU group, the
rocket driver registers /dev/accel/accel0, and dmesg is free of NPU
errors. With the rail no longer pinned on, regulator_summary shows
vdd_npu_s0 at a use count of zero while the NPU is idle, so pd_npu is
free to drop it.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
Changes in v2:
- Drop regulator-always-on from vdd_npu_s0, so pd_npu can actually power
  the rail down. Thanks to Jimmy Hon for spotting it. This mirrors
  commit de5b39d16318 ("arm64: dts: rockchip: Remove workaround that
  prevented Turing RK1 GPU power regulator control"), which did the same
  for vdd_gpu_s0 once the domain-supply was in place.
- Mention the change in the commit message and retest with it.
- v1: https://lore.kernel.org/linux-rockchip/tencent_FF56D057857A89EBFD82C037D80A53598C06@qq.com/

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index a0fc128ce6e1..e5c2e77d86c2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -276,7 +276,6 @@ vdd_npu_s0: regulator@42 {
 		reg = <0x42>;
 		fcs,suspend-voltage-selector = <1>;
 		regulator-name = "vdd_npu_s0";
-		regulator-always-on;
 		regulator-boot-on;
 		regulator-min-microvolt = <550000>;
 		regulator-max-microvolt = <950000>;
@@ -365,6 +364,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hym8563 {
 		hym8563_int: hym8563-int {
@@ -407,6 +410,36 @@ &pwm0 {
 	status = "okay";
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";
-- 
2.55.0


