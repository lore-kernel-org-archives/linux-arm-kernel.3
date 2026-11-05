Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCFD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jnTE219O;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYzYmfgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R1g/0OOIopm5O7nEJwv3mEF3G4sRvgCEUmYgEoayvhQ=; b=jnTE219OD1GaQld7Nc5mZf4ssy
	xK+rhwh4OtbVwpBF2rCoqbdTnFOco0OPwCoeJaKTaE2UnLnAftgLNY+LcEOLmSdD+Vv+G41MrD0d2
	FwdWjOTLB39SZ3AQWvBNXr1bH1hTdqF8apH+07CuWegXo0gSovvOFP6YOJkDdx+Oq2bMLW9yrLZsV
	N/U7f/nWh3oJTH61Ih2exIsA1zjKlhQIJ8vIqxC5trf4QvgbzlueIOJJ8DcUUMXI1auclRP9umgYr
	lWEcGvRn0llvjdJoA3/r45ZXC2kDcqs9tj1q3a4xvZa4EX/obNAAYWXgDbU17Vv4C1SB/2Mn/x7EI
	eYOu9xHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySn-00000009GqA-0FP7;
	Thu, 05 Nov 2026 14:29:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOySf-00000009GjD-0Kjr;
	Thu, 05 Nov 2026 14:29:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D16F943E5E;
	Thu,  5 Nov 2026 14:29:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793888944;
	b=BIKK+k0Xj5fS2g1yOgv/9ExmkvgsdTXpJUxXNlImu2IhVV9+6e+Hm78GivrLRwIM6tr0
	 GKBKKqBiH6ba12BvGD55gHXpF1DoKv/iXq433WD6tH49D8VTG4nnlUr6eVYQZut1Fg70O
	 qgwy7kAYj+7iTU/GRxflQbnnaxN6sgU3BO8c7n88bwTW3Oq5NUs8izyKckXhlmpOfbkFE
	 IpcrXAxuUN+xXadjpfPqoEvuDAipwD1lt6onQ9bM7gUutleCMZ0DDa8VZ6rJcgGxT/7ES
	 /pFUezL+CtoUKMAfak8lf0oIX6u/XmMLL0HFDp+4/G2smuZMhrS066zIlncEKpnL/gw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793888944;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=R1g/0OOIopm5O7nEJwv3mEF3G4sRvgCEUmYgEoayvhQ=;
	b=jx9JBSczzYVKebZF/nxTyRkdHswYU7iQ0C/RhRj0u0X1KjUnDm2+yzCu0ZOHPfCja6Nq
	 dUUXO6tSDU1KEZmqq3uFB0hfz6g7ad2BKIxFyPDKOozxWAu5k86bA/fpqraY8ACzluczN
	 zUaGLasACZq1bN6/ZZ/LQtbhC8SQYOdBAAB1P8R99U/9z9FxWmjKnqRyRa68qhtCt7QKK
	 WC1sRmEM8Q22O1c9mi9dGctWwyVIl8P4FxHaIpN6bLeEX/mf5ZwREuSrma7CR8R+X7lka
	 CSWA026WCXthItpT1rhCE7JOQdvfHvAUfjvGsS2cTp1eGzXLhEsKlV3HAgLq1WNaXUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1CE51F0093A;
	Thu,  5 Nov 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888944;
	bh=R1g/0OOIopm5O7nEJwv3mEF3G4sRvgCEUmYgEoayvhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hYzYmfgyHEX5OIZOILQLSVs8HSGZ+TJSUDnAJKOaYw/nfNc/KofN73ilMBTa8JN80
	 KFIVmJ1ivPw/j79VFxm7rk7J8moLGv7hJMPKyWsSx4N9Vu7yb9uSbYO6a+QSQQUtoH
	 SpPYtICbmaozaSsBTjScvRcQ/7mui4Mg3JDMSbD3WtH6iDnOCeMyDdPVpBwm7gU2An
	 7YKqqvUrhPSTRZopgkZQgLin1QSpS+AIyGsRam1RZ0OKZSZFoMIebVI8kJmISh2LsU
	 Z+gehI1nZjO6EW5a44e1abwz/XErN+tddGWD8h0iD9lDys4XDKHwvbaNX1kGjVYwWb
	 xWXBIhHt/H1YQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 745BC472CB;
	Thu,  5 Nov 2026 14:29:02 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Thu, 05 Nov 2026 14:28:51 +0000
Subject: [PATCH v2 6/6] arm64: dts: mediatek: Add Amazon Echo Dot (2016)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-6-e68d7d428f99@protonmail.ch>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793888941; l=2808;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=lMdVcco71nADP8HucTPUNLICr3LWil3QPPZ2t6j8t8U=;
 b=1gM5kK19g/Zj6TdHjF5vtSHjr28/lrz2PngEXoa5duQ8nRBZs6j1HAPa6l1ga6YPSPu2xLHes
 51lH66yQtI3CEbWoYf+SHMFmr7OTWB8gYV398bK8egn6EvJkObV+Nwr
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: bengris32@protonmail.ch
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ben Grisdale <bengris32@protonmail.ch>

Add a device tree for the Amazon Echo Dot (2nd generation, 2016),
codenamed "biscuit", which is based on the MediaTek MT8163 SoC.

This is enough to boot to a shell over UART0. The UART pins are assumed
to be configured by the bootloader, as there is no pinctrl support yet.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt8163-amazon-biscuit.dts    | 68 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..adf02b9f234b 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -92,6 +92,7 @@ mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18-dtbs := \
 	mt7988a-bananapi-bpi-r4-pro-cn13.dtbo \
 	mt7988a-bananapi-bpi-r4-pro-cn18.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-pro-8x-sd-cn18.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8163-amazon-biscuit.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8163-amazon-biscuit.dts b/arch/arm64/boot/dts/mediatek/mt8163-amazon-biscuit.dts
new file mode 100644
index 000000000000..5fb5d59e4ed2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8163-amazon-biscuit.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) 2026 Ben Grisdale <bengris32@protonmail.ch>
+ */
+
+/dts-v1/;
+#include "mt8163.dtsi"
+
+/ {
+	model = "Amazon Echo Dot (2016)";
+	compatible = "amazon,biscuit", "mediatek,mt8163";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x20000000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		secmon@43000000 {
+			reg = <0 0x43000000 0 0x30000>;
+			no-map;
+		};
+
+		/* 16 KiB reserved for SPM firmware */
+		spm-pcm@43030000 {
+			reg = <0 0x43030000 0 0x4000>;
+			no-map;
+		};
+
+		/*
+		 * 6 MiB reserved for OP-TEE (BL32)
+		 * +-----------------------+ 0x4380_0000
+		 * |      SHMEM 2MiB       |
+		 * +-----------------------+ 0x4360_0000
+		 * |     TZDRAM 4MiB       |
+		 * +-----------------------+ 0x4320_0000
+		 */
+		optee@43200000 {
+			reg = <0 0x43200000 0 0x600000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.56.0



