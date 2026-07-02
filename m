Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F75C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci9sassTPfQ4PtBaB6pgiyOjRjA2h48iSLiBED/KLZY=; b=vo0jDsspg49bLObP18AzvWZGUn
	aSYHBH3jN9PhIMzlUZjXXYhaiYBZX+jDgQ5hPrYZSHhgySBYY/5vZU2RkwPN7bPhlqiRcxVPKZOkH
	LUM8p0PHQu3aa6sDzsFBii25WqCTj8p9tuh7FRY2tq5b/1M2i/WAr162ldq8KGuTIMh001B1JQL2p
	yfqyBZD2lEo9vydwP87ERqeslrE7M5CeWWRvjzhJ4Ksh8nU0bY3r0C+6wr3JJDDCeGRnzDJDRcvOp
	BWi6FL/RDmX1xz5DB28ceNA5nrESvFKuSk4tYCb1TjprropLPei+kl5sbPqoedPdW6sy8KImrA9sv
	geTAYoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4u-00000004aq7-2xN4;
	Thu, 02 Jul 2026 14:07:44 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfI4p-00000004aku-0pjZ;
	Thu, 02 Jul 2026 14:07:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783001256; bh=Ci9sassTPfQ4PtBaB6pgiyOjRjA2h48iSLiBED/KLZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TULst1VVL/Oj7cnvwQI5hi5DNvpZr2O23rM3sbiC6PeM0T8giJpjjD0AEkbeHWC4U
	 iB0AkM2pL73Zo9tD/mU0DMjoS0U81kPUHtNuvQuErISvDfu3u0O6cWQGXaIA/65Ajr
	 WgfvUN1QJkrnWP1njyTckYNppUxWaT6U0XnuLBTY=
Received: from localhost.localdomain ([218.4.149.66])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 1D09A800; Thu, 02 Jul 2026 22:07:16 +0800
X-QQ-mid: xmsmtpt1783001251tc1d8skwl
Message-ID: <tencent_DA47F002A610FBFDE89B9A697C649412FA09@qq.com>
X-QQ-XMAILINFO: NxKoLLhE22aTY3XiOTE2Ayq58Gh91BDu+xF8078Gr/pT+k2leB027ggheKjgiJ
	 CNlopjmoTvBxjZJe7FiyoyUCvkUTJ3/s/s/bhgJaM37GO3T/E2i/MOia+mG5Zdc0EdlMq716CYci
	 2kMFOycwxS164PGSFDch+e2vY+JVJHEv8TJ1Z2CAmBtqU8/l1CYtwSVteLCpV9BUvoxmy1thsOvE
	 6ETxuMtnXXjy7RhChwTrq7IIIrkhM5aKU5ei1FB8brOr6S+NUMdzGe1jCdF0wWfuBPE5qwTjZr9a
	 gXdygGLpgbfv3IDVJvCZUnc3O87gPgfyJoJVEBcyZ6u2ghefmBY/r0bEVkJ9W7I5jo3Qb6kD9ZIc
	 VWrXhAkvxZUa100GaZX9JNIr/HJLj5ifpbwmDzQaEUcrS6MhoDBTbK/2IVMmj/JnlvOr7I9XWA6d
	 Ux3ZkMKMdubINv/kU8+irvmCbwtCpILxwJEcZElknKe89/IFwDt4NL5tR0FYTDbb41ngVHh4T6fV
	 4dD+qghZC52lFBEIsS/rbabpYCLbpdCmtqc37isLCXeHuYUTJymwT9VEk90pNawZ5RpriR1a6Dxy
	 7SvFf6lmgbUiK3S47KZV8S5IFmF46rjYmu47HkbYUHZ2kv5Gabbie0v6wy61/kOOabUUYO9q9bkM
	 It9B1IVXhWjUW/lu3zQ0cegLZJvipMPTKdhgohB5Vq7DYT5wmsOsIznbu8KCd9WOK6C5tj9xPnTF
	 JR0qrw8pO+kdODv5LJrBhokVRJ+166f/GWVjW+78lYV7LZPwJh5LDrOW5QMkhNSEWC9Z7feQEQI/
	 +PN9Xmk4rIKV+BywShumFRgP0YptxWm+DOUXt6Ot3imA23K5DxgeL4hYxPRy0Aby3JBXYymfnfCC
	 38yDGSetH2nlsHdWzvHrQofKA7LM7DNpZj6YZ23yXqLnb4kBhTyZkxp5s40amD671LZTec+M0gui
	 LtItThrcbaqA3T3uYh9RyNDxjxbiH7yE4joSEeE75dDRChLF1QFOww0y+Hix8praalHU3vQFRu5d
	 jR6AFgsmFg/pcMqEXC
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can <linux-can@vger.kernel.org>
Cc: Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	kernel <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Cunhao Lu <1579567540@qq.com>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
Date: Thu,  2 Jul 2026 22:06:53 +0800
X-OQ-MSGID: <20260702140654.2961561-4-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702140654.2961561-1-1579567540@qq.com>
References: <20260702140654.2961561-1-1579567540@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_070739_601226_23DEAFF0 
X-CRM114-Status: UNSURE (   9.59  )
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

From: Cunhao Lu <1579567540@qq.com>

Describe the three CAN-FD controllers integrated in RK3588 in the base
SoC .dtsi.

Add CAN0, CAN1 and CAN2 nodes with their register ranges, interrupts,
clocks and resets, and keep them disabled by default so board DTS files
can enable them as needed.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..b340973775c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2648,6 +2648,45 @@ dmac1: dma-controller@fea30000 {
 		#dma-cells = <1>;
 	};
 
+	can0: can@fea50000 {
+		compatible = "rockchip,rk3588-canfd";
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
+		compatible = "rockchip,rk3588-canfd";
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
+		compatible = "rockchip,rk3588-canfd";
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


