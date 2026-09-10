Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04442C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTQs+EqJ2jz1aVTBXUxG/Ns86mD3YpL6nt+OIuVu2Gc=; b=GILzibi+UBKJKKwQrZ25WOYUQl
	ftoJIorRRE3bcTsqNFkRQeI7KsdeXE6m6VzcS5i35ZczBieqFhthVs1CKgV706FFOvVnWjt/tBrKr
	N5cWXc8PQ05jMAQehDWELLWJZSxzvWYwLCQC93KaoMQzUjGBfUoL6jB8a5DTsvYLUnSLSZlZ3yUiS
	mnuASv4MDFTfdkfkSD6VEY5d+MSP18gOM37XygC9ZK/mOdFMEUQjkgtCpjXuGiqfMkpiJOFcOifn/
	LeuaNHQNc90oBh7tBabr+lJFXzSrCyBzfs8Dwg0OoQ+xd1PTxV/3x9cnumA+Ku8Df/ZhkprILagWU
	wu17JHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l45-0000000FIrR-0dhm;
	Thu, 10 Sep 2026 20:08:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIpt-1pA5;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 856E543B61;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57DE8C2BCFB;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=1S166W08hav/cf72m6GiZgUIfPTgGC3XjugLkwkf5xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=naXGoxiQpDICIGwkKe1oWiLFaXcnJz7Jv06gKy3gWuhdTxkAFEANpQe6rt7gZ607y
	 q70W2QvYIZ6kv6FZcRAe+c6SiEqUYxRIaC5yTytAPYI5EMwVK++kt49bk8QUyOCkyV
	 /7yCg+DelPPuv4MuH2swkG3egG6sqbeiIEbGSDi48BX24h2k0J64TVR+BRlROOQJR7
	 Ezf9zmm5Sfbpo8sRhSpPnFhtggVdI37VWwHdak7CP3EeSazf8vWwrI/7UiXnqtDoqK
	 +hs1GFrYmqmhJ+8QkZcwkRK7A9ji1lX4KACQXg1n9fNAjmJt4bGJz6Mhn73I0fnjs/
	 LpMm62NI7BncQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380FFC79FBB;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Thu, 10 Sep 2026 22:07:52 +0200
Subject: [PATCH v5 2/7] arm64: dts: rockchip: describe PCIe RTL8125
 Ethernet on NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-2-c1b9e5f10cd6@pardini.net>
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
To: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=i4GeIrJloVMIhPqbv8MMmvK6rUkQxMcuRPKHm4uxbIo=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWQt5lO5ZsyY6XfpwNOtGY8b3r97ESAekVrkf1n+oa+df
 nfqdM/znYz+LAyMHAyWYoosaySUeb6tf3XqjkfHZJhBrEwgU6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx0DHmIGLUwCm2iuB/X9Gv4pQKa9F9ddaK/7/iqrdta7LQhiP/p+/qtJ8+e5Jx3TqHGK3Rl3
 d79c99TlbyU3eWFOGB3u/Ji/PN3q6bHn26nLpdTPuKTDUWYX5TQlkjnmzNrO7Rnjjkz/pRu1dGp
 rfw6Luv3/DXm4j/qfhevGWA1tSmb+wNkbdyhWfJTZZoM5YvMko0ebcpmxl07NufQKs3w++fPBmw
 eJDe+vlGtk4VoUqrF8tuWJFusGixAc8Ncb5kXM+XX1wyMfc490qvulWj/zv24WzX482/3yydplk
 0uJHwnrNqe+SNp1avG1dgG7jwvyrR89wRxc2P9Zkd174OyysSCxAOSopM6YpIdh15SZ/DvVjyf3
 XrOqqAQ==
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

The FriendlyElec NanoPC-T6 carries two on-board Realtek RTL8125 NICs
behind pcie2x1l0 and pcie2x1l2.

Describe the fixed function nodes and attach ethernet0/ethernet1
aliases, so that U-Boot's fdt_fixup_ethernet() can fill in the MAC
from its ethaddr/eth1addr env. The on-NIC EEPROMs on this board are
not pre-programmed with a unique MAC, so this gives a stable MAC
across boots that both U-Boot and the kernel agree on.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index cfdb5c13f8606..550358a756618 100644
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
@@ -644,6 +646,20 @@ &pcie2x1l0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie2_0_rst>;
 	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x21 0x2f>;
+
+		rtl_eth0: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x210000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie2x1l1 {
@@ -660,6 +676,20 @@ &pcie2x1l2 {
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
+		bus-range = <0x41 0x4f>;
+
+		rtl_eth1: ethernet@0,0 {
+			compatible = "pci10ec,8125";
+			reg = <0x410000 0 0 0 0>;
+		};
+	};
 };
 
 &pcie30phy {

-- 
2.55.0



