Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A280C98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbBjtZiwvW3+ed65Dqj2P8+3DohWPWa2sAVoOy4X4uM=; b=APqH3EJdOtUHW73c+jHf4YjJ0X
	/pxz9HvJlsrfnQq82ezpM7tZ/MpGuboKweQWicpQlnTOXSWrQJKL2ug9De/bKbDdWz4fe3pWlgFBs
	7rs++OxKIZwERfw24X+SRbX5heOAQjWrXOkELQ7VZnbkkCu2bBlroSd/EwFtpfsFcANUJk8BbGJOE
	s+hxLLR/yPpYZqyA2YVqubZxaXwqFIP7u0mxLV4ET2Rnzi2+Gx+VYI/bTZeby/7ZBgTsPa8arvGBK
	oSzCBNsW0H0XB5OH4mE7zY5Wq6DuOKnW7EE/o7snIQZPpC47YwRSvdBHkKDORo7mY3FhkIjKvkGKd
	x7jv3v6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIW-0000000ABk1-2oUb;
	Thu, 24 Sep 2026 06:51:12 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dIF-0000000ABfT-0hMM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:50:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rbBjtZiwvW3+ed65Dqj2P8+3DohWPWa2sAVoOy4X4uM=; b=UwYG+7MfwAnL+GwQoqLTRm3NiF
	RzXKfdW43ZehApaeECIGs/G2lSEjFUYL+yn2F7iKvWK8flpOdwFGIyGsS1ezuGcWrolciOZIk/0wY
	RVffowucdAhZL3QOATt2W9lKwMYtI0NTUvXq28hEHchEoZ7PcblOz5q7Z1DgNKx0s1FHnl2xVJI13
	xrlO53SEFyzDbhqPXuXdxTnfOnTSKhyeeHtqiPxTZtIaWnHHY05l5G+1APv3BSjdaU+uDvS+F6eqE
	xeyh0ol1IV3RccMb39ephvbjTMd1tzyz1euuBX9kF4+99VScTIA2EhpUOT/T1fpXnAeu6Eouh5Mlr
	UVcKltvA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:54176 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9dI7-0000000AyGs-3vil;
	Thu, 24 Sep 2026 08:50:48 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	upstream@lists.phytec.de,
	andrej.picej@norik.com
Subject: [PATCH v2 3/4] watchdog: da9062: Add support for dlg,wdt-sd property
Date: Thu, 24 Sep 2026 08:50:43 +0200
Message-Id: <20260924065044.368341-4-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260924065044.368341-1-primoz.fiser@norik.com>
References: <20260924065044.368341-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235055_380119_AC1B8FA8 
X-CRM114-Status: GOOD (  11.09  )
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

From: Andrej Picej <andrej.picej@norik.com>

Implement a method to change watchdog timeout configuration based on the
"dlg,wdt-sd" devicetree property. Setting the WATCHDOG_SD bit enables
SHUTDOWN mode, and clearing it enables POWERDOWN mode on watchdog
timeout.

If no devicetree property is specified, the WATCHDOG_SD bit stays in the
default configuration, not breaking behaviour of devices which might
depend on default fuse configuration.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
Tested-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- implement Guenter's remarks (code refactor and update commit message)

 drivers/watchdog/da9062_wdt.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
index 3d7bf2f351db..0c007847b7c4 100644
--- a/drivers/watchdog/da9062_wdt.c
+++ b/drivers/watchdog/da9062_wdt.c
@@ -206,6 +206,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 	unsigned int timeout;
 	struct da9062 *chip;
 	struct da9062_watchdog *wdt;
+	int ret;
+	u32 val;
 
 	chip = dev_get_drvdata(dev->parent);
 	if (!chip)
@@ -245,6 +247,22 @@ static int da9062_wdt_probe(struct platform_device *pdev)
 		set_bit(WDOG_HW_RUNNING, &wdt->wdtdev.status);
 	}
 
+	/*
+	 * Configure what happens on watchdog timeout. Can be specified with
+	 * the "dlg,wdt-sd" devicetree property (0 -> POWERDOWN, non-zero ->
+	 * SHUTDOWN). If the property is not set, leave the default in place.
+	 */
+	ret = device_property_read_u32(dev, "dlg,wdt-sd", &val);
+	if (!ret) {
+		ret = regmap_update_bits(wdt->hw->regmap,
+					 DA9062AA_CONFIG_I,
+					 DA9062AA_WATCHDOG_SD_MASK,
+					 val ? DA9062AA_WATCHDOG_SD_MASK : 0);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to set wdt reset mode\n");
+	}
+
 	return devm_watchdog_register_device(dev, &wdt->wdtdev);
 }
 
-- 
2.34.1


