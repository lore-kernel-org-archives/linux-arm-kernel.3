Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F82CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6cVNg0nrPutBXFaolcSF3OSNXWK0cUF98DgE0Qie5k=; b=mBio5BQ6SZMxxxPDNbzletsKyz
	3m/ZV/O3MZ3ux92chcz4YWx/gmji5yn6Ph6I5w7+6oAfp3LKGAwQpIrYJCVIdt9VCJ2o7+dQt3rZt
	zvd5cL1EoAESdMyKXY3N/UBeqSMkFgVNOrAMNXJ2fioTqKNAlsFblr4DHpBvXYsxs8aCVrH0MORzV
	p9C4sZuWmSmSKpgloQsh0wHwtrVcXJowo8VxvBO49P42gu1BdqSRkilZShaKyizTrydOYV7kz2K1I
	MTr42PXyBzIAJEKG9v6ZgCL5hojvRrT12Pwy6mUQbqi3Lwij9HRsu21oYK6RoVQ3smVozumyKZcuV
	5r4R9CHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00P0-00000005cGs-3KrD;
	Sat, 20 Sep 2025 16:25:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00OO-00000005bg1-1U4I;
	Sat, 20 Sep 2025 16:24:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BB75244CFF;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EAA1C116D0;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758385493;
	bh=nIOQJydUgpMwH1Y2vny+oU81K/MwcYWcirq+RS+j7e0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rpznskuK9AgChkGKaCX1AMVIJOFxNkwIDslxKa3phYZ5f2KcZyBaS0XivX612+tms
	 HUaGpJgnPyR/8jNhLiQkAFTACejVBoxgHpt+0KQf2Y/m01e9jJnKXLqDt8L860OeM0
	 sKsDe643oaLzOMzZ2peI7OH5ddEWU5/3EZp903VnoDlRU8a9VyI8s03K3iga3GKaBn
	 DLaDQBPma80TqZdTzM8PYzD/c7gKNaA2dj73B9t9BpxQcLxFo3cvBLEzVzsioCNjZ1
	 HXTvZt+6g7KFWSYmPuJXE42QFR6p/N9Y4f3Gh70eMzj9vW+rXQPONNWFBMCdYAxXpw
	 ynDE6RhruyExg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9594ACAC5A8;
	Sat, 20 Sep 2025 16:24:53 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 20 Sep 2025 20:23:35 +0200
Subject: [PATCH 10/10] ARM: dts: mediatek: add basic support for Alcatel
 yarisxl board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-mt6582-v1-10-b887720f577d@protonmail.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
In-Reply-To: <20250920-mt6582-v1-0-b887720f577d@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758392693; l=2470;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=iyYcAwIUuKoaf3t5Jk0wP9oO6VHUo1cct77WwDYuJAM=;
 b=42iTG8Igz4PcR3ipNH7H+GmAzf51vDO+8qD+UElOPoElp7HJMwL0bq4MpcxPzJCGvRv2LIHbF
 2nbdRJ2sa3LBtNJhUSvcN5kR9O7qmc/NFrxPCjYJ+ya/hTKaMKjRVbh
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_092456_468299_AC9EF2C2 
X-CRM114-Status: GOOD (  13.99  )
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
Reply-To: cristian_ci@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Cristian Cozzolino <cristian_ci@protonmail.com>

This smartphone uses a MediaTek MT6582 system-on-chip with 512MB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm/boot/dts/mediatek/Makefile                |  1 +
 .../boot/dts/mediatek/mt6582-alcatel-yarisxl.dts   | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index e48de3efeb3b9ab00108cc28afa8da525d0ec14a..37c4cded0eae8cfcdc61c58fd1d986ae14c3de93 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt6572-jty-d101.dtb \
 	mt6572-lenovo-a369i.dtb \
 	mt6580-evbp1.dtb \
+	mt6582-alcatel-yarisxl.dtb \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
 	mt6589-fairphone-fp1.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts b/arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f55d8edad1acfe316ea139e76858833dcdae24fe
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6582-alcatel-yarisxl.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Cristian Cozzolino <cristian_ci@protonmail.com>
+ */
+
+/dts-v1/;
+#include "mt6582.dtsi"
+
+/ {
+	model = "Alcatel One Touch Pop C7 (OT-7041D)";
+	compatible = "alcatel,yarisxl", "mediatek,mt6582";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		stdout-path = "serial0:921600n8";
+
+		framebuffer: framebuffer@9fa00000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <480>;
+			height = <854>;
+			stride = <(480 * 4)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		connsys@9f900000 {
+			reg = <0x9f900000 0x100000>;
+			no-map;
+		};
+
+		modem@9e000000 {
+			reg = <0x9e000000 0x1800000>;
+			no-map;
+		};
+
+		framebuffer_reserved: framebuffer@9fa00000 {
+			reg = <0x9fa00000 0x600000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.49.0



