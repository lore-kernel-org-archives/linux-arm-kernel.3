Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6E4C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZpVwh8CIc0ifvK7yjvQ1M5nK/aIW/l8aBs8zK338c4=; b=RBSWn3BGougAKR64Kd3jF/qpji
	EuWxm7qgyMXCW1z40xR52VFy2NRMBIvWno+jDO792jaRfYVhkRGI3qpdO9Or8g+i5B7L9lMXsjkYp
	gde7O9nEj/zaHkQKkuzEuaaGZ9q3dwfkKZqSIZ4h6VHorCc+bq5C91R0E3ea3nYoWe81dmhs4+oGI
	3lrAUTpU09dBeIlqO9s9prox5AaGkot3tqBKPihT1c73xhqafoQvluwuFLg3cBrzmdnU0StLsuTFl
	9syRYTQMIQoB+guci9sfP9STsvbmoOKBC9rskKsBLatamKJw2mSg0bSQJi+xc/I0Jav+CNpWPsVnn
	vbVUmRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub3-00000001C7Q-1kGP;
	Sat, 12 Sep 2026 20:45:13 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ub1-00000001C68-2ADo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:45:12 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9C04E240103
	for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 22:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1789245906;
	bh=IZpVwh8CIc0ifvK7yjvQ1M5nK/aIW/l8aBs8zK338c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=G0+WTvy+2rf/ljuurTIEcsXgbldAH3629kcjx2bPHXO3vNqm3Gm/SDuG7YqslS3ON
	 T7s7dH9t/Yvw8U1VSmb3RB9ED5WmmA9lT7Ig2v/mc7j1uHikp2f5xkhplKyezsNPC0
	 xK5DrsRh2V7c37nIo5jf44dtWTDp/FGkKJ2DHUVzjSSPB0hQClYCeMItxFnAPUF4Cw
	 unfk+D98yNRb8+crDPq7PJHvM83ZItoYmDMRPmkUhpDbHdx4yQbepV3TH3jWgz9ah+
	 CajndEa1Svwc978ktskeNXDfkRSYHGAKbk1vkrRxhcIq/rFTowIiRunYb6MBP/gf+y
	 eg8IhxqV6s1yw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hj3M534q8z9rxB;
	Sat, 12 Sep 2026 22:45:05 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: alexandre.torgue@foss.st.com,
	mcoquelin.stm32@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: st: enable eMMC on stm32mp257f-dk
Date: Sat, 12 Sep 2026 20:45:06 +0000
Message-ID: <20260912204454.219606-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
References: <20260912204454.219606-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_134511_710828_0AA182E6 
X-CRM114-Status: UNSURE (   9.54  )
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

Enable the 8-Gbyte eMMC v5.1 connected to SDMMC2 with an 8-bit bus.
Faster 1.8V modes are not enabled as they could not be tested yet.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 8daf3dfd5133..8c6aabac367e 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -21,6 +21,8 @@ / {
 	aliases {
 		ethernet0 = &ethernet1;
 		serial0 = &usart2;
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
 	};
 
 	chosen {
@@ -231,6 +233,10 @@ scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 	};
+	scmi_vddio2: regulator@1 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
 	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
@@ -279,6 +285,21 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b8_pins_a>;
+	pinctrl-1 = <&sdmmc2_b8_od_pins_a>;
+	pinctrl-2 = <&sdmmc2_b8_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	status = "okay";
+	vmmc-supply = <&scmi_vdd_emmc>;
+	vqmmc-supply = <&scmi_vddio2>;
+};
+
 &usart2 {
 	pinctrl-names = "default", "idle", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
-- 
2.55.0


