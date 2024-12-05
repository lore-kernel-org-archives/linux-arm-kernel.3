Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0530E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67jtnZdAqgZmsIdKecCH4vXI2Gu7dBBbAbO28nvPUW0=; b=So1obBxg2VvdnwZPNixAx4Vveu
	QmWOP8osmuhk+inhblAZ7fxY+uQmRPJtwTLcjOwrC+jQ9/98txGaDU2n8EYIh7EL/dE7EaOEoHYtL
	aBUYtYD6IoOd9X9bJvockichm9lEa1xdWlgMBX+WVDCStFRZgN02B7+XqUcr3ir8J5TDbHDjoIvk1
	vchLufvcWtiEScg5i2JL6IJ3OMQrGoPZ7qfW/DX6YnLSlhg8gBN0zNm9d0gL2AbeRtjx/6ED1pRbg
	cjJz+1QAJcobMnELGewlP2WnY5JaU1Z8/37iJz5jhuhQgIwMnRdmJ80Je+iafK+aCENBFsFW3MsRz
	FM5v2hAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Hl-0000000FZ1J-3hIe;
	Thu, 05 Dec 2024 10:40:41 +0000
Received: from mail-m15566.qiye.163.com ([101.71.155.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Dl-0000000FXfd-1yPb;
	Thu, 05 Dec 2024 10:36:37 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4cf7c967;
	Thu, 5 Dec 2024 18:36:29 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dts: arm64: rockchip: Add rk3576 naneng combphy nodes
Date: Thu,  5 Dec 2024 18:36:19 +0800
Message-Id: <20241205103623.878181-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241205103623.878181-1-kever.yang@rock-chips.com>
References: <20241205103623.878181-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMeH1ZOQkpMSRhIQxhCGkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a939664827203afkunm4cf7c967
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6HAw5LjIfQg0RHy5JCxkd
	Hx5PCzdVSlVKTEhISEJPQkJLQk1JVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0pLNwY+
DKIM-Signature: a=rsa-sha256;
	b=V7FxV3IWdqlMRwcrHv/JZXj4IxrNmMzuj8ZcM4AszMNfJgsMw2Opm2AqMxrkCI0yA3gXdga2/A53QjBUXQ8LicrvTNrkEM9I7iqrcpTy9Buz12pbzVQZ/6VbFDl4OTDXbMLbUzcbcH8fa9oJvHJF7rgxmNbY1vvzKMNbQVYbtDI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=67jtnZdAqgZmsIdKecCH4vXI2Gu7dBBbAbO28nvPUW0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023634_013555_A34E845E 
X-CRM114-Status: UNSURE (   7.24  )
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

rk3576 has two naneng combo phy,
- combophy0 is used for one of pcie and sata;
- combophy is used for one of pcie, sata and usb3;

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 436232ffe4d1..8938ec7c3bb4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1587,6 +1587,42 @@ uart11: serial@2afd0000 {
 			status = "disabled";
 		};
 
+		combphy0_ps: phy@2b050000 {
+			compatible = "rockchip,rk3576-naneng-combphy";
+			reg = <0x0 0x2b050000 0x0 0x100>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE0_PHY>,
+				 <&cru PCLK_PCIE2_COMBOPHY0>,
+				 <&cru PCLK_PCIE0>;
+			clock-names = "refclk", "apbclk", "pipe_clk";
+			assigned-clocks = <&cru CLK_REF_PCIE0_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_P_PCIE2_COMBOPHY0>,
+				 <&cru SRST_PCIE0_PIPE_PHY>;
+			reset-names = "combphy-apb", "combphy";
+			rockchip,pipe-grf = <&php_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy0_grf>;
+			status = "disabled";
+		};
+
+		combphy1_psu: phy@2b060000 {
+			compatible = "rockchip,rk3576-naneng-combphy";
+			reg = <0x0 0x2b060000 0x0 0x100>;
+			#phy-cells = <1>;
+			clocks = <&cru CLK_REF_PCIE1_PHY>,
+				 <&cru PCLK_PCIE2_COMBOPHY1>,
+				 <&cru PCLK_PCIE1>;
+			clock-names = "refclk", "apbclk", "pipe_clk";
+			assigned-clocks = <&cru CLK_REF_PCIE1_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_P_PCIE2_COMBOPHY1>,
+				 <&cru SRST_PCIE1_PIPE_PHY>;
+			reset-names = "combphy-apb", "combphy";
+			rockchip,pipe-grf = <&php_grf>;
+			rockchip,pipe-phy-grf = <&pipe_phy1_grf>;
+			status = "disabled";
+		};
+
 		sram: sram@3ff88000 {
 			compatible = "mmio-sram";
 			reg = <0x0 0x3ff88000 0x0 0x78000>;
-- 
2.25.1


