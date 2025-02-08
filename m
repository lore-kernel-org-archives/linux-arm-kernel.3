Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A701C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CAH1dcXEz2+VFXon/oNdlFEefOj5kJXA/0Z8pEycdA=; b=2ev9ZHNPXJbPpXB5KDitdXOp5i
	mQ60RS6uyValfwWWjjam+na3LUcLJFr2pCgvQJ01VPXX0s1jPnYISqi1nO7HUq0F76Jc2dmp0zAEl
	EJ+3MVuDita0WTqerzVfmUk3vPUR0jlVG96DTU9oPODSsjJwlTrndFOGFCgdxHtWQy6OKcLvGOGyl
	a2ogBM24R0sYi2sEqj7Md9XMp5JuUR0TYbRmnZX53sH3RbF2+P8LlTQ4FUAZrjE4jlue7BZE2eKJD
	MeyhMa+cgJ4MgHInh7NgJ+8KZEROwbhYBQmmFmYmhFEeoViHsmdVhM30DI9o1GPLTCVGWajWqVQO6
	Vl34HOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaAs-0000000Brdz-47eN;
	Sat, 08 Feb 2025 02:02:26 +0000
Received: from mail-aws120186.qiye.163.com ([54.178.120.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga6l-0000000Bqw1-1UJL;
	Sat, 08 Feb 2025 01:58:13 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bde;
	Sat, 8 Feb 2025 09:58:05 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] arm64: dts: rockchip: Increase VOP clk rate on RK3328
Date: Sat,  8 Feb 2025 09:57:57 +0800
Message-Id: <20250208015757.27594-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkxNHVZDQ05DGRkaHRlPHx9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e347403c03a3kunma75a6bde
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Qgw5KjIQQwNOFxUSGS06
	ODVPCklVSlVKTEhDQkxCQ0NNSUxOVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpOT0o3Bg++
DKIM-Signature: a=rsa-sha256;
	b=XBoyJNpfysrNkHeYlKIJtZfd3lX2RtFrsvjTR6b+hw5/uS9bB9Jwi8i3bedCDBc4vKJcGq5FcYV/MEiY/YZhz+x/2Em3VwmzDgwCGJFIgwiXUj59qOvZiR6JoKbSa3zzhWacFBGCokE6cH/l96f1pXaZtTSgUIuapdkDBXLC564=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2CAH1dcXEz2+VFXon/oNdlFEefOj5kJXA/0Z8pEycdA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_175811_605455_8A251EA1 
X-CRM114-Status: UNSURE (   6.53  )
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

The VOP on RK3328 needs to run at a higher rate in order to produce
a proper 3840x2160 signal.
Change to use 300MHz for VIO clk and 400MHz for VOP clk.

Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..0c905f411e92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -842,7 +842,8 @@
 			<&cru ACLK_BUS_PRE>, <&cru HCLK_BUS_PRE>,
 			<&cru PCLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
 			<&cru HCLK_PERI>, <&cru PCLK_PERI>,
-			<&cru SCLK_RTC32K>;
+			<&cru SCLK_RTC32K>, <&cru ACLK_VIO_PRE>,
+			<&cru ACLK_VOP_PRE>;
 		assigned-clock-parents =
 			<&cru HDMIPHY>, <&cru PLL_APLL>,
 			<&cru PLL_GPLL>, <&xin24m>,
@@ -852,8 +853,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<300000000>, <100000000>,
-			<400000000>, <100000000>,
+			<100000000>, <100000000>,
+			<100000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
@@ -863,7 +864,8 @@
 			<150000000>, <75000000>,
 			<75000000>, <150000000>,
 			<75000000>, <75000000>,
-			<32768>;
+			<32768>, <300000000>,
+			<400000000>;
 	};
 
 	usb2phy_grf: syscon@ff450000 {
-- 
2.17.1


