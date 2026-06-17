Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EE7CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRA+s2/3T2bwiN3zie27aN3X0MFfzaIzUrLfvpVvvRY=; b=YlkD26vhDAbIIAaYMA6vBT28as
	iO2Z6y8m7Ygg9LZm9/Axi1lHGtpoT965hmgqqijvVShbLFkrnHTr6StN+CL6EwWBSkXB0tPSdTSin
	2WwtEW9u817qZNjyNMaCYsauRAqAIlqgqTDZoGhWh0V5tjGlv8EZPq6CGUFFE3tTaDj841Rm04GbW
	ocsIXun2lppEXMIzruuiG2tt9r7cNubTmqDo5V4Dbq2+DQIQct5vyHXHkFZyNZoL4nHtiZ/9d4KDr
	/vgiudimkgu/FnPkRW0FLxckILO+zpc8SNeaOhs3g1V8NO8uUGuj/rgf9/KYT375EZKiZ/hEugVeL
	38sF+YWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSH-0000000HQMK-2gKk;
	Wed, 17 Jun 2026 13:37:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZqSG-0000000HQLG-1P09;
	Wed, 17 Jun 2026 13:37:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA628445C3;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDDCAC4AF16;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781703439;
	bh=glvYwgFlMorddfw4uLmdJXSdkoYcHUq+2F+K+ayE2Dk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PWofZshT6y6Lglo7k6HZULDwGrm41ddFCZLs2nBRjyoOWM4NaFPJcwFi0CLwakNIr
	 D0Ify7hRkAIdBDUWYgLx/0U6vUScG1QWBMAZwMrV3Ok5GYqndHVgKZ0QHis5FndeVL
	 Ed5yXrWFy3xibuWnt7CA5O/cReH3V5YVK+4fo5wKjSqRrAMTUz7rRsAnjVlEWbKkcn
	 BHo11rqJrxusGyHraZ0YMW5RuGLELYcoqjNYRjAmsBIa+4cQDqE/BAFz0Jo1U6xYJg
	 SgOqBd5wXBKSwBaSvvM0cnD3bcN+CdepIITR7P8b0nQb3cdPNVjCVo0KpVzPTrK2Ql
	 qG4TrSpksv9ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68ACCD98E2;
	Wed, 17 Jun 2026 13:37:19 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh1.proton.me@kernel.org>
Date: Wed, 17 Jun 2026 22:37:03 +0900
Subject: [PATCH v2 5/5] ARM: dts: mediatek: Add basic support for Amazon
 ford board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-mt8127-amazon-ford-basic-v2-5-6859e29e72a8@proton.me>
References: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
In-Reply-To: <20260617-mt8127-amazon-ford-basic-v2-0-6859e29e72a8@proton.me>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Zakariya Hadrami <zkh1@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781703437; l=1963;
 i=zkh1@proton.me; s=20260616; h=from:subject:message-id;
 bh=ER3ARswagh7xs80gDU1m6FCsuRFGAreidBmq7cULkdo=;
 b=knrHaSV8cyIhI6j/4ugY3/Y9fieSarHylXmpVc6ygFKsdiQ4KwXfanhfpgRV+kpn/hdia5xyq
 bDT9Q0r/3dMCGrvC55esWdqeKnD0voKHhtsnqGuX5IGgc9T8EevY/vS
X-Developer-Key: i=zkh1@proton.me; a=ed25519;
 pk=9DiJwhINAERP95fbFofXSP77GEnvfO/rMIRRRFDhaoc=
X-Endpoint-Received: by B4 Relay for zkh1@proton.me/20260616 with
 auth_id=824
X-Original-From: Zakariya Hadrami <zkh1@proton.me>
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
Reply-To: zkh1@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh1@proton.me>

This tablet uses a MediaTek MT8127 system-on-chip with 1GB of RAM.
It can currently boot into initramfs with a working UART and
Simple Framebuffer using already initialized panel by the bootloader.

Signed-off-by: Zakariya Hadrami <zkh1@proton.me>
---
 arch/arm/boot/dts/mediatek/Makefile               |  1 +
 arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts | 46 +++++++++++++++++++++++
 2 files changed, 47 insertions(+)

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
index 000000000000..21bdab0e43f8
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt8127-amazon-ford.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+#include "mt8127.dtsi"
+
+/ {
+	model = "MediaTek MT8127 Amazon Ford";
+	compatible = "amazon,ford", "mediatek,mt8127";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
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



