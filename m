Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A172C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=; b=BWiix/9kgqgLX5epht9SvX37r9
	crYEP1RwSdoQRokxD2rVkJ8YB/6zxXzefbzNLeG+Nd+vYZkD99onZfDdT+i9r54nigrfQsf71Dcg9
	fLGBSSrWGihE3onwmkCQPXSnlbCx5Dv7iRqcHBYo6SIlZevU+XLy0AFrMJKo0GN4wwsjEpzG1W+Bk
	wd0LfUqj91npJa1KXI7nWQkV6X0sNDdKlZaXoX9vtsoJtsMlrwZTwr/PlfPMmRGNRkn9hv5pYbtYS
	Y8S7Yc4iS0EN5fso640cgI1KusseI7T+wIuIQn7wsSGRY9cghSrvloFtHl8l6YipeKb9+tPh4+l6r
	dwO7NQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXV-00000006OMw-2ipU;
	Fri, 03 Jul 2026 08:46:25 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXS-00000006OEn-0WRd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:23 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so2099685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068380; x=1783673180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=f5S9bmXRp4bfpGBrPDDfkY/R4MVCGvL8A1M32Fpo+5Ei0hA0Uw0eDA6NxMIcdIxQZx
         zOW3UNxZY0bo9ipjrPK3+ZJ67siqYKQWdT2H9w3Xqa+W8jA0dgqJfe2+pp0jsT6vC+eX
         TE0C6QSWVAsQvkuI1gNgdWGJ5zHX17VWg9gIBIrnifHleZueJWVuD8xnecgBX8WMdPQa
         D80UmMbj3FJJBd8NAi0VwOQJ66yKcE+hU6FelCwaY8Y1z5NvC3QXN5QdU7CJHW1dydvV
         dZle+lVlamWJIde3c/nZ/EHvNjnQ72hgA8X/aiopaR8EYmVHED/jKmJI6grIlxgHfxds
         qEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068380; x=1783673180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYlLFsClo+FRePFneV/AibXEv418FTJ0Zt+d/hHSJLs=;
        b=WjFd5mCfaZizNy+Iz41MH/4vJsoVJSjlPHERerPkmwzf6PDffb9/P+Rjf3XTlkdNpD
         ED64XrbtwfJKkJC2IYOQo6mOrJrDAYJeWIpwZLZNzWLLyUnKDvaODlc3aOZ9LJ3amTv2
         Cl7EejaYyNlUMC7zebm+2spxr1fvacnWSI2b5nmWTQQWsG2u6t5/g/K1jo9F13UWsp7S
         pXXDwe2wWMUIerKaFbagEX6wp//ZYmYTOueecAVNycjTSOuK4d/jU/DiP1YaD7YjSrpR
         ueETZinfujn7c75gzC7LDb32d2MF7+weCuxpEt+nc76r9PYBo1fSNcwUDtWDgCYYWSlm
         ZrRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sxaNdHDzQoKEmkzS7MyRsJvA6Agu1WZwBcWYVHEn763PNhLsLxizmmrEpU/YqvdjA4d5DT4RfYO3acb3NKRyK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyxw6ATxjmEXSgY/pkjVrv8FMp2QPThzF79yrKkcIwrGBDdBdc
	b4nf/ZiVSaARR3d2hlQnp5fgpYTRzp2ExCIldDmQZZwq8F3EWNw8RjnX
X-Gm-Gg: AfdE7clEf6RgHAI9t9S31+8Pak9nSIeTc8ictLwYyqmNb38HdPRLNPc8ENdCa+1C8fs
	hBWLw0Oj4xYVpbLtmcqSh2eA+mp1P+wPqyauaZI1QOFDobKhn07+KrJ/0o82Xx0akQt4PDopd91
	t7ALFINPj8U2Z8LgCS0BZFYFI7eKZV6wsULx0M3tbjMg5fAU8ofPrVttTm2+AloO3ERHNf89BKd
	B7B8SyODm6QrDaMgNMD/oneVnXvYsr5oGnw6vH/UCF9uSp+ZgllRNKKmub9ojUsAS2UmJ0HucOF
	ix2ExL4Awl0RPLKmOp1La3y3Lvhi1yJhyvaOvYQSUEjIM02JgMdcsWFcCzIstcgFCBR2Fcez1QD
	vmsqzzF4FfIMMR4VOCAAO4d9fBCj4usT2LB2np73ETdkqKyEMVXDv0YxsqZycp8BAdFDVDx5RQi
	KpDODiCXDTzkHnslayjvFVrpbXW60WpkyeYdyY0ET5/PE6CYvzVlNxruJ6UXa12uJRY6U6G7vtS
	vzI9B+cxWjtmms+LKpNdBS+hw==
X-Received: by 2002:a05:600c:8183:b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-493c3df34d3mr108791735e9.37.1783068379993;
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Fri,  3 Jul 2026 10:45:58 +0200
Message-ID: <92d57a1af29af4b2e25d654bf7379cd96e3e5128.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014622_227177_7FE98A34 
X-CRM114-Status: GOOD (  10.41  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3


