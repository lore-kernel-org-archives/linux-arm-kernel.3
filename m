Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A8FD3770
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyUU6FF2jFAcVNE31Ov3V4y/0ZiRfjVnTcbxKi2RrOM=; b=sepXA9hpUl5GYl1PW7ZZSh6M2B
	V7NBQtoisRUwpkx9o+fp9/0+j+5d59TieQsGHwjyzivIGbG/6pcUqlu5vL2M7MD2jI3Pg1Z+oaujZ
	ykOlrQurVp9bcQFFGEPMIw9JumNZ37yi+G6en4+ec9DhgFD5IaFSvPuxvjpgyBx8Exkdxjjt17EYQ
	82FKvn8XrRlohfISub04Ri5AW4Qro2xGlFlQF5oIXxRPR3IbwdiKXLe44GYcMW9O0YUAmCa1jGLZf
	8QgP/+p1JoAVPLCqB3G3Oijf4aV1Ni7pniD2ppmI4qoxPNV3PFygKppqw1OsNVsvFz9EiBILNUiri
	ztDZqtPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRK-00000004S22-1Hy0;
	Wed, 25 Feb 2026 16:08:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHRH-00000004S0T-2sgV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B13894453E;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389A8C2BC86;
	Wed, 25 Feb 2026 16:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772035718;
	bh=qwfoHVa3sWupH63/IoctrrdImGNaTAv1X9ueQgmMOqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l9N2+hL9WjFxPRqfQTBg2AlB5lzy4SE4FK5WNbQjRYETFVMVNgijeeNPyFBHZt2sd
	 PWWni/t1rMrHoRCX9cMzQBjY8XWPZno1obpzfQ84Ek+NY/AthbGhDc858/VrwZKCJv
	 cE5n8MKAPfbacUrUoUhGREfR6tqAq0tyd/V+wZ9MpM0wEnDtuUjJQWJT2jYwGVgRMP
	 I6SW+0d+VSoyRpe+0grA4PRQrR4NYHcoAG5F6GaA5BKfFhzaKO8gSuF6yQcl23yQHR
	 fnF/cGsmaq4spo6it2AcSenE9cUjQOdNb+MqFRzjDKRPAOx1eE4DnCvnOiayPfaYeJ
	 TCjYk3vfANDiA==
Received: by wens.tw (Postfix, from userid 1000)
	id B957D5FF08; Thu, 26 Feb 2026 00:08:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
Date: Thu, 26 Feb 2026 00:08:26 +0800
Message-ID: <20260225160828.1687643-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225160828.1687643-1-wens@kernel.org>
References: <20260225160828.1687643-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_080839_756749_BB016ECC 
X-CRM114-Status: GOOD (  13.13  )
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

The Avaota A1 board features 4 RGB LEDs in a string connected to the
SoC's LED controller.

Enable the LED controller and add device nodes for them. The timings
were copied from the downstream vendor DTS. The design does not specify
what these LEDs are for, nor are there any markings on the board for
them, so just use them as indicators.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 054d0357c139..7c24121de88f 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -6,6 +6,7 @@
 #include "sun55i-a523.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Avaota A1";
@@ -99,6 +100,46 @@ &gpu {
 	status = "okay";
 };
 
+&ledc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ledc_ph_pin>;
+	allwinner,pixel-format = "grb";
+	allwinner,t0l-ns = <800>;
+	allwinner,t0h-ns = <300>;
+	allwinner,t1l-ns = <320>;
+	allwinner,t1h-ns = <800>;
+	allwinner,treset-ns = <84>;
+	status = "okay";
+
+	multi-led@0 {
+		reg = <0x0>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <0>;
+	};
+
+	multi-led@1 {
+		reg = <0x1>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <1>;
+	};
+
+	multi-led@2 {
+		reg = <0x2>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <2>;
+	};
+
+	multi-led@3 {
+		reg = <0x3>;
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_INDICATOR;
+		function-enumerator = <3>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii0_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
-- 
2.47.3


