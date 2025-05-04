Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD0BC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3GLMQvVURueTJUfJOlZy1bzDlyZjB6YxPVmLXhRiwUg=; b=NL8gtPb44UdypbOs/0iYqSGxbR
	oYvhQzcto48m4fNLQdHlMsPMuAkm0/IZiKvxRIBXgEsd3JiEqFE7258OGjcv7F80TVodV2RCuQlDT
	u2xoivSsBHE3wFOr/VPErby2zKoMAUYdsF02xfDWtl/tyDRFXkZliB722XV4himXkjf70bQlWXsvc
	uywsg9gcWUy/Rc4JXk2IAAGagHu5p24JhR/5wJnNs/FIPhaZDLy5AQa4+HIFJYwHsycERcUm3E+Xu
	zBJxBC1A7PWtTeOmyRu1VAVIuLtyQwcixxlNXqeWILoWAvjDvjeSOz8Fu6zd8rVBtHm/JoavE2FX8
	xwcjXFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBad1-00000005Pn9-0ElB;
	Sun, 04 May 2025 14:47:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBab5-00000005POc-1cwr;
	Sun, 04 May 2025 14:45:40 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so6582919a12.2;
        Sun, 04 May 2025 07:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369937; x=1746974737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GLMQvVURueTJUfJOlZy1bzDlyZjB6YxPVmLXhRiwUg=;
        b=i1vW8hgXCVk+4896WLgwZBlNOHGa6sQ0RAwR90UUnzvOJN1uZNFWeGNuEmUVBd9x80
         iPS2lbqxtWZP3qu3M0RtAgqmhdYL/nzW95mwfnIr3hNNPIxLIFJiVh/Dh6vGUhl2OM5R
         VA47sLqvvXaovjEfZFw9XLerooRPHjSHNtjmGNh0YLJs8+qhHjcCAbLJPqcj5pZar4QA
         PR7SiZ5miZPXxMX6N8JDbuHFWha8TSWak8glv6Erl1+71WDSeJjGtH+FbY3S3yo2fQra
         5bDW+0GEtomxkMkWn5UJDq3t1duh7vZJ4wIqozu44Q6kkbaVfGvfjdPFG2Z6v0Dje4bn
         QKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369937; x=1746974737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GLMQvVURueTJUfJOlZy1bzDlyZjB6YxPVmLXhRiwUg=;
        b=UY6kEti7F8RzwUYymwFViHzD2AatUS/z/W/PtAv+o+z8RCUnjJ8YxqVMlDuwMPdssZ
         Ypdwjsuf3969LbNZ7WV/KhhFEZqclacK4kfDYfja0unQa/TUZZRsJSgobGFt4Ooio8+0
         voJAfIQW0abPtC4Lee0fhMAnUnW7ltZjRGPCMVurOml1IV8I5H8kgNE3EkkWfTBsB8Of
         kEAj4yYmECKyzq1mb8GveQdPnLcF8c1GNt1mIkuDFDQH8NVujUe957Uw3qV2GOkjDMho
         V+pK0CHhEdYpzYORL02g38/x5bLL/v+jmeClOXDCuW9x8IO5NbexLd7c11x3D07atLHS
         Xv6w==
X-Forwarded-Encrypted: i=1; AJvYcCWC88xoiZ/67nQ/ajL9hBijIOBbjhtXekatXTz8AvvGBARnANUVX65Av7r93DCbuH0MvE50xIw+NwEtvpPJkjg1@lists.infradead.org
X-Gm-Message-State: AOJu0YwZIEZZRNxhnC/GtgWX5iOdaMYoi7AU+x+RYtd56c2Te+kXg+0Q
	6z8+nrmo10nOobN/1FR9fJtkP7mtcfnpE4PLz+d9rk4NchEXTnM3
X-Gm-Gg: ASbGncsP71XGNyNlJBoFLNIPXR+CO2r2YwYcMU+eEz3RxdoK3z3bO68dNgjYT865zFQ
	70PdmIThMCSsV69YnmgmxQNIHloMEEjmTU82as8UIaR+X13LWR3+chvzHHkClI7geyQx14f0Iyn
	EoOis21AbF19cUeCpSwTIINf6a5cjdGmss4PB1OTWGlRiGgSZe7ktRq/nmt4gGYjoVPzWnB4Bp+
	9BUU66cOxvxBhDG8l+Q6EHX2IZ1PNpZJdkrSAmkcMyAsusxhMqsjilrEcyAa7biKpv0qoVUe2U6
	7SFrK/9QSiaioheCjoSs9+n8SUmLATobtBwXCg7VgxRSdtdbndFnKVHyn4HPTXUVzdj7twOlcE+
	eQEFe7NQvAF6A7m3G
X-Google-Smtp-Source: AGHT+IEC43jOF2l9Y+pWj7JP3rs0bfznp+nHLXmOJyVYTaj2ERAtZaGGWdiC4aq9yrCcx89V7OTvYw==
X-Received: by 2002:a05:6402:3494:b0:5f8:36b2:dc07 with SMTP id 4fb4d7f45d1cf-5fab057d79cmr3440722a12.16.1746369937074;
        Sun, 04 May 2025 07:45:37 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Sun,  4 May 2025 17:45:17 +0300
Message-ID: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074539_434691_F857D661 
X-CRM114-Status: GOOD (  21.59  )
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

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.example.dts
  DTC [C] Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.example.dtb

Best regards,
Ivaylo

Changes in v5:
EUSB2 changes:
- rename binding to match compatible
- simplify binding name
- indent binding example node properly
- add r-b tag for binding
USBDRD changes:
- add r-b tag for binding

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

 .../phy/samsung,exynos2200-eusb2-phy.yaml     |  80 +++
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 627 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 965 insertions(+), 471 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-eusb2-phy.yaml
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


