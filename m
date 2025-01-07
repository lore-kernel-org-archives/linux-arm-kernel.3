Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FEDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSCqXXvyq7kaloFgBj+3piFhPo3zSlCSuA6539oXzdw=; b=4RhSp+zhMaX57FgUzTrJMJ138B
	PCE+wGsGFtQInFxeCylxUTOU5Xg8vN6DqusYmTTAaxnZuUmIoHdDRlMGsF/xSBTj/a3bqqC0BKPli
	JE0hA2LoFqz3hZUGpT3two3ouVA9kCg0E+dYqiNHVIwRXpA2HvF3IEoH9Y94IddUPI5bLsJEWuLNh
	NqyAZlt0bBjkFUzorPhtpGpKxvdYDH6f5hXn7wv4iMa1TOHQ9cXQzCoI9ZMnORRHGloaPZ5ntU0oF
	zeOgdM8lzSrtBhaOE9DJti0KhAJabiLilLryLyfxFnQAU5sikzbCwIB9czPFD0Io5ZRDlmNONJkuB
	1QSqK/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Ne-00000003oCr-3jxR;
	Tue, 07 Jan 2025 07:52:02 +0000
Received: from mail-m32110.qiye.163.com ([220.197.32.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4L2-00000003nkl-3e5b;
	Tue, 07 Jan 2025 07:49:24 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f3b5a76;
	Tue, 7 Jan 2025 15:49:15 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Liang Chen <cl@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/7] arm64: dts: rockchip: Add rk3576 naneng combphy nodes
Date: Tue,  7 Jan 2025 15:49:05 +0800
Message-Id: <20250107074911.550057-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107074911.550057-1-kever.yang@rock-chips.com>
References: <20250107074911.550057-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkMaH1ZDHUIYS0IZTxlOH0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943fbd41f503afkunm7f3b5a76
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6My46Lgw6FTILMRM3SSpCSE0q
	LR0aCgNVSlVKTEhNSUhNSk5NTE5DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJSktONwY+
DKIM-Signature: a=rsa-sha256;
	b=ae71aq9gsUG5V1a0Dln8Hh/L0LgV+IqS4/i+n/Awi05lflNiNJFB+42V4IWNstuoCRsbXwajWn41adwznm+7FggGxhrF/JfjGKpoLjzyEwCKkgM37REewsvwMfiRjIH9U2xWpB7qy3zeSOYZJ+eN0X4/P9xLnsTTlEymFn6cRI4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uSCqXXvyq7kaloFgBj+3piFhPo3zSlCSuA6539oXzdw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234921_089018_53F42E66 
X-CRM114-Status: UNSURE (   8.62  )
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

rk3576 has two naneng combo phys:
- combophy0 is used for one of pcie and sata;
- combophy1 is used for one of pcie, sata and usb3;

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v4: None
Changes in v3:
- Update the subject

Changes in v2:
- Update the clock and reset names to pass the DTB CHECK

 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 436232ffe4d1..a147879da501 100644
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
+			clock-names = "ref", "apb", "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE0_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE0_PIPE_PHY>,
+				 <&cru SRST_P_PCIE2_COMBOPHY0>;
+			reset-names = "phy", "apb";
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
+			clock-names = "ref", "apb", "pipe";
+			assigned-clocks = <&cru CLK_REF_PCIE1_PHY>;
+			assigned-clock-rates = <100000000>;
+			resets = <&cru SRST_PCIE1_PIPE_PHY>,
+				 <&cru SRST_P_PCIE2_COMBOPHY1>;
+			reset-names = "phy", "apb";
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


