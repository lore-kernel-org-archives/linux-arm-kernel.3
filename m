Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FA9C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=; b=1SyPajgdTF5ih73NrFKkJoD/nA
	ECxpgnDxZ2uenKkU4dmqvPJvCLKqLRhhQnRTXqyfnqepwZgqZoAcG7V+/ds+1L9ViILgCA80ugQXp
	/m0dFGIVFD3oNMxQlYeWEIuRfw1GXWO5fn26ZjVSEWggF4Ksb2S3MIH5tLPYUdMuKzKe/BHC/T27V
	NSBttjGRHpLciVv6hdLudH8C+8dKBXOZMAYGBnuuwwLJevqvkdTt6CBQLo+znV9iGh2Tv8E2tYaNr
	x1V15petWWl+Zy+jMd367XO6x21wl6+qZvxzQocUC6Iulxm9y/XeUWCW95CwqW5iAf6dEPtFDU54q
	6FPYxQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXL-00000001Qqj-0IHw;
	Fri, 04 Sep 2026 08:44:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXG-00000001QkW-0T8A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:38 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso874124a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511473; x=1789116273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=NQfUNfqexw+Of+wkQA/CdkLZxXI+EeV0x05SWAb/fpvaZ2BuhkXPMlg32TrtgfxqL+
         aFAEOYAPyM/ucG8IIqnqj0R9831GakOqrQcDffbqtsZVbV8rMuwySYJ2dhNljvyfOQw2
         6G1IECNaNOggfZC9A1LMMoX1ksgU8SYvUphgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511473; x=1789116273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=TSW5BMOV1bMZY+jOTPqgCXBkeJrBhFV4eiXCFdg9kEYbqC8a9HU2+VnInSjK31YbV0
         ck+vF5WXrU1eFIn+d3LbOxL4pYl3WQthHDOW5g9Kkp/1i3+nmBcLnVbasirwMa2sNuCS
         Zhe1sgKyVCdHpXtvMdnnqPa8g32UE9yNCy0bl8Y1WqXB2UbkV2y2ceGLUYfxAOUOCPkJ
         AwbRaBxPs2NPQZVDy3LeD6mI0vGbH3IIpnrvgwKpi6DV8hpigr0Ps73z7J2YW5FAPfPP
         KDp6kk/v61Lza8Z7Qopk+Lh7vlMBmx71MmIlla6iwFS4ikbxLw3iYy79aUa7lBNLcqhP
         domA==
X-Forwarded-Encrypted: i=1; AKwUvBxkc0QFXlgzSWMO2TAM+lsGwXqF1ai9DMRfzwDZZOEc6U+qKpGCiI9gLLhdUXSEMN4Qzb0g7ObYQAUX1yXNYhSI@lists.infradead.org
X-Gm-Message-State: AFuF++n/UfqFFEHdQcERc0pbI/4w+xuVpRboCUIUwpn5vjHW7HMHgt/F
	DxnGEhUPpLGEEhJaqIoAS/c9elS3KpQBocM9C+9P0oFnyPw80vlfKJJPOO2GPu987g==
X-Gm-Gg: AYBFou2mmON+nKImodunhXluIETiypNSUkMNLpR5LYxPqNme4D2g+iVGFqjt8mCxqIH
	g7BEhdzbE5gL72GQafVtDM00RONFeSXxPozvoc7GrQDzJXJzBLqqQZuMOf6UD4e/1XLXE37pcFs
	I0FrSEzUeNud/ZtPg/mjin6EY+FnrY0uS6PKW4AzzKRdfkl1zDP+q0uVzTYNnIyQTUoBbOl3Okm
	foXGGnF/qOuQO9hFYj+u7EqyNxtzF1g7mo1GCY0XJbTDNaKV7kekGADU0eX5Sa1DQzp+04R8wMP
	NxY8rUJfEwDXLYiee1aRQR5rYKC/iBjje7swZoA+IeeNC5YduqiQXHp7vOd96+rWnjY/ybFHGE/
	ws7gZmMpHFXXKpawB7RqlHscA46YyS8qmLhy2fbG0meYiIzLCl8P6bykaNXH06P7y86XeXqNAj9
	B+/mxNTlnGLg3k/GA73ymiFOgbY3Is3/V9XH5ITQOBZvdaSqfZu6Cf45YF2iMsu+qoWAc9dBfFU
	hWQp0oAvQFWx1OT3Uc6dVSzelTzu4pT/OUjv3/rmZTPMzYfFE2Qhjyl
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr6523995a91.10.1788511473366;
        Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:32 -0700 (PDT)
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
Subject: [PATCH v8 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri,  4 Sep 2026 16:41:53 +0800
Message-ID: <20260904084158.1341550-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014434_159794_0AE95FA8 
X-CRM114-Status: GOOD (  23.45  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index 987faa9f3b3b..f7bcc8bb4c77 100644
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
2.55.0.979.g7e5102b832-goog


