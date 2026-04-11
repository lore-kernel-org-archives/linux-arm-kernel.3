Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A232F3ED4B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 13:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cn2rQUk1tKmpxYp0wGwPKfZn1n0sjn09eGZvl3z2nRk=; b=NNHbS1uqf/NHPN5gy7skvjxskH
	69Xu7JdTxDF/a12l2/jAs2gfCaaXk5C5tDJxl2B46HVpRDOIXus87oKX50ju24Gtwme0nfFXxkG6R
	skSZRK5GGYnQrjKbMW41DPA9X0N19coBEnK+xDo9a/lDnZ4AMWkshgi6RaKe4i6QY2LWhtf3hyNwL
	8oq8dfCS8QuJ8Z1OHDh57bcP/0y7I0FtIQPLf55GvkIHKelHTRhtCmJuwWirBAPuvnY38hcVnmflx
	m0IXekxeE37adazVQZZ5rijrjfeIaS9zebLF0ekInboko56rI7z0GAtyy3tzuQupYOdZ6oEM7O+am
	hB5Ghc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBY0I-0000000DSED-473l;
	Sat, 11 Apr 2026 13:04:02 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBY0G-0000000DSDj-2NUu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 13:04:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DB8C113964;
	Sat, 11 Apr 2026 15:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775912638; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Cn2rQUk1tKmpxYp0wGwPKfZn1n0sjn09eGZvl3z2nRk=;
	b=hFKe7xtVoN+yPUb1sjbwm6420K0wWoQerdZW6bPlyzdKvbFUUdqWUX4XzhXgScxa7adfzn
	TS9hbIhXaTjWRKMSije7YuzzFnFH96Vz8U3CGibeoRZgOUtWWPLB3gjjCsbsp94ckuqGKF
	ZF5Vp4Hc15UTSnqVAeXb2eqKE3dNslIdjdJMDUsdmO4SJhbMCKM20oPuZ3lRbnQniNpLnH
	z5R3IcY9CFvpSmZFC26sFMQ2R6hrEIzepIAh6EdKfmsDhWOSn7YVM+KQc3OXThnPsyR1mk
	xUMGFlrKGh2Wi/6c7llTMklrRC68G0cS201N+likmo2Ef4uNWSsLZgabegt5rQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] ARM: dts: stm32: Enable PHY SSC on DH STM32MP13xx DHCOR DHSBC board
Date: Sat, 11 Apr 2026 15:03:24 +0200
Message-ID: <20260411130355.19670-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_060400_741828_D9C53D75 
X-CRM114-Status: UNSURE (   7.98  )
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

Add realtek,rxc-ssc-enable and realtek,sysclk-ssc-enable to both PHY
DT nodes to enable PHY Spread Spectrum on RXC and SYSCLK, CLKOUT is
disabled and therefore does not need SSC enabled.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 9902849ed0406..70d85af467353 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -97,6 +97,8 @@ ethphy1: ethernet-phy@1 {
 			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
@@ -146,6 +148,8 @@ ethphy2: ethernet-phy@1 {
 			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
-- 
2.53.0


