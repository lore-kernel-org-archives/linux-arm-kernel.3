Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B164C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MyMaQLp9M+rwS0AteFEdLzWdZrV9YUjHABH2hNf9E+0=; b=ZcxTWCuOzVcm4hq6L8ZdVeljvz
	vasB/t6496B3t2spXwMkqiahJ/6jE6CYYtj51G8mI4zJM3cAR1NJvzcXdCMItwkkEUMbG77zWIEmd
	Y9oT8pbGptNO9T9/3KkDHQ8ybXAfcaO51esh54EJgA3s+N0HsWI84ryZ1YYWiKh781NOAVrCFz2aS
	VoR+OVovCFjzLrsNzk6sQracGHLATyGtHpEKUzei28c10zAhget6G5HSakEPpJ2I5Ky2OVOyLQBvV
	uE0Ck+Eaexi6sa6MipvMOeSfGkIALufK7isd5IYF3wipB4BLt1FkVWTwD+JkFwAOC7Mv27c99d1h/
	9puRMOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l45-0000000FIrL-0G6z;
	Thu, 10 Sep 2026 20:08:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4l43-0000000FIpv-1jJY;
	Thu, 10 Sep 2026 20:08:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 623D5412E7;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3283BC2BCF4;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789070886;
	bh=r6js+jziMUsagrxNtK58g/Crq9cEVtYCRnaAMm14gsM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fD69EY71I6tk8uAOOPObfgW7WK6S4ii6TSCVw9vMNlWMzjfQ2QN6+gY+OMSAm1jAV
	 nw2F/CsA1wN+/5GwiidOtEeFF58eBB6gABilVHq5c/BjQ5vgVemRqeOiJv5CU1NHKY
	 Ixpy+pTBlpJgCZYp4CfLIn3RDspzIX0WxsA5htTZk5XnSXSxMCATDB7Y1lOoXzgIIr
	 l8Zv4nD4a6NF4GSmbhxMSvGNAaz0E3lG2b3MJY4BW7aCMuRuZiEZpOe+qAWCMqPokx
	 XKBTjmf61rVTBx9Oa560N5P0BbLFAkokGrinQmqSwuq9YnvJYPP+WC3TbwVpeTYes9
	 EJk9c3T5ivFzQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2DEC88E41;
	Thu, 10 Sep 2026 20:08:06 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
