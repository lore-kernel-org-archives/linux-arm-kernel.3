Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B0CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FKPUmtrZifzHzdD4ujiZUV2ha0V1EuD2HhlEVPXjoTI=; b=hzZTu/+jErjO70Ee/6FVfshuOL
	37DIEF6Uw69pHRrF0cK6AA0jbbhbYcYEiV9HrKl84RWNUtBP2/n5xeF21F7oJRja+KRSAqQtQEoIQ
	brRbdwytjFRfSD9JwbX11VX5XACJJXEvN0mOnHGrJ1EBH1J/a8tT/f9FpsGDhYFBcwcdFGC5/gfm8
	+0L1/AVX7T8qvddA3trocxbXrVf/AA33StxxoGnn05K7uaxedgn2QLqqOIbBR570y0mbMY+T1mu76
	J1nyHKNdCQpdw/Pkkg28iAlI4qxXhjZO3Tp/PGc3MMAuTcstJfu8IZIvfL2cB71BDzuDfwbVoPB6S
	BqRyuPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB1h-0000000B59W-15hT;
	Sun, 23 Feb 2025 12:24:05 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0D-0000000B4po-2NMc;
	Sun, 23 Feb 2025 12:22:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f504f087eso2914566f8f.1;
        Sun, 23 Feb 2025 04:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313352; x=1740918152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKPUmtrZifzHzdD4ujiZUV2ha0V1EuD2HhlEVPXjoTI=;
        b=k+HQGQni65k01WwTti9XwJvmiong4XpaSED4XROtR2Urkf56cw5jazxjFmhP+YLFER
         gFRJYiP0/W/Du+GXf21mGy+9hNZA3MNjOsLbT8wGpVXBDSTVXpLJPxu9kaPD4cRxsHiS
         Ktk5oJ6JQ3L5MFBIKm3fxZutRRMpwUaaT5kCCHkmUsFaycXxIRB7LxODfwXTj6sifBrW
         a6ZVbPww+tzTUZG+iK05x4vcVrYR1UkDvo7GtC2vJ2H2e0RK5XVBe5/OwckZuydgmTnl
         mMDsgOCaI50MF7qhnsP8IEwYfAJDUukSPu6gTgmWz3O3Jem+HKazweLogEdhSnWCEvuv
         s05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313352; x=1740918152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKPUmtrZifzHzdD4ujiZUV2ha0V1EuD2HhlEVPXjoTI=;
        b=EUNKgVBlbx+Wc9pIR9Jp8OKPMf6xC3Lb6n7H3NIMNs6xyRv71758W5iVI2s/ivyEJp
         TZSsL8I3o+NU1tGJdNS8HwXn9vDxkgW1pEXcGHvr8HNNsF2uE4Rngq+bTXK0RNjkzFpq
         vEcd7LsJi5bURiHod/RE/xfstJoAWM00f5jIqCxRPSKgp8MRxDCJIg8gTS6ZEjieI8sn
         i1hJ+t36CmWIB10bgl0wOy9Ye0BcnyQ7qW7VZt77ko91fChNO5IMrJlmhw5e9BfJOW6H
         7Ht+Ia6S3NWzKgRM/K5nevl2rdmFXxiD8unbVlp22Pm8neLUeIAdNtj+jsUd2HCf1Q7d
         M3wg==
X-Forwarded-Encrypted: i=1; AJvYcCUvl3kX22uwW1o6JPoPG44YjUzPzkVhZo3/Br/ATTAaZs7zldNIbU4whliRjOa9aMmFiOrwS25etxdz@lists.infradead.org, AJvYcCWmea3y4ujCuXlI2usWO+/0RoCVmKRYhvsfodgc0PCiaW0MMWiqobp/+6rkUWibQxAFi9dxAnUiC2NTcPzBaa+X@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwpc6oXPdtybGUoydvgqUY6MUwgHBwugDyT5oxSJPDhZVa2uND
	523iDtMYPhyTloBIwtXbZOPPQMPwT/A6+ysfEF/lt1F9K7hxR6DtpH4cPw==
X-Gm-Gg: ASbGnctwpR8b+mOHXaQhf1wWcFyRZyB0t01gA/zvUmzfl3Gg9LL5F16Q3MtTdJg8fhe
	SI7rqaA+6LhzQkTpAxuGoEA6EWpL3gAJWnsnZ+L4VwFz9sWn69vram2wFXrtKkr/m1wH88craCN
	fLe6yjK8t015psLwRNtL6ZD7TcCb2YQXGH/sbTeFHIj5ssAae0n1bSTo8HOy9gaqMartTiNTXXK
	Qd5M3btjdGK0DtoN4JX5NagNWZOZmWx9FMw+saMdUBTSye736Qpyc2bu6YRxginJg6qfFcz7sE4
	tBemxLgUtLYArM3up86XaSUlLOh9em5/GqnUptzk4Ft4lIPM4/hJFHSQ452mu5kTftKoraMY9L2
	VNQ==
