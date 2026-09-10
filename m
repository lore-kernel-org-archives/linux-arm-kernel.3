Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA21C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTPH6qWe594p9gs6pEEJP8z1idhrLKnyX6qfHun7fqM=; b=MQDGDKqQVNbwdIxZrbf13zIUay
	yBpKFX5Uk5gHCl6Jq+xd1wC3eSsH8+39Q/dxLAi967fl6v6Fd9B1GqDpymmrKFfNfwEjcZYyfGseV
	e3AcczuZ0OK5DDb8z3VX+hmb7qMJFFRwj1aug5gwYPOax5vFzONWny62Ny8+UFT31ttf9I4WWJCqa
	KdZzmDD7Gz9mUrIx0H+RjZKQLXR3HS9IhaHAepsZMb5xaoD3o/gS+/DvKkxSJRXXnjqcdO3f+U/TM
	pIteeOd8hNWLIQJddXVNVNPGQROKF1URtI8ZPar7d3zGwZX5NL80upREnqQuytfy3JncSfo9LG9cq
	F7hB7rJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erI-0000000ET3y-02tV;
	Thu, 10 Sep 2026 13:30:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4erC-0000000ET09-28La;
	Thu, 10 Sep 2026 13:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE97C447B8;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 927C6C2BCFA;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789047025;
	bh=Xln+3KgYAhViUK6FrJlzb7tWSxGhjzGMjzeQxcxn7yw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=W+Ol8hOhhuvQ6UiPosVefOjLDMPXo02Njz0JOKz9LX810vCoXcGlTctOGjOAL+WF8
	 ga0834qK8NEgGSqpuv8PCT6sijpjPYShBdTUJfpmbcW3R/YQziIrqqIUD7ivrX03Z8
	 DuF9F+I4Sp6QkKqFtyXetr32+MRgKuTTnUlMfgHCRDXBLrA5cOZ60er3SqQhVfl7Bs
	 1SwMbWztKBNZRcO08jCDpEXWpMcVqx6M2ss4bfTUG6jX85jCH14VaY3ZnU57qYTmhD
	 DRQFhhoQBvy5CdaoYkW6/fVAZYVWLoye2NiWxLyQE08dJi/WW5c2W5ranA6ozE6sdq
	 pjUzu0OqDjmIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E326C88E45;
	Thu, 10 Sep 2026 13:30:25 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Thu, 10 Sep 2026 15:29:15 +0200
Subject: [PATCH v5 4/4] ARM: dts: mediatek: Add basic support for Amazon
 ford board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-mt8127-amazon-ford-basic-v5-4-3cb9eeaffd5c@mailbox.org>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789047024; l=2198;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=DKMWzeIWrDdE5NxRFxhkopW7K+NuB7yjRCdlYC4XOK8=;
 b=vJS8OzFINpJOzA+dvIdsjqg2jAzrd/LlslT+hjVdFBKY17l7Mpm3LMA+KfGvey69miiTyqSl/
 fWmKfqr+KAUAozAz6KDR9PKFrNt/LVlLRgX3+fVnTNbylEDo8Nvfi64
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

This tablet uses a MediaTek MT8127 system-on-chip with 1GB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
 arch/arm/boot/dts/mediatek/Makefile               |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts | 54 +++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index 37c4cded0eae..a610bc75c7d9 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -14,5 +14,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt7623n-rfb-emmc.dtb \
 	mt7623n-bananapi-bpi-r2.dtb \
 	mt7629-rfb.dtb \
+	mt8127-amazon-ford.dtb \
 	mt8127-moose.dtb \
 	mt8135-evbp1.dtb
diff --git a/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
new file mode 100644
index 000000000000..4b138e832795
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+#include "mt8127.dtsi"
+
+/ {
+	model = "Amazon Fire 7 2015 (Ford)";
+	compatible = "amazon,ford", "mediatek,mt8127";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		stdout-path = "serial0:921600n8";
+
+		framebuffer0: framebuffer@b7a00000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <1024>;
+			height = <600>;
+			stride = <(1024 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0 0x80000000 0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer_reserved: framebuffer@b7a00000 {
+			reg = <0 0xb7a00000 0 0x1000000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};

-- 
2.54.0



