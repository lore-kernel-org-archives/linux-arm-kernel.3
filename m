Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FE3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH9lG3lADyuuhfASdZJ0Hlu8ZLTSCi9nev/mOF2oDdA=; b=LZdYfeTL48s3nUofp6okUwt0MS
	yTmXihNQH16mnSoWfFyclHdt+T8eTuZsebjtQa60WT5jF4OpFLF1ZqYcBlOGjGnG/w6M7YsHAJ0nI
	dpzlvSF0oA4+jsHzqahz12Wy/Ikc7KkTD1LYpx2MNBeX5sLOy7uXQkIrMG9xDWQhbkz1CshSMwacb
	OWwSTZkFDTCvA57Y39Apsu6crzpd+RxbhdgPCJQmjic12nk4SJYX9C6RkhvymxrxgumYQQlq3T44l
	PGl0FYDbbQtr5Uv4r67BpUZkQjve/bfXwJ0JA/aAXxg0hHXZQpJweDkfYSF9fNhU7L1K6wGSWsoUV
	eqztFGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxW-00000000r8S-0jpM;
	Wed, 01 Jul 2026 07:02:10 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxQ-00000000r3e-3ntt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782889322; bh=KH9lG3lADyuuhfASdZJ0Hlu8ZLTSCi9nev/mOF2oDdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GreCodbT3tcs51qul27qACdJoLrQfH/4FINNYaEpeYT2Fw4LwSe3fFFayY4b0RO3e
	 ajvmscrbuonXdOfdCpDHFfv2K8Yl1eGhw1dVyanOC2+YeCojI/NLBjEK840VXMTb7B
	 iKIczzF9Pm2Kq89PODkP4hQ3U0XjEoFvEUgZrySg=
Received: from localhost.localdomain ([2409:8d20:2a:1b57:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 71832C3; Wed, 01 Jul 2026 15:01:49 +0800
X-QQ-mid: xmsmtpt1782889319tzlmfzkal
Message-ID: <tencent_5FD72FB1A997864EA622E17964240006F105@qq.com>
X-QQ-XMAILINFO: OR5rDBBXAGpMcj2gkvTYRbvGB+SK657gAAT44mPXmteN7yu8QMvy8mYLIjf0+g
	 1oxanFpbsFRcOObRaHf6AfB9qy7YXCHe/m6fhcgEKmiL/PiooNueSLRoO0iPRsV05jU2RuqWmj7G
	 r4zm/GMR/bIQN/pF7pfEEPIy9gAjcWrakCKelahdOWvKHF6m0TK71kASS0/OprsGftJdMozDZ3Aj
	 mXqIC50RFz9u363aHIfJMWx+8BcMV2pdngCWAg90mk/XeaJ8aRTQ1ZyPmUphEgXaKP5/tutLuHK/
	 4ys1cBTeCsBfhcq4++nByDDJs5BN74aoqX+unDYp2cftrjr0XPZOc+ssfwHrz4BgXOI1EfUZg3Dn
	 eXR0qig7zDAC5nFsHWncI+fpFC0yptCZT0qbl5/Xn6utzi9eZEHbvuM3QTA6en4LdIUzyBwJLgX+
	 qogULTCYYipQU9lpnfYkZZ8+9fz6H0zaPwtE7XBxxcAgzEq6+Ghe5qebcD2Lmy7JKYmkaSdZRx1N
	 f+7vJPC4a+Fbn6wEJHJa4/43yNgIKSlOhaXoFD0ifdB+jwGGCjgyMrq50rUweekX+iECn3wlQBCR
	 FrZZPxs/bQ/oaokHRk53HgcjvNfOfowK/ujYKZaBSFHKBLWvTN7WFbDV8evHOY9XaRPM76+NsXoo
	 34bxwa2f/gWObgTIHRl50jqNcrBni6LfnYgpjpwA/t3WiMtUm57msBC1dcmmMQKFPWwFg4VaQDU5
	 q6elZl4zx7kA9drGa0DBpafB4cbOazCcDIYyGRWuOb0v00ypSL7p/Yl5N2qdYrdkW7HGAtPFcBoW
	 SfaJxf9RQJiBQaUPKFxCyJFG591WDa3Ozg5Dpx8yNSHS4Wjn8HeTkSbtxZ48M+yyxg51+ghkDoPA
	 xfb5DklIiBWWTkdf6ZCyfC/rfyk1PmEe5q4D2656UzHWC8pzO9m6JxTYHZybUYaIhqOyjTLI6ZVK
	 X6v7GiX1Y6Uf26/pYOVUEkgzHXuXyZFnKIIX3Kr7GzXUpF8gSJgclrewpdipytAe5sw4Om5p3NgT
	 Fr760NysLGGFKOcm/p/2TqwDYkxbz2qAumMLu1V1UcHnNwszGw7UJYRr1YiAVQhU3KmAiWIj6K+h
	 4zha0lNXeex/9D3sew1RNs+7xxsH4J+xUcefgc
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org
Cc: Vincent Mailhol <mailhol@kernel.org>,
	kernel@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luch00 <1579567540@qq.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: add CAN-FD nodes for RK3588
Date: Wed,  1 Jul 2026 15:01:28 +0800
X-OQ-MSGID: <20260701070128.2096267-4-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701070128.2096267-1-1579567540@qq.com>
References: <20260701070128.2096267-1-1579567540@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_000206_660889_A29C16A0 
X-CRM114-Status: UNSURE (   9.42  )
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

From: luch00 <1579567540@qq.com>

Describe the three CAN-FD controllers integrated in RK3588 in the base
SoC .dtsi.

Add CAN0, CAN1 and CAN2 nodes with their register ranges, interrupts,
clocks and resets, and keep them disabled by default so board DTS files
can enable them as needed.

Signed-off-by: luch00 <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3..f38cd8bd4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2648,6 +2648,45 @@ dmac1: dma-controller@fea30000 {
 		#dma-cells = <1>;
 	};
 
+	can0: can@fea50000 {
+		compatible = "rockchip,rk3588v2-canfd";
+		reg = <0x0 0xfea50000 0x0 0x1000>;
+		interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN0>, <&cru PCLK_CAN0>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN0>, <&cru SRST_P_CAN0>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can0m0_pins>;
+		status = "disabled";
+	};
+
+	can1: can@fea60000 {
+		compatible = "rockchip,rk3588v2-canfd";
+		reg = <0x0 0xfea60000 0x0 0x1000>;
+		interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN1>, <&cru PCLK_CAN1>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN1>, <&cru SRST_P_CAN1>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can1m0_pins>;
+		status = "disabled";
+	};
+
+	can2: can@fea70000 {
+		compatible = "rockchip,rk3588v2-canfd";
+		reg = <0x0 0xfea70000 0x0 0x1000>;
+		interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN2>, <&cru PCLK_CAN2>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN2>, <&cru SRST_P_CAN2>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can2m0_pins>;
+		status = "disabled";
+	};
+
 	i2c1: i2c@fea90000 {
 		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
 		reg = <0x0 0xfea90000 0x0 0x1000>;
-- 
2.34.1


