Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7731CC36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cx8i5q9C97cvTJx9sm9EUVs2MLrBNeN/ptxBJzmW6gA=; b=cKG/mhB0loGHMMW9oc1GsBbqRZ
	IjMgCUAzypY2J0qFgitKCxoIsaRBDqElQ7k57eGUK2EATXfCRltjf/0sXj2rc14D54H/bogJjnqrN
	rJb5zLj7HksB1EYHcTi0QknbQ49E1HUMopDmdhWbrprhujfJwI0mUTykIVnAb7h9mrGdJhmhxhxKc
	CHO7o5+VMfp9S3vd6XB1ztm5z728JcNHHazqpS+1J/MxYAdKJ7Kh9QncJ0G0Dn/XOiWtAE92TKWXo
	O+GV6YMHyQiUr2EU3o01+biAGrXwobZLk5avKYRZNoS9KTodj42qKgZBf3iwhi12Ezpm3YVXHkifU
	JlND23Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYld-00000002cOV-3bva;
	Tue, 01 Apr 2025 10:22:49 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYQ4-00000002Y4b-3hUe;
	Tue, 01 Apr 2025 10:00:36 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10501caff;
	Tue, 1 Apr 2025 18:00:29 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add DMA controller for RK3528
Date: Tue,  1 Apr 2025 18:00:19 +0800
Message-Id: <20250401100020.944658-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401100020.944658-1-amadeus@jmu.edu.cn>
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0lJVhgZT0weSEoeGh8dHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQY+
X-HM-Tid: 0a95f0cb9a3403a2kunm10501caff
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORw6Shw5FDJLPQoWFSwDFAEs
	GU0KFBdVSlVKTE9ITktKTUhLQkhNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSUpOSDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_030033_291976_62DB9F34 
X-CRM114-Status: UNSURE (   8.10  )
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

Add DMA controller dt node for RK3528 SoC.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 7f1ffd6003f5..c366766ee3f5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -493,6 +493,24 @@ sdhci: mmc@ffbf0000 {
 			status = "disabled";
 		};
 
+		dmac: dma-controller@ffd60000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0x0 0xffd60000 0x0 0x4000>;
+			clocks = <&cru ACLK_DMAC>;
+			clock-names = "apb_pclk";
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			arm,pl330-periph-burst;
+			#dma-cells = <1>;
+		};
+
 		pinctrl: pinctrl {
 			compatible = "rockchip,rk3528-pinctrl";
 			rockchip,grf = <&ioc_grf>;
-- 
2.25.1


