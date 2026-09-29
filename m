Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A06CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RHAAFr+i4usoPv5gUuG1ugztlpBAc9vmyog+ELSH+E4=; b=1tzLG3u4f5Gl+hbtNEdS5a2bzF
	+OwRurnwjG/Ioh65cvI3Bsh3QfTRiyMTEanuPxTxQAITY0v20hKvsarMf60zaw77KhLnmuM5IWW5g
	kzEdlLvBM99hhzHrSJLBja4tcjoE4SMg7xwbSIobULPvoTEGXr15XlxXwJACLa2ZCM5kSFhHZNGR9
	OaSXGyS6LOqfRz3NCYOyfPr1mrklaBi8ECZj+berA5FEq6ZVk0GcnCZ5T3aYaUXnkEFHDJXmLOkwd
	JVSMwjpxfmBBzliRQpfJ4f6dkMkf7LJrvEgekhdGwyp/WG+BSoZqmWkawXqdUMnS6FUEOaiKVa+z5
	RXj9ln3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhN-00000004OkS-0YfO;
	Tue, 29 Sep 2026 19:41:09 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdhD-00000004OgH-0FqY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:41:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6DCE106ABE;
	Tue, 29 Sep 2026 21:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710851; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=RHAAFr+i4usoPv5gUuG1ugztlpBAc9vmyog+ELSH+E4=;
	b=EJsTIUn17iuIRv7f6AK9AhVw9+aDIworF1kuMOWML6hQTnl70O7oz/vx24WqHjJ3T9dc9e
	MDNiQInbCBs27z2KB98LT3zymoMGPohvXElOGK+j6J9V3JZRcYRsXCCiVzHG3SGKWASw/v
	r09txWCwCAy+3JV7ua1n0CTovl5z7FoDBSPumLEQ4XdeZiete4uL8ZmRir8AKbUizzDy7/
	GiWGf94d87qMdrX0q0hc5Gr3Z3oEU0fksxbLRW8/M73SLI0qesEgLY7SHDPsGDbG95e+0y
	XmoFSFnClL4Pdl51rwjC/2CBu6BUG0e3vtQA+LLB0m0EfK6Nqx89qvhngeF0Hg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 1/5] arm64: dts: st: Add st,io-sync into eth2_rgmii_pins_b
Date: Tue, 29 Sep 2026 21:39:55 +0200
Message-ID: <20260929194035.496244-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124059_362577_3D1D15A8 
X-CRM114-Status: GOOD (  10.24  )
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

Add st,io-sync into eth2_rgmii_pins_b to configure the RGMII data pins
for DDR operation. This pinmux is used on DH electronics STM32MP23xx
and STM32MP25xx DHCOS DHSBC.

Fixes: e2fce4620933 ("arm64: dts: st: Add pinmux nodes for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 757cdd2415394..75f516b8d6af7 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -240,6 +240,7 @@ pins1 {
 			bias-disable;
 			drive-push-pull;
 			slew-rate = <3>;
+			st,io-sync = "data on both edges";
 		};
 		pins2 {
 			pinmux = <STM32_PINMUX('F', 8, AF10)>, /* ETH_RGMII_CLK125 */
@@ -255,6 +256,7 @@ pins3 {
 				 <STM32_PINMUX('C', 11, AF10)>, /* ETH_RGMII_RXD3 */
 				 <STM32_PINMUX('C', 3, AF10)>; /* ETH_RGMII_RX_CTL */
 			bias-disable;
+			st,io-sync = "data on both edges";
 		};
 		pins4 {
 			pinmux = <STM32_PINMUX('F', 6, AF10)>; /* ETH_RGMII_RX_CLK */
-- 
2.53.0


