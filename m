Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A2CC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=; b=PYEMjS8AB1pGIG99eszVmN0DOi
	n9z5x9HCuPnb+0BheoZdt7EmFvDqKUs7EGlhXrXQbu4YWxHGq5CmEmjl2hsdehsyD0PwsjrjFJJ+a
	B5v1GKcuCWJJsq2tpE2RRtDBprwEMXkzNuSoIRxSBt6FNKrkjWGT43nNsblKxDDD15GR866J4ew2w
	b5jBcKYgYu12tHl1YPFYWSpKKIfnPZhSjOYQEfYq3f/YV1CJOuZmcltqHtlFjmfVB0tOImeZF19GX
	nOTrmN28cTVu3tafow77BnyosGLH/YUnyF5AaP0jh9xgRrT3YPi71oYqPTaHg9I7bj5D2tAbxf0wo
	0GvVTERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBXR-0000000FrlX-40Zu;
	Fri, 24 Jul 2026 08:45:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWv-0000000FrKb-2tjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:19 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e041ea211so163171a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882717; x=1785487517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=E+t9VxheiExBGWSrk72KBP3VIbyIWwGTMrx/07h9l8zJU+5uYVm9ztWLnCV6gUjrX+
         2oLX5Nxa6cITUBKr0iqa2Tmeh9nXT7SkP2+iNQysd1dmB68n/uydVvUbPuJKXT5VGyGE
         3k1xuvy9421fwdGYZ6OJBpAvjAj6VkU1oVMSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882717; x=1785487517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=GInzjVbOzXNx7hA5KkjDKh8xuMPgc+1/tInk8Bnnmu9KDgWvlLJ9eL9dFC4GHKj1ss
         97rK2unw6J+Rj+9DGbdZv2XFFWDKB5nED49/WxAhTjIHOIe4JWIA3/3cCVmlusdQQEwp
         W9Hr6bwf/fqovN4TJmOQ4FcK7ZeYtwwB65qHQ6hT4NuTscPcflaTAIDylw5oaf+iDYE7
         Nisyg+/cGnwFLnCveYCGZhbBfG6/6hCmQUcavbI3WhG3Rm4Uw1cRFnwAAiH5+B6gTR3/
         +mHRpQ1wFImWhZjEobPSCpcCHn+bUTdu8NZ1VpuzPHVKa5uNysPRp5oKKb3pDRGez/Rs
         hEvg==
X-Forwarded-Encrypted: i=1; AHgh+RqP0hB7CTbqTaf3fyC8A5lnDPHI0UVbe74PH70OHcGGMvU+ayy6yrSUl5v8O8imoH0X9ZKjyOtllaBTP7NIZWIY@lists.infradead.org
X-Gm-Message-State: AOJu0YzxVSIWlBDEdeP/hnLtAgPRLO2nS/fZt364vK3QiIaXAN9CnSFO
	pHWrzSoXveCZt9XU/4L3Q/wAWl80P1tBOoABUmGhP8v0olOaAzPlmZQsh/4q3cz6cw==
X-Gm-Gg: AR+sD11QQe3CK6Vs/0xORnQQtE1t9QFlqggxuP+bk54m52Rs1zEcJ83qkAfet5ejwij
	OXd2svBuMWbZQjhDBQ/xo9OzFkZcfM3tjjO03xpb08bcfUbA7mM4aArmEKMwtxw3LBlETpD+qCt
	CqZEkQcLjDv4K0GkYK9lct6N6i4MOZUcwQgRGusrGxLpYyaAYyCXo05OXRHSXpV4pIViv27ZtgZ
	JPrY1aw++JbmXcu/xpWkmO1vFeO5SPI+D2cpmT9YwKyNsu2t1w0fxBq3ZfTJpFLll0jYJdslx4J
	n2yDjHb2tgmFcVpQqMODrKLhtcyySRKovKVJBgqPHaiZz39Ip8dSS3Ai3TezZ4tvuR+MdKHd3L7
	L+RDSvZsM7VcTXKfIbr5cUuaGFxbttSHcVGVNybz+rNgMdvFaiV9eJX1TRkToXsTQmgqT7tPrav
	qDbUgQRhJ5Cx22YDgaSOKmU986mjvtpqNOxuzlCrpGURXSE88IsOP6nhxahSU=
X-Received: by 2002:a17:90a:d64c:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-38ec6985236mr6392312a91.18.1784882717037;
        Fri, 24 Jul 2026 01:45:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:15 -0700 (PDT)
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
Subject: [PATCH v7 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri, 24 Jul 2026 16:43:23 +0800
Message-ID: <20260724084328.3943997-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014517_771354_0DC486B9 
X-CRM114-Status: GOOD (  22.94  )
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

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 693b0d33f8cf..56e4f40e0480 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.229.g6434b31f56-goog


