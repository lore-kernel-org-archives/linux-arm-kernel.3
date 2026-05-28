Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D003CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1AnpU5tCNCN0keTZRLfXKZG8L7AjxclRX0YRBV/OKI=; b=p6krGKCSwBetmpFa1WiQaIMwJm
	GtuP0Hth5rk52PYsV1/BppLOICvUswMLpRL+RaYykrBSnzdvUhohGoaJuPo0Lu8+zbJ+HaJel+Hxv
	8+O8HKdySyL6rv+AYKnDaTFe91CZU58i+xU6zvW9ei+A5gYfrILSO7jVnaREaMLNU1IzgZ1l6r4f6
	KjXnixWh6VMIE048jxhaGy3zKaxqaN09EdRN5+M9cyfwkLgyrARpYGFQgb6gFMpn5PmGO8jQXNRVT
	iTuxau8iwUtCZlsWARAAkKqmCY5h925pO0hTp9sQERztQYEtetNiGh5pvQAwwTyzhGSbhhBXKl7cl
	ctMYoyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZyz-00000005iuw-0bDo;
	Thu, 28 May 2026 12:37:05 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZyr-00000005isP-3GFy;
	Thu, 28 May 2026 12:36:59 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779971815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C1AnpU5tCNCN0keTZRLfXKZG8L7AjxclRX0YRBV/OKI=;
	b=Hf7Z2VYzkcO0mgTeEd9DS25v46P+Y57N0ItMWINIwmhMPatmdk2vgsTUGR2et/Z4DJXOxM
	MQICIC177p0OA//vp38igJioa7JKBQsoCs3GIWhUQe+cI09K0sChTAEySB8menaekr0Sqd
	gIwN5XAZxOzSpvQL9bfD8/YrWGnyrjy1Oj0jld22TCwQHSXSMfimZDtPaclZObvhWiHibV
	w7vdREiEno4f09orQFfeAN/ltQLvVp+WhPRgVGisS1TI130z6ucjIbQu5Q/hYFMp3UA2PD
	P7OQ66WCBIpOl+YI9SauguTBOaT4hlsJ4qRUmtyQ/YMk0NTqwXkZpmbwu0VfLA==
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martino Dell'Ambrogio <tillo@tillo.ch>
Subject: [PATCH v2] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Thu, 28 May 2026 14:36:55 +0200
Message-ID: <20260528123655.2650868-1-tillo@tillo.ch>
In-Reply-To: <20260528092807.1936177-1-tillo@tillo.ch>
References: <20260528092807.1936177-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_053657_982941_C1E11A94 
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
Changes in v2:
 - Add no-map; to keep the carve-out out of the kernel linear map and
   avoid the cacheable/write-combine attribute mismatch on arm64.
   (sashiko-bot, gemini-3.1-pro)
 - Rewrite the ECC paragraph in the commit log: the zone sizes already
   fill the 64 KiB region, so there is no remainder; ecc-size is carved
   from each zone in persistent_ram_new(). (sashiko-bot, gemini-3.1-pro)

v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d..31ee189 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,19 @@ sfp2: sfp-2 {
 	};
 };

+&{/reserved-memory} {
+	ramoops@42ff0000 {
+		compatible = "ramoops";
+		reg = <0 0x42ff0000 0 0x10000>;
+		no-map;
+		record-size = <0x2000>;
+		console-size = <0x8000>;
+		ftrace-size = <0x2000>;
+		pmsg-size = <0x2000>;
+		ecc-size = <16>;
+	};
+};
+
 &cpu_thermal {
 	cooling-maps {
 		map-cpu-active-high {
--
2.47.3

