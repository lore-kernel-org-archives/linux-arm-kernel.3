Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6FFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 03:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yonl3ENKSgte5Nwj0BKHhqfaUkH4F872Lq1R+UyzkDg=; b=DPF/lE38OeDnANl+sMi+1s6Qt1
	+CDCceBHgmnM1SkdcF8o23YmLiv6SgelhQ0jxb6s6n1uNKHt2vouDw5xyoXqWIk3MoefAnngeyVsU
	x22tqDiuROfhv8aAfhBjpaF8zVoT8WHHMECaJKz2juI+ZkgZ5d+2vi1HlPcAjI8GPrBOoi1a4Nso0
	nFzgkKesHKcKz+oJtD+/Gwt18RQPGmx4F3kMrCUVkC413fPwT4qwnRufGQwYwikG7B9d/doJDcXJe
	/GxNcelx8vseycb+evzqAmii2X01Wfa0LiCDZsBDFe/ZTLgXofRujMvUtjNFUFsGvou5NE4b/PGdB
	UtyiVkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfTW-00000000uC9-1Svd;
	Thu, 09 Jul 2026 03:30:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfTU-00000000uBK-3hM4;
	Thu, 09 Jul 2026 03:30:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 52E8543DB4;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24259C2BCB9;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783567855;
	bh=vebU/IOSL4arCI7BNVBZ9A6pu8AqsIlGnYCcT/LYqyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FNih6mKOnim7IzfeF9w40FWC2YVy7YFGbqdwFNaB89oTloaCZv176GZ2oMSDZ7HgR
	 iOld8xZpY7mldKeMCSPszmSylJo43ViIX3KqoBixhbzxTBoSpr0AXucqw4ICK3hndq
	 Br3AKj+pEtcpCYk3TKaBsMxOz6UP1TOfQ3ne5/PPNfXB01gVid/tnqoT7B3uRKSvxB
	 6joXb2aPi4TxzSazc5FhAODmBlZx4Kkp5bB5nxgSHb/iVPx3Xf5DFTYsV6YwZQw56R
	 LNDmNd93+OimwxedSS3rgH5vZoCAfbwbcfKwXs4YBPQyZATBxvW1VpxvQx1eE1+YSQ
	 5jECuMexr6d2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079F5C44506;
	Thu,  9 Jul 2026 03:30:55 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 09 Jul 2026 03:30:52 +0000
Subject: [PATCH v2 2/2] arm64: dts: amlogic: a9: Add IR controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-a9-ir-v2-2-42c21d7a6ffc@amlogic.com>
References: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
In-Reply-To: <20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783567853; l=2027;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=33MzL3Cv7uhjfti4gs/DqpQ4WXJtnpUBkHN5kst4OOM=;
 b=8SnUZjwxz3vAI+j4FX/PVcpN9cL+yAwjXwLL0gpEZn0ZorSBb+bG2CooNlUssjFmYrLhfscJx
 AEqPwtaNpmrAD2TsJBGMMgTWEItCxlcP6aIuRyMiUIGo1OVCVERRVWe
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the IR controller node for the Amlogic A9 SoC and describe the
corresponding remote input pin configuration.

Enable the IR controller on the Amlogic A9 A311Y3 BY401 board with the
proper pinctrl setting.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi             | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
index a6b380ca47a5..389c9de3dc3c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts
@@ -38,3 +38,9 @@ secmon_reserved: secmon@5000000 {
 &uart_b {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..aa89b31bfe30 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -241,6 +241,13 @@ test_n: gpio@c0 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&aobus_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 				};
+
+				func-ir-in {
+						remote_input_ao_pins: group-remote-input-ao-pins {
+						pinmux = <AML_PINMUX(AMLOGIC_GPIO_D, 5, 1)>;
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_ao_intc: interrupt-controller@4080 {
@@ -254,6 +261,13 @@ gpio_ao_intc: interrupt-controller@4080 {
 					394 395 396 397 398 399 400 401 402 403>;
 			};
 
+			ir: ir@14080 {
+				compatible = "amlogic,a9-ir", "amlogic,meson-s4-ir";
+				reg = <0x0 0x14080 0x0 0x30>;
+				interrupts = <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			uart_b: serial@1e000 {
 				compatible = "amlogic,a9-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.52.0



