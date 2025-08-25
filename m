Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81212CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTZ6ReWDh63SW2snxudICAvhkxK62zXI722Y94yJGWI=; b=ekJi70cIfyALcPq1g8ztu9Z6Iz
	2wyl+m140dgFSuzegJs0p0F+gTBlNe6yDHIzgSqO6LVttmuY5JcZSgW+dwZOuMtUq4JBXvW4rsHRl
	OpnrpbpHu3sBHlH+BNqGwvECY+RmEHj9YLWWqi6oQnmy1tzeYbr0k3Xiu+gjeSvEmJO7koQJu8VO5
	/JefXz9R5ZI1Nb4RXwKH3SXx54pVsdWnxga4g8Z8fiM8MZ7QvQw+XT+ItjLjYi2/jYuKb4NK8/lRB
	isLwW6MJF5/ymYdVef6b0s1mx7CicZVfmZk0dUSyXmI9+bM2j5SKXrk88qdliNPZQ1oKqOTZFNc3U
	akB484bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRbz-00000007AFO-0z2w;
	Mon, 25 Aug 2025 07:27:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5h-00000007503-0bVS;
	Mon, 25 Aug 2025 06:54:06 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so3524777b3a.0;
        Sun, 24 Aug 2025 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104844; x=1756709644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTZ6ReWDh63SW2snxudICAvhkxK62zXI722Y94yJGWI=;
        b=l3prV9koc9YiXYgjemCuNgY3ngnjtIv9g35rv3AOOZXA7P4uggqY6m0Oyv43Jw+8SZ
         EDrRCE0HvKFbl5LlnAqhN8C+JR1WyiDvSmbbG/FexN32KmwMDknPB/RdkHHuvM+0lW78
         ctcfXeas772LVxyRuzOD9hruo5eIClLWTVbe3Mt3JQpmwN4GUxewkTPrHrv579z4RbpX
         QME/j5/Qw+hRpSiPdMxRx6e5QlkqVGdB8E8wwc1DC7ixlxBzR9KNGQHceq6HcddGEAl6
         asFB9MWlt3mk/AMgs9e1XCBND0NZTk2kPz1pErjh2FBBOvClpPhYRkzUBVDDSX1Xu3qE
         fCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104844; x=1756709644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTZ6ReWDh63SW2snxudICAvhkxK62zXI722Y94yJGWI=;
        b=m6gLPJ2Qk3xDrXyu+L4orPbptcmV+BcGSinhR8xbkqf8aw/dXYuhvwCj/tjA6y3HGi
         S1BrZlWxhj1TtQlq5uHIi6v92EHZPPwG02UvmHlY0tfFX3dy7ki15LfsDnijMpYRuuLg
         jxTqFDErEZyL4/g/Bop2/nZqGF62YxUkcmm855lfULkkMk9yjvjE9OH42Bea5J6NfMZV
         vgeiohO0RD32A+WJ8ENb7bouxxsVXTCSmuPVM26LGkHZCIPMmEluEOWXvFxg8BbF06Km
         3pgnxs3cBN+FrYkEXFVUDVOPpVOV+t+cnFElfqDZrMLrWkkEL4ON6/mPzR2sg7NS1dzi
         imTA==
X-Forwarded-Encrypted: i=1; AJvYcCUNsKVNxxtRTqpc1yqoEk1c0PpzsVMCatXx8dyCSC6MmYeh55//UzwMogMpAuLODg0PW1EFbF7HzLg3df4H@lists.infradead.org, AJvYcCWM4Jg1FM4GDwSQGrLAMh46/v4DrykfQlabZtGer4YxZq3rDAGbrMlg8dGBvqbWtUbrRwo3WWJcHPAxZbHkTt0RMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGT4g6rcfcKcZDVFN1s2JeOJ+xdlWdxd8x0kO2q8d5CQkE12kr
	RLMvoyfMkjMrDtozPZQc8+GGB7UdfknRCllJaILaQ3T2U1wI7vk5q/A3
X-Gm-Gg: ASbGncus/iC5IQRnTtqhF9jybZEX+DsdWuGsK7E8kwyYIs6BN641zW6YiI5PxjjYhU/
	J6ASESn5SnYMfncKjH/HL3JwVNY19+TTihFVLGkCpo4RrBvnFFr9lOJO6Qe7Ez/Igbg0xWQqArO
	VyY3okwmZ1Qff4ridSCVMHnESA/D8tNwC8D2+C0w/SJycss+0cQyhUnP8hUnBRO2nGKr4eJYBo4
	uydoMfDQpcEm36194axp1lVfgZDMXnd8vwx3rOTFWiVsAOx2bH0AT/gMdv8ELhEBxIw7YUW+sgB
	Zk6WlAq9lTepKU5f98OrYIvpj/u/xQRhQEXq+4jWDHXUm64vFKZjl8UEplskpdUqmGRwrf3ug+D
	T0kAb6dRc/Xo5E+FtXb9ChVD39zWvkuI=
X-Google-Smtp-Source: AGHT+IExiDKidasdirJUMxHM8Ko8guGC+ynt8/s2M0w0Ora+UP9rYkO4PHXhidtDZ1EPCbRI+HH6qQ==
X-Received: by 2002:a05:6a00:98c:b0:76e:99fd:e8 with SMTP id d2e1a72fcca58-7702fbfaf3emr13327206b3a.27.1756104844339;
        Sun, 24 Aug 2025 23:54:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:54:03 -0700 (PDT)
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
Subject: [PATCH v2 10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
Date: Mon, 25 Aug 2025 12:21:50 +0530
Message-ID: <20250825065240.22577-11-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235405_182270_250246A6 
X-CRM114-Status: GOOD (  11.87  )
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

As per S922X datasheet add missing cache information to the Amlogic
S922X SoC.

- Each Cortex-A53 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A73 core has 64 KB of L1 instruction cache and
	64 KB of L1 data cache available.
- The little (A53) cluster has 256 KB of unified L2 cache available.
- The big (A73) cluster has 1 MB of unified L2 cache available.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 62 ++++++++++++++++++---
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
index 86e6ceb31d5e..f04efa828256 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
@@ -49,7 +49,13 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -59,7 +65,13 @@ cpu1: cpu@1 {
 			reg = <0x0 0x1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <592>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -69,7 +81,13 @@ cpu100: cpu@100 {
 			reg = <0x0 0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -79,7 +97,13 @@ cpu101: cpu@101 {
 			reg = <0x0 0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 			#cooling-cells = <2>;
 		};
 
@@ -89,7 +113,13 @@ cpu102: cpu@102 {
 			reg = <0x0 0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
@@ -99,14 +129,32 @@ cpu103: cpu@103 {
 			reg = <0x0 0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			next-level-cache = <&l2>;
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 			#cooling-cells = <2>;
 		};
 
-		l2: l2-cache0 {
+		l2_cache_l: l2-cache-cluster0 {
 			compatible = "cache";
 			cache-level = <2>;
 			cache-unified;
+			cache-size = <0x40000>;  /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>; /* L2. 1MB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 };
-- 
2.50.1


