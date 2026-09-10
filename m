Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB60EC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCBZmH17QiInkjZ2F/s6/a7WCuKesQ7Lkk+LF99SDh4=; b=Epqu8v1a2SO286dsl83fmExTvG
	hkI/IQ29RhjLNqqnxAK4957QAJk0iCKy//+AB4quIuto+LcU5YgUWdsHMMJwnckFsRoX+zv++Wc9q
	Jgf3EZfV2G5Dy2J+GiDc+fRuv1/WAGcsCymOuHNJLW53delbt8nNUrI+7vZzOMXajxxAnBqViWInK
	RbxGScRdUlJwWBz1yuNBXCijotC4/coyusld/JwtFTa/xvzXxMrSu0Qf1F3y+Ke1sGbI1/rYLziOO
	dj7q26Zp+hqLmNKDn6jirHDCx13rel7r3lG4+8OztZUeLLjPQcip8ir2CShtVDOQIw0M39wB7LWEQ
	d0yZ13Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l44-0000000FIrD-3jEt;
	Thu, 10 Sep 2026 20:08:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIpw-1pE6;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6AB1447FB;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 989EEC2BCFF;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=7LrlWxr2Z4DDLcsXmLIuY+CjhNOBB53K9pRbhU1j8J4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NkgYdaKhk0bo70iZboI4BJZdg3Xwe+aNXtUl+fDark7EdhB1RBbfRvpozOQyF0FQm
	 8WSPyIb8SOru2Sa6YFyOX0yuJc3rt964SXmU1kttwYGadlTDSimOM94Z2yY2uo9iA/
	 fgsXv0KTqd2EuFO/KyrZXygIJJraO/MaS7xmZbpk/2789eftfwDoBdEaD6Crosj1Rl
	 a4bjrkkYblkhRt6Bogvu+/emrbowgNQUDdNqFZFO1I26UDP9nOklwh1ZbJPZrfmuNV
	 k9QhPXvjYr9i3XSy3VXgpdVwzKWy2CAjuxNA/zVoFQ4hukFR5dHLeljkNxNmcXUb1f
	 OWAR9VmJngxoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F0AC79FBB;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 10 Sep 2026 22:07:54 +0200
Subject: [PATCH v5 4/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on CM3588-NAS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-4-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=6aWGqDcRch0v/DplqTK15TLUKtWXFJaV5tLvgpIwOHw=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqow4kAR15pUoqF3xi9F3Vxau8FW177GaOAb8zv
 VSbYj0m77CJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaqMOJBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7emW2Qf9ECGLK+iE4GdKQosucYn4phX5l51nFBA
 bIosr3xNCE+YOUAmo5Kh0dpvoZnw3mmaMH/+kSdfsLK1aMHWTgI9u/+B5Td8Y3onC/7+ZK4kJ4N
 nz/CXisUAG2EzqJAjx1NB33n4oMlFnvn6aFZdCLA/iEMwKyNvq3u21TgeDeFIQwE9LR9XQjyOCL
 eWTspIHvOhYFiuQVc9vlJdcw8XJnZqgt+tyND0dOGRHNwVMLPp1CS7zLgQSUKqeim4M52uxtKzY
 jgNia/u27vVSBrSi93ubO5beyBl5eZArW41VAlpe46lF5uTu6Kusy5b/EgquKT0jEdiD4XzWcR/
 pNa7ekAQUxw==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The FriendlyElec CM3588-NAS carrier carries an on-board Realtek
RTL8125 NIC behind pcie2x1l2.

Describe the fixed function node and attach an ethernet0 alias in the
NAS carrier .dts (not the SoM dtsi, as the RTL8125 sits on the
carrier), so that U-Boot's fdt_fixup_ethernet() can inject a
mac-address from its ethaddr env, for a stable MAC across boots that
both U-Boot and the kernel agree on.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 .../dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index f4c34da61c4df..96b3b245e0866 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -20,6 +20,10 @@ / {
 	model = "FriendlyElec CM3588 NAS";
 	compatible = "friendlyarm,cm3588-nas", "friendlyarm,cm3588", "rockchip,rk3588";
 
+	aliases {
+		ethernet0 = &rtl_eth0;
+	};
+
 	adc_key_recovery: adc-key-recovery {
 		compatible = "adc-keys";
 		io-channels = <&saradc 1>;
@@ -512,6 +516,23 @@ &pcie2x1l1 {
 	status = "okay";
 };
 
+&pcie2x1l2 {
+	/* on-board RTL8125 2.5GbE NIC */
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
+};
+
 &pcie30phy {
 	/*
 	* Data lane mapping <1 3 2 4> = x1x1 x1x1 (bifurcation of both ports)

-- 
2.55.0



