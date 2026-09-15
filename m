Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37D5C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/vr+uEAwXqjHzhWPbfgMVFBA8wvT21ni08gYcXTbW0=; b=N8JIc6895NUOoaUV1gL8qRW+Kc
	TPy+AIq7JbMf3T1ViqA+FncIK0gsT3s3SrlMFXz6MHdygt5yNi84hMP3w9pzybFuQXDaBlMGuoPAE
	FLp4cQKTeuaNMjoTV5SWgDMldoZt6piOrRFHDmTReDbUdK0Kg6B1cEfVT449/8FjpJtAdu47miQXQ
	UsLbt699M7GBnx2xLhYoYJ95NkteSC7IBpM2F0ZTahs+IzWT/IDYu59IQXLlN1wN+AIfMHSPrVtE3
	VImCJQo0DbwnhTvd/jBaoQVWvE7n8+Dhz+vIDmRxBiA1fe/iLIYhPQyfNV4ZhDnf9YWMB5dvAnhGB
	xIRDvadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rn4-00000006KxQ-38qD;
	Tue, 15 Sep 2026 11:57:34 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rn0-00000006Ksz-1klV;
	Tue, 15 Sep 2026 11:57:31 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789473448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9/vr+uEAwXqjHzhWPbfgMVFBA8wvT21ni08gYcXTbW0=;
	b=TcnRn/N7eio1rumCna9E2hOlUg85z27ktR/9xzJWXB/eqBFbzLgl1KuGuu60JAlrKekp4P
	UP4bXDPOdI8OzjzC1eO7UXzcdFepjzZsRHNryjqxTF86JpwC5gtj4R+MIjV6RLsrYRx8yK
	YCRsBXZwJwMoNwCusPbraZAIrZPsI+QQIDL+L2+bbEWNM1dPD7bvLF5P1AtCE9yED2WzXi
	ULPsDpi2xOoZYAQS1FjMyk9szDsbbJVx8b1KI3iits7yjLWvvx9N85L5G+nOdptTR79HvO
	ioIc1iVLqKf1rgFJ78BD23oh7fueSRU8+PWbqY/2XUMa0ebGSybuKUym98lzFg==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v4] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 13:57:27 +0200
Message-ID: <20260915135727.567145-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045730_637043_892DFA15 
X-CRM114-Status: GOOD (  13.81  )
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
Changes in v4:
 - Use a plain reserved-memory node inside the root node instead of the
   &{/reserved-memory} path reference, as AngeloGioacchino pointed out. dtc
   merges it with the node from mt7986a.dtsi, so the resulting DTB is
   identical; this is a syntax change only. Same change made to the BPI-R4
   patch.

No rush on my account for the earlier silence - the v2 postings were
cross-threaded into each other's v1, so they were easy to miss.

v3: https://lore.kernel.org/all/20260915064302.1595204-1-tillo@tillo.ch/
v2: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 637e556..150b794 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,19 @@
 		tx-disable-gpios = <&pio 15 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 	};
+
+	reserved-memory {
+		ramoops@42f00000 {
+			compatible = "ramoops";
+			reg = <0 0x42f00000 0 0x100000>;
+			no-map;
+			record-size = <0x20000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+			ecc-size = <16>;
+		};
+	};
 };
 
 &cpu_thermal {
-- 
2.47.3



