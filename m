Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF83C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s85R3yVSuNjwngZj8e21pKm72hiISate8KTU7XoNJnM=; b=UND3Py45wRvtb4LsEsFlgrnxam
	+UKzgStxIzLId/7bH3A0820AMg/nmwQn+QzJRCy+8vkw8xsgT3X9pKEE7w5uHxyAZkdtVDIzsgqkn
	B4M3evHGNph/68Js68FMP6ylIzNuAPiXjJfx9e1cmnFdqNzzks0iK120c5zLP/PM/x50SnFHSmRfN
	FYdLh9+kZ058Lgsf6i1iDZb56efzNUZDGkZcRV68/S4D1y3zR+UmwoEiCEKJgbwrNZhzWFP5j42ST
	Z4mBTwCAU6aJ/cJIDi4UX0E66gMvzUFsC040zCIMybeMj4OS4qNOen8snaSICQSV10FptYJs18eda
	bIABhiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYq0H-00000000wdd-3vvY;
	Fri, 17 Jan 2025 17:19:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYprE-00000000uYK-0SV5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:10:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aaf57c2e0beso472867666b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133806; x=1737738606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s85R3yVSuNjwngZj8e21pKm72hiISate8KTU7XoNJnM=;
        b=Z+bmZV09PTP1lzXoRBc6ZmHTMu5hXMJpaTtb5if5M/N8M17r873JNgBhldqdmpApqF
         zp4bPaMDEgRSpyhmWPF6XRw9mH9hCLiikBg9b78ypq9kAHvFdOpAmy1+/HIhhGVatPol
         4HRnMyxfM9hHc8CJj1CGcR9M8G3R94mR7NGy97xW3ZnrjgRppBIRAYXXPUyKHZ81jTr9
         7RwaoxA6j4wjpvgQDJ0+FSiZPJd2U6hFCLBNbU0k1g4rwV5OAPb8a7Toe5SC9Q5oQgej
         El9ejmnx0+BzD1euuiLy63tVyGm8G5FimMuITHm1up/wreHeFdO4j7limGUJM6S/o+Y2
         SSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133806; x=1737738606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s85R3yVSuNjwngZj8e21pKm72hiISate8KTU7XoNJnM=;
        b=WJc+XDZnQWf23U2rdgljKfhgL7xjotaoilrP7Q4et08kRrVO5v6UCV9KzwMAv0jHmA
         XQhRi7u1RK0C3c/3bF/8RBrhyaNtd6PbjmbogDXSdgu0IKDC8TFkom5Q4BQmJTxImWiT
         WM9Ou/LBoxi4i7ppvwpMsq1DYWOsQ2ta7MpqPPcGSYRmgtmhyWeVk0d8YykiV2Ah2sg/
         pk+oFEubNsa49q8k+H0QaFXlPHfmpEeM5NISdxfIThJJB5N1EAvpArTibMDUayP1MeNj
         LmlI5n2r/bQxo5/ls4iiywlcxDw/8bed33YBhqR+lg7UsXL1wspMNu5Dmhx17Rf1ZTin
         MkLg==
X-Forwarded-Encrypted: i=1; AJvYcCWwasxLP9HMVQoeqEVdG/6/t/PamWBpDr+YYOWxfIsaYVO9U+eHnLYSAjdABB0XwGjlguV/2ifiinIeUR2+xVua@lists.infradead.org
X-Gm-Message-State: AOJu0YymN/XYSh2zFRRKFovUcbuTCcsmS7Qg7+ttCyL0XfNtSI82prXt
	eTSo7BiIlOY0XE2GaLDmG4Bwa8u1mj5ASKI6zfc91ClIVVAB7bhggTliPqf2kt8=
X-Gm-Gg: ASbGncu4ZAqNcOfIUsRiBFz0aaOMVJfzcTniM/2qRTLWo8W/wuzhQxYRlav47WbgkgR
	xWAeRMRnNyF662AFtOBc9w4EJCCMqxakkskRTjgd5kpZicwnwLMQMM96Zwsffi3ouEM6OYyDk5P
	qSs+o6+PDrhaMtVUh/OBPYlL5xyQK2XSwyVXExksFkT2i3nFpEuKQAACX/k/V5guFFOU1W4FS2l
	hzbUv48BIMaePLgDXrMjNnrkYJkuGpKA1WKjpVcVUSjmkVe+4xgUhZHmTvtM5IHl8PedGGKA/wF
	lb9ChcwEDQSdatQJ/fiBimUwvd4zd/VJIHPOxdXp
X-Google-Smtp-Source: AGHT+IF3lyD6ENeo+kfAD9mp5xyQb07iN5gPpJzGtPJfuC6X1w0JFQBCoLxFgjtL2UXjDVhReGYI4w==
X-Received: by 2002:a17:907:7fab:b0:ab2:c1e2:1da9 with SMTP id a640c23a62f3a-ab38b4c6ac9mr362313366b.51.1737133806461;
        Fri, 17 Jan 2025 09:10:06 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:10:06 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 17 Jan 2025 17:09:57 +0000
Subject: [PATCH v4 4/4] arm64: dts: exynos: gs101-raven: add new board file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-gs101-simplefb-v4-4-a5b90ca2f917@linaro.org>
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_091008_149259_03F0A8E2 
X-CRM114-Status: GOOD (  12.73  )
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

Raven is Google's code name for Pixel 6 Pro. Similar to Pixel 6
(Oriole), this is also based around its Tensor gs101 SoC.

For now, the relevant difference here is the display resolution:
1440 x 3120 instead of 1080 x 2400.

Create a new board file to reflect this difference.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: MAINTAINERS doesn't need updating, it covers this whole directory
---
 arch/arm64/boot/dts/exynos/google/Makefile        |  1 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts | 29 +++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/boot/dts/exynos/google/Makefile
index 0a6d5e1fe4ee..7385f82b03c9 100644
--- a/arch/arm64/boot/dts/exynos/google/Makefile
+++ b/arch/arm64/boot/dts/exynos/google/Makefile
@@ -2,3 +2,4 @@
 
 dtb-$(CONFIG_ARCH_EXYNOS) += \
 	gs101-oriole.dtb \
+	gs101-raven.dtb
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
new file mode 100644
index 000000000000..1e7e6b34b864
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Raven Device Tree
+ *
+ * Copyright 2021-2023 Google LLC
+ * Copyright 2023-2025 Linaro Ltd
+ */
+
+/dts-v1/;
+
+#include "gs101-pixel-common.dtsi"
+
+/ {
+	model = "Raven";
+	compatible = "google,gs101-raven", "google,gs101";
+};
+
+&cont_splash_mem {
+	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+	status = "okay";
+};
+
+&framebuffer0 {
+	width = <1440>;
+	height = <3120>;
+	stride = <(1440 * 4)>;
+	format = "a8r8g8b8";
+	status = "okay";
+};

-- 
2.48.0.rc2.279.g1de40edade-goog


