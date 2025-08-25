Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2BDCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nPSWsDoAmy8PQ775XW5/42G5LT1wuElB0TP9BhSo2b4=; b=lU2hF+YC/RWL3dKPzJRETcMfXF
	CSNfMInDZNNwFL/Itg0r2tfpUsSNe5zBz1BFCJNJD0EX4iUkOv4JQOPywrQ2HJ2XRlvqoo+o58a3j
	L82Yv5Mylu/XgpAaWi3T7G/epVfAg9KHoRG7zmymfWmAkIgHZwh/2guEkS+tBOz8waT9LxNNF8ctd
	LVV45pnmn3XAe3zW0cpJNm27HEU7yVPWobqOB01i7gB5VFAGiBU4hsjQzSKJ+HV7fTz04Wk11pxab
	xLZSxWhUEpJPNtICCayjuvQpjXDFN7GA4E4qyvhlGF591Im+t5paM4gbYbAaH/iEjA5Eao+snfOcM
	oYRabKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRGi-000000077L0-3t9p;
	Mon, 25 Aug 2025 07:05:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR4T-000000074gZ-1atj;
	Mon, 25 Aug 2025 06:52:50 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3436802b3a.1;
        Sun, 24 Aug 2025 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104768; x=1756709568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nPSWsDoAmy8PQ775XW5/42G5LT1wuElB0TP9BhSo2b4=;
        b=djpGPOrf1lZuUoUzVrtKMx8+Tjm3ASMKdmUrx7nRRTTf6xrP18PlfMInbtoi998Gl3
         gFqcRUxHT9EBq7j/XIu1N9vPeWbfk07oPUq03xtD6XVoS4ta1bX1VL6nStEb3ar2K0Zi
         KF03gpsp4TSMpw614cLtK610mth+w/GgFbKSzRxWeI1L0KJmsrn9ci/pYZQ1YcmVy5tM
         v6Vpe9nrWNL+4xJ43ghpRMLBEo7s9rtDmn9tQ5DYkfrFD4qDBqlhfBPTYwOiH4j4IBqY
         8gYf3KCz65a528qpPb1dTFqc+iUsgF5t0G4H0O2A67X8iT0yVVtScxLhJVRmIXf0xeVq
         lQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104768; x=1756709568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPSWsDoAmy8PQ775XW5/42G5LT1wuElB0TP9BhSo2b4=;
        b=NaoMFT/VbEaPH/7CqJj8ME1rHol5fK6UdStcQKBaNWEfu23FeM81oeoN0vTSlGNZ9b
         jEHFLuYFKW666Latg0drMT03GcYn6iT5z4JKXko+YQrus8Ve8jflk1zaUBtlXRoHKRDP
         YUrBbzWw/ymcsxRiyQ8VrQzEDR7iiZe3yXM5kvmzVvyTgyvfiTOaKnbDKDPWZNsG2wgD
         SE4XpHWM/UCCxt/z8g3SsJQXfHi9jFmlx1EycWSeWyx1DIiGgRsl9X8+S73J/BL9QcEG
         I4rnDfPFrEj2XCrkHqeki7TvBC1QR8m7MgAKHy4nz57A+DAMh/ZZ+gS8fgg5DvaCZWAp
         MzWA==
X-Forwarded-Encrypted: i=1; AJvYcCV7so6b+1mfaK3byXv6Q07WmLeR2LlfQaR5T3vEZK6erdF2fxyBTTQDn+rZO6y5VSWLXBLpWvXCJ7rUHj3V@lists.infradead.org, AJvYcCW4I0tH7H1gqjdRYcr0Qh6AuXYT/hHy8KSR3jlcFjaNbOGB9l3eAG3IbsHzhCCsNg5wpni4QMuMbKG6AnDmPPmCpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/e9g4J1KpZkSXy2Ji3wP30/fi/AIoYiRPgl2rvXLeY1GykSJl
	PuC0n+UkuUDLTkWbSpzsOcP3mdah7yF40NVG24zR7QUQWsigideqLNEX
