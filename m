Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C7D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 20:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQ2hrIoF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JeFiiXRx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=; b=nQ2hrIoF6Q1fj/
	j5tUaBBcsmgS0pm4w/6mOSrrf3m7SypedcVYNVJwWTHYYWrATKAY5utfkj7SD6oSIVAZbPyaFH7Vy
	IQO5sThd+NUe9kIjRZI90mSiYELaMCgB6eNquwAqIxcD4Xd/JXTuJXf+HlEuqBddS4P2Ct5lV+m0A
	nQaYENw/mOfHKbJoWKRCpdmpPXMg0VrlRu00hnzRTTetItNy7b+g796J/OMAaMivtOLtDKymcz4/p
	Ylhv24Q6o7P8jfgubOb/2c7z/6fjy9lclNyac7Nmm/ctprAcybivzzG/q0Qpp2EijJ04COeX1VvhE
	/PAskNxCZjSifCWUPYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRWG-00000003ENl-0c3l;
	Mon, 26 Oct 2026 20:42:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLRW4-00000003EJw-0F6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 20:42:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2997227f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047318; x=1793652118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=JeFiiXRxdLh2Ii/HpLdAqhJh3iNLi05Wwqd0ED6p1Q8GskmuSTMPe30VuCp1Vdm9g9
         +RjAnIrbBDmyZsHcVtL5s9I1KZxo6B6mrs33kl8ldhfA7woQzGzBMGFxFVg9ktSMbb5J
         XWMqYqVYvH43qly0Dcu4Nk6V32Mmc0SEyHBMenlcEnzEeYGWyqJyO2rEhMBQwcgUS3lQ
         Ndz2stLalAwsaAmHDp946/fPMYA2k1xfH/9NgBFteuP6ntfpRMmZPFvnhy2J9kJpHuzK
         iSS8bifORWZ0svSKV7gdcCxxfoU4YxunRyWPCIKeiBbhl9/0WkKo56wgRphLDLdnCKmm
         QrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047318; x=1793652118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=RWojis5ppabwUhTv9sAMMHQn799MXzkVbsDCMqTV+r/tBIZwegzFxtuvjIW3R5KEvn
         b0IjL+SaXAzx3m/g1cllRPDhwu3X4dkq6S81lWGM4rHGdp36h2oI8EUrsRuJ2uv9kCyS
         TRE/eZhTlMmWU/UxJITZudDuWLyML1SlV51/NWB4cg//zsgfIQYhO72B9fJ6yeDCWb6B
         ZyWDlSmTbrxj3STCfAL85HxF3SzUYwi0XbTgBQg/GoQhv9Uq4C0jUFNi143wExOMPrkS
         F316VhIlLVYPCLx1o/vz3fFiIqJHWDQphcF/Amk0f4vg9ffYHs8WbpXaOtAq3C/ODvLg
         zv7g==
X-Forwarded-Encrypted: i=1; AKwUvBzRLEbZogACEyodLRTzgJ+dohr00PxAHqeBxzRk1bqbSjLAEDLLNwoj2yW5q2niBcqgfS6pZlkOCRiwc8E8CpY+@lists.infradead.org
X-Gm-Message-State: AFq9FYJcTM4kLBCI4KXvFILWrea0l7812OS3Pid6G3E9t8XUy+uo0jJ4
	hEpdOcK26llzvzW+Co9Qy0ffCfFcKNh2dP25kKxqF5cB78EZ+7Ise+6U
X-Gm-Gg: AYBFou3f7Nl9kvLFdXw8RSxPG43Q9JJMrC9EiQUz9fszcBrANnF9Bhak4+apGmXTo6d
	UuoXWVk75hnG4/4Ijov7Gtkfei4VKWcGJD+iM4wBQREsO8pFeJkadZ3bw5sAgqWTvxeU2lr61Sl
	QUIBTWGVScKy4Ze04SQdkcuwg359fDsoq6sH2f92rsCOL1AWRIcTN85YBJUKzoX2bilRPvTr6G5
	9h4WuCtcpxczznz1qzm1Pj6B3tbz3W09EKzSq0MpVH67tGHIoHdEIUuPcdsMc/bf2V/IjJOF6B0
	MPS20Nx1gWeXkJ5MgFHiHqHjSpwDP4mJh5xbfGJjSM1oGazLd4zMC3rvGCH/xlLxiRuR0cX477M
	vpoB6hJkr2drjtGwFHFTTNKI99fWFiNYp5Uw0gT1ql9r40AHYThQDY4TaoAJRio6puIZoSAxtWq
	/zLP8VTfrIHabLXvd/hkWYaf0aIlrPcR9X8mwr118Q1aDw+Xi6Il7JhGd6gUxqMTG3dpAmDCKHt
	65PDXlj+ZGL5WgIN4K4ZIhLh7ztFvnEgLZesZDL8NShQtQp3ygZldMfvgK1NwzBwfaHRradCyG0
	yb2g6H7W2sekhJHrBpBXNwAOiXAgfenozc84SLNf24vOMlQXOE0NlQ8YRsaoj9MWIMToKcZxgal
	hfGle6Fvop+uDdPga80rp+mONnd8EQW+Gr/q5vl9YNYbA91PR0c7Esr25YZ8aG25ddcZnu+S2Py
	Yxh18K
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr12409485f8f.37.1793047318143;
        Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
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
Subject: [PATCH v3 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:54 +0100
Message-ID: <20261026204154.26378-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_134200_129623_CAB91ABE 
X-CRM114-Status: GOOD (  24.60  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 3 deletions(-)
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
index 000000000000..8a18e65de30c
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,41 @@
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
+	samsung,audio-widgets = "Headphone", "Headphone Jack",
+				"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)