X-Google-Smtp-Source: AGHT+IFF0Ys8iFbS9iVVaNpCOkfbWSsfnV1SQ/+3vlRrKKwWO9igs5LmwE4oSfElk+6OGzdggA5aVA==
X-Received: by 2002:a5d:64ec:0:b0:385:fa26:f0d9 with SMTP id ffacd0b85a97d-38f6e4be4c1mr7603763f8f.0.1740313350463;
        Sun, 23 Feb 2025 04:22:30 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:30 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sun, 23 Feb 2025 14:22:19 +0200
Message-ID: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042233_621421_8867B8D4 
X-CRM114-Status: GOOD (  18.09  )
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

In the vendor kernel, everything is handled in a single phy driver,
with helpers for functions outside it. Clocks and regulators are
specified and enabled in one node, which makes it difficult to
separate what clocks and regulators go where without access to
schematics or TRMs. The following gates are defined for USB:

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBSUBCTL_APB_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBDPPHY_TCA_APB_CLK

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USBLINK_ACLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_USB32DRD_REF_CLK_40

CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_CTRL_PCLK
CLK_BLK_HSI0_UID_USB32DRD_IPCLKPORT_I_EUSB_APB_CLK
CLK_BLK_HSI0_UID_AS_APB_EUSBPHY_HSI0_IPCLKPORT_PCLKM
CLK_BLK_HSI0_UID_RSTNSYNC_CLK_HSI0_EUSB_IPCLKPORT_CLK

The vendor kernel specifies 4 regulators, 2 of which are for eUSB
and the other 2 for the repeater. The rest of the PHYs and the dwc3
controller are on a single power domain (hsi0), so they're most likely
sharing power rails.

From what I've managed to understand, this SoC has 3 PHYs for USB:
 - a synopsys eusb2 phy
 - a synposys combophy for usbdp and superspeed
 - a usbcon phy, which acts as a "controller" for the other 2 phys

As Qualcomm is also using the eUSB2 IP, the approach taken here is to
rename the driver so that it can be used by other SoC vendors as well
while keeping compatibles SoC-vendor prefixed (different vendors have
different implementations of the IP with different register maps),
add support for exynos2200 in it and introduce a new USBCON phy driver,
modelled to take phandles to eUSB2 (and in the future, USBDP).

A new USBDP driver will be added later on, so that pipe3 and super-speed
can be configured.

The USBCON binding includes a header from the clocks [1] patchset.

Bindings have been tested:
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/home/ivaylo/linux-devices/s22/linux/for-upstream/linux-next/Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.example.dtb

ivaylo@ivaylo-T580:~/linux-devices/s22/linux/for-upstream/linux-next$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTC [C] Documentation/devicetree/bindings/phy/snps,eusb2-phy.example.dtb

Best regards,
Ivaylo

Changes in v2:
USBCON changes:
- drop unused header includes
- sanitize the binding
- proper init and exit power management
- shorten some variables
- unrelax reads and writes
- update commit description
- remodel to take other phys
- drop specified regulators as these are for the repeater
- make the kconfig description better
- general cleanup
EUSB2 changes:
- merge the previous separate driver into the qualcomm one
- drop the previous model of taking usbcon phandle

[1] https://lore.kernel.org/all/20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (8):
  dt-bindings: phy: rename qcom,snps-eusb2-phy binding to snps,eusb2-phy
  dt-bindings: phy: snps-eusb2: add exynos2200 support
  dt-bindings: phy: add samsung,exynos2200-usbcon-phy schema file
  phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
  phy: phy-snps-eusb2: make repeater optional
  phy: phy-snps-eusb2: make reset control optional
  phy: phy-snps-eusb2: add support for exynos2200
  phy: samsung: add Exynos2200 usb phy controller

 .../phy/samsung,exynos2200-usbcon-phy.yaml    |  76 ++
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} |  70 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 677 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/Kconfig                   |  12 +
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynos2200-usbcon.c   | 250 +++++++
 11 files changed, 1085 insertions(+), 462 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (57%)
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
 create mode 100644 drivers/phy/samsung/phy-exynos2200-usbcon.c

-- 
2.43.0


