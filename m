Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA39C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DC459CV950edulfkeUKCKs0B0NkTiszTKnaC3l5EK/o=; b=ABIb1DOCVk7/vBNC4nOkxEO+wj
	di+a18FzwqrNOgyqvKFJIfRVlIVhCUdC0JSvKXty7ext+UIPnqcXxCLGLP6RbsK6N0Mh3JHOBtlJd
	k3JivjnzG5X9BPNYYnG0YyH+XMHRiTphiZxyCLEV0eg9Bx1Cx0Rl4vRrmOnzWoTgK7/7psU/yy4wN
	+52EbuI34tCs1TYTkv4g3qXkEC4OlsACynLcIO25FWjEVC52Dt2SVD2pJSaGTFmXcRDHAd2r2ThOm
	Xd4sohUwsGYJsj1kRQaZnQHRb6Y7WD3qviyMRHYAMS1vom19ZH501/4EUfNHDDNONVBYxjh4R0Wx6
	+GiwED6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucLHg-00000009mf7-1jqN;
	Thu, 17 Jul 2025 09:52:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL4d-00000009kWd-2Ea3;
	Thu, 17 Jul 2025 09:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CAC75C688E;
	Thu, 17 Jul 2025 09:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB6CC4CEEB;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752745122;
	bh=T3PS9vZhXd87vxsDAEauzZTimunT7qthZYCWoQ0vQGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dY8jlF8589CoOfmQzB1Qb5DmLLYo9zbe3zX/GrkfrYUX3dUWHp2kgnH3gbJVQV9wr
	 5K6IuPyADtelQ8T/13/KizgyS5W8F8DoGwc+YD6dEfIS63pxMw9gQmRS6lrmJdFs9f
	 kncuVm1QY5IvWl9Ch59Sb9y7dj+HIYGUsu+pquDDafkpv9xKNmJQ3/mt/SyiDNw631
	 +FgHU7Zvhyuaf3F1inWSpbjKy7fZjyG/wtC0cZeAzdBo3hoJht+5sGTnuRu57fcaKc
	 lVvEC+ycdc90bzOOV6PansgLGJ6SZYwOGMUkTGOCMnp/LbFCHRtL7nUx6dkAPqJ4xu
	 JaX6IitVq+81g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACB4C83F1B;
	Thu, 17 Jul 2025 09:38:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 17 Jul 2025 17:38:38 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: C3: Add RTC controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-rtc-c3-node-v1-2-4f9ae059b8e6@amlogic.com>
References: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
In-Reply-To: <20250717-rtc-c3-node-v1-0-4f9ae059b8e6@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752745121; l=1224;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=oDscrQnwBWleM1lKXYkem+gVGQrkocRvej4i/VO/Lqk=;
 b=7H03TvHXdNylCWXWrMbEeTI+1PGuh2L1B8KhKOjjIqk3FuLzkDI3KcY81WNs5ECGqlqxiWdfV
 +2Dzk3/7U5AD+mOxUE1rQSUSR9ra0skTfhMbvFoRVyJMmhsKAMqGKaL
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023843_640102_250C40D5 
X-CRM114-Status: UNSURE (   7.93  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the RTC controller node for C3 SoC family.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index cb9ea3ca6ee0..b81bffac7732 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -53,6 +53,13 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	xtal_32k: xtal-clk-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "xtal_32k";
+		#clock-cells = <0>;
+	};
+
 	sm: secure-monitor {
 		compatible = "amlogic,meson-gxbb-sm";
 
@@ -967,6 +974,15 @@ nand: nand-controller@8d000 {
 				clock-names = "core", "device";
 				status = "disabled";
 			};
+
+			rtc@9a000 {
+				compatible = "amlogic,c3-rtc",
+					     "amlogic,a5-rtc";
+				reg = <0x0 0x9a000 0x0 0x38>;
+				interrupts = <GIC_SPI 131 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal_32k>, <&clkc_periphs CLKID_SYS_RTC>;
+				clock-names = "osc", "sys";
+			};
 		};
 
 		ethmac: ethernet@fdc00000 {

-- 
2.37.1



