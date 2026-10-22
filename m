Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A67606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 05:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EUpmGjWD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XRMVn8Nk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=; b=EUpmGjWDDZks6HNdnESWsyPAr8
	cirjfujYn1TRyNVV0bgjv10wPK5S9cxAinywPCPmBYi6fI8munXvHmnX5l67JKOn+fjjRq562GJra
	tsOvLyqVrh3beMFj6jl+XgM7MOs82rMh+BRV9QoUNLQJwA11EPz0e0bdLLB/G0XWoFN0XOT+Lc62e
	ugTmw7cBqiBwSqfF165azYvfE4FGCIgyN2EwL9VfNP4zar8VNtsHg4dy6pxC0rkxZQWGDflf8AUnt
	z+/Ag/ULb9v6rma3PZpzfjBTN3r52UhHGd2TutoRD6kctQ+cmb00Oy8jSI3u8mtnVcBAI6tHJmiWu
	qE69o4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJliv-0000000DQLD-3qGy;
	Thu, 22 Oct 2026 05:52:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlir-0000000DQJU-1bp4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 05:52:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so1187145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648336; x=1793253136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=XRMVn8NkotQc2dcdlreIjycn1t6KTtGJxsDdLl+NQq9yDdEJDsXux2T7YOQ4nv7hxo
         H9//z1td3a4wvhQhfyspUUKEjCIQIOFGjiEkIoN0uf4MaQnu8QTynBZrDooKbkIzKbCd
         ohWcGU3amfsTHhXlVi14uAWzhUx9W9bz3WtdyfosdTcWKrQeozfDUb42c/JYdKFJV43A
         6mf8nKZfMjHuchrYUPKdYgcHitGBS5mridtxJ+lix9/esPSt2Q16oToM8qjW9FSIC+F+
         AMqCMnJN1v9LCzVBTi7SFYlxt/rdgS0kIkidYrQo3H9HbS70aX46eBo1BZIGjQ1VoM2s
         XXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648336; x=1793253136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=fbRSgAMe3jHCmbfkrKbJ5cjwl5zyXh7NEEMq4xXHvWIR42IQEqqciVCOhc8tCc+SPF
         6XUJhWyubEHF2XZDP8No8wYfPVypknWwVGQddvOTCSBbNxe2/s3K+HoAznbYv1i4Kc/K
         os8hgJ1Gl53cxIpyYIjEdqRiACJzyTZ0zl/n03662cBg2UdUr6V06IQklVYpETD7mVPa
         qWnakeUCK573eLvbbTUby6OrwzMpivMkytBiHhQYPHXYM1otOG3rKzChWxoUEeZLPeVY
         b0PWVPtBmGT7lkeuVQxYi2pmloeOWJJR5ND4mv3u/EwdwcJp1BMSd82HtIXZcTPoBevm
         0uGw==
X-Forwarded-Encrypted: i=1; AKwUvByim+cZWEEEucYR8ViBOrs5JLov3i3u35TsqFhRDokPcqlscOP7ve5Xh/waahlvnwoKl1aSaJuMBdgScaeeYl7t@lists.infradead.org
X-Gm-Message-State: AFq9FYKKWMIPPp3z4HXZjubAejeodqjiRcGxIzaymEKZ3uC0lipGYvkS
	7KxqniCiHosBzieIFf0Cvnz3vvElS9N5kYETGcxlSk3yQbNYC0+YPbnj
X-Gm-Gg: AYBFou0D4Xf44mFspQAOeJqs1nOGji8GzKQRCAexANv9Wihir7q9fWi1ozLJE3o+sD7
	1A+8+I1dZoeh58gUXOiLXnwze5eGKW+3L8Zbo3dt5AsHnjeaKJt79mWTFSyweu7QfBl0zygrCIN
	2v0bcy+1bq4Bre+bJ05f6O0JodZNPGfq2x+n3SXenyZTrtPEtQPaGbLn6jGySd2Z1CULUFCeYyC
	ChAy1upEtZjfdbSE6FHl+9cOSLEAX+C3gij2RaCYSFYrvSt0w3GzTEZWFXJXGnyHmE0PF5OyaoO
	Unxj2fn7BbUGdYERxhwKg1CV1PTHy0mv8a0a61yVVGmAyf/sLEHMlDuxQKQiUrlN+btYRghvM+O
	md2UgT22vFVVkXgHGyny+JrmrpxWsOg2RVg37YA1s1pAgqdmC12IdnrdODCDyV0/i0mdogjscQo
	QdEsW2cB7MP57i0Jt46I0FAIHozDXPUmhIb1u2zu7+1K1OeSHaMlxD7EJaHEplfLflE+fGlZIzu
	c1Bfoh/KJ31Q2Yt2Zurktq6pElJrgGOjSA1SA5Rc8DOvPQBj7psyHFFMzCOU0QCpc9UyM5Rb5om
	IHJDiDNaTtj27uhDQzoqz9++46kbyB22m+ZI6/kRlTWYw/iGTonqvrXcCoa6TTfIN/hUACtYKWI
	4TLSNDxpR4fdFBOA2vGvKWl+OMiQf1PVdf7GXVWitaJC0vBrRe+b7VNofr02YnEbXokrePhnohn
	K7/wI7
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr25966005e9.11.1792648335601;
        Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:08 +0200
Message-ID: <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_225217_466939_D39EE997 
X-CRM114-Status: GOOD (  24.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add a device tree for the board that includes the ODROID-U3 one and
describes only these differences, as the ODROID-X2 does with the
ODROID-X, and update the comments in the common dtsi, as the LDO22 and
BUCK8 constraints are now also used by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..bc14df9be9f7
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC. The board is the predecessor of the
+ * ODROID-U3, so only the differences from it are described here.
+ */
+
+#include "exynos4412-odroidu3.dts"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+};
+
+/* No VBUS supply switch on the micro-USB port */
+/delete-node/ &vbus_otg_reg;
+
+&hsotg {
+	dr_mode = "peripheral";
+	/delete-property/ vbus-supply;
+};
+
+&sound {
+	model = "Odroid-U2";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)


