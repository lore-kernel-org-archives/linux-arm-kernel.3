Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B21606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4grwfCR5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkpRrorW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=; b=4grwfCR5SDOD0LDkh775fJwqRr
	lnR/YISJ+czaz0LT69BIL5UE651WqzMwP7mjaFdKoG6WiBdnsl5vxgXYdqcdrE7Zzq04wFE2DeZba
	e49Xr35bnms6kpLA0GmbpW3djv34y3gbkHecZIetOxYN10FBI7zvXqKm+n9d5tFlornv4qsuZGTOK
	KaJWz4cWBARsLo8cTvh/ZrIXJxePwCVFa9wMKOHKj9MMVykkdhmMW379ijA8WqhFzYB7UOFuVgLNW
	NzmlumQ941tdHnY/VmlPXIERjhjLhXzzGlU+dYN3n9HkHXdMTocrXJxloWVl8AOV+FSDEU/6L2+rY
	bDvEBK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHgB-00000003D0R-0UMY;
	Tue, 03 Nov 2026 16:48:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHg3-00000003Cyh-2F1J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:48:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so35784085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793724480; x=1794329280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=NkpRrorWl6WxFx7tRiYB7fZKMwKxF5XqZ8p6swpZHwMkZnjDrNC+d4+VUEKa/cMFlQ
         OqBWjst1RnPpIPyh/ipcyujJGN6DDPoSWvHq5F/Pq5guL/MdpfN4IQmKPMAnXF5S6nQJ
         5bGUESwKAi6MFOyxMMn457roczbucVbAdecHBap3SUdsgm7IFB16sqk/leD+vovHrm4R
         zq/BS8cXwKOGSyWeOfDRBgHanNKdx1PUEDl61UaTnFEPmLRb0WEa+E0+esEJc5X2kbtn
         AyRbcKSjKBkl5sVSQYpwFMbnSAlG/Lc82yNCGpFcQDpvPGJMGoviX7PcjOtWQR23e8To
         THsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724480; x=1794329280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHqxRU3I3QAylUw75qoIBcYNwXHNjO4FsY2C/ZCxGk=;
        b=CKPatjDngrgN1npmLcNozPl8rJFrfJMrZPEasYN1FA0/Xoz1K4ANhYeK2yKunYUrUN
         sFCCQx9iNhKI6i/PIOqqnwBXAAFQfSVRFLZdJmCns7n7Q+3hPYwr76i+dwBOdxNTiuUl
         1oGJBz14nNW0jz8d5EgGotERZCi9AisCf9S0icTtNdfp01UqwAI3oxRHGGrJyacMD9Oj
         0aehPjt5UI2Tq6xNa0iRLS6IFW+OQcdVuTwqvgbb14UkLmCItBxnqsWDY/z66pSx+M+r
         GqI4JKRgpVkpXbXYP/bUgNaB1C18wA5onedsxOiy3USelkMerCNctetnJrGnaM8U6QH6
         xk9A==
X-Forwarded-Encrypted: i=1; AKwUvBz3ye+2Z0cO5IRWpwJVdNx+T3sTSUFWlOl12JNkpgkU11QLmct6//K7lxRJ7Xf5/WcmACpWYkXCa4zqgO9Qk8w5@lists.infradead.org
X-Gm-Message-State: APuU4Z8eVxDlWF7U9TJPGCCSdPo+Q4J3LYo3SrbMC0HTOIP8RUuuV6K8
	+3K8jVaFhRT++woPzJqCkc1Wf/Bg8ruHbNx/Uyaw0wqe4xpUyWDuiyHH
X-Gm-Gg: AYBFou3JDoqaOCG4pmLVxBCjylgOlPwuz13V4XXto9EERE29++y3mprGdWCTvNfApBj
	2j8JRkzpWy8/0rsQgUcdPYI/IMIHo5ZB6RPZiPHu/k2mWdii2/IjKCWD49/ahUYg3pSkAh2Ap0L
	4H2IDRZssknlAAnIosTAn1s0wRDP7vr/oNyltn82L9DTDk9wUxdPM4r/KgxnSYfiHjsYM1WpW34
	Po87xLNvyrfLvmmEmHIiRmXsC+t+XF/nWWHrm9K9axTKqAFQGM0l2slwsjpmDmXhdpQJ8v7WUzX
	ECEQt14b0NJxcnI0dNwD0WUp2eIpytiRoIcvtgHxYa7CdfPg1dfvQP0DbIt2ZYFWn+/kDcSevmT
	k0/Wx7ZZmT9bJGr1FyvlB2tncrfirJxn9PVtHnZdrCp5rFwFBFgedtXIaK3a5mCJ1JmfJVjQg5c
	tr7Z53053BhNLNrJP8756hNgkeprWuKqW3JUR8lQXsJgByDhMhX0adzXb0If0v+LqeRq5LGId4F
	hEaLjEmDDGXOEh6srR94cOSPR/4YeNfLLrtDuxHqeDRm+X/Gq6szrJoxHlZTKBa8jRPbGtf7FX1
	8GYU2bFP4ibi/WrEDAKNjRlZhk4O16rp4xNuzsgOzwL21BCN4lpwEUg65uTl6hAgdS4=
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr276786925e9.28.1793724480320;
        Tue, 03 Nov 2026 08:48:00 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm79469835e9.0.2026.11.03.08.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:47:59 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue,  3 Nov 2026 17:47:30 +0100
Message-ID: <20261103164730.160593-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084803_605861_22F5CE50 
X-CRM114-Status: GOOD (  14.82  )
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

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..c70780b11b9b
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3


