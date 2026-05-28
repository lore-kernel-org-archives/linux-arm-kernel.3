Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32276CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBWMq60AwDT71lXHyf/bfDDbjfiWdp2HdqQcnoI9g+Y=; b=eZSZII3Zj46Zzu6bAo7bhlxH5o
	+jeuVL07LISpBhOlfsuhEqUraPfnENu4yg63Usutrf8LWYyXe8dQx4bO/uMALA4JRTpQccMGTYm0j
	OZp9gKy/rGJWqbS0ABJSXra/yPl80D5HBBwey2vLWfBr+/QjjAlih1osiE/OgaAgK7JS9VkUkC+sO
	snfu5jI35MnqsBDg2mvW3cuW0V8Lh/FluuqI9HHQkgfCQP4vtsggQUpC22jUhN0Z1RKriO/dgyyOC
	RKIKc08ATX3SwLnYEqWMJ3ufxG6o6r7bVasVizwRvxRyjyEKDHWYLy7tDXeGT90l8nMfYrYw2X0AV
	hL5EY8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX3K-00000005VTc-3cyV;
	Thu, 28 May 2026 09:29:22 +0000
Received: from mail.mdapi.ch ([31.3.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX3H-00000005VSC-39Rt;
	Thu, 28 May 2026 09:29:21 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1779960544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RBWMq60AwDT71lXHyf/bfDDbjfiWdp2HdqQcnoI9g+Y=;
	b=DVKDwUocZsY6DVhSdwB4+1tZrA5DhMQjw2FZ4v28MoYEf6DUk94N7Yi+DFHdsbkrHDNv2g
	p8b6dCOeGhVpMgxWmhwdknvwCxnUX3Lr++DQFSdKuruevu6hSH6mp8rngFO9sSs0BxpYAv
	OUB62kO4EbOLngcXnBTbTqexJgSKRoDK9d6xlv8WztYHovWhwE27GCu8umJskJFEaDCYy8
	tlBMmKoo4cOEsQWwNI0CNcwjGsRVvNBSn+9AzPbemdRqst5Mqgs1CWBUExuFz/heRKbAjV
	FmxJAD8Z0DB9UaYAR8ZZv7nv/jhtUcIWtxjeXWygQYlXwLvIGxH5i+MZqKvD7g==
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
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bananapi-bpi-r4: add ramoops region
Date: Thu, 28 May 2026 11:28:07 +0200
Message-ID: <20260528092807.1936177-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_022920_131306_AAA69EE1 
X-CRM114-Status: UNSURE (   9.58  )
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

Reserve 1 MiB of RAM just below the ARM Trusted Firmware secmon region
(0x42f00000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
reboot. Without it, kernel crash logs on this board are lost when the SoC
warm-resets and the on-chip console buffer is reinitialised.

The record sizes (128 KiB kmsg records, 256 KiB rolling console, 64 KiB
ftrace, 64 KiB pmsg) sum to 512 KiB; the remainder of the 1 MiB carve-out
is used for the ECC parity blocks (ecc-size=16, one Reed-Solomon block per
record) which significantly improves dump readability when the panic path
truncates writes mid-record.

The carve-out sits immediately below the ATF region already declared at
0x43000000 in mt7988a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R4 ships with at least 4 GiB of DRAM starting at 0x40000000,
so the region is well within installed memory on every variant.

For the carve-out to actually preserve content across a reset, the boot
loader must also avoid touching this region on warm reset; on standard
BPI-R4 boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
index 0ff69da..f7d4944 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
@@ -80,6 +80,18 @@ sfp1: sfp1 {
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42f00000 {
+		compatible = "ramoops";
+		reg = <0 0x42f00000 0 0x100000>;
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


