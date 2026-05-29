Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FCFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=; b=bqMOULDKVjXEC6+H5GB7tDGSwz
	0A8/EbcFA1KlPR3uG6LqRclwz1DTScN4BuxRWaD1J4+jrPONnkP5+6ls+mi50rqMjpspEn8vtX+3X
	BLtBf60V7Zh+OHQevMSu0SMBoQAvNW+XY94KvtqP4t5GYFYWdhODYFR/Xnq0LlX/zQTgNgxJZ/57v
	M7YFaEtAz5YIkxxIKU13vtcaAaWYgCI1r4VgXzntv80M9KXVz5kHrcRiZMYsNmyTvRcvezP5P1X1m
	ghHUgPlN9a5RnAGLykyFkoMkZNmh6pNwL2Y43gBFcBf3GmoynHITwScaYO16+5okR5ZOLQ+yrXm2B
	Oh08oz5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUb-00000007YOp-26hn;
	Fri, 29 May 2026 14:47:21 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUZ-00000007YN3-1b7v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso121675475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066035; x=1780670835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
        b=MeSjYVkCTH8bMg3HaY4uH7hzo1K+xAkYJnHW0C6pCWgVTKhWgK4dEfPAj85jEFdnRp
         lxhU4Z0mpG823bbcEO00Jo/CfvIk6Io2SESLOaWULhsB62CsNcJLXvOfevjkGk9wsgqH
         MnY2dOu6pAu8RcIHOCPqU8i/3VgSsI1QW5YDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066035; x=1780670835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXAnr2ji1K1FMxfIa+2dWup2lSJTGHNXhn3K7ZsSAnw=;
        b=iqce5cimGngJfQwUBrajjErc7vFBgKCIxLFGrAWi4BTaW22Y2/RgbUq/y64s2AKbcS
         ZrNuOvHlAyhO0C3Kr/9vT/J4ORN5y5e/MTiPl2fO3AsQOejbzBbU58DHHrP4P9XmmclT
         0Qrq9ZUMLViF8y+PJnWtpx8C6qDjumK3EpV78aWvAyS/FXUY767BYSNcszC6Y0vu5A13
         RSLiUkKWoyo1sw8HJpePrzRtlN0GoSvgkH0TmtI4lf1eZQ3n56+6saJ7OG3ilb/Jg2DI
         WOM1uQBiLkKshmZvKdpWpbddElKcVHC1u3Y9C7JcMt3RLeVVAhKJs5T2jpI6X5Gf6DdX
         3jNg==
X-Forwarded-Encrypted: i=1; AFNElJ+pyfg4d7yxnb35rmM4wxGB9lNlFfjNbDoKsyhACloLVU53Zj7gLJQxJTKQbj4DRSADgXQYhy7YQMzgImOI0ZRS@lists.infradead.org
X-Gm-Message-State: AOJu0YyLqMPVcK3k2bv9CITnSLyWFyZNGueR07yAxhcT5pL+UWGdNhYp
	tZWmwlCe0rL0vK+FseCGVD9fcBG581Wo0G7iq1bMpLpXq8vV/2xf+pP7G9uLZgiYOwo=
X-Gm-Gg: Acq92OFcY/ulN+8GVEtwjhagWJbaX9dXqMf3xGS4oToY81D5ri+elnfy3kIDg8ZF55q
	HsxKZtZhQo/7J7uEtQ0shX0tCiI1rArlnentUgxbd1Pb9fGhc3GC+bKvgecaFAoDT/Mn1VXU7WX
	H/GSNKcP/HeIeKc6baYj76E22b9bMKQOWoYvo3VkcZe4kp6cXqMZ7oMjWp1liubLW12I0wnfoKT
	L9WlPch2J2m+Twi7k3Pk2iTK8gEeqoA3R53IO6KtY/WPJ68JqwggNABtZnSS0R1CBCY4O1uyy+F
	uzR9pJm18+a7EDYCh3ABY/EW4oepIu7a0Q/UUe0ZN+8FV9K+LRoxY0UJNbx9Lw6NdMRkdLXDd8s
	5y+IcImh4M80DtYR8/DKRPCgGvEG5/0Er1uruwMGJkFb1VfyaniC0gWdosl7eRFV1s7/KjiB+a5
	s2fYto0XtovVZRSpCq/HRe19CCSWnnLg0ROop58kDEqb2aVhJBS1gtYUzgl+wZDwwZ8xzDcZqu3
	xNiUC9eKd+kjMmk2kd8/etTYFNtQ6GJ7mwdlO30o+/RPCJEJ5s/M/XOCRU=
X-Received: by 2002:a05:600d:848a:b0:490:60cb:55f0 with SMTP id 5b1f17b1804b1-4909c0aa2c7mr40837195e9.21.1780066035193;
        Fri, 29 May 2026 07:47:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 00/15] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri, 29 May 2026 16:46:14 +0200
Message-ID: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074719_448268_140FD166 
X-CRM114-Status: GOOD (  14.23  )
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

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Notes:
Following Arnd's guidance [1], patch 14/15 "arm64: defconfig: cleanup the
defconfig" is kept in this series purely for review purposes. Since a better
version of this change has already been merged via Krzysztof's cleanups,
this patch will be skipped once the review is complete.

[1] https://lore.kernel.org/all/3e23b0c6-6968-4c87-8d34-f44b8af1df82@app.fastmail.com/

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (15):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: cleanup the defconfig
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  15 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 861 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
branch: stm32mp257d-microgea

