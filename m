Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6E4D5B84D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJjG2x0vaTe6jnGdA0VuhBCj104Jr5YbxT3cgKLb1Js=; b=VrXT1U1rEEm7WJmHrpiVlE48c8
	2sk/VyhmV0gJfPDcHZflUWeMDImdaNbb6acPOuqWjWreOStLdFrJlYUtV+LpgUgDFcjmQvGsFv2cD
	6ZH+QD/iXMDeBzRPTDwLQT6te9gRev8lBkT8FiNBXPTFYLFZzCEn5txPnnljaPn4yeZigYZxPdzop
	zq0UReONaPhGbe5NPFhP7BJpBPsQxSyort9DdSmsrpKRohbv8tF38IQbgpGzEVJzKvrVy5/Xq1fW5
	G6Ko1wLYtPT+g6FuBuokUFF6tYCM+EIpbqkckclF/U2xhUxs4eR3kPP20Uc80LiXlv4joxEZbUlxN
	/0xxGjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBiK-0000000411S-1tRT;
	Mon, 15 Dec 2025 16:46:24 +0000
Received: from smtp-42ac.mail.infomaniak.ch ([2001:1600:4:17::42ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBiH-0000000410N-34o6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:46:23 +0000
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dVQtf6cv1zTkg;
	Mon, 15 Dec 2025 17:46:18 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dVQtf0KpFz6NJ;
	Mon, 15 Dec 2025 17:46:17 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 15 Dec 2025 17:45:56 +0100
Subject: [PATCH] arm64: dts: rockchip: fix unit-address for RK3588 NPU's
 core1 and core2's IOMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-npu-dt-node-address-v1-1-840093e8a2bf@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqFMAxF0a1Ixj9giyK6FXFQzVMzqdLoRxD3b
 nF4BvfeZEgKo664KeGvplvMcL+CpjXEBaySTb70tfOu5rifLAfHTcBBJMGMm3FGGCsvAS3lck+
 Y9fqu/fA8L8QN/89lAAAA
X-Change-ID: 20251215-npu-dt-node-address-7bfeab42dae9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_084621_919533_66548311 
X-CRM114-Status: GOOD (  12.58  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

The Device Tree specification specifies[1] that

"""
Each node in the devicetree is named according to the following
convention:
	node-name@unit-address
[...]
The unit-address must match the first address specified in the reg
property of the node.
"""

The first address in the reg property is fdaXa000 and not fdaX9000. This
is likely a copy-paste error as the IOMMU for core0 has two entries in
the reg property, the first one being fdab9000 and the second fdaba000.

Let's fix this oversight to match what the spec is expecting.

[1] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.4/devicetree-specification-v0.4.pdf 2.2.1 Node Names

Fixes: a31dfc060a74 ("arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base")
Cc: stable@vger.kernel.org
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 2a79217930206..7ab12d1054a73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1200,7 +1200,7 @@ rknn_core_1: npu@fdac0000 {
 		status = "disabled";
 	};
 
-	rknn_mmu_1: iommu@fdac9000 {
+	rknn_mmu_1: iommu@fdaca000 {
 		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
 		reg = <0x0 0xfdaca000 0x0 0x100>;
 		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
@@ -1230,7 +1230,7 @@ rknn_core_2: npu@fdad0000 {
 		status = "disabled";
 	};
 
-	rknn_mmu_2: iommu@fdad9000 {
+	rknn_mmu_2: iommu@fdada000 {
 		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
 		reg = <0x0 0xfdada000 0x0 0x100>;
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;

---
base-commit: a619746d25c8adafe294777cc98c47a09759b3ed
change-id: 20251215-npu-dt-node-address-7bfeab42dae9

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


