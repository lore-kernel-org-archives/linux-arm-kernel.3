Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F09606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XdVM6Zj8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sxe6zxs2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ulo7n1omNefbM1CK/nDYuujYSj3ZIL41KL6TNMScnsQ=; b=XdVM6Zj82mY+vvljC8i6bmUZt7
	tVl2UO22ODNNic9Ca8UDzbSIoA1GC9ValaJJfbajv/QhW+tSRNgvj0wmKzzRhL/PSsTpEwZhdNEza
	gUvNnYUA+hqM9TmalRDjV3zUmv0Kuqqe257IO8K/wqtJlZal1XbWBn+7F/3XX1hykeWMjrlTSHTSi
	cKHNNZ7O8k7rGU/82Sm3t0151G3cGPjQON2tORSl35IDPKRzaeTJeLqpP+m57erJmKYNz0xYy8IVc
	wdNMAU0DGmqCoztPEChwCPejMN1gqCGA0W717f5BSAwCZwMp7U2aAujo1P+1YllR6KjREAlqqJdbz
	fxUxauSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc9-0000000ExQr-0QDM;
	Sun, 01 Nov 2026 22:01:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdc8-0000000ExON-0Sr5;
	Sun, 01 Nov 2026 22:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CE7D601F9;
	Sun,  1 Nov 2026 22:01:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570479;
	b=xXEevNybKcVbSj6MZSHaGW6XvgOCFu1ULhj7pLoy2QmcZyyGemThxCJQFxhlbktmBFmK
	 dQGu6Rc9wj301bn+2cp3m1s7o4GuEI7CDo4ePqYHpI1M6/dE2Jxj0DSRJ8Wugr/rTbjl3
	 9IQkvP8oo7Nc2TwndKATQt8MX1SwKCKDnc0cx5eu543E5TpavD5zjkD/s29NhE8qed9js
	 3lqBLe1proYAbkLyYcv+DnAv60ErPA0xHtF/SYGsGV5KkO8vZ9qiyg5aiUR1NX4zWY4mZ
	 2wdRMEemZKXrns98gC3upqUR0zeepVuxDjqNoKa3+LKVOXpzV7ckXDMoTA2zk5Avbwg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570479;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ulo7n1omNefbM1CK/nDYuujYSj3ZIL41KL6TNMScnsQ=;
	b=dB9p5sgMgzS+wpIzZPIOXgbZLEcIAbRQjyutsIR2/xlWdAFMrR+VI+IwSG9+PbWdhfb0
	 voHA+27/PbWRSTF1qcfowv10uTld8Cc7iMyFjIHIRBMFEdsOumSDVulVGQU45kO2CPWUq
	 /f8c3romaEeN/29ldM8cAdqnlAqHLv/lVoN/jCRh6vRBTxIqYbwdec2hx1AN98lw0FK/2
	 RMzjLLFawyJKrRiW0l+LrfWxNS1RocyqjzTYlH0HQCTxdMWdUorNCUSLjy4PDIYRWYqwA
	 AisWKybNWTmhyC/8OHDuQai9KiXHnn74+c0kK504gjV7dfALU8CICx1yPVShCE23zkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AB101F00A02;
	Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570479;
	bh=Ulo7n1omNefbM1CK/nDYuujYSj3ZIL41KL6TNMScnsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Sxe6zxs21sqm+/7r7eEJkS6jVkiVIspVh/H5UzcIH/tdW6flUrI8AOu9BTzDrWR45
	 VCO4LZ4HPr4pS84ZjvUXRkKi03r4h/QHKqev8XH2/JkLqYtj2i8NrcZycoNPrfiuuo
	 9JzmIwbM0OUewxcp8UhS9n4gFB8AyUcfOHO4C3csCi9t5iO5SseMmFeYQ283JFidIN
	 HHR9XwNrHrDX37OSe7Q4a4W54Vnb41tYLdrOjMxpEFqaHTdrOBSzl8xv713jzKR9ZJ
	 82QomfTy237WzVuF3MHGtE3qOjIW7wmuc+wMJwq266INenEHqBTbs+D2nB1fT4/gPG
	 c/nSVoAYWFkKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1D604462B4;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:00:54 +0100
Subject: [PATCH 3/3] arm64: dts: rockchip: add support for NanoPi M6 board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-nanopi-m6v2-v1-3-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
In-Reply-To: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=3626;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=260hii/GH2tEPdeW43MCVdatF4DRD18H7tiMSoy6AFE=;
 b=CtLK83F15OJHnfsgFTbpf217tBe7dqJUdICO8o27nac58lTe6BHxs8PMXs9sfT5BlIUYqltFm
 ci2JD6Nh9xcAzlhpY4a1MxJaRf1f051F4srQulmwDbzBev2iLw9wBg1
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joachim Eastwood <joachim.eastwood@gmail.com>

The NanoPi M6V2 board is an updated version of the original M6 board
with the following changes.
* New audio CODEC (Everest ES8389)
* New Ethernet PHY (MotorComm YT8531C)
* 1 extra user button
* Misc connector changes on the board

The codec_es_3v3 regulator enable pin is hardwired to the 5V input rail.

See link below for detailed information:
https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |  1 +
 .../boot/dts/rockchip/rk3588s-nanopi-m6v2.dts      | 90 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 442d322a20cf7..46aa42d4c854b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -238,6 +238,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-lubancat-4.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6v2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
new file mode 100644
index 0000000000000..2ac00f2de6844
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6v2.dts
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-nanopi-m6.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi M6V2";
+	compatible = "friendlyarm,nanopi-m6v2", "rockchip,rk3588s";
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rk3588s-es8389";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_det>;
+		hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+
+		dais = <&i2s0_8ch_p0>;
+		routing =
+			"Headphones", "HPOL",
+			"Headphones", "HPOR",
+			"INPUT1", "Microphone Jack",
+			"INPUT2", "Microphone Jack";
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Microphone Jack";
+	};
+
+	codec_es_3v3: regulator-codec-es-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "codec_es_3v3";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_btn>;
+
+		user-button {
+			label = "User";
+			linux,code = <BTN_1>;
+			gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+			debounce-interval = <50>;
+		};
+	};
+};
+
+&i2c7 {
+	audio-codec@10 {
+		compatible = "everest,es8389";
+		reg = <0x10>;
+		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S1_8CH_MCLKOUT>;
+		clock-names = "mclk";
+		vddd-supply = <&vcc_1v8_s3>;
+		vdda-supply = <&codec_es_3v3>;
+		#sound-dai-cells = <0>;
+
+		port {
+			es8389_p0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8389_p0>;
+		};
+	};
+};
+
+&pinctrl {
+	buttons {
+		user_btn: user-btn {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};

-- 
2.56.0



