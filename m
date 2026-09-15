Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D2DC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ix4zUneWseQ7vdoZIO9ZqqK5b1ofsYuNIFP6ohWZvWc=; b=Ci92ApS7OZBzSCTrdizHZR3sOg
	aO88YUxKvufE8u2onzv4hbd8VIOD/PNjYw/rZi4C4jyGn9B41VVSFbUHNwLcLWRPNEZPQ/e4NucVl
	QxHc2WafQuamjLMc6Kq883oK0SA7WZzJF98PwOTwC6dZ+hFCqyVAw7fVcLZL9sI7mR3I/gl1CUVcg
	mw8QQ/EFbwd89dYcyWyyu5EhoU76EZtvnuvtI+QW0Bod+e9HuF8SyHG8QqYNmgulYj1E0ysTjlu+1
	g1fMr0QIzoYqG8Er6BCcYl/Zr410KXFppLs5UmL3mlZc+UmGXTtZNwwkL4ucHw5SlialcO0pjrk1A
	9FC0bAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rn4-00000006Kww-1qxH;
	Tue, 15 Sep 2026 11:57:34 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rmy-00000006Kr5-0V7L;
	Tue, 15 Sep 2026 11:57:29 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789473442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ix4zUneWseQ7vdoZIO9ZqqK5b1ofsYuNIFP6ohWZvWc=;
	b=gLEEYnnmonwrqeCPhxqBohgYdJfsQxDIMIemRm5bC7lnm2XjBcNIgyd2xT8FBA+2VWG/oC
	GK1P6B/d4ZikTPOjmsiElND5nzCDug6W33eAUAe+R1A0pIV3gpwkduAvJ625246EfCILHT
	fzVhGwNQBOTLexuRjqloMvAXYSE5HyofvAI4w/th18Y0BwEFULwb2gP8vTmoFqZIl7ULLN
	0P2TSKyhzzjE3DSHDgzJjynbDogW/c8WdrMzWfiF713ethU4b5f8t36AGWlv85QcsY4WqS
	7VftbrKSwK4JNTmFu18+dFvHzwoSQsFPTHH05okKTPglZzznFR2Y1j27GENClA==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v4] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Tue, 15 Sep 2026 13:57:22 +0200
Message-ID: <20260915135722.566918-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045728_442582_569FB257 
X-CRM114-Status: GOOD (  16.79  )
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
Changes in v4:
 - Use a plain reserved-memory node inside the root node instead of the
   &{/reserved-memory} path reference, as AngeloGioacchino pointed out. dtc
   merges it with the node from mt7988a.dtsi, so the resulting DTB is
   identical; this is a syntax change only. Same change made to the BPI-R3
   patch.

No rush on my account for the earlier silence - the v2 postings were
cross-threaded into each other's v1, so they were easy to miss.

For what it is worth, this layout is in use on a BPI-R4 here: the kernel
brings it up as
  OF: reserved mem: 0x42f00000..0x42ffffff (1024 KiB) nomap non-reusable
  pstore: Registered ramoops as persistent store backend
  ramoops: using 0x100000@0x42f00000, ecc: 16
(that build carries the same node via the path-reference form, so the DTB is
the one this patch produces). I have not yet confirmed a panic dump survives
end to end on it.

v3: https://lore.kernel.org/all/20260915064254.1594808-1-tillo@tillo.ch/
v2: https://lore.kernel.org/all/20260528123645.2650085-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528092807.1936177-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..75f5940 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -66,6 +66,19 @@
 		regulator-always-on;
 	};
 
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
+
 	/* SFP1 cage (WAN) */
 	sfp1: sfp1 {
 		compatible = "sff,sfp";
-- 
2.47.3



