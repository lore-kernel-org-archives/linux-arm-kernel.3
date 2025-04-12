Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pt8x7MsG2eaE/5Lv28czLfNqjIaR0J4hccDPHzanxb8=; b=JVteM01+zZRkuG6Ca4jaXcAZOG
	h7bqgU00SgDO80J6o7QkmrXc0hfISGzIA5pgjb2nDmxQhOMiae7/3zy7KES1AlgSfQwPZZYxm+Fr8
	QeelPLeCBOSgqq3lX4B+Urv5XNs40g4MfI/WkpW2qGNYBPvKafOXX8F0VZKno7FyIyL4Uakqm3AN2
	10jptjWiiDbky+fQbN2YoHvvQCTbC8cLjV0b4wcYaQi7bT2u8YwVvxFSTI0n3Gm9207d1JF+9ZLFG
	pW+mYppVRqoZHheFHor+b5iLtcykS3STUnk/QXX1wQCfncSjRIKwkx31GbwhbrMOI8L82jiJCrVPC
	5LMjE0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hT9-0000000GPNV-2uSS;
	Sat, 12 Apr 2025 20:28:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRK-0000000GOyt-0I9E;
	Sat, 12 Apr 2025 20:26:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf680d351so24006085e9.0;
        Sat, 12 Apr 2025 13:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489616; x=1745094416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pt8x7MsG2eaE/5Lv28czLfNqjIaR0J4hccDPHzanxb8=;
        b=fftlR6r6GwEvZtTIg4/VvZCznSszeUk3QSyFi95j1ntEIKRXYw9VSsovS4aS+WxwPx
         siqQT8q+VQ1nXTkUrFA18eBRiJQeaf6BCaWd3bPeTXqiaOtIoxj2rTJtcr935B3K7OiU
         sgD45acju62mp3B3lHqio2lmQQeXEPP08KjsVsacGrgWwleMX11GZPzZ4hhAPclI9XVn
         Ot1ntmu7PU9M2Q/RY8FaC2uOdxeeFQmvKKudl6T83XcJ0NnEfKTL2GKLcCKSvu2LPrvJ
         +ghAYqse6+alA7N58GX9O9k7Mctu0hbm8lXDArpQvEVKWd//tGodC8Ul/pFdNJJAOUXx
         hUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489616; x=1745094416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pt8x7MsG2eaE/5Lv28czLfNqjIaR0J4hccDPHzanxb8=;
        b=O6pzFaKJHNfgorchQ/ajDMjeIMKOT2+/gZ2XV3Vug3YWhvPeFytvWUyHMNVM3Xu8zH
         xZs9nyFcErQhDF7Wku1/6aBXC89oTPCJQS66WVH6iFZdW0At8X1Qexwl5OpBa9zLA8Xq
         Leywr7w28GYLC/Yzhbb2Z750tZnffCzST3Agsy3M1J4mAbbwPKo26WxrlYcA06ZEiSft
         HozCFcEfP25hh1/vqo+2HwS7n+Q50zTUSRrBB4UdfgQaR2qa4n8hJYXfK9t0WVS/Aor+
         Wpmns4hfuOVTsy9j0g3UzI2/BLHsRTGsgBxGN/UtcreE9r/8wnp7rHvXiOOIf1e5tiKp
         8IUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW47OTSRyTu2UbnGcxep5zNkFDOtUC7UeCjU7VTjXDw7cSiDzo9ujcOeT0vGty9b7AGAjQTE996OVX6IYy3ARNp@lists.infradead.org, AJvYcCXyx6RupVyohzK6xOjRjB4AwtsRUv/orQucBMAvKM8q3a/lKw+klTLQwx+YhPxjNBzq6yJSOh6nn+yO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn5W/erzak28h6v0zDcdB14hAwz2TXvE8I0NWzgw0oJusZp/S/
	mGgFDt1lAY3adUYT/+bboLUorL/zOOmL27DCi87C9921fM7ybCDERoa9Sw==
