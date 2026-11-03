Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBFE606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4P23bjM7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aq6dsubP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PCU7y3jR1uP1uuD4qOMsO0MEVxorZLQ+huDNPjoG2X8=; b=4P23bjM7uoyjbORzEBSbjp/HCr
	wXzqD9hBkhghFyINHPE/RFbWOH1dEE++P4aI1TqhXq8Qw+bFmYiN7E3p/+9e+aADlZpdl+aWLUO6U
	xpA2dFSmxKvSBVu1Am2we/XrW2DC/tLnYyW/FyyXADcAtqa34vEPc5veqUgx63yyvIyeXjkLkfJN2
	3NW4WZRaqffK2JLnC39FLdgbRQNrp2bwo/9iA+hEZ1gzePXY7V0H9XYnamXhJfpG1Z6aaaCvwAZvT
	HHG2t4KTgEGjuwFRdxtUU567rbR7/EItzJIkd6QR4HihYibYrJCKGN9mp0cepkld16g08SCtHSM6Y
	l9/jEoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVv-00000001hQw-3qbf;
	Tue, 03 Nov 2026 09:09:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAVu-00000001hPf-0mbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:09:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B0EA643ACC;
	Tue,  3 Nov 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793696945;
	b=mgBqf/bYAcVMhR72SGOC9neF+CBp/A1hyonwAay+/l+kEC2M7ZSBrXMazS5XAWtot3zM
	 4klvSv5R9mJNIJe29DrzLc8LmAgcWDW+GnAdpKf/RZ8nd9ze3WpzZsGJ94utvJA/25mnj
	 jXvNyixDou/oiIvfovrAUH3YrZoqQ7fzx2eq9PcIq6K2YutOvfu1WByKGJnzDpkDFABrs
	 MWyOiSw0pY3sfoKGtuaOgpnm/2AIlk2cpa0pBbPwPuvhJWeY1AU20c8P1x8I3eHun27OC
	 mPheyZcKo0meUnYsyw0+ffGkAWFWDYSEmbajgeGhBaWEuJ0867Ri/8FAdZsaW6hMwWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793696945;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=PCU7y3jR1uP1uuD4qOMsO0MEVxorZLQ+huDNPjoG2X8=;
	b=lVahx5wd7uZoQe7yEWSTobVfRbPpiNREon/ORcT69L9bnwxiM4OMLLtbnOlzAayiK5BO
	 MBwN6iCVo2gqsrfN7PYC+Yy2G/28mvDy0Jj6kUgZJy8s82Xu3ibfl69boY7slLuZr9Q52
	 HYRoMR9vS0iqg3RFUK/SBu8lVhoRh2Pm7dPPN2ppJ+wrEzWJj7FZJG1weWqSWF6Qy0Hmp
	 GCBdyfAyOO3dkbjtcxW7HjBPs1Chh8RtNMxNqfrlzgtvL8gSw9PKbctzQ6BW43h3DUcFO
	 H/cfyFVV3Ur8tgZpOjD7aPms9Y78rZc+EtHFzdP2Z169ivsQFWeAIfp/MgXOuJ7bKmA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EFEF51F00919;
	Tue,  3 Nov 2026 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696945;
	bh=PCU7y3jR1uP1uuD4qOMsO0MEVxorZLQ+huDNPjoG2X8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=aq6dsubPkp32rsbD+ufsqGYrpS/FtmaBuoNWf9tp8QvU3cdj2w8EVl9akysMHxqTv
	 qGnXUXkkY6YfQCvHKqmSFCwSHTMaHH0x6XA3i5isw5okcOv0o9buT3Eh/enZVuho7g
	 Jjo7DUtFiqdhqnDLMviKVIjg3iLmXz2jOBFiRLj386F5DcQ3tnvCq6dp/lT+TpKeSl
	 RvGhbFA1nAvs6qw0vrbH1haI8VueBbLN9a7BS+T9argtvBS6afVwYuj4ZcQC8R7eQT
	 y/DP0kXNiRYd82q03Xshe69LQjdZcwZYAiz/EQrhnIiepAg2S41Tgo3X1V7IdXH/hJ
	 ttnFx0HHFPDbQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4CF9C4684D;
	Tue,  3 Nov 2026 09:09:04 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Tue, 03 Nov 2026 03:09:04 -0600
Subject: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK+k6WoC/yXMQQrCQAxG4auUrA0ktah4FXExU39tRGtJRhFK7
 +6oy2/x3kwBNwTtm5kcLwt7jBW6aqgf0ngB26maWmk3qrLmpCJcBvg93bi4TcEZ2mEn3TZLohp
 OjrO9f9PD8e945iv68j3RsnwAeuWDOnYAAAA=
X-Change-ID: 20261103-a100-thermal-trips-be14e8047b0a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793696943; l=3851;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=TK5v1GFylrgHUT61Byg8vJfxL26nBlC6KGx7Vp13nuU=;
 b=/0kW6ihxKb1jQSR5o8EODnSv+/ohl7t86rMTSddqI7rmvqiEcu/p299NMpE/Ho5Fz1M0xWnl5
 TIh1RNopqd7Bwqbl5AidD39HpB0upbRkKxbFiRQ6ANcSnaXnG3akcoK
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
points, so nothing throttles the CPU as it heats up and nothing shuts
the system down before it overheats. On a KickPi K5C (A133) without a
heatsink, the CPU reaches 90 C within minutes of full load.

Add a passive trip at 90 C that throttles all four cores through
cpufreq, and a critical trip at 110 C, using the same layout as
sun50i-h6.dtsi.

The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
BSP drives this zone with the power allocator governor: control starts
at 70 C, the target is 90 C, and 110 C is critical. The power
allocator needs a power model of the CPUs (dynamic-power-coefficient),
which the A100 does not have in mainline, so here the 90 C target
becomes a step_wise passive trip, and the 110 C critical trip is kept.
110 C is also the highest working junction temperature in the
recommended operating conditions of the A133 datasheet (rev 1.5,
table 5-2). The absolute maximum is 125 C.

The GPU and DDR zones are left without trips, as in the BSP.

Polling stays disabled: the sensor raises an interrupt every 250 ms
and the driver updates the zone from it, as on the H6.

Tested on a KickPi K5C (A133, no heatsink):
- one hour of full load on all cores held the CPU at about 90 C, with
  short throttling to 1.32 GHz
- with thermal emulation, a rising temperature lowers the limit one
  OPP at a time down to 408 MHz, the limit is released below 88 C, and
  111 C triggers the hardware protection shutdown

Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
arm64: dts: allwinner: a100: Add CPU thermal trips and cooling maps
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index ba6020989..fce91dc2c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/sun50i-a100-r-ccu.h>
 #include <dt-bindings/reset/sun50i-a100-ccu.h>
 #include <dt-bindings/reset/sun50i-a100-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -24,6 +25,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -32,6 +34,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -40,6 +43,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -48,6 +52,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			enable-method = "psci";
 			clocks = <&ccu CLK_CPUX>;
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -659,6 +664,30 @@ cpu-thermal {
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu_alert: cpu-alert {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <110000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddr-thermal {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-a100-thermal-trips-be14e8047b0a

Best regards,
--  
Rajan Yadav <rajanyadav0307@gmail.com>



