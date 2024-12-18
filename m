Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2C0E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNRt/uikR0eGNnMWcZwn5Bi3LrNwHFMkuk2PlHieVbg=; b=C0qWkdvYFT/wB+QI1jENp1s1dR
	VBkYq8MaHKZ6GK7AFPWOarED5jK9XdTNByfvOEWls72qx/GSPwNqc9GcGWrNJWvgigqHe6/hNYcUy
	KVfL0WpR+qCUd/H6TMp7nS0UfapWG8aiKNCMenJ3kTk7nEP0zT+2rlwq6lRm8CZZRsGeW/kB/1lCZ
	uoNUYWYP3GtbsySbVsJbSFWUykZhnj5tmUfXpyCQKDBFBOlzm3IfFavZC+QDWj+LpcaeRK7HTkc1w
	pECJICiIkAiww2JBNUBm/A0byL8VZ6s4x/vSipELpqCElq11gPyfCLupt/Gcp0cwgqDlWzTBrmkXk
	XrDB33HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNthR-0000000GexE-3OxW;
	Wed, 18 Dec 2024 13:02:49 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtgM-0000000Genv-2DIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=UtiFUB7JYOEIMLI78fhF4G8WqBGTAB6l9kQoj2W7g7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jXmM0P56xEPCszSNWAG2srnBbfoN63A04qcy47Fnb+SYM/xM1N3rXfL8eSptj4Itz
	 Ruff8oOAfZ/fiDHmUXwEwaydSR6HYm29SJe86oCxB/oumb10a/SB5anIhIMSGaVVOl
	 NUodk1QWl26XZnlsdBjwQUhwEdbQ9cvTaHl2x3eypRcerwqKHb1PsHNdTbLMvu+ptP
	 qhSAduiC7yhdc59AQsiSUM4Y6T7WcLEdzVbHRQ+7VopDqy48XCVuPQToowosTT1aV5
	 ttas0gRSzxcYAJ6FzsoqM7MRKWYyLMVzbhDMB/xtxMEHZKsekhK6Q6/pLz7MyM5VJE
	 Tafulc5+iwhig==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Wed, 18 Dec 2024 09:01:19 -0400
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a100: Add syscon nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-a100-syscon-v2-2-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050142_630824_B3D57627 
X-CRM114-Status: UNSURE (   9.96  )
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

The Allwinner A100 has a system configuration block, denoted as SYS_CFG
in the user manual's memory map. It is undocumented in the manual, but
a glance at the vendor tree shows this block is similar to its
predecessors in the A64 and H6. The A100 also has 3 SRAM blocks: A1, A2,
and C. Add all of these to the SoC's device tree.

Reviewed-by: Parthiban Nallathambi <parthiban@linumiz.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..a24adba201af29a3a117222c67da5d269629fa47 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,39 @@ soc {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x3fffffff>;
 
+		syscon: syscon@3000000 {
+			compatible = "allwinner,sun50i-a100-system-control",
+				     "allwinner,sun50i-a64-system-control";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram_a1: sram@20000 {
+				compatible = "mmio-sram";
+				reg = <0x00020000 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x00020000 0x4000>;
+			};
+
+			sram_c: sram@24000 {
+				compatible = "mmio-sram";
+				reg = <0x024000 0x21000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x024000 0x21000>;
+			};
+
+			sram_a2: sram@100000 {
+				compatible = "mmio-sram";
+				reg = <0x0100000 0x14000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x0100000 0x14000>;
+			};
+		};
+
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-a100-ccu";
 			reg = <0x03001000 0x1000>;

-- 
2.47.1


