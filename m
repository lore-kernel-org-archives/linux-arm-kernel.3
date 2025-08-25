Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D899CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYN7nhGItPuxuOx5ODUBHzob17LH5jYbMo8Fs5p8ph8=; b=A+DqYrhLqkbLbVrlWxdRHR8Cax
	BouOEFL+aqN+3ANuMPTuQ0cPzeE7Ol4YIPcLJa8mlQcQtLkOaLbqA9kmBRzmbnIYj7NbIhC0ygvTz
	IXkbvEYzislYNDmbncbyi7RhIxXeN3lEGp0pYUe/9WIByymo57X9gd3IZum4hG7GyzX7juCFWPeSc
	BkoW+gxFpb0Ki7xUNAgdNOusgQOQCS6VOWRCeIZ7jqDZGWRDjCkg3k9eS9sqBoky7JUI07Lp22Y8a
	i8FlR+LXJdFZy52utu8Lo6wfm2+z545gSUqggJGRWm5t3q1F313p9FRed2gFsi7tzjLcDDRms2dN5
	LPGs4IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqReh-00000007AYr-1dDT;
	Mon, 25 Aug 2025 07:30:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5o-0000000752H-1hpt;
	Mon, 25 Aug 2025 06:54:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-771e4378263so374576b3a.0;
        Sun, 24 Aug 2025 23:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104852; x=1756709652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYN7nhGItPuxuOx5ODUBHzob17LH5jYbMo8Fs5p8ph8=;
        b=drt9b55NZGtLB4EDDmblzG6eOuOk1Ds4TPjqyVAzWVmP0IV3NIssMWbe+rDLB6ij3I
         HkQ3PD7oYjH5KjO1cfpcy7xDu3nl9H3w6z0p5MxAJnEWCQNqj3XV9Od5DzIIsokBvtdB
         bgesbLAMQDZ5Qwu4PhDGK0/wlpy3MIqURP+zf4vwjXa8+9Jimk8AjXUrfZsUwZ8s1zzi
         nX0KBhQyrVhzri3TtnCT1tj7OIdAOBWv2YM7S0WYSs/bsVd8ZaHFbfB5Klfc7DsXUIcY
         OS64H2qb3Ofbd/kzIKYbXP2lQw4Di6s9TcE/YvbUetX2wl5fLxD0IUfbu8FEDCnpdzkI
         aTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104852; x=1756709652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYN7nhGItPuxuOx5ODUBHzob17LH5jYbMo8Fs5p8ph8=;
        b=ALDRYOhB91BCWZ2Qxm/H7rLxVxZ5QlqDnD7CEabSmL1f+s4J+6ZQusArxsCAo1R2ij
         dfpRfBiZgRTEUbFJ2aAI4Jz1bKWKWFAikJpvHraQe30fqCHcMhy1kx3EpanHB3244nmo
         QmBp1Q4evkfgtmHlKw0Tmr8qU6YAvAXIg7iyWdJdtozGS1QDlQp0nYZ52rytWI9JeXMg
         lXAtQu3M0/dXju234DlGBd8RCljUJJLnAotlvD649DEFqsNj20Pdl1jKlwJMcy2FPSUP
         ezTSewrsqjuErjYovw8rBb8AR/hB9hXVC+9Jkctciot6oyTFkUz5eKVplgIb5/gyWlYT
         Hmow==
X-Forwarded-Encrypted: i=1; AJvYcCVcuSnFdYzLB4emSmj/Fb8o17mWPIXGBXEmQbOVcvP/IeMG9+G5xD1Qgdj/s9dIOoq2IEtQivRCAVIIXKOc@lists.infradead.org, AJvYcCXG2X97K1V4TSwFIvT7Q+cDXdkdWwMhZuGWEbf+3HmaTRKZLoPSNXejcfxSd6PgX+rttF/zI1CeALRxNxMcTVS45w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5MjK2SZvQA1LaoI0e/7epKKSvHsmIIKq90fd3lai97CzAksL
	EXaHmBRawZWWcQOijoN6zAY0uqc8AwmHzHE6amDV2i+Y7XXnbzrND+m5
X-Gm-Gg: ASbGnctqmV5cTpRE2xMsRGODUr/XzMogyexYhiNK+tZ8E5LARqmNOHxEWTH3k+bNSw2
	QA28u5mHlTqbFGachul3NVOa/Tmf37eEPg9aWp+DKNAoviCmOI8tlj+sTdaxW754JSv1IobMYsn
	7r+Bwq+0FyGJucbyz46TVE9pazqhBj3rWJJwbQA2eCYYN32boNWLk5xdbgqsoaXETlueqS9lz0G
	TsVG0pX/UO5kmTYYV5FCh2/fBHc40aNsIWWtLwFprE3IQME7KtvFqyDDthKsbVuRymRteOE25Sp
	BqL3go50hLwhjkGyNmRS4loqq7p1ifyPJUJr58jyfjnPEn44U0xFDk1mphknLZrn4ZdsXQiudOe
	ZXTBfl9y4ZjiyKDihjcpH
X-Google-Smtp-Source: AGHT+IHWUk4cAML93HyGiEFwezL8U62c5uaN829A7XblToHk00FYTc2hvy+Bm+6bwtMuYJzqSRZfFQ==
X-Received: by 2002:a05:6a00:398c:b0:76b:995c:4bb1 with SMTP id d2e1a72fcca58-7702fc1ca28mr13204386b3a.15.1756104851788;
        Sun, 24 Aug 2025 23:54:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:54:11 -0700 (PDT)
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
Subject: [PATCH v2 11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
Date: Mon, 25 Aug 2025 12:21:51 +0530
Message-ID: <20250825065240.22577-12-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235412_442558_D48B0FB4 
X-CRM114-Status: GOOD (  11.36  )
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

As per T7 datasheet add missing cache information to the Amlogic T7 SoC.

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
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index ec743cad57db..6510068bcff9 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -53,6 +53,13 @@ cpu100: cpu@100 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu101: cpu@101 {
@@ -60,6 +67,13 @@ cpu101: cpu@101 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu102: cpu@102 {
@@ -67,6 +81,13 @@ cpu102: cpu@102 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu103: cpu@103 {
@@ -74,6 +95,13 @@ cpu103: cpu@103 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu0: cpu@0 {
@@ -81,6 +109,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu1: cpu@1 {
@@ -88,6 +123,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu2: cpu@2 {
@@ -95,6 +137,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu3: cpu@3 {
@@ -102,6 +151,31 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
+		};
+
+		l2_cache_l: l2-cache-cluster0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x40000>;  /* L2. 256 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>; /* L2. 1 Mb */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.50.1


