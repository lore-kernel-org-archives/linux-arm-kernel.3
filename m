Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD57BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF4rStkw0AAJ3+AgUeRof/dz2uW1bUTsT5f/s3AyNRY=; b=rUHTLxPh1xcLBxFnioXbqPCS7E
	Sjq94lvpN7JGwEzZJMq3jGHX5S854Qtrhos8UoJmBgKcE7j19FTIjmlJFWW8uPfqwYjNRkUfSdiiY
	9yCAaqSJsibnB4iJ4MDWhHZdkihitPX4QiVy8f3pvYAnMPJZKLU7tMrJ1jKX5iwhZmOUrur3Pkl+9
	zmgP8u3/7D1tmYcGsIQU5Xw48oh5ELAlOC+PC4XJogDrYg1LYw1RVKf+qWuqCACKCJj722xxkfvLX
	o6MvlGubED/13AfDcrQY43xcZCnFFoRQaIYg2WUaNvDiofMYVM45ByL7KipxmGoujGyx4/+2gOCr0
	3VsJbCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO57P-00000000THP-28Nr;
	Thu, 19 Dec 2024 01:14:23 +0000
Received: from mail-m127100.qiye.163.com ([115.236.127.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO55F-00000000T02-2BHF;
	Thu, 19 Dec 2024 01:12:11 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 626be1a6;
	Thu, 19 Dec 2024 09:12:03 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: rockchip: rk3576: add can dts nodes
Date: Thu, 19 Dec 2024 09:11:59 +0800
Message-Id: <20241219011159.3357530-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219011159.3357530-1-zhangqing@rock-chips.com>
References: <20241219011159.3357530-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0aTlZDGklKGkNCHR9DS05WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0
	NVSktLVUpCWQY+
X-HM-Tid: 0a93dc78c72003a3kunm626be1a6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OVE6Ngw6NjIKPhcDIh8IMEIt
	LgkaFE5VSlVKTEhPTkxLTElPSk1MVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpPQks3Bg++
DKIM-Signature: a=rsa-sha256;
	b=ZPCOb3AwfxvQsOncQo5jgZGTjSUcCXRF6cHwKJSQv42xCl8KKCNjHXTY8HAmCNao2nydA+BIMDnMd4rfSW14Fp6yM/ho+UOabXTJ9gi6nkTIS4SBjysNpmJOCgvjAlwRl0ZDt0uHWQCBrteIIEnUWyWSrS1GAWVFg8hgjzhcI04=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=NF4rStkw0AAJ3+AgUeRof/dz2uW1bUTsT5f/s3AyNRY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_171209_784060_CF1A3DE5 
X-CRM114-Status: UNSURE (   6.83  )
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

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 436232ffe4d1..eefae2b5e6e4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1195,6 +1195,32 @@ dmac2: dma-controller@2abd0000 {
 			#dma-cells = <1>;
 		};
 
+		can0: can@2ac00000 {
+			compatible = "rockchip,rk3576-canfd";
+			reg = <0x0 0x2ac00000 0x0 0x1000>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru CLK_CAN0>, <&cru HCLK_CAN0>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&cru SRST_CAN0>, <&cru SRST_H_CAN0>;
+			reset-names = "can", "can-apb";
+			dmas = <&dmac0 20>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		can1: can@2ac10000 {
+			compatible = "rockchip,rk3576-canfd";
+			reg = <0x0 0x2ac10000 0x0 0x1000>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru CLK_CAN1>, <&cru HCLK_CAN1>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&cru SRST_CAN1>, <&cru SRST_H_CAN1>;
+			reset-names = "can", "can-apb";
+			dmas = <&dmac1 21>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		i2c1: i2c@2ac40000 {
 			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
 			reg = <0x0 0x2ac40000 0x0 0x1000>;
-- 
2.34.1