X-Gm-Gg: ASbGncsyCeGFT1K0sV48OBkWys1KbejEbjcnHgJIrTs+jzmw7yyXxQGkHT7JrqgCw02
	fN/jXg/F6QJncr02u8GzMQ0AlgBuQvApgtqiX+ZgZTXX9V4nFbdRmIItQetWL6rWRRp6CI++PNg
	wmY2vkmQDTDUB/BpYgkzE0bWKy0VamLNMT8xLzjWcjvRxvM3wlOQOch0v+JtYY8dwqfEBGyRGor
	bhWMqwNuY7cd1WLTnVOXveb73HCI2yOU0GkFEzx+oGA9pmq3yft5mZRnjStL0kjyr/d+UU20PcZ
	gR0KmkuOQwQXlrq0FPd1JneZyd9Fusm8EtSMU5/C/zkpufoFPeGQox1oorE2wt8idW/cgqGjdGA
	I20BDFQYFppCdqmiY
X-Google-Smtp-Source: AGHT+IFTVjJVaiqOWTJvgSlXy0IDFIlrMIPfubQkZClUTft4KlMYZTec77RN03cNec003jQi0G1xXg==
X-Received: by 2002:a05:6000:4022:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-39d8f2676a3mr8510788f8f.6.1744489615366;
        Sat, 12 Apr 2025 13:26:55 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:54 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sat, 12 Apr 2025 23:26:10 +0300
Message-ID: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132658_111658_8102C938 
X-CRM114-Status: GOOD (  21.61  )
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

This patchset adds Exynos2200 support to the existing eUSB2 phy driver,
as well as USBDRD support for that SoC.

The SoC features the same (as far as I can tell from comparing code)
USBDRD 3.2 4nm block that Exynos2400 has, hence the common denominator.
It consists of a SEC USB link controller, Synopsys eUSB2 and Synopsys
USBDP combophy, which are independent underlying hardware blocks of
the USBDRD controller.

In the vendor kernel, everything is handled in the usbdrd controller
driver, with helpers for underlying hardware block functions outside it.
Clocks and regulators are specified and enabled in one node, which makes
it difficult to separate what clocks and regulators go where without
access to schematics or TRMs. The following gates are defined for USB:

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

As Qualcomm is also using the eUSB2 IP, the approach taken here is to
rename the driver so that it can be used by other SoC vendors as well
while keeping compatibles SoC-vendor prefixed (different vendors have
different implementations of the IP with different register maps),
add support for exynos2200 in it and implement support for exynos2200
in the existing exynos5-usbdrd driver (with link controller init).

A new USBDP driver will be added later on, so that super-speed can be
configured.

Bindings have been tested:

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.example.dtb

Best regards,
Ivaylo

Changes in v4:
EUSB2 changes:
- make a new separate binding for eusb2 ip found in samsung socs
- fix order of tags in 03/10
- change 'SNPS' to 'Synopsys' in the MODULE_DESCRIPTION in 04/10
- simplify code around device_get_match_data in 05/10
USBDRD changes:
- drop double colons and 'phandle to' in binding

Changes in v3:
USBCON changes:
- drop the driver and introduce it all in existing exynos5-usbdrd driver
EUSB2 changes:
- split changes into multiple commits with clear diff
- add a commit to do table-based lookup for refclk
- clean up here and there
- correct the cover letter according to my new knowledge of how the
  hardware functions
- change commit message of the optional repeater patch

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

Ivaylo Ivanov (10):
  dt-bindings: phy: add exynos2200 eusb2 phy support
  dt-bindings: phy: samsung,usb3-drd-phy: add exynos2200 support
  phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
  phy: phy-snps-eusb2: refactor constructs names
  phy: phy-snps-eusb2: split phy init code
  phy: phy-snps-eusb2: make repeater optional
  phy: phy-snps-eusb2: make reset control optional
  phy: phy-snps-eusb2: refactor reference clock init
  phy: phy-snps-eusb2: add support for exynos2200
  phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller

 .../bindings/phy/samsung,snps-eusb2-phy.yaml  |  79 +++
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 627 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 964 insertions(+), 471 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