X-Gm-Gg: ASbGnctvelmUlywP4tn/UK412YUG3tIMsGJ3IKB9p6ydtj3EfXgPFkCYMTHNjAox9Tg
	rB1R0xrNUdEtciioJBPavGVY2//HslDe1+1VF97azjrj13TFRUvF2xJ+6GQ6Cll7OjLZhKWjIn0
	02rOj8XKVLqWGJYK1nJm3PCi1pLenH4+zPcg7+EJY65VectuPcxHlGd3JK8JTnvpSSMkQhS7Pg9
	q8ZKHP33BohsqwM0iNRUlxTTuqQTgPIf08lXbeM14uQwy5/qGMZvCECpcCnPVMvNw4z23rjThcC
	7vUdvWIzaEKys61A0sBlCjf8bi/FcNB2SpfA1HXauTfyqBqD1e7IMXhF3PhtKTGVMWtDOruL9Pl
	gd/UeO7FMIi4lUZE/qbvi
X-Google-Smtp-Source: AGHT+IH0PqNjC6PoFYiYSzlQkFiRl1br9OBwRTA+P1HjLnfy+GnCt9CSGYrubD44ufk3hcYJLcLUDw==
X-Received: by 2002:a05:6a21:33a0:b0:240:1a3a:d7ed with SMTP id adf61e73a8af0-24340d59ba3mr14443254637.41.1756104768135;
        Sun, 24 Aug 2025 23:52:48 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401ecc51sm6604072b3a.75.2025.08.24.23.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:52:46 -0700 (PDT)
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
Subject: [PATCH v2 00/11] Add cache information to Amlogic SoC
Date: Mon, 25 Aug 2025 12:21:40 +0530
Message-ID: <20250825065240.22577-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235249_421728_2486EB38 
X-CRM114-Status: GOOD (  10.68  )
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

Most publicly available Amlogic datasheets mention that the CPU employs
a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
overall system performance.

However, these documents typically omit details regarding the sizes of the
L1 data cache, L1 instruction cache, and L2 cache.

The patches in question align with the cache specifications provided by
ARM TRM for the respective CPU cores.

ARM Cortex-A53
L1: 32KB instruction + 32KB data cache
L2: Unified 512KB cache
L1 cache details, L2 cache details

[1] https://developer.arm.com/documentation/ddi0500/j/Level-1-Memory-System/About-the-L1-memory-system?lang=en
[2] https://developer.arm.com/documentation/ddi0500/j/Level-2-Memory-System/About-the-L2-memory-system?lang=en

ARM Cortex-A55
Cache sizes are implementation-dependent; refer to ARM documentation for configuration options.

[3] https://developer.arm.com/documentation/100442/0200/Functional-description/Introduction-to-the-Cortex-A55-core/Implementation-options

ARM Cortex-A73 (as used in Amlogic S922X and T7)
L1: Configurable, typically 64KB instruction + 64KB data
L2: Unified cache, configurable up to 1MB or more
L2 cache details,
4× Cortex-A73 cores (up to 1.8GHz) with 1MB shared L2 cache
2× Cortex-A53 cores with 256KB shared L2 cache

[4] https://developer.arm.com/documentation/100048/0100/level-1-memory-system/about-the-l1-memory-system?lang=enL2
[5] https://developer.arm.com/documentation/100048/0100/level-2-memory-system/about-the-l2-memory-system?lang=en
[6] https://androidpctv.com/comparative-amlogic-s922x/

Changes:
v2: Modified the commit message and added cache information few more SoC.

v1: https://lists.infradead.org/pipermail/linux-arm-kernel/2024-February/901497.html

Thanks
-Anand

Anand Moon (11):
  arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL
    SoC
  arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
  arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
  arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
  arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC

 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 37 +++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 23 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 36 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi   | 15 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 21 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 27 ++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 62 +++++++++++++++--
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 27 ++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi  | 24 +++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 27 ++++++++
 11 files changed, 366 insertions(+), 7 deletions(-)


base-commit: 1b237f190eb3d36f52dffe07a40b5eb210280e00
-- 
2.50.1


