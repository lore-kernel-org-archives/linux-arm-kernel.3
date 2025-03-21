Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04585C36001
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=56J1KUMfPtv7YH7JwS6tnsp9uttP01mWHoJl2IMnwrU=; b=l7j17IXjE26rBwyTxb5+vabzkH
	IPp9XH97OzhvYMbe55zMWA8NXdArjc0q7zbAG5t0MZCuD9dRMCey/AxOPfW3Eks9zWQyb/4Sn/UfV
	b+z08PIn9bfmEQVNIPSnCz9hVxk3kQLyAbucUsfYc3Xk/ritxee3XKiBSHTlXkmENSOrZu0KEKdp2
	FiBxaTa/LxXw6h+gf4PxwEOS/tcR8uvgAyL98VO/CkAB8d/DNOrvL6J6efEcOVvBTta8KwFPmkEgi
	u/TfJEDofVALgOaY4gsLoF1izABbI2zsr8QcFqzYIfjQVxcoxVOyx7qbbu7igdRyWHc+Dj2MfHF4e
	q9rxBUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcvU-0000000F0sl-2wd4;
	Fri, 21 Mar 2025 14:00:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcto-0000000F0U5-1259;
	Fri, 21 Mar 2025 13:59:01 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913b539aabso1103878f8f.2;
        Fri, 21 Mar 2025 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565538; x=1743170338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=56J1KUMfPtv7YH7JwS6tnsp9uttP01mWHoJl2IMnwrU=;
        b=ZPL+J2ZdeTtNS1eZLPD649elDsD36eO1a9myRCgMoa6lJG3wOdoK7uqWP94IHdadMm
         7i6/OH9gJ0M/Su1rXBk+pWiSlv1v2Ljmehd14PIAWQvp1qU9LkSgndqWv/vL70yfyn9N
         AVn97v4m0vJfaacOY8BblAVmZ07sUreF/9gLVAyQ6AQ6HSSYxUPvO3b9xB5kPsaFuXrM
         Uvx/jGIluzNqfusyy7AEWJTWi5HbhfoNwv7JTko9O14us+EdddOTAwVpMIfeIGdnmT0V
         1Vzz1HedCgZAsSqaAtVUKLny5TqrTyAouk/E/m/T7Lb6qqN5P1g+/ZOJ/sCriBFtJ2yF
         /shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565538; x=1743170338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=56J1KUMfPtv7YH7JwS6tnsp9uttP01mWHoJl2IMnwrU=;
        b=hIh41JaZgqbAXAFIItkLAxt8CMtNbFlDAVqrraO6mfv2kEdbbqqWSUBcEyD3KwegDG
         yojho32ev8pB/rgNz/n3LisG8QmhRtDRVFeMuLxObYeiIsavze2w9NznF0t5/hkBh+N2
         pqqufYd7VMMvCtnkuGlrsc18TNUf5FO9OzIgHJVX5lvjEijKlqmf6f7SOQ0Wnv7q7Hbm
         T4XMgcn5Llif1ykrHzd/gPFVY+mEH3dTOoDp4dwgA4xmr16srYeZQ2H8DJ3Xs4KHnKMm
         V9A37mHEs9W1lXr4Mgqb38NMfL2l7ff7fF/QB5xl9DKuqYJLqRy8bqrcHsKlWeoHO5/v
         F01w==
X-Forwarded-Encrypted: i=1; AJvYcCWN1YjXZLM0a4UPbbtir7481SnUG88X1oe3C607vG5UR2w9Vzt044JTfPliasvtw8awMRV+kYcK3jMCW2w7RstP@lists.infradead.org, AJvYcCXgWRJ0Xmdol7udZzABjN4HtTwMvkNHFT65SKRHXp7jNr4uVa/2WaNB/vbU5iSW5D3LeywkF1Pqwovw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zQ8u97S5bJPsXT73zOiGwqzYr9Rh0F3ynWnCXx7PaWb0hqlg
	EoAALjfmi+hPCDqf525ko39uv0pqz9KnH1hN24hhUuFzq5WhnwOS
X-Gm-Gg: ASbGncsvVHK+pKXlUsltB9R7Xgp+kPNUQ76ufjkaefRP/mrnMMVA9ceMbTs3DUloG0D
	fBD8E26heHJjnaRpg/Nq+LH9YfWH8leaChJo1Wnlcf3pvMdWN94jopLQUOnbWgJ5psPp2i8uDZe
	ELg0qz2N7UgGMVsE833tRWNjXucCMjEkGNCbwId+jgzEfWNTuQS46Ex/b1/5IJv5dE8PPbUwJk5
	pbL+OROdseJFKuGPYTPZXnbj6rHndkiutPqkIx0l6H5V4tdYlKaqBCDTQKdQsNaaTZfG8bEpkoh
	ppMqQVNzkZ1Qpq3Hq00YcgofXSiXHzYEG73ZrAREHfSzHcBESETIxsr55qF0qXLP+aX1QUOMRze
	o7q8IDQDdhTxMCFDXxa93
X-Google-Smtp-Source: AGHT+IEmP2V8CO1INsAaZ0+BS6Z4Of0/aKLxKxtEMiq516SLKe67fIcVMhRIBPUe38svnpCtWpDFgg==
X-Received: by 2002:a05:6000:156b:b0:391:3173:4fa2 with SMTP id ffacd0b85a97d-3997f90087emr3132261f8f.5.1742565537889;
        Fri, 21 Mar 2025 06:58:57 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:58:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 00/10] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Date: Fri, 21 Mar 2025 15:58:44 +0200
Message-ID: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065900_300907_FF348B27 
X-CRM114-Status: GOOD (  19.40  )
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

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/phy/snps,eusb2-phy.yaml"
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTC [C] Documentation/devicetree/bindings/phy/snps,eusb2-phy.example.dtb

Best regards,
Ivaylo

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

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  38 +-
 ...nps-eusb2-phy.yaml => snps,eusb2-phy.yaml} |  62 +-
 drivers/phy/Kconfig                           |   8 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-snps-eusb2.c                  | 629 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   9 -
 drivers/phy/qualcomm/Makefile                 |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 442 ------------
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 227 ++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 10 files changed, 941 insertions(+), 479 deletions(-)
 rename Documentation/devicetree/bindings/phy/{qcom,snps-eusb2-phy.yaml => snps,eusb2-phy.yaml} (59%)
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.43.0


