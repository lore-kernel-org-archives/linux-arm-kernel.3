Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB87D4979C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 04:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LT2lediJQVwDLBFKbOV4H46tIxN+VXWeUCOYLC0QB8=; b=1liQWLfulRx2/AhLSrkKwcwZMc
	QE9IiMgy4lQczQ6pU7eo7BWt7XJ5KQ5m7DXWDUgRTiLh+u/9jPBxrs/Fuxf2LtPCpaW1IUjjwhRks
	7rUyDCXkmmuIggcgo7PlWXWPIU02Ay2x/sviBAPxK7D0NzV29j7WJYPQWhW+xGnk8jfpPXWwYxwiY
	zztlARUBcfATAL0nwGQTZ5IeKFkNNAnUj97O2sxxV0PjG3PYg+n+Ku9LD2TQgzpoE0cf0qtJl9maU
	nErEk5CiJwrisstySVOmmtgqBcSQ7dhxiHpkRcP1VUXWXL9QENTsz2f0V84VSljsod/FKKTirwh+U
	PZypzxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyIm-000000054BH-0wve;
	Mon, 02 Dec 2024 04:44:52 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHyHm-00000005453-3F60
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 04:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1733114627;
	bh=c7DrF4FY6ek6JMuSQX4DMWp2SLBG/+HX8Rg78u1FF5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dBqagzb1CFLZ4juBxO+3shH0BexnFVBgz4rTYgptwcYNP3CpnalGsKNgXBi2yR3en
	 go8UM4LGs1a7MNMozITf5qtHb216sKbMj2FfNnMDDzTtH3jGsT2Xa1hkqxDjqp47sg
	 1fMYZQJf/uW6iV+SNQKwulyncODdPHQIQkBewoyg7k9Sk90TDAlkpUxqEc0olmqb3G
	 hGGh6u4qh6eulZ/mQFBMmtjATUud2FDc7Tr5ArUqYQRWYfRN7H1z9nUYqC7JEnOecu
	 P483uscsys5NR8/TTy54HcfT+3pBUL3apwXLtPlo8UfNovVrQ8l8E8Bg1ks5GcO6ed
	 OOyDhV09H9kmQ==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Mon, 02 Dec 2024 00:43:27 -0400
Subject: [PATCH 2/2] arm64: dts: allwinner: a100: Add syscon nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-a100-syscon-v1-2-86c6524f24d7@epochal.quest>
References: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
In-Reply-To: <20241202-a100-syscon-v1-0-86c6524f24d7@epochal.quest>
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
X-CRM114-CacheID: sfid-20241201_204350_899899_789163FC 
X-CRM114-Status: GOOD (  10.18  )
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

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..31540a7ca1f01c6c2e69e329054aca16ffd112c4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,37 @@ soc {
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
+			sram_c: sram@24000 {
+				compatible = "mmio-sram";
+				reg = <0x024000 0x21000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x024000 0x21000>;
+			};
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


