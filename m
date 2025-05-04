Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47BDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=; b=Wpy8QrVApQ9lQc4noBHeqZmrOO
	NpQczQS/3wb9272LxRNysPCBv3KS4asikYtcq94ZN8p0zKa3O7euvGFjDmCRiL++s7eo+6VUQ1xy5
	ZXemfbYNVRqhAI3WusUrIwiBomSAtcmwdBxNuI6Zn43amAd12SxcyLZSatg2CIrKq2B0NfE11WcxK
	w5k+/cmKMgoPQ/l2NFihWJFuheAB+l+vJZJ1KFjqhUWyBWhjICh7ps+uxSAP4E7NLPd01tmV/slgv
	0qudAX23VagpcyTLFp21WhQTAD+SSdVUH1ghPn3Dkijrsc2GPmfipJfBdozDbQwILkw5DA58n4njj
	RVwkFZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaig-00000005QUj-05k4;
	Sun, 04 May 2025 14:53:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBabA-00000005PQ1-0LT2;
	Sun, 04 May 2025 14:45:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so6583044a12.2;
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369942; x=1746974742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=WFXlPGHkPdmeorFN6UsNOF9zQJZDrkyxDtpfOajbjiYdupfHKy2Om96qp9YEJ5AuTR
         zp6xOBgHZFmg7MzYGELUl6kew727d/KzVsAQfntodcGwE6swZ//awm4CccaNHwfwQkpd
         Fa0ox2tM4T9IHO1mEWB+l+ey/EM0x7rsbj8vUjmMIUfQbIzgQfnjoZcQDctfrUiCBqhs
         09ECta6DD5F3eqseKnyPTSyBZW33YkPYXEIExXb6cVeAPQHioyTVsGirtDiomn69Fknp
         aJN7LBEuZNoAhIWIGTdI2fssH/A7aPqKJrDLJMdKV6rlUUpWDS4Q+J8PBbF3H+Y1ThLI
         Q80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369942; x=1746974742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=UkUA38RMaxEnPGqHS5+U4UqPeS/vmJoWUbAWQ1TlYtDUobdOFDyXu+6U/JS1bFF+Kv
         cAepBy1r8Kypsa7Pq7pTYR6vfdntdWGR7Pfc0TICr7eAXQUQOMXcWbS9F3Qi3T/YCMF9
         ITEf/BzXBbHq3sim6v24N2TFgqWcP8TTYQxy+TGF+38wSMO6Ji6Sbz+aPIzM0Ej7Rd9j
         bz0VbwnwYzfu+uRD/yyQQ9sa3QKWICSarmtybvvyEilm3zbF0YetrKZzPE/Dzhf0+LRF
         sDvCL2WRv0ggoVKHAMpdXrOT5on05IzRx6RyDJyKguX649nh996vjSwm0R3xAIUL7/sb
         Zd1w==
X-Forwarded-Encrypted: i=1; AJvYcCXSzdwax0rOK4OUQJOjmJAG2144gOaROEvjbetglqkbBN24piOM4YIcRClWN5N9wqKf6VC+/7iWptzwEQa0ArhN@lists.infradead.org
X-Gm-Message-State: AOJu0YwoTefIAtgBRHTzi9ePP5X4tGUQ1q0zOz1J4RRHNsNb10h+TX9I
	qCzeU27hWyn5Y1mifXXrSQLiKoCQ6b5XLp1r4FMS1s9vEj4iqEHX
X-Gm-Gg: ASbGncujuxS4eOt2uBJxBQtT4B+mhJQfjxgmYMQvuaY+MVWpDDWBKLemeovanQrkZk7
	AGa3SICHXMlT6tz1/PmJ1ntn1uvvZ8m4QzpYyYL+NEEck9V0wTBMCITZk/xR5Dm2tKKaxicq7AF
	kv5GKNkV6z4yBNZwMnyXaYxqeaPrTVx/q3bDJWb6qjK94WspMH2OP2O+V4v+7Lvr6HiGgoL8jGK
	dlfhFlvt0BFcLwOuela9p8mtnKCtASbH3bW52p7XbiYduRHqgax1JqbaRKvB5A6Z8z9SHWey5k7
	Ot+vVmt7u5/56RozojjhrEyv/5yPHR9BiYS1Xj3pVJqIk39tUIYYRtBoEixkKVT6C0QXuOgHl7Q
	fwuWsGxHbKqfSNnwy
X-Google-Smtp-Source: AGHT+IFTIP5CBFY93DSwyT3Ei3OKqLDWTnScVRZxdsvibHCNV0wkkQGod1vGXCLNf31UK3SVtHlNWg==
X-Received: by 2002:a05:6402:4408:b0:5f8:d6b1:c3f8 with SMTP id 4fb4d7f45d1cf-5fab05763b1mr3722707a12.8.1746369942217;
        Sun, 04 May 2025 07:45:42 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:41 -0700 (PDT)
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
Subject: [PATCH v5 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Sun,  4 May 2025 17:45:20 +0300
Message-ID: <20250504144527.1723980-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_074544_122634_777D56E1 
X-CRM114-Status: GOOD (  12.03  )
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

As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
(albeit with a different register layout) in their newer SoCs, move the
driver out of its vendor sub-directory and rename it to phy-snps-eusb2.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/Kconfig                                      | 8 ++++++++
 drivers/phy/Makefile                                     | 1 +
 .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
 drivers/phy/qualcomm/Kconfig                             | 9 ---------
 drivers/phy/qualcomm/Makefile                            | 1 -
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe99..11c166204 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -43,6 +43,14 @@ config PHY_PISTACHIO_USB
 	help
 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
 
+config PHY_SNPS_EUSB2
+	tristate "SNPS eUSB2 PHY Driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable support for the USB high-speed SNPS eUSB2 phy on select
+	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
+
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
 	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442ac..c670a8dac 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
+obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
similarity index 100%
rename from drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
rename to drivers/phy/phy-snps-eusb2.c
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11dd..ef14f4e33 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -125,15 +125,6 @@ config PHY_QCOM_QUSB2
 	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
 	  USB IPs on MSM SOCs.
 
-config PHY_QCOM_SNPS_EUSB2
-	tristate "Qualcomm SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
-	select GENERIC_PHY
-	help
-	  Enable support for the USB high-speed SNPS eUSB2 phy on Qualcomm
-	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
-	  on Qualcomm SOCs.
-
 config PHY_QCOM_EUSB2_REPEATER
 	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 42038bc30..3851e28a2 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
-obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
-- 
2.43.0


