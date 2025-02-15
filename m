Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4115BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EnzWEyG0F/nkFAdJDRcXTNC91j8CDzx+Ml98DGY+G/I=; b=mkrmp4Zo5z6WWWGhxBeTchMI/h
	BSaD11H4f3+nnFcCsNhRG0q1mBtE+yVFPUmY6HGdnt1w/9PZryTpSSYC5ALfX9EWxWPy+2mnwA96E
	sHJD6Bfldc51cmqR8LeIzwBtiriSc3mg/kwajMOeutwFYZ/QbD43XEMV5asi1tB5ubx3y+1ipafyy
	fl0UaiFQK3zs9qFIgXhPqcqNPSg3DDQGRCoMw008nwrPiIRKjtE+/uzV5JnCIN+T8EqDTKXVRiKw+
	PicmMPvmcA3roJwgBmutOBDHv/JjlnBp31U89YURGn2t++f5INpFhOTbmIMmusynsigdE9W7GPhCY
	2/nfIiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHsU-000000007Cp-29WI;
	Sat, 15 Feb 2025 13:06:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjHr3-000000006vh-08Ap
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 13:05:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so2470848f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739624707; x=1740229507; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnzWEyG0F/nkFAdJDRcXTNC91j8CDzx+Ml98DGY+G/I=;
        b=Lc7CB5qf2G2bj4e+edKRHZlg7tNbtXx4bmfIUq7ZQcBTNUr3+mqWmxaV8cVqdRJWcN
         77fIrn62qfGZEmmco60xz2w4tbsbDi3B+vO5XVEncaxjECBVOMR1Z5bSGGrVZ94bjftE
         xuPhCBWRzG5L9tTVINvoQfhQ/E9n8FRLwdIBgCsUSYQ/FIpYa1MHflILuI2F7b4h5XWJ
         wyaNpEg9rkPFUbz2E5gT9EMDdY3R8lSZle1YPjD0X3QgfLwvScVwgvO8am7gNmKbFDh0
         SrLaPjtta/7MgmIVyhCUXB13OCTeGasXnNAvCG2xMjSqjleOhfsgB2V6SA26N+7FR+Xm
         c0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739624707; x=1740229507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnzWEyG0F/nkFAdJDRcXTNC91j8CDzx+Ml98DGY+G/I=;
        b=uPNUMDyIl+12vsc729ELlMb+8I4H4jWyN/FGYOf76Cf0QC3Eu1AMArSQ0GLozr0vgu
         2rjxuRgUXhw8X4INYQEQWjF/H6HD08Kv+dg6VGsVyQHqYHGH4+LrdwBdEAAS9vY5knYP
         vldkxhGtEolYl475aapnUOgmQS0iPyMJOr+9QIgn3hALHbhG5DXGhqFKvLhJr8J3V6VL
         Worji/QRQMZrxuv/haXSsuPOVxEAIUrHw766Bz1yG7NmecoZMQvnya/HWxbs3eOlysl6
         /3yc93g1os+HBFZQV+HH3qu0YjuXN2EflxeWvC3na0FS9qS7BEzl+HapCplS/ZZT7b/W
         kN0A==
X-Forwarded-Encrypted: i=1; AJvYcCVKiQRqV21GQy1Oapnw28LMWbHUEDNffisW+6tJKf3UKMMvTdt5jJRlBha1y4209PlC5Ya5oyGi1fLxqAIGACuD@lists.infradead.org
X-Gm-Message-State: AOJu0YzYvaIvL7ImUAV7qA+pqDePv1SzfcbLYbnzM0xTGrREVYYP08WH
	vZrACNLNIMdIR0T1/IpwvZfaFQEGyHdHTjs7lC4vjqtV2HN+t6ld
X-Gm-Gg: ASbGncta4qGIhJIeS/WNlPX5CDp6kxS8fz4NM6ZdbEEZp8IAfVALQwRjbMjGDKXv6VL
	eN5SRP4N+P0k1UzGYUdv+ZHaA3gcPY5gymCJI4vG11g4MRujfNEygw2Nsxa6sziZWb9x5SdGBmh
	JL5q62TIci6N0m2NL+JL8dOdrfB3OJg72NaV48V7SBI6UMefgvzm8QAIXPH5m3Ev6GXv5segK+V
	+UbS4ZlgDPN3ZHABDYVsQVfOg71bUdGeoDUmrGGPJoK94jAtbprPva5K7Ue7T9dEyWjYEqyeDPF
	S5IyEGvPSQJwn6OEU7mcdY76NHtQnElyZeDYfLW5fxUBnRFmsOK+QlM+4X7dy6UE5MU=
X-Google-Smtp-Source: AGHT+IGPH6nFSzgJGVGOdy5Vv5Ptqx1cOrQXhqFYvlTcihepkkW9W18HUSoDwHWBrrhWnva3n8h1ew==
X-Received: by 2002:adf:ed48:0:b0:38f:2a3e:870c with SMTP id ffacd0b85a97d-38f33f38891mr3726621f8f.16.1739624706983;
        Sat, 15 Feb 2025 05:05:06 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b412esm7091418f8f.1.2025.02.15.05.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 05:05:06 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
Date: Sat, 15 Feb 2025 15:04:57 +0200
Message-ID: <20250215130500.170738-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_050509_071441_846F4A08 
X-CRM114-Status: GOOD (  16.42  )
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

Hey folks,

This patchset adds device tree files for Exynos 2200 and Samsung
Galaxy S22+.

Exynos 2200 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy S22
(r0s), S22+ (g0s), S22 Ultra (b0s) Add minimal support for that SoC,
including psci, pmu, chipid, architecture timer and mct, pinctrl,
clocks and usb.

The devices using this SoC suffer from an issue caused by the stock
Samsung bootloader, as it doesn't configure CNTFRQ_EL0. Hence it's
needed to hardcode the adequate frequency in the timer node,
otherwise the kernel panics.

Another issue is that cpu2 and cpu3 fail to come up consistently, which
leads to a hang later in the boot process. As A510 cores are clustered
by two, it makes sense for both of these cpus to fail if there is a
power issue. Disable them until the problem is figured out.

Samsung Galaxy S22+ (SM-S906B), codenamed g0s, is a mobile phone from
2022. It features 8GB RAM, 128/256GB UFS 3.1, Exynos 2200 SoC and a
1080x2340 Dynamic AMOLED display.

Further platform support will be added over time.

I expect [1], [2], [3], [4], [5], [6] to be merged before this patchset
because it relies on the aforementioned series for drivers and device
tree bindings.

[1] https://lore.kernel.org/all/20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com/
[2] https://lore.kernel.org/all/20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com/
[3] https://lore.kernel.org/all/20250215115433.161091-1-ivo.ivanov.ivanov1@gmail.com/
[4] https://lore.kernel.org/all/20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com/
[5] https://lore.kernel.org/all/20250215123453.163434-1-ivo.ivanov.ivanov1@gmail.com/
[6] https://lore.kernel.org/all/20250215123922.163630-1-ivo.ivanov.ivanov1@gmail.com/

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: arm: samsung: document g0s board binding
  arm64: dts: exynos: add initial support for exynos2200 SoC
  arm64: dts: exynos: add initial support for Samsung Galaxy S22+

 .../bindings/arm/samsung/samsung-boards.yaml  |    6 +
 arch/arm64/boot/dts/exynos/Makefile           |    1 +
 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts |  178 ++
 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   | 1765 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    |  560 ++++++
 5 files changed, 2510 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-g0s.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos2200.dtsi

-- 
2.43.0


