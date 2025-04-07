Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FDCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 04:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=; b=MNHpw3jmketjf2
	WnA/cWorMDbmC8nWHuhw2KRkPLX91PeBMz3JM9HSKHQfAFr2cjl6aXrm4lHa1KO7krcw1oyW2HkIU
	y3ymm7dmx2GkqazFczkEUSlt112DANwI8lzzfp2z63JjcWeAzPOAYM9sPf0RzoSuQSdzN7p+FZZug
	ISLNvPN205Iuhgy09uBG88G29ocPlrpIRg0XNRcYSy97mi5gDbkVfnRI4YMCPrOyDHT+Y/mkO149b
	3vVRPvPULhIe+B1rvA2bjgPjianLnwrqaOxE5nWmohtRUQra7py5uL57bzHHslQXmCCTxfBu+FBi5
	AMbqfo+mBQkNsskVDH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eOp-0000000GN2S-09AN;
	Mon, 07 Apr 2025 04:47:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1eN3-0000000GMee-3zT3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 04:46:07 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-aee79a0f192so2339721a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 21:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001164; x=1744605964; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=IZqGFp8bF9/eGgly0wIeIarsDaMSV8YKAiOauLuQfEf0HiBOsnu1PWvgzH9Cfw+tGz
         ELu05Ym2XjICSflAhgbMmcNVfvwdqcD9LpW5jt0pBmWF2lKyN/Sh9ftlRiIh9GebHxnJ
         1RX9vIv1nb8PukDfX7ecy1Vaiznu5G0XkXei2M9c6sOKl5ixw2PmQFtwcLkenAvf1ykP
         IFmzuFy/8QhlbEpN/8/q9ddomrfCF2ovq88kwXaI66VX38onPfTNSU3kCZsseuMlA99I
         ZlL4fHWrRnZNamnrTo9ZOXky4nOrnUNMTolWLN/5RRflU/XNIAruFE5AuG+Jp40oh1y4
         kF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001164; x=1744605964;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EuDa5MdYzDvx9phCQyiyQIJ/EzyBR8j5u1DkbRAKbc=;
        b=TxlJnxyud77jhF74q4OYJhc///XRtF3stjZy8B7Izl5KIAG6Wg/qhvdzL6RqCdvNHr
         pTPFLfsYQj39lGfLq1VnXuOxrMEePQaC09wUUsnH+gOiRppfO6Wjv9V9+0fuhPIlKvIP
         Pp9hJDIOZTuD/sReYPAbih3wizQoq4A2F/d0MToIH772XpaekW6B3HctV3UAbxecR3/4
         rPj+XIuE2jXfUoqSZmDzTe/eCwXh7zUFql3Tk5aYRvx7V0W0yd56NkAWg+2x2GFCxC7o
         QFD5fWefptHZcIy5OEvpt78lmFpym3UPvE144OYwVVyuKVs/C0uoMkiZEbX1Kms9zpl2
         VzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4UzE8CB2pcJND4EPcr2B8N/RVCkjsfsXCvydirfU/N345bv+ng3XOgY0p/wePJQngLfsDOPsd8pq5oLFHavE/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy56X/JTGeYSEQnVYZJCAAy5V8d/1bIGqJoJczuUa23sQGOzElv
	tF+m2ZQyXh/yknCquYXPWejTycpJznAnl/iYKdv5L2bZXlv1gYf+Htg9Gg==
X-Gm-Gg: ASbGncvAvh9QXhtgDGUXCKXILXrA0De/pMo1Z1F7M+KOoLrzgBUfeVz2wCdXqsQOAgT
	I2iqXPym8FGWsb0PJAC9yDPMA85cPkxflFujnFDOqDh85nWTxWYpa0lyKOk3P7XmYimqfu8Okpg
	zUktyn8J8hKvUd0lydsAAXy4QMduXE/LjCEmPIMeWLKExA+SO27rSiganxCwLBAZ+Xqfk0F8UkL
	gAv+ZuwHgcBAnoXulwWb3aJSPf3RTmf+iaEeb6jxRIlyYNvYDLpgXF/PNw5vsdLuW1+MwEi5HWC
	eINVSLs5jsFAkr9q6JaVxJ2GL+oJfQ15GHo1JZw8c/ktlX3G0PDm2HXwLQ==
