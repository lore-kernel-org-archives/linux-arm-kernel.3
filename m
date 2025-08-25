Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2824CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpWYLZ3/Cil789iwatZdhzUNJcQxhQ2Jy0GGTG4rorg=; b=f/j4pk8nRJgFisuVQ0ZL2IIkLT
	bcfzoGl1xoAibbuiHq1SguCU/51wSGe7xakfOpCsSB3LsTHmHbIXzK3eauMJr3zAO5RLo0nEdtT+E
	QYpsl3A4WSwPPwyh28eSXAFh0Skvon5OEAANwTX81rtUzVk3itwt2BCBvfCghOkl5pwBzXKhDRHiS
	elVLjhdTarPc6Vtobmot66Hl7LCn2XSjt+1BLh7xXfdVpUtamw/7yDMv3LDWbLw/MR58NxNdsLEfZ
	fH5/PBCHgFU55PIxyx8zx91pvhlRgjZThtg9IS6ov25QP3eb/hfktdixRPVO4NZQdqeTZuiNA5uGS
	bKzZZpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRRV-00000007956-34j0;
	Mon, 25 Aug 2025 07:16:37 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR5D-000000074uP-0D1O;
	Mon, 25 Aug 2025 06:53:36 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so3524366b3a.0;
        Sun, 24 Aug 2025 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104814; x=1756709614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpWYLZ3/Cil789iwatZdhzUNJcQxhQ2Jy0GGTG4rorg=;
        b=DuPHiwIHO/j4ngU9sTFeSTgreAPFp9TYz9Yu/nOTx0k9Ikdjb9BMOBu28GI1uHj3oq
         iqnb9uaev4Yt3dPJNlEENS2+y+fs2Eo9WvkAD8xyNPNZ+j+fimBY1TvxFxdsKLBarMOs
         UcAi9Alo4RO85lXLzYUr+vaFeDKeDgdSspQqmvorCI0DqWRF/LFfsg8RujDHvtslRFPz
         G++hmxj7Rw9NUvr+fm2V9FVQubbqqGCFXH3AitF0G5U7+23mny9w2ps5hC13gLnr7B/A
         OSv+kJzqHGsguL+YxB3VBeMODCrM5UZ36eQyFdcgnVj72xrvtEQj6YHBQFd8ql6pOw6B
         ucAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104814; x=1756709614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpWYLZ3/Cil789iwatZdhzUNJcQxhQ2Jy0GGTG4rorg=;
        b=QytDFObGJzKr+VkMihCmpPry0s/1GxtXwt9HMlXzDcLdZC+4LoMFEGhSHLDIQOTeoU
         7d662mYfz82QD4s4NkuO7Mm8xNPFv0XQyyDCxbGCktWE/WpsLcISK1OI5OsMvHnTeOqA
         cWXQ2ajFuC00OQe0DZem9qlhUDvT3qormzhwPopfdzELHbUvgZLAgbqR0/v1sqo/VuA+
         RBcywNrFlcE2kJrL1tayPbbwcwQn0YA+NX9YVWP7sov5l4m3Jclr0CbF/AeNEMWyPtSJ
         NeibDMziubhmUgZRWq5LPqxfPilwvJ7iAHKrKg1tKShJQTWGSxW50ZckuDno1fkm6Ob9
         ThQA==
X-Forwarded-Encrypted: i=1; AJvYcCU+pQNKiId5OJec7ox2Rr/rWcBTwlX39JMKA5nheBmhlsFPrSALTrcnROaAjVxA3oDJDcxs61HuGykHPOp1@lists.infradead.org, AJvYcCWj8hSR4Hh4ZYslQoqYdsFvE81A+sNq7EoY0m8spheufuE3gYcGx7yi/+reobb2uBL3VRqKZvnbtnjsPmWkJzB0ow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8RL44Pr5xx7qVid3pbRy7lXguTdsvcItD5kD2anV8rtK59GuD
	2etF43wh1auw0vGvCXnU104FHLjWvYfNBXviQtZLgkco8KnFSH2lCN+W
X-Gm-Gg: ASbGncun6uAucla5SK5fFZkQp44v7ga9rV9p7zPcuWU6EMtApSeI7SSE2JpN+cC0kMI
	xPlG8iiR+n5N7Y9Kq42pkarYz8YZ3C4joyM1LM+wqV0gqBZjaNhHTjBprij427zKykveHdInAGs
	RGbTwZQfDpwyfKxwyUW+O89VEDQtxbzftAogi7KKHvyaFftRUc0u61CSXeeBszwMYqcYbszEKpf
	oUIbtJumwK35YI1TDoXe/4fjAkntIghl1Smt2n4+qfcQisjzuN8hotefSVz8sWlGw9w8fsYEpoU
	zkmP5yaeabtmEyFFA5qPtwnZomYndt5ZXjZrmb9hwW/1TFmFX7ANOY+J9g5iIaVoLtx5NIDC4fV
	9Vg1NcioEgFDFM60QqIlP
X-Google-Smtp-Source: AGHT+IEJ9v2YuGTPj6e3CqpkOu27JKZc8ygwmzFRvwV2rJG4r8c49aZnSJ4hrvoX/pEwKqx+A2Koxg==
X-Received: by 2002:a05:6a20:394b:b0:23d:dad9:50d1 with SMTP id adf61e73a8af0-24340bd0f16mr15536129637.7.1756104814484;
        Sun, 24 Aug 2025 23:53:34 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:53:33 -0700 (PDT)
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
Subject: [PATCH v2 06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
Date: Mon, 25 Aug 2025 12:21:46 +0530
Message-ID: <20250825065240.22577-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235335_087331_9E89A172 
X-CRM114-Status: GOOD (  10.22  )
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

As per the A1 datasheet add missing cache information to the Amlogic A1
SoC.

- Each Cortex-A53 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L2 cache.

Cache memory significantly reduces the time it takes for the CPU
to access data and instructions, leading to faster program execution
and overall system responsiveness.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index f7f25a10f409..27b68ed85c4c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -27,6 +27,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
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
@@ -36,6 +42,12 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
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
@@ -44,6 +56,9 @@ l2: l2-cache0 {
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


