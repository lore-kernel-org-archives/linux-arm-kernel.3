Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5231CCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcowIcPNux4LDkAMYkEqLQs99M4cGzB+ZVypPifTiHQ=; b=Z7VN0XYLHrVkUw6jAX/9j4kFIO
	Oo/pdHX1egUnoBEcJ0B1wMNzPJgYot6FtkZLviCDu6EhcDD60aVmqYr3Zd5sfOrlt8hLD8vQIkEPA
	dHFAgrAIr2SmuHRh316Lvh+4/AnCoSjJy4M3QJRylpwEcMSFhXFEPUlzSCM1o2I64vaINpJg8Knhp
	IGd4s5CyAJPx0L2twc8V2fYqr+PHwqf7ZbPEBCgONbGCFQ/VlBUSQB+Nx1AjV+59hbeG69BthxuFj
	EEIAvXOw/vatoCE3vg2yJugQXigAL3aQ/ErgNg4g62Chi6HySNsZK7cFMmUUXQ2SbPJDGtTvL6UTA
	LkQ0OnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzBQ-00000007hkD-0X2f;
	Fri, 29 May 2026 15:31:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzBN-00000007hhw-0DDA;
	Fri, 29 May 2026 15:31:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2380A43D7A;
	Fri, 29 May 2026 15:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB91DC2BCB3;
	Fri, 29 May 2026 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780068692;
	bh=Wc7i4dF9ygiTQTaQ/gCEQkz1kc+L4fUW6J/05ngPp7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=boPVeON2KW3rK93sT25Ly4iFGSKdlqTWm+ENdICl1VZIZECcCNk+w04jdJo+WT2JE
	 VHE4zAcbHxfUUXjBDKj7ldrmAVMGyNT725OjVO/BzhT46kCgyEundpAlcG8R4wg0k2
	 dLznGWGI3SfRoKLfvcUcDeFpzmjs++MgYHkKLCoC8x4dj9hC3ijkE5Lf10LaFi4SAJ
	 PFW5PbqodBas3HGxToHcEeUprZFRevoTYRCAmMqoQc/Vcze7LHPOslW5jAG0GRL6lh
	 G9MyiYK+egdLwWCGt3vVdqa0GZzaTtw6+90GKxCXgPKeIe72KOIx7JpIURgY9VLcnb
	 XitH9p1ATQkAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E182ECD4F54;
	Fri, 29 May 2026 15:31:31 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v2 0/2] describe PCIe ethernet interfaces and alias
 ethernet0/1 on NanoPC-T6
Date: Fri, 29 May 2026 17:31:23 +0200
Message-Id: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf4X07BpaLBBP/ofhUNpFVkkh20o0h
 H+3YLx7fJPJvFlEQCYM4pwtgnGmQKNPoA6ZsL3xNwRyiYXKVZlrdQJ+FLquwcUAHAfA2IPDYJl
 aTCGYgUwAK9HJumorq3ORpibGjl675tp8OTzbO9q4bW+NnkIc+b3/mOXW+yn1f8pZggRTdtYZX
 RbGVpfJsCNPR49RNOu6fgA3sv5v7AAAAA==
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=Wc7i4dF9ygiTQTaQ/gCEQkz1kc+L4fUW6J/05ngPp7E=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqGbFSPnLISoKIp2YOdD3mlPG61DJUOBfi9o1sC
 thxlsVlILWJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCahmxUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7emM8Af+I/ztaHtuESg8K7PXiX+dQ+qkRAk6nPQ
 btd0McxQmrWGrJ57QoTBbgthgPt7E7fbINDputVTOkME8dq4b+6MsSN+VrtbR3HDjbDe6VC2daD
 w7zGtsEVV5yXRmLZllu6R+mLVvoilpLL534zYGM4N/QEGH2sIShyq+HI8vgS7V3fCx5fz6yFMzF
 aymwSBhN6/t1EV0UfTGisW/WOIbvxSIimh2vlNLvI/F7rXvgzG874uRx25yDtWylzIY3JpQoGpn
 +620KC3UsuZNwQ/HTlUQ+QxRI5Mqb+iM2PBGEN7RSM1M/SF18cPjMuv2fUG/0SRjoi0/J2/DUm0
 EkyPm173ZMA==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_083133_137397_3237768D 
X-CRM114-Status: GOOD (  11.80  )
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

This describes the two on-board Realtek RTL8125BG PCIe Ethernet
controllers on the FriendlyElec NanoPC-T6 (RK3588) board and aliases
them to ethernet0/ethernet1.

Many Rockchip boards have on-board RTL8125 PCIe NICs, wired to
pcie2x1l0 and pcie2x1l2. The controllers were already enabled in the
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

While at it, rename regulator vcc3v3_pcie2x1l0 to l1, since that is
what is actually powers; since only cosmetic, I did not include
a Fixes tag.

---
Changes in v2:
- fix: pcie2x1l0, not pcie2x1l1; indirectly caught by Sashiko's review [1]
- while-at-it: rename regulator vcc3v3_pcie2x1l0 to l1
- Link to v1: https://patch.msgid.link/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net

[1] https://sashiko.dev/#/patchset/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7%40pardini.net

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

---
Ricardo Pardini (2):
      arm64: dts: rockchip: describe PCIe Ethernet controllers on NanoPC-T6
      arm64: dts: rockchip: fix PCIe regulator name on NanoPC-T6

 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



