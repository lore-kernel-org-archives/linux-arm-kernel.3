Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 12:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4m7eV95SQBs/HTEXZplNLjB0uTcHgTt6OZjSsboJY0=; b=M/QJAnIsXIlik4T2WuXZ15jVu1
	W4M8bEdlaAhAL27pknEC1Xfc3ixS2awoajsJsr7L8WJYlZmiFly0Pnvh19OKKfPD66t45rFIBNA0a
	LfhA7UyezA78Re7RCOd/d9KfK6fyxtqCz9LKvaD9zuk+iT6jLI8j359ujbKiqZm6sQg1DoyFqVELc
	AFnIRTRyGOgBeEvknodg7GcluH/57GJMoiF6JhrU4YRkjX8Dbja7uc5dZiA0oV0WLGUfUtzuEPQ1P
	3ceA66lw1epIvxtmv+txcQdpN8N6nkk+w24GndaPZbdd+ZU6TrYktFJYuyXGE4qOcXQ/LAOtD0yfp
	RoEbWt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWS0-0000000E8OR-1VQE;
	Fri, 07 Mar 2025 12:05:12 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWND-0000000E7Wf-13lj;
	Fri, 07 Mar 2025 12:00:16 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.89])
	by smtp.qiye.163.com (Hmail) with ESMTP id d5c9f2d7;
	Fri, 7 Mar 2025 20:00:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Yao Zi <ziyao@disroot.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Fri,  7 Mar 2025 20:00:04 +0800
Message-Id: <20250307120004.959980-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250307120004.959980-1-amadeus@jmu.edu.cn>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR4ZVklLH05NSUxNGENPGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVDQllXWRYaDxIVHRRZQVlPS0hVSktJSEJLQ1VKS0tVSk
	JZBg++
X-HM-Tid: 0a95707a369203a2kunmd5c9f2d7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6TAw4KzJKMjUKMzMpCEkp
	EBUKCSJVSlVKTE9KSE9DQ0pISk1IVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUNCWVdZCAFZQUhIQ083Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_040015_454479_1C053CFA 
X-CRM114-Status: UNSURE (   8.75  )
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
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 88 ++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index b1713ed4d7e2..ab1ac3273611 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -264,6 +264,94 @@ uart7: serial@ffa28000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@ffa90000 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90000 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm0m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@ffa90010 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90010 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm1m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@ffa90020 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90020 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm2m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@ffa90030 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa90030 0x0 0x10>;
+			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm3m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@ffa98000 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98000 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm4m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@ffa98010 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98010 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm5m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@ffa98020 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98020 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm6m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@ffa98030 {
+			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";
+			reg = <0x0 0xffa98030 0x0 0x10>;
+			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
+			clock-names = "pwm", "pclk";
+			pinctrl-0 = <&pwm7m0_pins>;
+			pinctrl-names = "active";
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl {
 			compatible = "rockchip,rk3528-pinctrl";
 			rockchip,grf = <&ioc_grf>;
-- 
2.25.1


