Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66D1C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KsW8X9WKTUVjkLOMVLun4STQMn5HssaiU+p3WX0jzQw=; b=dlJ/Tf48swiLUf
	Xvpjbq6DtmRbt5GdUVjK0RuMrY2pxt+T7eHb37daYps21gwiWVCrzOvOo+7h9Rp/dfWsIDxbLicRP
	F1TcpFgq2lmX/M2aoe4ICdnYs5GYH+2bzk+iHarX/vU7UjHDlJau26cIdT+e+KHRAv+ds02q95el8
	7Pv0CLxtIXo5W4CmkrWKq3dHvVHwon9H8z4kWpzSscrPpa7edjwjdltRy3faQ/+k3JtY0V7o0J3fE
	BBznnIV0wXaobkyby4FuFT7maYAs6I0OE3IdixfbMAUBvMKbBibG94FSipxwAz5rHseYCZzNJcakW
	8GI9b40IhoC7YUJ2KgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tey9p-0000000Fplg-2ygF;
	Mon, 03 Feb 2025 15:14:41 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tey8U-0000000FpUH-0Ay1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 15:13:20 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E560EA0E4F;
	Mon,  3 Feb 2025 16:13:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=KsW8X9WKTUVjkLOMVLun4STQMn5HssaiU+p3WX0jzQw=; b=
	ZkOGUhdEZdk7nZcdBpWIynCii/QLezGnYiubpZmIP1nbEsFPV/VrJIVF5IaJTpqo
	gEgut8MklY1FQc38+jyXZMvY8iSMwvUu8b3dmlTU2nwZm9MQZ9SawibxDHCgXCFu
	hz9epWJh5YtWkNHRY3uaUToFhOuyZ6dSRUWuBId4uqIfXqATAU3lxbV2xTEnzFk9
	Q/8T3i4DVAFSfUrNQkheHUOu0Sf2Y7jvh+IpzuQb74CCMYCjHemWFctTXarz+f75
	2t3Nmx1hAHSRNua1pk71sr7Fy7dM6YxjkgwbWGt7WSeBLo02Cjyzc8lqhhlGN9CD
	Y+c+qbXBEQCs5h71oaXWm0qk0jd4KZqRVX/zqm20d8fOhwi9y21mR4G86V9sifxH
	Yw/8tVr4gXcdrlXSn4KQN/Jd3s+P5BoAljXMkUuutV+Vdn5kGPk+cJPLvRwRrEAB
	GXZ0kTJqgCfbAbzF7/I2DZfpYuu6+cP4ZHXDQCDtqoYFref5apShFiMGy2XvPUyx
	bjWxjJ3r0FnMfzqHGTsdGvjK9Ql+e12nGZrBPNn3FjTKWzkzeSs6bLOKi44jwT7A
	244J1GsxeZ//J+g+WT4qgGfuokPC+/hyJ08GdthvOUzBe+lpP/cPbDJ5AJaTfA5Z
	3kqVPMLb0rYebPocaKcZaKetv4LYylaj2Q0PqdsThBE=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH for-6.14] spi: atmel-quadspi: Fix warning in doc-comment
Date: Mon, 3 Feb 2025 16:12:49 +0100
Message-ID: <20250203151249.79876-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1738595593;VERSION=7984;MC=1580607873;ID=182239;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852667064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_071318_541717_49DA3014 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel test robot <lkp@intel.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The doc-comment for `struct atmel_qspi_pcal` had a typo in one of the
struct members' name, causing a warning with the `W=1` option.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501311707.Ltj0qXse-lkp@intel.com/
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index abdc49d9d940..d8c9be64d006 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -235,8 +235,8 @@
 /**
  * struct atmel_qspi_pcal - Pad Calibration Clock Division
  * @pclk_rate: peripheral clock rate.
- * @pclkdiv: calibration clock division. The clock applied to the calibration
- *           cell is divided by pclkdiv + 1.
+ * @pclk_div: calibration clock division. The clock applied to the calibration
+ *           cell is divided by pclk_div + 1.
  */
 struct atmel_qspi_pcal {
 	u32 pclk_rate;
-- 
2.48.1



