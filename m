Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC98CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxRfEcPcIN87oF3LCTOkdejufy+FFvG5+gjxZ5CrTbM=; b=0aaTZJjEmADLzSAZ0tE2Mbvllt
	UHQcdmmTUMj8qTmRIyouAXdgbNUHFFsF5Tkek8dF/keYQ83b1YW0FlLXfoH0jiY3w9v4/Ng+MehE/
	Ncc86TyDTyGISywHt8rWYuMNRUoCn9BHkVAVvwrtGHbPUE6uHUEo4ttzotpnGxD6AuyB8huuIQ/q2
	mGWHIJfSG0NY/lJfzKKvoXg9ZuFVEWKaAmwldUac5t34KEYJvA/gRMsK/qO/UcikKCFftDnF4ZqTV
	pErgW7/AE62OeZTn3KN02noPjpe5ojRXcGY+yHdXLW2E5vUVZUNgFK15AefgmqPsrSY85o04z5Ck8
	VCnUoRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRZG-000000079x0-0ArW;
	Mon, 25 Aug 2025 07:24:38 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5Z-000000074z0-1Y3b;
	Mon, 25 Aug 2025 06:53:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2e89e89fso5302278b3a.1;
        Sun, 24 Aug 2025 23:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104836; x=1756709636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxRfEcPcIN87oF3LCTOkdejufy+FFvG5+gjxZ5CrTbM=;
        b=i5mU73Sjg7Xn9Ax3wN/WSlVgV7Xbc1Pa1ZkppGzuMVhrHQyfZLboRbyFSd+3qlAIGy
         Qq1+bxZE9Mz0klOpZ1gazzrMT0ZawCArBusDwmnnha/nFag4o8EANak/qQV+x/3ATlZO
         jKsSKpnEgDXgz4dEU2/eumNDEDn+TU0oztjcCsQrAKAgMzOqYPw+kUiOgJSd4zxVmCMu
         qYqaPNjQLlGukVMCzaxSOCzFAr6xGM6AfVTs5xalmu2YnB2e6F3SPEnOujUjYk87cURD
         RC38gwjwKmW/36C2K+J3VwhmPEssLpwcwv2VtiqnLpV7TbkSzqxVa4atTeM4zwgENs11
         WshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104836; x=1756709636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxRfEcPcIN87oF3LCTOkdejufy+FFvG5+gjxZ5CrTbM=;
        b=mtbSDXB4Fy9xzm9oRiRNI0gXqymPjwvOHcFkltRErjGa+seYNGKN+RyVgTRu3oXAgM
         0UaQJopleFalhq5b6+ryMvgTax7hZ4KgFutu/9fLKSlFaOxr2YcU21HuHtuKCdkNWdl+
         n8bly027+hXRzwdSYPNz6bY6ZfC05YmUy28LocBySvlsW1qwqpcKAKJqcwPJihlb1FPO
         zt2X06Nveq46CiXzelT0fDTIx83L8FmhFPQ/zXtknptKPSl07CCZxLZGw/1VDA3TwlaM
         DYXL+MkyfivHmvOdLbEAiV1JYBpK3he7kaafzM6FnR9sXMuHSNU0Q5I6MVnbj03OayVl
         6S8w==
X-Forwarded-Encrypted: i=1; AJvYcCUPJCFyQkzlkPd2cP6q3Fg6vkSTzDinD7CN7jYGiKKefgIvBfDL82xxGro6463VcN5iWqd3YSyUmjnUS0enf/TvfQ==@lists.infradead.org, AJvYcCXAn9u6I5zXkwkT+sWRH5uQrCts62pZ6xuKxa+LWDrgPoie1vQshY/GxNpEiFssf/hfN6ZHcI9JqfjrKNJk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfpnm2CR2sYqqfJHXfp+lTETnrn0pzFtMTSCnEXh2JOi4LeIee
	qEwV4zrcr5GbJaGCOLTiWFd0wVcGbZi0uNpJGal0ujKUqwxggWkgRuw+
X-Gm-Gg: ASbGnct2Hf9WMM1+RtFW/oqJ4k8GipVsg2Sx7pAerulTpgBynPaTOl7Tau1wNldn+OV
	vb6By3oQEh4qz/3ptdkzPQ4+xyUI/DhY0NuHMvvk33rKh1mJXolgGaAWUChZuky01yIjYLS7yJZ
	2A4fgWEGa3xb+3G9ArkrR8z+FN9uegz3R6cadcAkVjaHxHHy4wosU3QKB7yh2zzWwBxd3ddPz8h
	Y3pLbCOSClRWpJtG+WYH+2m4tz2OZzyAxoV7N7UkgvH8q9M+4g0b3eFVt0zMJMHTsMprY2++Otb
	BpDNrAJT36rnXg2F9IvcVfK7neV5jpJj5eVn4sjVTVC94MVfbn2r0gn9veOouQdbJegAIM5l7Jv
	6RyW5klE9C0wdfYbK0zpq
X-Google-Smtp-Source: AGHT+IGx65vo/k+uU4ptdKOZZVOFUAizGlTJrjDMLm40OnK0Yn4YQiR778Z1RRh6I85L04R72QoA9g==
X-Received: by 2002:a05:6a00:2286:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7702faaf0abmr13315850b3a.21.1756104836565;
        Sun, 24 Aug 2025 23:53:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
Date: Mon, 25 Aug 2025 12:21:49 +0530
Message-ID: <20250825065240.22577-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235357_405253_8B9C49F8 
X-CRM114-Status: GOOD (  10.80  )
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

As per S7 datasheet add missing cache information to the Amlogic S7 SoC.

 ARM Cortex-A55 CPU uses unified L2 cache.

- Each Cortex-A55 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 256KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 260918b37b9a..d262c0b66e4b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -18,6 +18,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@100 {
@@ -25,6 +32,13 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@200 {
@@ -32,6 +46,13 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@300 {
@@ -39,8 +60,23 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2>;
 		};
 
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>; /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
 	};
 
 	timer {
-- 
2.50.1


