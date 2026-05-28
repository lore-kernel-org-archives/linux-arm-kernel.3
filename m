Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6555CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itbZjZRKXln7cACQXBgUCNHsIa9fw9ikb73wmLlO620=; b=w8IBaOHjCr/RUr/mmslKYIQgKL
	nWFv6X0TEV4PT2Q6NXgSelu4Kts7XOjGurhse/1j4U5DBeBys8EOasjAhkLDGZhqMJ9Vj1hiVeTf7
	CDg6NpjlmMGRdH3FOaVkNsQMMGAAU5w5PCiNExabvmFtUZP0Uxqrp22haL1iV6GLndWl1fGIjLNTD
	kMqKyrlne4+0QjU68TGjPnVmUVjQAefHtqpWiX6GTDjKLSjQ6mh/VdDaxben6XGbIPMgzJO7g74Pv
	GRGOzYPLglT0PfvrBwVr+8AlTRkHuJdX+3RuZt84QZXEJrJYn3RrOR6cQWiqsXF9gYvZ1Dk64bT4B
	F/ubBKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZys-00000005isw-3ux1;
	Thu, 28 May 2026 12:36:58 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZyp-00000005is8-2xX1;
	Thu, 28 May 2026 12:36:57 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779971807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itbZjZRKXln7cACQXBgUCNHsIa9fw9ikb73wmLlO620=;
	b=NN56Us8xnHzAZPWEEB/c/QPp1KHoU3luSk5dCZ+iiqunpn/TpiUTsfAE5v1EIQms8o0wMD
	pw0lZSGg/XthICwelE03poHumGQwxloDRYiYngQjAOYFoMofQi0n6DJQrpIWJeB6ynsJOq
	k71jLbq4daNyr5oiqetbO8FXk4lB04wdAIwSchH+jjFJI692Y3xMGcj4gLjJjLuF4Hp0lY
	M7XOf1QCVkmYkRXSU0Njt2XiLb5wqSdLl9KvGv14yLlkJhT0SLjEf8NYf2zXlVl1twFE5+
	Zrxajb2B2oYCuhCBu2N492Saw1AeIdsweTEYTuI64L4TpNvonqqSDwB0oxvvWA==
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
Subject: [PATCH v2] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Thu, 28 May 2026 14:36:44 +0200
Message-ID: <20260528123645.2650085-1-tillo@tillo.ch>
In-Reply-To: <20260528093038.1945245-1-tillo@tillo.ch>
References: <20260528093038.1945245-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_053656_107804_E1A6C863 
X-CRM114-Status: GOOD (  13.47  )
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
Changes in v2:
 - Add no-map; to keep the carve-out out of the kernel linear map and
   avoid the cacheable/write-combine attribute mismatch on arm64.
   (sashiko-bot, gemini-3.1-pro)
 - Rewrite the ECC paragraph in the commit log: ramoops carves ecc-size
   from each zone's own allocation in persistent_ram_new() and the
   post-console remainder is split into record-size'd kmsg records, not
   one record plus a separate ECC pool. (sashiko-bot, gemini-3.1-pro)

v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..f7d4944 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -80,6 +80,19 @@ sfp1: sfp1 {
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

