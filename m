Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A368C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 22:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJIgAAH+8Y16oylKkitLSpj2UK/N5Cab/fT4wxa+wKA=; b=LxDnMzj9nWDj71jqTzNqd3LOmP
	oNPF+5ZrZT4GJ3ThxQwJ9lsS94JYFNqrDC6vAxH92v/GJ+oejpb0JSoK245YoidCYYUkDlnqHOM15
	nv8Y3fuA4oL8jtIvTH806gxaZV/JCDobvJ4YHMBzFgDuoI8WZO+fCl+qOXdBJBEOSFEMHlrHneydC
	YoV+CrUTzIQUD70rZpoQEiJzE6jFQdaME3nkqWwA6gra4NgoM5YzYtGqJ0abKs9cabWfy15dRtx6i
	E90va+PnZ1Vg1aZ3y8HIkf89NUmTNBnKLEGEm99QZFOcO1sbV03Q1OR/pi0Uq34wfaCdTpN7YLgSG
	DolbhXrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfSJ-0000000Cu5k-0Lde;
	Wed, 22 Jul 2026 22:30:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmfSG-0000000Cu5K-1317
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 22:30:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 240561595;
	Wed, 22 Jul 2026 15:30:14 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0DD3F86F;
	Wed, 22 Jul 2026 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784759418; bh=GEJgn95LVfTN0f7LCnR1Kb7DD6JzpxxaVqfo9augIsY=;
	h=From:To:Cc:Subject:Date:From;
	b=PFkuEqlbZtbWide5d48YajwaebabyjfwC2wrnCMbpT+edBo6s8ZijZ+rSE5LgriMj
	 tGBp3Qu+dG5Cc5ApROTcLIRmveaVFSZ7sM/TUQaJIOe8vd4Ea01v3OI4/Z0ejk+6ZD
	 fS+T9fE+QV4CWm3heFcLh4NhBqfdmDxs2nMBUPYI=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: a523: enable IR on the Avaota A1
Date: Thu, 23 Jul 2026 00:26:27 +0200
Message-ID: <20260722222627.14138-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_153020_331398_7F9C4A4E 
X-CRM114-Status: UNSURE (   9.72  )
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

The Avaota A1 board has an IR receiver chip on the PCB (next to the
Ethernet jacks), wired to the PI8 pin on the SoC.

Add the pin description to the PIO DT node, and enable the CIR receiver
in the main power domain.

Tested on the board with evtest and some random TV remote control.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this goes on top of Justin's A523/H728/T527 IR receiver series.

Cheers,
Andre

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi          | 7 +++++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 19771aac68e53..770433b4f905b 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -155,6 +155,13 @@ i2s2_pi_pins: i2s2-pi-pins {
 				bias-disable;
 			};
 
+			/omit-if-no-ref/
+			ir_rx_pin: ir-rx-pin {
+				pins = "PI8";
+				allwinner,pinmux = <3>;
+				function = "cir_rx";
+			};
+
 			/omit-if-no-ref/
 			ledc_ph_pin: ledc-ph-pin {
 				pins = "PH19";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 474354fbfcec1..994f1e4f0ce7d 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -100,6 +100,12 @@ &gpu {
 	status = "okay";
 };
 
+&ir {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ir_rx_pin>;
+	status = "okay";
+};
+
 &ledc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ledc_ph_pin>;

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
prerequisite-patch-id: 7deae1861f99fd36ada1af9c830c337374a74980
prerequisite-patch-id: 0175281b3456fb2bfca8cc0e99238583682af0f1
prerequisite-patch-id: 93ebe68eb0b466e360c6a02e5d936be910c85752
-- 
2.46.4


