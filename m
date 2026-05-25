Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFFACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPsTr42GSKVHAD89g5ugmjFmkPUG4GzK5AqN4QlbUl0=; b=UIwJMpU3AYoAETXykHcU9q2rk1
	2FzYQVoYX1D/1KOLsBcWmycRPEVPvNOInUTSOWlB8h5s0h7m0yDQ30ZaeyEHWnOlFvc2FgyWxw26K
	cWNbJ8yWHZSQowlQktoTE6ULgXVHy5EMPr/yHJ6oL4yD5RnTSA693AKu3X/c+GSQA7J+aGbJCEIZW
	GKIbv733KrlrqRiOIHTF4bVQQy+ngBUz1N0ZMBYJqVmUrY2frNm+IHQoxUHY9TbgfmQ54aCg0QU34
	P5kqWH3OP5zGFTMDA+srNyEr5bFQLIBdJa2z60JY3y6vgsiAK8tKWyRt9rEl7pz5eQ2M3nJUsTVxQ
	UDMOc9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSIB-0000000GuzA-43l9;
	Mon, 25 May 2026 10:12:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSIB-0000000Guyv-1W5V;
	Mon, 25 May 2026 10:12:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B6EF600BB;
	Mon, 25 May 2026 10:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A8E9C2BCB7;
	Mon, 25 May 2026 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779703934;
	bh=R1GgFe59YMZX6danIrFGUoWQKiOB3++Y2+t6P2g9wRo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NiJtpp1JxeiDN7T4QZ9Qez9xO/ym5qQAquuF6u0Ej/NvKNyG6x5WOTyQHQqcLpUw1
	 i8a49TlJBrPOOCkJaq7VZ2XN8MEogdoA/4hn2xAiWuq7IHGBfqiwMVmwdweWnL8Y/o
	 1cHVa1zhKwCAzSDsoykOz8d+U1jvCvH67ilSdCdKF1sRE1eb8NYuWrb3aCgLUrgwJU
	 FDNcVMdA2Lp8Dhi5QSVaI4f9bMhIZ/89ZNtXwwQXHOgo5oVpEQkloVYaQiy4Oi+PLg
	 Hw2w8Hu0HZE+RAM0p03UQ/YBDZLzMKWRdC0Ev2mU/KNf7DJNbcztD4LVX/ZRkU/R5N
	 7huBJ4tvl9K2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2278ACD5BD0;
	Mon, 25 May 2026 10:12:14 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Mon, 25 May 2026 12:12:12 +0200
Subject: [PATCH] arm64: dts: rockchip: describe PCIe Ethernet controllers
 on NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNSw7CMAxF0a1UHmMpCQ2N2ApikI+hhqogO6BKV
 fdOgOF5g/tWUBImhWO3gtCblR9zg911kMc4Xwm5NIMz7mC861Huex8ClqoodUKqIxbSLJyojRg
 njorZUrFhSEP2BlrqKXTh5XdzOv+tr3SjXL9t2LYPxz+gY4gAAAA=
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3532;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=ATDxgV+aVRYA1qwVl5QQNVkoTUqIMI+aNMm96MahMCc=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqFCB9KNIKy16b9ZOZvEfenPlRdjMemK/hkmuEK
 v7F67/+EWSJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCahQgfRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7ekCeAgAhETNghtgglmhDGNt9QFfL3n73Tw10Gc
 FzHh8hLZmz5mFgbpWN31ixqkFdOtvj6xz4ba3rSh/T0zezG3EObvlNMtmyPe9YfaDtOtSndYlMZ
 4mKo83ioOZWwzJJMxuXdWWxe6siI7IWEQ7Zz0861Tf1qDaGyeDMj45dKMZq5bFhpsg8n619HJNd
 IVF7Mhc9uWFnTmE3V0xxaVl2sOc60rjztOgkT8EgUH9gEhk9ygegkxGOPs+jDIUDvYo+frdpe5c
 UVuwbJ6ax1BCseH9JqPOpLh38agQGmxWxXQBXlNAtVA2GEz8yfLj/qLIlfgjz89zkNa9C6f9q+F
 u96ZM+5/MSg==
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

The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125BG
(r8169 family, PCI 10ec:8125) NICs, each behind its own RK3588 PCIe2x1
controller (pcie2x1l1 and pcie2x1l2). Both host bridges were already
enabled by the board DT, but the Ethernet function nodes themselves
were not described, leaving the kernel without DT handles on the two
NICs.

Describe the fixed PCI function nodes and attach ethernet0/ethernet1
aliases to them.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
This describes the two on-board Realtek RTL8125BG PCIe Ethernet
controllers on the FriendlyElec NanoPC-T6 (RK3588) board and aliases
them to ethernet0/ethernet1.

Many Rockchip boards have on-board RTL8125 PCIe NICs, wired to
pcie2x1l1 and pcie2x1l2. The controllers were already enabled in the
board DT, but the Ethernet function nodes themselves are not
described, so the kernel (and u-boot) has no DT handle on the NICs.

Adding the function nodes lets us:
- expose stable ethernet0/ethernet1 aliases for the two NICs, the
  same way other rk3588 boards alias their GMAC interfaces; and
- let U-Boot's fdt_fixup_ethernet() patch mac-address properties in
  at boot time from its ethaddr/eth1addr environment - useful on
  boards (like this one) whose on-NIC EEPROM is not pre-programmed
  with a unique MAC. The kernel and U-Boot then agree on the MAC,
  which matters for network-boot setups.

Checkpatch warnings:
-  WARNING: DT compatible string "pci10ec,8125" appears un-documented
-  WARNING: DT compatible string vendor "pci10ec" appears un-documented
Both are expected. "pciVVVV,DDDD" is the Open Firmware PCI Bus
Binding spelling, where VVVV/DDDD are the PCI vendor and device IDs
allocated by the PCI-SIG (10ec = Realtek, 8125 = RTL8125). It is not a
DT vendor prefix.

If this is seen as a good thing, it would apply very similarly to
the Radxa Rock 5 series and others.
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 84b6b53f016ab..5d28c74847c58 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -20,6 +20,8 @@ / {
 	compatible = "friendlyarm,nanopc-t6", "rockchip,rk3588";
 
 	aliases {
+		ethernet0 = &rtl_eth0;
+		ethernet1 = &rtl_eth1;
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
@@ -643,6 +645,20 @@ &pcie2x1l1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_1_rst>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x20 0x2f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x210000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie2x1l2 {
@@ -651,6 +667,20 @@ &pcie2x1l2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_2_rst>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



