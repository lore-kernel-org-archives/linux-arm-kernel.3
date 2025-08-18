Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D109CA0EF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UE3OHlpofQv8KRvd/HPAn3L9I8ZnXZEam5hUTI2cd0I=; b=LKjLihl+V6z/PIjzUAo2pm67Vf
	K13S2k9k8nP7+28yqQqW21xf9cSyb4hEspgOfge6H4QgN93cdY8HBq8HSsVLOfabSfkIL+aee7jlY
	E4pUQuZJjVXLdo4j73C+66E68b+OmB5Gcas4QJeqO8tHiw/JoVX0arQatxQQlueetfKc8hP4O2Jj6
	0pryhGam662L0DKtuDlfJOes3ZvtLrH/yrZ5dXDuQ8FIkqoeI6IyAjJ+Cs34V+XM5b9pporQvxEgd
	5oncka88NFw87vYWrrD37do8hX53ANpJJCNOXRC7EqXksKAazjOJZp5gf81e1S+ACmzMwpuRTtkrf
	48xuiG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AJ-00000007oep-1NZC;
	Mon, 18 Aug 2025 14:48:51 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwfC-000000076zW-1s4k;
	Mon, 18 Aug 2025 10:00:27 +0000
Received: from localhost.localdomain (unknown [119.122.213.154])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1fbaa9d09;
	Mon, 18 Aug 2025 18:00:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: rockchip: Add HINLINK H66K
Date: Mon, 18 Aug 2025 18:00:09 +0800
Message-Id: <20250818100009.170202-5-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818100009.170202-1-amadeus@jmu.edu.cn>
References: <20250818100009.170202-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98bc9f6d8e03a2kunm3d9619f636a27b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS09DVktLGB9MTUxLHh0dSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKTk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_030026_643755_568D1C26 
X-CRM114-Status: GOOD (  12.11  )
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

The HINLINK H66K is a development board with the
Rockchip RK3568 SoC. It has the following features:

- 2/4GB LPDDR4
- 1x HDMI Type A
- 3.5mm jack with mic
- 1x PCIE 2.0 WiFi slot
- 1x USB 3.0, 2x USB 2.0
- 2x 2.5GbE RTL8125B Ethernet
- MicroSD card slot / eMMC 32GB

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/Makefile                |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 09c810cb64a4..93e547a1c77b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -130,6 +130,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r68s.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-hinlink-h66k.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-hinlink-h68k.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-lubancat-2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts b/arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts
new file mode 100644
index 000000000000..bc51123d53f5
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3568-hinlink-opc.dtsi"
+
+/ {
+	model = "HINLINK H66K";
+	compatible = "hinlink,h66k", "rockchip,rk3568";
+};
-- 
2.25.1


