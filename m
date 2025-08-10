Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253C5C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 10:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pVoHS3BJz4JAzSpu8mYj9JWovPIdiEH0btjFK/eNi3I=; b=NjpciIbYy98jMhc8rkdY2Tsdle
	/4svu06HFn97HspA+ttgtoxTriEBpEZyqKHs0OP1XGADIkF8VHdlOLxQqTBNwbhrzIMZv4NrpOjEz
	KSz+Z/uwyMiNhyCg+UiiIgz3S2x8IawJDXYxkcqIFkQ6PxSLAezrBSys+xm0kNhk3dwFQxL1+8aNA
	Vu234aHafjE0Qcni/A3YokJLBQ1zXSXCCdlfQ68CFKHakOh7YUUw4P4r1mWQBvro5P2hbJk8z4DQi
	v51SSHuO2Mr545tlBIFb7TYsZKXnJQPoS6rp7jWszBw+BFgv08L3i09Js/9mjn18kMGo31xWuUyx+
	aZf2G0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2yS-00000005W7H-0sfk;
	Sun, 10 Aug 2025 10:08:20 +0000
Received: from mail-m83116.xmail.ntesmail.com ([156.224.83.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul2qy-00000005Vj4-49vK;
	Sun, 10 Aug 2025 10:00:39 +0000
Received: from localhost.localdomain (unknown [119.122.215.209])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ede32cee;
	Sun, 10 Aug 2025 18:00:24 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: rockchip: disable display subsystem for Radxa E52C
Date: Sun, 10 Aug 2025 18:00:18 +0800
Message-Id: <20250810100020.445053-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98936c973703a2kunm8ce533755351b3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHU1IVkMZT0weTB1DQh8ZSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJS0JZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_030037_366491_F264C729 
X-CRM114-Status: UNSURE (   7.29  )
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

The Radxa E52C SBC do not have HDMI output, so disable
the display subsystem.

Fixes: 9be4171219b6 ("arm64: dts: rockchip: Add Radxa E52C")
Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
index e04f21d8c831..3b519be6e1ea 100644
--- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
@@ -207,6 +207,10 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&display_subsystem {
+	status = "disabled";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
-- 
2.25.1


