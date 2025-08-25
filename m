Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51164CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sJCLAs9Ub2fhHSbUKPpxZHLwG3foItGZ6AhSJ9AW5Q=; b=o80DPp/cZ3efTDYnqImHTbQH7y
	zWvZmMofL4ZPP8IJ9dmaTrzHBO5UkMgLSHNa7+4qlRFaDXaQ2uUITboQlZ9jtMeU8zmHk4giWRJIZ
	MmvPleavH+YMe7tZaiUkC82Mzl37pH9PMfb/4tNM6zukLv6st94uAOtKIneos7RuL4gdCjdWbz8C+
	j1sjvx2wQKMGfMAy+1DDEetHnX2875O8woD7/MwenmtKf41EjJB/D2TmqgeYns8CTdTWxt8FqS7+x
	QtKp2eO0aGDeD4htiZQzG7nh2aKOs2EpCNzF1GUZK2AC+IhQD9JVSmAhjqr60sNT12kYD+nvsk3uQ
	HRiY/XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqROT-000000078ie-1Me3;
	Mon, 25 Aug 2025 07:13:29 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4q-000000074mG-1sUJ;
	Mon, 25 Aug 2025 06:53:14 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-770530175a6so592725b3a.3;
        Sun, 24 Aug 2025 23:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104792; x=1756709592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sJCLAs9Ub2fhHSbUKPpxZHLwG3foItGZ6AhSJ9AW5Q=;
        b=LMZ9k+jeJrOHP5X1J0o7hdHQRWNzwXL8JvezzvcZ9+/ksmXYrqn3bid00jL3HMgKtq
         W+kkurVgjmXIJi1i7VmTcqTJ7kvyk/zE/Uae0w3PBRJkvyB5/Sj87tuusd2DvMcwTVwC
         rquVEi6DV3fuPUBz1+e6WAG+cZCQHLOaIjtih35NvEY4X6gUZ/HI4h6dQHHQvO3bhs9z
         QNkUJGky0SZGZzsVAykcagQUqKFexz7/Wo0niRbwXD2z+5WJdBJyjw7Qwv83sGLsLZS7
         hoiu7HZA0cSCF0/J2TGVgrtuW4N5uWpyqzbymy4xmuQH6wjxxwdxB9CqWSNOHkBpjjVt
         TQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104792; x=1756709592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sJCLAs9Ub2fhHSbUKPpxZHLwG3foItGZ6AhSJ9AW5Q=;
        b=T/z/NS7PcVlhgDGDuRDCp+aZrgAvQtfknHE7FDNzrhc8qJWsb7rHyxePQVH1X74aGW
         S4GccAo7SyTKxtLSgk4pa9Z990uN83OcC6LmaD2W5C93fBB2vySKfbv4ttqd8X1gsLus
         fo5gjqwB+Ijiq/BV+xO7WR39e/SfRlHEMd/+mCGc08uQSK57k5Iq7+XtfxZTxGC+bIX1
         nOkHvfccREyAzeYcAgMvOO6Mhe28PVF4CYm2U/QXctQPoyonX6c7p5/hahJ8OZwViVJ/
         7PHBAQ1LMy7/n4hkGKPaqi0uBNTYJKagOrfXgyadC0YlO8RZ5ZiZ5JjaKE1hqRG7Pdhs
         nF0w==
X-Forwarded-Encrypted: i=1; AJvYcCV8dRz5XL6WAnOzClk6sS/AVcpYVZdybpGHKrkXYDTPNimKEuZKPyRK9hPhD+C2PJo9eTOsRazGIsHK1YhsCS+yMA==@lists.infradead.org, AJvYcCXNDG1dgR0fmxoqqBwOXB66omNiIBn3G6PVMGQZBLMtMYpnf8mWQIM1mnWrP1k+CKfCqP/3EsZ6W0mfC0wM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6D8RkKmflx5DQfhj7ljXK7pT7KH/t6EHo8wAno7wcTw2/v5+/
	w6M24G+sGdvZ5qXXLh0VIwfu55fuU/CRS3fLd14D/6oNeocKcR+jA0oZ
X-Gm-Gg: ASbGncuWDMZ6SvbYh3KptjSbnEgKKyjixlR2zvDSoLbGR+rSkuVVw+bjZ80Gmp7+lKm
	8V1U9fjVR78vuJdhoM4mKjf3J0d3hxhWHimrkBuJHQYTdm9DsUDzd09axkvcLeSkxEUrOTBTvJn
	LcrCsECKcP9vck3aQn6+iX/kzpxcpdnz0eO+WCUvplOAQPIajyztht2EIxbK7qJaa/fZNWNm1Qv
	tZcac3nuPrIrV+9ktKmXP4jcUtKKhIw8NGVhdCdtZu8LG3Xqxa5Nbhr75CZG+J+wsbHtxtQ7meN
	xI7BseyZV+YYh9/5ncs9MhAShVBUxehmW10hwp06rleD5evJuiNpkdz8qSfOzVXcJTvPyL2gDSw
	IH+A9i2Q52YzjgJch6RMf
X-Google-Smtp-Source: AGHT+IEuXAC6GTvXdh+FQR2MmdSDTq0jrcSEN6KLs/qvLz3Mrs1wH+kkzuUrxAawY/6c/RpxtZoJxQ==
X-Received: by 2002:a05:6a00:3927:b0:76e:885a:c330 with SMTP id d2e1a72fcca58-7702fc75bf8mr11181399b3a.30.1756104791843;
        Sun, 24 Aug 2025 23:53:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:10 -0700 (PDT)
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
Subject: [PATCH v2 03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
Date: Mon, 25 Aug 2025 12:21:43 +0530
Message-ID: <20250825065240.22577-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235312_485205_71991613 
X-CRM114-Status: GOOD (  10.84  )
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

As per the S905X2 datasheet add missing cache information to the Amlogic
G12A SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 +++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index deee61dbe074..1321ad95923d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -17,6 +17,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -26,6 +32,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -35,6 +47,12 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -44,6 +62,12 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			#cooling-cells = <2>;
 		};
@@ -52,6 +76,9 @@ l2: l2-cache0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


