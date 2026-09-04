Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34BDC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXiJKGEMuTwqwy42qG7uMnjSfbdcOoA9DAqQks+0PHc=; b=aHbUDgRRo16mMaCH8NPxCFXj6l
	JiBZUeZ+MGXoJdV9IVK7yonYkl6w/M+1csDyoMpG0EIYSTzf292via31vFjey6XLFSaxDhwQ1fkaq
	ju7i8R+i6uj5Cetz548D4QjvS6B6VjRL0i/p7XMco94RtmKvxCI6wHeTDlPx20XAiHCtbgzUeCbMt
	Dl0zC7iE/a7ss04RC+8qyLJvlHE0CW9mYSgJXFjY1lQyVDLp25ZuQX7mbCmpBcwODVCNhvVwX44C6
	jjuSPJ9gGBs7v7XCiULgGpJ8wjC4p/rqXFrf5zk/3xPKB3ptNPZQeDe7JvFZLNfcWKz5JvNw4HEg9
	owYVgTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXD-00000001QgU-2oGe;
	Fri, 04 Sep 2026 08:44:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXA-00000001QdF-28ay
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38e041ea211so598061a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511468; x=1789116268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXiJKGEMuTwqwy42qG7uMnjSfbdcOoA9DAqQks+0PHc=;
        b=L3/iA+TOMAeeSXUBKYsTPb9BdZ4zigcCz6T1lpkuuYv9S/Uw3p6uu8nJMSLlpIwa8z
         vHVXndVwdRUZ00DbJzMVv0JQYLjfxTatlQn8mLZv7caPYKm+D4M13+jf9zhuRoWPJ6Jf
         hPKvohpDHOje22bwqUx0oN1/ntpkxxukNPUVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511468; x=1789116268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXiJKGEMuTwqwy42qG7uMnjSfbdcOoA9DAqQks+0PHc=;
        b=bbcFdOYF33DtWj2Z49Y6r8mv60wPR2wxq01ipnYLq3GfTxepX3CiQRH6Hxscc1wOyP
         D+FClUbAp+AD3mAghBIl4++1sITOuP5YPDVYBVK5bh8SwXXI/+iqA9TBjbjwdqkjSBRb
         vmRG2OoQImDxHt4kPcEaxdO5GzDu5Yji736ngBXDCXm9VmWsW9S9tr1wgb5OH7FmS4U6
         987PSMTYNXfH4drm+D+zQlNfKim9+Vt0yFrXbJU8PPEXnqzDwYKV1j2E77DqYgTHa7bl
         yyaRGrqcoNwh1rq8s4xQlz9E4/Dtgmja62JSgnrlG2xhHqjPk3Pst6g6vBPJzCIXyvK6
         3Rhw==
X-Forwarded-Encrypted: i=1; AKwUvBxZMqjXMfcxCYv+coFltuKmr/fa1IITX2Vy7f0zwDByOkXTySn99MoPRmfJTFKwKSFyfDxEZsi7sfxjO2tTUnDR@lists.infradead.org
X-Gm-Message-State: AFuF++mEqGbRsEnFeeier+9Fe8wqwiWlEAJg/GIB+D9VGYdsgyHLwwGM
	WSOtTkNvBfw5t+CmAgH92EvTy6PwBAFbgRdruU2yXjmNwaT1kERIbS2+359YjvSQZQ==
X-Gm-Gg: AYBFou237WQ3yR3YaL9DlK8l2Vm26yzvYI38N8NXZiUeFdxxriid9m6L1Kcdj7qdUIx
	JYA08gY1O94rHz9fz0uZ4FvpYZs5IYiHh/mXwOw5mg3cmu9IMJSlsrla4b38F7t+cgBBT1RslCr
	Am/DcBMBTSGsSayyu2bNxSpFF0ROy1TJvSy7EdCoACj7EHTt96ZZnRHw2hhxDfbkONuMaR6rljZ
	fxIf1C/2WEmeMl3rUYhWIALFuZVLKmBvHi1HgUKIIK8W2KLsYdbkd6AtmjzAB3/MQo8PVX1CN3d
	+bHGgW6phseqqUBlxY/6VZIS3hC2F4vs5mhEuPgY14s0z4Idb6WuENUdN2kpLbeR0KvhJ8s5Jtk
	ZRDbk6Fc+mezq2JHHGj2zXPb2P1s4TWulNSd4Al9gelw5tbtCO2PNMkbU4TNlI5ll+c62AAkv9w
	dwSQE/JLMIsgsBcY9E0ghdbHx35hTpCbXhye4qi0rZ3Q0aRwpNy2+f3wxRl8ORj8hl/ownB5SpJ
	YMGrXtbRZSfdD3bTtDkC2ADDOVYle7hpUOmXbjlgKPz
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr7479557a91.20.1788511467843;
        Fri, 04 Sep 2026 01:44:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:27 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 13/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri,  4 Sep 2026 16:41:52 +0800
Message-ID: <20260904084158.1341550-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014428_568771_F5A66C73 
X-CRM114-Status: GOOD (  16.07  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 43b2328a6661..987faa9f3b3b 100644
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
2.55.0.979.g7e5102b832-goog


