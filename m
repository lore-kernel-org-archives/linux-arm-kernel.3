Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F04DCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhW29/b+CCelmi2XjzsSfhT4svDfHoJ79d8gi34QLNA=; b=oCzcJejp1zPA/lZjlvBv6LFvlZ
	hYlZR1wNj4vfAc8BQ231O2mIFZHZrJENkv8RYEwoUPemCTFSe8SKFD+PqKuHJrD3fRkE9aXNc9SU3
	4jVozk6XGGaq9cgU/jSOPP4IlSGZL6RIIqNbuYGnFZripAsRVaEohTpx9Xm3mHaJy73k+6EaYD+VD
	D8xOWN7kCKePOVIj8Nak0P1gQxjaWqveh6vqQaTVpX0N8OYDN711uG5BE2y+nhRwyHoAX48i7cKbV
	BoXEUULmoMYI0WCby0apOfV5sfnnZMWw/NGbt/sX8OHoUuhV3ojIBDqy39I9yFg21q6EnPO/wx0TC
	RIY5AdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v638R-00000001Z67-19x5;
	Tue, 07 Oct 2025 08:33:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6381-00000001YWd-39Sf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:33:02 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637z-0002Hb-Vv; Tue, 07 Oct 2025 10:33:00 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:32:08 +0200
Subject: [PATCH 15/16] arm64: dts: rockchip: increase rga3 clock speed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-15-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013301_803444_828B301C 
X-CRM114-Status: UNSURE (   9.50  )
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

Increase the RGA3 clock speed to get the maximal possible frames
per second. By default the core and axi clock is set to 375Mhz.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 08885d9c19e0c104ab0f723ec161b83998cfb9c7..57e320267bb629893bb884bf4e8d6bbc22f8d628 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1179,6 +1179,8 @@ rga3_core0: rga@fdb60000 {
 		interrupt-names = "rga3_core0_irq";
 		clocks = <&cru ACLK_RGA3_0>, <&cru HCLK_RGA3_0>, <&cru CLK_RGA3_0_CORE>;
 		clock-names = "aclk", "hclk", "sclk";
+		assigned-clocks = <&cru CLK_RGA3_0_CORE>, <&cru ACLK_RGA3_0>;
+		assigned-clock-rates = <800000000>, <800000000>;
 		resets = <&cru SRST_RGA3_0_CORE>, <&cru SRST_A_RGA3_0>, <&cru SRST_H_RGA3_0>;
 		reset-names = "core", "axi", "ahb";
 		power-domains = <&power RK3588_PD_RGA30>;
@@ -1202,6 +1204,8 @@ rga3_core1: rga@fdb70000 {
 		interrupt-names = "rga3_core1_irq";
 		clocks = <&cru ACLK_RGA3_1>, <&cru HCLK_RGA3_1>, <&cru CLK_RGA3_1_CORE>;
 		clock-names = "aclk", "hclk", "sclk";
+		assigned-clocks = <&cru CLK_RGA3_1_CORE>, <&cru ACLK_RGA3_1>;
+		assigned-clock-rates = <800000000>, <800000000>;
 		resets = <&cru SRST_RGA3_1_CORE>, <&cru SRST_A_RGA3_1>, <&cru SRST_H_RGA3_1>;
 		reset-names = "core", "axi", "ahb";
 		power-domains = <&power RK3588_PD_RGA31>;

-- 
2.51.0


