Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7251AC88E46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFQfHQ/Ey+zcqWwgyDNrokZmou/lXSb5l0yXrzrY0EY=; b=KmZX/sy5gFDyxZXkDHHgmMv9OA
	uwW4M6pYtgA/qEHfhZwABq3NOP6EUzC87xmtE9rnBbYzs4j4E8h/VxTbRDHHgQuyTNGbuH/kswhX2
	f67pPbta1EU0kDw38d0TypOhkCM4YJS9zGZ/w5zIL6NSzla0G3e2S2oChMO9xB4e9GEfJiaQl9i9B
	e6Z88732MdelZeE8y/aqHwzQ/bAjuJ6LVF0bB0diX4KxbOeupZ35kNf4+3OwLM1Sov57caKFmdW2g
	mozPWYbNPjdt+xmNieUBGUE7dg4AcFbkETw0sE808iiIXWzjRNWVq6eIdrRuDybeNOb3AS0KlCp+U
	9t+aGnKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l44-0000000FIrH-42oY;
	Thu, 10 Sep 2026 20:08:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIpy-1p6v;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD31D44801;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BECF7C2BCFD;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=TkgcEqovDSDZTjRFITYc6jyBnY8bUKfb7VvOWvcb4Ig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cHZQl3BZ4qxr7plSjoyqVajDdC8B4fLAVXBfsCBOCifcPDSsehlPHIFRTMby/G9HO
	 BXBYEd4qH4r7yHx67j0rVuUEj498eBeKuuj3qC2szP+CepF5mK7GJYXZR177XBqSRg
	 0ZWmvj6B4CrWJcwL+0Mvr3pGRk2j8d8Z5blNKi8JKyqK8OUqY0va8OVsz7aH56YNd+
	 FeoQmQR6no4j/uLXb/85uKJuB6E2hAAw5jes1anuZtnIAc/vhiLzXB2mxrKBzgbYiK
	 OEjXDGbVxyfr5QfoFbQWnvPkjZnbZ3ENcXfJd7XzYMud7SXO/Ddhw9nUVQ9e+5vmXy
	 aGmXSqHq7J4xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4C2C88E46;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 10 Sep 2026 22:07:56 +0200
Subject: [PATCH v5 6/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPi R6C
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-6-c1b9e5f10cd6@pardini.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=MisAjbBWjrxNVve9XEAprLuxRBoFAEwbTkAxVvkz9Fo=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWQt5lORqT659ajnQj3O2X/Ld2hH7/C3emXIetGu1prjx
 IGDDvOmdzL6szAwcjBYiimyrJFQ5vm2/tWpOx4dk2EGsTKBTJEWaWAAAhYGvtzEvFIjHSM9U21D
 PUMjHQMdYwYuTgGY6lt17P9M7ZgscsVF8lRstkz1Zxd5e4VVv7Lx19RAd9cjef8uTm9++6PDTUT
 ptMa0/P0CTSnbXAKCfc3L5m0vN/S+FeEnH/pin2V6n7L3gudM+ss87+t+nXC4oH+bXdrRv+n2ao
 ZNeUoGbE67GmculChuO8KR0/m9+LjF6u/+AWcdnEQqHvN8fK5jwmMm/fKZ1q7pPR0Xz1lzeV3Ym
 3JZyuaow2PtC1dTaif8LeJojvWYXBBdOKViSdHUSdNj0tdxCNhVKudMPbLT4YGK8bv/sfafoo8u
 Fw82NVtk69m4kzVx8pLLktUM9Wwpk1/9/e29jEEtKcswIs8r9LlCzivrX+tnzubn0zw1u2j5i7/
 tDmJPAA==
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

The FriendlyElec NanoPi R6C carries one on-board Realtek RTL8125 NIC
(the LAN port; WAN uses the on-SoC gmac1 RGMII PHY) behind pcie2x1l1.

Describe the fixed function node and attach an ethernet1 alias
(ethernet0 stays mapped to gmac1), so that U-Boot's fdt_fixup_ethernet()
can inject a mac-address from its eth1addr env, for a stable MAC
across boots that both U-Boot and the kernel agree on.

The function node is added in this .dts (not the shared
rk3588s-nanopi-r6.dtsi), since on the R6C the dtsi's second
RTL8125-capable lane is empty compared to the R6S.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
index ccc5e46275176..b142df0b0e180 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts
@@ -7,8 +7,29 @@
 / {
 	model = "FriendlyElec NanoPi R6C";
 	compatible = "friendlyarm,nanopi-r6c", "rockchip,rk3588s";
+
+	aliases {
+		ethernet1 = &rtl_eth1;
+	};
 };
 
 &lan2_led {
 	label = "user_led";
 };
+
+&pcie2x1l1 {
+	/* on-board RTL8125 2.5GbE NIC */
+	pcie@0,0 {
+		reg = <0x300000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x30 0x3f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x310000 0 0 0 0>;
+		};
+	};
+};

-- 
2.55.0



