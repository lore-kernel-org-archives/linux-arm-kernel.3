Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF4AC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 23:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/ZazWjina70/cRQXYDTmtrC62x1PssgN2ugHsolDfw=; b=A0kdX5FXcsJv0V+G7of8h8uDHH
	giJsDPZeP/yVm3uDI63sziB+qnnI7Eyfr4j51Ifp0Y8tG1gFbufXFk7r04vvEITCvtcc1kidvYY3Y
	awyJ9SF1/31a36ts7RQqufwfV0HtwBbbe+nNPpWGixggwMrWO/hdYeFbK4DhuAkP/SPjIJhmRnmAR
	nh/sfHC3rAxp465g+bhcC5AQu9LlwP2EvH1cZGZr5K/bnOX3mSs8PdRw51Yc5fpnZw+z36k8sUqdO
	+RCPdd2QLaV3lVplWUORmFnvNpKB57RbQOQdhvCcHYJayCiRQj3LLXLOTV8M+KLwT/NkAM3hBJQny
	m7hGsmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbn3-0000000Fr1i-2wu8;
	Sat, 26 Sep 2026 23:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAbmv-0000000Fqzq-0Kkp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 23:26:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C397A1596;
	Sat, 26 Sep 2026 16:26:32 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D633F85F;
	Sat, 26 Sep 2026 16:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790465196; bh=W5iZHw/9hbynSVMkDHufc1P8AF2PukWPWeCd4BJBy1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CqGsx+28/+rPIouDhtlPfUGK+LTE/N5Ngf5iiuR+uTaiPTkCeXrkmQ6AN5VDAOEb5
	 UYPD346wMwDFLuEDgIoEi1/CKXXZLVmk2vpElrw/OCil08N1jhq57fIKJ66fHw0QTK
	 QlxtmAcS7VAoIiOc3FbLSfqP8jZEcz67LvkWEHEs=
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
	Per Larsson <per@palvencia.se>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: a523: add EPHY 25MHz clock fanout pins
Date: Sun, 27 Sep 2026 01:21:41 +0200
Message-ID: <20260926232142.5244-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260926232142.5244-1-andre.przywara@arm.com>
References: <20260926232142.5244-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_162637_156678_4295C327 
X-CRM114-Status: UNSURE (   8.82  )
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

The Allwinner A523 SoC family provides two clock fanout pins, which are
backed by gated clocks fixed to 25 MHz, divided down from the main
peripheral PLL. Those are meant to clock an Ethernet PHY, and allow to
save an external crystal oscillator typically employed for that purpose.

Add the pin descriptions of the two pins for those clocks, one is within
the RGMII0 pins, the other within the RGMII1 pins, although the clock
fanout works completely independently from the two MACs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae7..ce01fad22b469 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,20 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			ephy0_25m_pin: ephy0-25m-pin {
+				pins = "PH13";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
+			/omit-if-no-ref/
+			ephy1_25m_pin: ephy1-25m-pin {
+				pins = "PJ10";
+				allwinner,pinmux = <5>;
+				function = "ephy_25m";
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.46.4


