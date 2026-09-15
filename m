Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C70C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=crTiarevnQnKIMMV9H7NWGBFcK3peD/bzvBVhBr5ui4=; b=h8yHCRciXzMhmcIfkmNXn7jc/T
	gSg1LZy1hvTmJuodwDSiEDuK73PGcdhlLFxPDZqxC4XLSmWFtS+F6qHOpCtljYHe0rv/WXil/g5Dp
	rgU8/9+6u0COgQMtBwHFFY+0FvX0qWhyPXNBv/PECeVbMhFdNbU0kLz0RoJdFZU5klw1P8MqZ7HuV
	qSyFnYg396SG/eGESrYI/m+lmE2xbQWNASdi8g8bgsaKuw9jFJdtXmMOfwvUYNf3t5aeZZ1VNYrmv
	rRpYtHElevvo2Eo8LNeW/PUO9w0YcpBdIDTyoGBb/loYe42S3jHuNcnZMFT9g6BXR/WhlBpuDyq0i
	9JUzmiMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S1a-00000006QEn-1vxQ;
	Tue, 15 Sep 2026 12:12:34 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6S1Y-00000006QCB-0vnc;
	Tue, 15 Sep 2026 12:12:33 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789474346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=crTiarevnQnKIMMV9H7NWGBFcK3peD/bzvBVhBr5ui4=;
	b=TFMoI+9f/IMg/rjhqVMcsjEph0zoixESn9bn4E3w9GZdu4SqRV93qFEfXbW4vym+ARMsoF
	6ro39G2XdYJXQ8MuiUBU8F8HkYQ6U8hDTcyKMqsoQq8CtivPzHao7TqpCNUPoB8Ksxema8
	hARaJqD5FAqj8jAu++rX5sJ7Y1KpoUXJ46puiWkmmuSWocl8aR9dZgUUZn0GHnwuCxRKiQ
	Zqk6QipU1gZQFyU0zE2aLAxPVOgFM9eFNGKm+9K2B8i6VzscRJZ8pJqDM8VGZ46VNf/Atf
	Of4jkuY+5HOCXUksZoj/XY4XQ1NWHTxpqS/x64xBW8wdgro4iW5pHk+QYrDNGw==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v5] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 14:12:26 +0200
Message-ID: <20260915141226.600486-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_051232_530904_1E8A9351 
X-CRM114-Status: GOOD (  15.27  )
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

Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
(0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
warm reset. Without it, kernel crash logs on this board are lost when the
SoC reboots.

The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
reserves a small Reed-Solomon parity block from each zone's own allocation
in persistent_ram_new(), which lets pstore recover dumps even when the panic
path truncates writes mid-record.

The no-map property is required so the reserved region is kept out of the
kernel linear map. ramoops remaps the carve-out write-combine via
ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
the linear map at the same time is an attribute-mismatch and risks losing
panic data to dirty cache evictions from the linear alias.

The region sits immediately below the ATF block already declared at
0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
0x43000000, so the region is always within installed memory.

For the carve-out to actually preserve content across a reset, the boot
loader must avoid touching this region on warm reset; on standard BPI-R3
boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
Changes in v5:
 - Restore this board's own carve-out. v4 carried the BPI-R4 values by
   mistake - 1 MiB at 0x42f00000 with 128/256/64/64 KiB zones - while the
   commit message still described the BPI-R3 layout. That would have reserved
   1 MiB instead of 64 KiB on a 2 GiB board and contradicted its own message.
   Back to 64 KiB at 0x42ff0000 with 8/32/8/8 KiB, as in v3. Thanks to the
   Sashiko review for catching it; entirely my error in regenerating the patch.
 - No other change: the plain reserved-memory node from v4 is kept.

The BPI-R4 patch is unaffected - its values were correct in v4 and it needs no
resend:
https://lore.kernel.org/all/20260915135722.566918-1-tillo@tillo.ch/

v4: https://lore.kernel.org/all/20260915135727.567145-1-tillo@tillo.ch/
v3: https://lore.kernel.org/all/20260915064302.1595204-1-tillo@tillo.ch/
v2: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 637e556..70c693f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,19 @@
 		tx-disable-gpios = <&pio 15 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 	};
+
+	reserved-memory {
+		ramoops@42ff0000 {
+			compatible = "ramoops";
+			reg = <0 0x42ff0000 0 0x10000>;
+			no-map;
+			record-size = <0x2000>;
+			console-size = <0x8000>;
+			ftrace-size = <0x2000>;
+			pmsg-size = <0x2000>;
+			ecc-size = <16>;
+		};
+	};
 };
 
 &cpu_thermal {
-- 
2.47.3