X-Google-Smtp-Source: AGHT+IGnnwu3PoUM04kNoMa5q/pPcTApIutUUP6YpURP7hymSf7y+lisKuwk4Y0t7sbuK5dmWNv2yw==
X-Received: by 2002:a17:90b:2d4e:b0:2fe:b77a:2eab with SMTP id 98e67ed59e1d1-306af7b37b5mr8196187a91.32.1744001164238;
        Sun, 06 Apr 2025 21:46:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v6 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Mon, 07 Apr 2025 12:45:09 +0800
Message-Id: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVY82cC/3XOwWrDMAzG8VcpPs8jluRa6WnvMXZwbbk1NE1It
 rBR8u5zCgMnsOMn+P3RQ00yZpnU6fBQo8x5yv29jOPLQYWrv19E51i2ggZsA8ZoPww30WHovrT
 11mP02BKjKmAYJeXvZ+z9o+xrnj778efZns16/ctAnZmNbnTi4BL4YBzh26Xz+fYa+k6tmRlqi
 hsKhbI749G0CMK8p/g/xULP4hL7KJFN2lOqKW0orQ+n4Bsha8jJntqKAm+oLbQVAxQisESq6bI
 sv1hkktWQAQAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3865; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=A/h8OXs8Wekr7gbuWaO+81ojzwQgObVHH0lNAKAIdNU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iAz4hLMliudNCLKDZSI8+c8gq5cO4dSJTrj
 JFIwGCrcXWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYgAAKCRABygi3psUI
 JDkcD/9GRYoFGfptUaxyUh/OHaFxIDxYKvUhITxgKDs0lKXNXU6O4QG/aPDi+rBHqKlgfw+pv5G
 4JKAvs+uN4L1tBkI2q1v4dYPEzoNO3qODNIRRY6/5oavcmq8u0ADZdvg/as/W0cdeiSFqCrHaIT
 O1WBwqwyBztXKw2IktrdwOeeeVnYdfbSUpX/0fQiBCBPmo6/p6Whg9isPpwUFYga+/BveBaPvvI
 tXzDs9Pb2XbKiSBWcqMOqeS5KGEaiBPgxtIR5xrGpazJVM7FrkzDpAcd//+XYTHvpkvb9jBG0d4
 Sncjv5mBK/ruyOB7UpE3VDKSvcFaTJlci3mIjAVCQLztuwbm9L8ukjEjD9DanUzwvokko0HfQxi
 O+YlR69WiTUEVWK/USWOP2GHFtJ+GVXREztk1LbpjknwtY7D96IGHtrpZbE+S34ZrKKkfk9ETZo
 g0dUflMQqVk8dx4nUUyfdZmnxno3cJWMlX8Rk/wM6WoS2B/RR9NbHWjyVUM2Mb/MCy+t/38EnAG
 FDHVytWAunHr8k7H51yMp/hWPWRgGbm67QkMQGcRXSc3DMlIdiYXR3mvzy/S3XXYq5fGuCZNxM8
 nP8Im3Bp43WHdCaqvqJXebZipW0WDhDzFvnlnumZsT8UeqNKr+GRrPUsANaw/fJRYj9haTvRuTn
 rVjO4qNRP4w9eMg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_214606_053832_FA6E37AB 
X-CRM114-Status: GOOD (  13.60  )
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

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-7 prepares the driver to allow adding support for those
older SoCs.
Patch 8-12 adds support for the older SoCs.
Patch 13-21 are the DT changes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v6:
- Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
- Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
- Include DT patches
- Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com

Changes in v5:
- Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
chronological order.
- Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com

Changes in v4:
- Support per-implementation event attr group
- Fix Apple A7 event attr groups
- Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com

Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (21):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU startup
      drivers/perf: apple_m1: Support per-implementation event attr group
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support
      arm64: dts: apple: s5l8960x: Add CPU PMU nodes
      arm64: dts: apple: t7000: Add CPU PMU nodes
      arm64: dts: apple: t7001: Add CPU PMU nodes
      arm64: dts: apple: s800-0-3: Add CPU PMU nodes
      arm64: dts: apple: s8001: Add CPU PMU nodes
      arm64: dts: apple: t8010: Add CPU PMU nodes
      arm64: dts: apple: t8011: Add CPU PMU nodes
      arm64: dts: apple: t8012: Add CPU PMU nodes
      arm64: dts: apple: t8015: Add CPU PMU nodes

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 871 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


