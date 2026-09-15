Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A12C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iDBR88Kq1bFU8YSncqnOxECCzfjGRrt18SSlVQzNBnc=; b=wH55l8ahxHaJkK6EJo6jGCncsO
	Lo2r21jUuIWyuhvjfs7E57LoQY3p/zLm0hdsDG31UrdTmx6uuNpSuLVqz2T3CWJo/60oGlpVH4inS
	Cxr3XWg/hDAdBvimSw2gV7l+QtISW+OAoyLlQP8xn0JjMMyuojTFOQollRsHHIoAxdTv94rkP7zv4
	RWtYRPUt9MsZIsGg6kTMm49kghLOOZq+s+zofhcKr3jTFhS68cYQ5GGAoDeBaFhZYHFmXIxACe3L1
	N8k/GuV9mb4pLuEkGtd536bdLGYx1uG51I/PwiGt0qcDxqxPMw371LV0sO6orrOwBnD2iKgJrzDYx
	8as8l1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L0n-00000005CWn-3Hpl;
	Tue, 15 Sep 2026 04:43:17 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L0k-00000005CUO-3B8N;
	Tue, 15 Sep 2026 04:43:16 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789447378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iDBR88Kq1bFU8YSncqnOxECCzfjGRrt18SSlVQzNBnc=;
	b=PPSoj7PgCTlMLla4350sZgDJzIx+8rTgGOjNPZe/8yjpHw/erLp7sBJIKRyL4Q0DGFFEES
	EOHypxEvIX9IQLMiyt4D1pNU4m5sUDJm9S4W/mviqw44fezn5wsj/atoTua336GyBgO+Sx
	3Ke3NU5c08uPO9p0GmAXn1OCT9x+OEVGupg0kPo7RDXGEtsV26T65sB4R5u/n8sJoZM9Dq
	L4QTolYeMLexySoXGEkLqUzBoI6PZsVqhxG2u7Z3nSwnHU4AApJVk/72Jdj5KPvYm/M7wy
	Y58qs1XXSkMlQ3h1FetjarEwgC45NJLH870d8KGTSMJtgWLgYL+dWQ0Deh/Kmg==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v3] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Tue, 15 Sep 2026 06:42:54 +0200
Message-ID: <20260915064254.1594808-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_214315_063565_D7E8ACE3 
X-CRM114-Status: GOOD (  14.81  )
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

Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
(0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
reboot. Without it, kernel crash logs on this board are lost when the SoC
warm-resets and the on-chip console buffer is reinitialised.

With record-size=128 KiB, console-size=256 KiB, ftrace-size=64 KiB and
pmsg-size=64 KiB, ramoops_probe() carves the post-console remainder
(640 KiB) into five 128 KiB kmsg records, with the requested ecc-size=16
reserving a small Reed-Solomon parity block from each zone's own
allocation (per persistent_ram_new()). The ECC lets pstore recover dumps
even when the panic path truncates writes mid-record.

The no-map property is required so the reserved region is kept out of the
kernel linear map. ramoops remaps the carve-out write-combine via
ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
the linear map at the same time is an attribute-mismatch and risks losing
panic data to dirty cache evictions from the linear alias.

The carve-out sits immediately below the ATF region already declared at
0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
so the region is well within installed memory on every variant.

For the carve-out to actually preserve content across a reset, the boot
loader must also avoid touching this region on warm reset; on standard
BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
Changes in v3:
 - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
   still applies unmodified.
 - v2 drew no review comments. It was also sent, in error, as a reply to
   the BPI-R3 patch's thread rather than its own, so it is likely to have
   been read as a duplicate of that board's patch. This version starts a
   fresh thread to avoid repeating that.

The matching BPI-R3 (mt7986a) patch is being resent as v3 at the same time.

v2: https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..6a8dc89 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -80,6 +80,19 @@
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42f00000 {
+		compatible = "ramoops";
+		reg = <0 0x42f00000 0 0x100000>;
+		no-map;
+		record-size = <0x20000>;
+		console-size = <0x40000>;
+		ftrace-size = <0x10000>;
+		pmsg-size = <0x10000>;
+		ecc-size = <16>;
+	};
+};
+
 &cci {
 	proc-supply = <&rt5190_buck3>;
 };
-- 
2.47.3



