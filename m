Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33C1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R59ctZio0nbgqHRQ4JYecMwYKlS4svhcqsOXKq5o7ro=; b=KuEyRucx0dEhAtWHic7zH5ORSB
	Ya2AaU2yq1qFK1tRm0/bn9OWnC1+h1vlW9cPg34Hyujp4tjR3JOQbydUPNkZkvt0auRKLjOx18jDL
	Ggv4Y1hgpCFf3IV3kEeGdem0tUq2BAPu8fIDGjgvU7RVfWBcf7LM3BFvh8U9hSNmM4osl7AM9MOsX
	qqqHl2La1HLr0G48y0XlvRPEphoW/jyq6anntPKyy6UMoT2aK+W3hbbhB0/y2MG4TQTnMbeY+TgZV
	w+LGPOpSdOKa38Eo/6I64AWZl1AQ6zS9MzMuCHKudQefs4bhNbp0BuiG+Wdx/e8QANiH4xIImEoVV
	Dzz1eYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOr-0000000EEXB-0jnm;
	Wed, 15 Jul 2026 08:55:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOi-0000000EEL4-1i6S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84830c774a0so1411011b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105719; x=1784710519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R59ctZio0nbgqHRQ4JYecMwYKlS4svhcqsOXKq5o7ro=;
        b=T33nPbBTcD1AT/aT6J1SYuuDLHrczwFFAGJxpVDIqoDv0vs54Aqv+IIwTXB/xeFCVY
         3nRf1smNhPrlnDfBaSm1NzMWXjttJYmYqlz2RWkaoXVgrW4BRLS0K/NS3XfpbswiCDkj
         xcuq3CfRVm9uMEOjNBFcZoTCUNdfpNppuDvys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105719; x=1784710519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R59ctZio0nbgqHRQ4JYecMwYKlS4svhcqsOXKq5o7ro=;
        b=CdhxAJ1mQJSY1fWGnvGMsbIFZ73TSNCbQXIuzIdfAl+dx5oRxnMnmHsvVY1G+ObyrS
         NBXkhzhQHjYAq536KZO1jHQ/DCr5pjRQ5lz+oCoFyox4GnubKnejPYq+Ui1QkTvd9fkn
         g87C4jSaRCzxrKPpERoyYE4W0IgCW5yuvphF+37exnHNl8MbjOmEyfgO2MJB28XgnIiT
         3LXbkt2rci6CT+XYqS1h3AxLxDJ3zwnmp3eyhUGAyN/yUVMkruUa/jEp9h1e5+sS8UuS
         EOCItIcmo+DeYPZZZ2EptDu4MNNgdx1AyV1O0MPsNqDmLgP+tX4NU2e8+Bj1XXpROQOw
         A7yA==
X-Forwarded-Encrypted: i=1; AHgh+RqLE90tks38Oo2hlCYSgfZwKNQFJV4IWeGblyDYPy2c+3E5ZC++xifJCQB6ySAflppdzZsssq8ThjCipQj9Cm1G@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq2sYdpIEf08CwJgep1cadd/bgkwQyIxfC0CRFXcfx4h1ZmQbQ
	XZyMRLfKmeePnJtJKe4vmPuFtg5I4+ML50E62T6+u0vbWhS1v7Tng1SEtYRh79+otg==
X-Gm-Gg: AfdE7cnfgdIiYvPX6UIwLuc6D73qEGN5M6wfb1Pl6HUEbtUgThR1UCa0Gxn2wWuNs6l
	I9Lmg5dRBTkBV9ayV4oWG1a9k8lG7f0DENtu5e0Roktp4cRO2ak/teUiQJFq+dxTbccVWlnQTSe
	6eOnEWNL1nw9UNa8dFw7YoXC3aZVCgxVKRqXl/EfBwsZyNAY523akuFQIZk3zCYicBH07S/ZXm9
	px4VDtsVjc0UqJVxnFhhkCXR4Kcs33JqlmSDj1i8iAZkha/YlTSuf4E+SNQMSKtM63l/SwpLeeO
	zQvuWBG+HhLLvZRwfhpG613sS4mOeD3mMWf3bnAz5bwPMSdagBpnsxbDxyR7ALS9ISiNJ/Z47zx
	sGUwFHHT4SviHghcPz77yE8zmxtX7nkPN9Bjjf+hyxz7eylzQvYqSvXo8LW/GhFYcxjzXnCaq8u
	5CSaoqmmNzG/V6Msm135S0hCHXG0qvu+O3ORiLZuf1FtHiDab6tMFfkTcVSYrGqX3IUR3Nxg==
X-Received: by 2002:a05:6a00:ab8a:b0:848:48e7:437b with SMTP id d2e1a72fcca58-8488985bd87mr15890965b3a.69.1784105719486;
        Wed, 15 Jul 2026 01:55:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 13/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 15 Jul 2026 16:53:43 +0800
Message-ID: <20260715085348.3457359-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015520_537097_C6E413EA 
X-CRM114-Status: GOOD (  15.90  )
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

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 691cad0a6dd0..693b0d33f8cf 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.795.g602f6c329a-goog