Date: Thu, 10 Sep 2026 22:07:50 +0200
Message-Id: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43Oy07DMBAF0F+pvGaQn7HTFf+BuvBjQgaqtLLdC
 FTl33GKEEWwyPKOrs6dKyuYCQvb764s40yFTlML5mHH4uinFwRKLTPJZceN1JDflHEOUi2Q6xG
 wjpCwxEwB2xH8kXyBKDAJZ4ONhrNGnTMO9H6beT585XIJrxjraq+NkUo95Y/bH7NYe9+TZtvkL
 ECA74aYvOmUj/bp7HOiiR4nrGwdneU9229kJXDQveVcaie0Gv6y6odt8EZWNdZ554wNqk/+H1b
 fscJuZHVjZUjK9VImIfvf7LIsn1ekkhrxAQAA
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5210;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=r6js+jziMUsagrxNtK58g/Crq9cEVtYCRnaAMm14gsM=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqow4jqF3C07w44Xc2TTt2lfJlkhcQU0sB7UkUX
 6VOO4ISsdeJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaqMOIxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7enshQf9HvMZjiH911nFDwBRO/U9Hl2hYxBMaDd
 Sh/ookigB/p5J/Jx+H7kvXw0Wysc7mVB78f3iU6z/O03r49guS4ZuQ4EoqQWdcPFjM9IZ1qE5lr
 jyldWV3qeAY0bdeTyq61Cgu0jaz7VZE8CaE9CNs5E2D7oBTibYWqe6dsIdcqOHFF6sJFtuFPUij
 Zf/H/vPMvTTASiC3RWk+tGD9IjaOXbdSZgY70bvYU6ZafuXmJgkxBJep4xPusG0k5SgM3w182II
 ZNRt+9qHthnp9QRGYMSUW3/vGlfhBLu+duhYiWMX0a3meSAhk9id9T1Y/A9/+RtFuvvsx5u6khj
 moJMXTi39bw==
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

Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
NICs whose PCI function nodes are not described in the DT. Describing
them allows for stable ethernetN aliases (matching the GMAC alias
convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
inject mac-address properties from its ethaddr/ethNaddr env, so MACs
stay stable across boots and U-Boot and kernel MAC match.

Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
/sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
u-boot correctly adds local-mac-address property there which is
correctly picked up kernel-side:

  => setenv eth1addr 8e:b4:90:66:66:66
  => boot
  ...
  # readlink -f /sys/bus/pci/devices/0004:41:00.0/of_node
  /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0
  # xxd /sys/bus/pci/devices/0004:41:00.0/of_node/local-mac-address
  00000000: 8eb4 9066 6666                           ...fff
  # ip link show dev end1 | grep ether
       link/ether 8e:b4:90:66:66:66 brd ff:ff:ff:ff:ff:ff

Patch 1 adds a DT binding for Realtek RTL8125 family PCIe Ethernet
controllers.

Patch 2-7 describes the on-board RTL8125 function nodes on a few
Rockchip boards.

---
Changes in v5:
- binding: reword commit message: pci10ec,8125 is already covered by
  dtschema pci-device.yaml; the binding is added only to validate the
  ethernet-controller properties on these nodes (local-mac-address,
  nvmem-cells, et al) (ref Krzysztof, Heiner).
- boards: add a few more Rockchip boards with RTL8125's.
- Link to v4: https://patch.msgid.link/20260617-rk3588-dts-rtl-eth-describe-dt-alias-v4-0-2bd38922d129@pardini.net

Changes in v4:
- binding: simplify the binding YAML ref Sashiko's and Krzysztof's
  reviews
- binding: describe only the RTL8125 + rename to match ref Heiner's
  review.
- dt: fix the bus-range according to Sashiko's review.
- Link to v3: https://patch.msgid.link/20260605-rk3588-dts-rtl-eth-describe-dt-alias-v3-0-8a8857b39daf@pardini.net

Changes in v3:
- new patch: add a DT binding for Realtek r8169 family PCIe Ethernet
  controllers, per Sebastian Reichel's review (the "pciVVVV,DDDD" OF
  spelling still needs a binding when used in a board DT).
- new patch for Rock5 series, and include a brief rationale in each.
- retitle the series, since it now covers a few boards and a binding
  rather than just DeviceTree changes for the NanoPC-T6.
- drop the v2 "rename vcc3v3_pcie2x1l0 regulator" patch from this
  series; it will be sent separately as it is not relevant to this.
- Link to v2: https://patch.msgid.link/20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net

Changes in v2:
- fix: pcie2x1l0, not pcie2x1l1; indirectly caught by Sashiko's review [1]
- while-at-it: rename regulator vcc3v3_pcie2x1l0 to l1
- Link to v1: https://patch.msgid.link/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net

[1] https://sashiko.dev/#/patchset/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7%40pardini.net

To: Heiner Kallweit <hkallweit1@gmail.com>
To: nic_swsd@realtek.com
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

---
Ricardo Pardini (7):
      dt-bindings: net: add Realtek RTL8125 PCIe Ethernet
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPC-T6
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 family
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on CM3588-NAS
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R5S
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on NanoPi R6C
      arm64: dts: rockchip: describe PCIe RTL8125 Ethernet on ROCK 5 ITX

 .../devicetree/bindings/net/realtek,rtl8125.yaml   | 43 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts | 30 +++++++++++++++
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    | 21 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 30 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 30 +++++++++++++++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 15 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 18 +++++++++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dts | 21 +++++++++++
 9 files changed, 209 insertions(+)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



