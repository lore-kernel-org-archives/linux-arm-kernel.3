Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F171C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fUzAPvGOsIDIBXLhkbuetQjqpX74lmjCv9ap+Xl2i8=; b=hcXJ0JAeYO/0RfM/9TX07HCpy6
	MnMZ6OpzjEk/Gm3U70TfJTX6IhSjsfR9ZE7DsuBSXULb01Ysn+DhUa42vWbPQxyyWaYelrPUT1hH3
	qZvVqTESYAVMipj7VjJmC9XhlEjaOuU3M/AiGrpfcwMYT87bnAbzwckOLBuGJJXLu89cN/xPE00wY
	KCU7iVLrFnzcbM0J2AKcnImKuSKWGanpzhwORT7+f0vF43tEhwLE0Xz/08/L2y5tthliHmiMxmFzK
	0tz8OTU3sVS9CwZIAMY6dsmkWznjUH4v5g/KHVof/cVwIDOkPqghAlezU8DcmFXMi/uEjRTgPFcun
	caLQLUMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVkv-00000005pzX-1xh1;
	Tue, 18 Mar 2025 12:09:13 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVcD-00000005o9N-277e;
	Tue, 18 Mar 2025 12:00:16 +0000
Received: from amadeus-Vostro-3710.lan (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id eaf1c5d0;
	Tue, 18 Mar 2025 20:00:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Tue, 18 Mar 2025 20:00:02 +0800
Message-Id: <20250318120003.2340652-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
References: <20250318120003.2340652-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkJOVkxKTklKGU1KTkJPTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a9201abd03a2kunmeaf1c5d0
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M1E6Myo6KzJKHEsYIVYeKygo
	ITkwFA9VSlVKTE9JSUJCSUtCS01MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBSUJMSTcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_050013_720488_A7C929B8 
X-CRM114-Status: UNSURE (   8.83  )
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

Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
RK3328, but the driver does not support interrupts yet.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 1af0d036cf32..621fc19ac0b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -465,6 +465,86 @@ uart7: serial@ffa28000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@ffa90000 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90000 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@ffa90010 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90010 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@ffa90020 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90020 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@ffa90030 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90030 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@ffa98000 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98000 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@ffa98010 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98010 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@ffa98020 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98020 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@ffa98030 {
+			compatible = "rockchip,rk3528-pwm",
+				     "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98030 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		saradc: adc@ffae0000 {
 			compatible = "rockchip,rk3528-saradc";
 			reg = <0x0 0xffae0000 0x0 0x10000>;
-- 
2.25.1


