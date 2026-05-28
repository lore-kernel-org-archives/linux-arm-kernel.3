Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9F5CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hUXazZYkDyhdjiv+bN79OJcCKaYJV/N7hpLsUqRQUIA=; b=g1zAVesmcYOWY8jxOsbIFj4fqs
	Fx1K2Ouedgm+uTMxYrCYNRkJVzL5WmQzEtQZeS68WoRHsu5WQx2dZORz5M/m7pzMIekiU/6Kn/3gP
	ucMx8jrVxZ+9omL23/z/oCTdTe34dvGeZzosDtfnSUTPAmPmXweZwUdRUljZYm+1xRrCeXVMbOkTl
	REb9Rd9KILRCwzLc/WCXax2A3CNOsVyXdQL4jd3KYSAaN+ToEPvtRFZwRN1x6uVp0oqp/7H4BQphq
	stUpl0WJTD4V2LQdZ6AT+xKk65M3J29PhuPa+P52/zGAs3pI5vtUFujz6hj2FLgaV2K3RX4BUVI5H
	LCHjUitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX4o-00000005VcC-1Hwp;
	Thu, 28 May 2026 09:30:54 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX4k-00000005Vbp-0xtN;
	Thu, 28 May 2026 09:30:52 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779960647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hUXazZYkDyhdjiv+bN79OJcCKaYJV/N7hpLsUqRQUIA=;
	b=T9zY7Nxniq8Bcglfp9Uib7EYGmBkAbg2EGy7g44w7F7A3+WDk3M0bb1PAka8lMcWxuZwbd
	OLxFzTkNr5KFb+ZdjL9tcDLKTiF3NXrWbij2/QMx+RYxM/frEplj69NA8m1qWof4iuO/0z
	5SyJGOnpZnpRhvSH1GDznMz/oqxy3GzNAFJ3Yq9x4JVf/++z3/yXRdmhnNMnXmSz4dsuF+
	/n6xuSU4hg/Q7RbSOGEkqP5fOIffTrHVa99WXkKyfreA7okzfwQgtigjtj+0m8qA+Y8EzU
	moAM5lndFPPa7ZUZ/UV81T9fLCuX9h/StE++r8fMbKzIN5qEo1gph6fUXlE5Iw==
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
Subject: [PATCH] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Thu, 28 May 2026 11:30:38 +0200
Message-ID: <20260528093038.1945245-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_023050_438198_69D1A6D1 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

The carve-out is divided into 8 KiB kmsg records, a 32 KiB rolling console,
8 KiB ftrace, and 8 KiB pmsg, leaving the remainder for the per-record
Reed-Solomon ECC parity (ecc-size=16) which significantly improves dump
readability when the panic path truncates writes mid-record.

The region sits immediately below the ATF block already declared at
0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
0x43000000, so the region is always within installed memory.

For the carve-out to actually preserve content across a reset, the boot
loader must avoid touching this region on warm reset; on standard BPI-R3
boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 19f538d..31ee189 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -140,6 +140,18 @@ sfp2: sfp-2 {
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42ff0000 {
+		compatible = "ramoops";
+		reg = <0 0x42ff0000 0 0x10000>;
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


