Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFC9C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhpGst6hKXGQbjeWSW8bS9c9yfKTvuFhr/lnJ3XcFNU=; b=uqlgBbZwOL2uQX52LVvczY1XcQ
	1z8tP1ef7w/kxLEsqysQVurzSD7Texe3OsiGBPo4AgN1NZBevzLGpVyoOK3hXh4Pr5dKQGml2rvKM
	3ZiEdc2hFQYszcYKIsyksBNxSrd79CKByWSYv+1N2QXPY01eSb9Zm0eYK/2nlqKFwIk4dZUnrIGx3
	SBLSuP0JfPkKUn2zlVM1NxLLhgJ8u0uc/tlQXyv+wUzZUhuoNb+7vjpavUHhzKX1+prsLkiGJMWJM
	LQ2A06rjCO3ESyrljCCxaD68GPlQesAOe5Kn2CkHKtZXmHIusJv+lwFzKGPxbNRFem+Q+7wbmfHKt
	dzaBi0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tga9X-0000000BrH7-01CP;
	Sat, 08 Feb 2025 02:01:03 +0000
Received: from mail-m32106.qiye.163.com ([220.197.32.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga6k-0000000Bqvw-45br;
	Sat, 08 Feb 2025 01:58:13 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bd3;
	Sat, 8 Feb 2025 09:58:03 +0800 (GMT+08:00)
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
Subject: [PATCH v3 1/2] ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for DCLK_VOP
Date: Sat,  8 Feb 2025 09:57:56 +0800
Message-Id: <20250208015757.27594-2-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250208015757.27594-1-zhangqing@rock-chips.com>
References: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhkeHlZNGBhPSx4YQkMYTk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e3473a5a03a3kunma75a6bd3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46FTo*MDIKOAMzLRc1GTod
	SzAwCh5VSlVKTEhDQkxCQ0NOS0tCVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpLTUk3Bg++
DKIM-Signature: a=rsa-sha256;
	b=HxJU5kXPCmv20Zdv+c8H/IC0fdfKgi92QMqlC2TdyZAlFH9g3d7PgHqURZfRkhf66olBJJLN8xVdT4qWNQKSzpjKGPPfg+Gf/J5fSvIb9p6Z9zZMhECQlCfRQk6Cftp2P1qma1vDjRy3cTdHgcqc3l6gu1y+x5GqseDTRVzrwWE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AhpGst6hKXGQbjeWSW8bS9c9yfKTvuFhr/lnJ3XcFNU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_175811_371603_9C48517D 
X-CRM114-Status: UNSURE (   7.16  )
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

If dclk_vop use CLK_SET_RATE_PARENT and CLK_SET_RATE_NO_REPARENT
we should assign clk parent in DT to make it extra clear
that hdmiphy should be used as dclk_vop parent.

Fixes: 1d34b9757523 ("clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228")
Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm/boot/dts/rockchip/rk322x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk322x.dtsi b/arch/arm/boot/dts/rockchip/rk322x.dtsi
index 96421355c274..2eb3c6611e59 100644
--- a/arch/arm/boot/dts/rockchip/rk322x.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk322x.dtsi
@@ -667,6 +667,8 @@
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
 		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		assigned-clocks = <&cru DCLK_VOP>;
+		assigned-clock-parents = <&cru SCLK_HDMI_PHY>;
 		resets = <&cru SRST_VOP_A>, <&cru SRST_VOP_H>, <&cru SRST_VOP_D>;
 		reset-names = "axi", "ahb", "dclk";
 		iommus = <&vop_mmu>;
-- 
2.17.1


