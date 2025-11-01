Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C96CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 14:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uvv4Ka4UXIT1LnU9mCoMqPO3YBJzbGN5Uxr9dgbmR+g=; b=Y1cVkUbb7jDRnKRBt+18aKXpP8
	v4zOD+2VJfxFRYRQNmMAVjSk6aeBPkj39PndZEHU+S6+DsrsrbZ5XkbBTvT+nn4Bq0qcwrJOXijqs
	re44GG+NTBGlr9UW2F/yKkJe6GkA1STVdEqUjNrq5dVlnjrbVO81NvztPoQMRvO6ZqD6xKrMbBm4x
	tJUhaPXDyXV5qE8yOAHURnFj+TEvmBSpBpw7LarW/n3+/LDtxf9MasjnAZVfk23dOR3QzH9io3nU/
	O2pgL0afwQSHM73wcXQFR2MU6IQ9aJLrLxw0h2r9flQjbtJDqRLP+VikP8KcB5Cm38SD1xnhomymL
	geGCgYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCAP-00000007ooz-2PHS;
	Sat, 01 Nov 2025 14:01:17 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCAL-00000007ony-1Pyd;
	Sat, 01 Nov 2025 14:01:15 +0000
Received: from localhost.localdomain (unknown [58.61.140.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2802e7076;
	Sat, 1 Nov 2025 22:01:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] arm64: dts: rockchip: drop reset from rk3576 i2c9 node
Date: Sat,  1 Nov 2025 22:01:01 +0800
Message-Id: <20251101140101.302229-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a3fb8ce2803a2kunm744b76102df25f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZThpCVkpOGUJOSh4YSBoaH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0tVSkhPWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_070113_851359_2C90070D 
X-CRM114-Status: UNSURE (   7.89  )
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

The reset property is not part of the binding, so drop it.
It is also not used by the driver, so it was likely copied
from some vendor-kernel node.

Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index f0c3ab00a7f3..a86fc6b4e8c4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2549,8 +2549,6 @@ i2c9: i2c@2ae80000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c9m0_xfer>;
-			resets = <&cru SRST_I2C9>, <&cru SRST_P_I2C9>;
-			reset-names = "i2c", "apb";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
-- 
2.25.1


