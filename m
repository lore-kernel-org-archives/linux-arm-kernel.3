Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6132FCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=; b=pd1WlDLR0VZD18H+Uc6UVNR674
	2B1V7F+3nITYpORm21M09VuZipUHT/EEqtnGqJ8t8Yjgh6XChSPOImCbCmLFbx1PphVcnzfmekY6U
	rsbgdHjHXQpQMBR/Kpxp2j8qGqz/82R+QcuKiDccWUkKLfZeESa/aeEkVSEZMdrOOFDi7oM8kIMJB
	VM48P3/Be5xK52Oz4cH99ieQQmCVNTJZ0YfhR34TMUgXdWsdUTDeiUeXsPzX3Hd5y0XyRsjGIWtjc
	Tf1lkkzehpVbnio5F+ucIutup0lcBngzwp4uond7LqfF9elncV+lVfg4lxyT8mxl8mgsuKCrR3kZX
	spscnReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguc-0000000Eaga-3GNZ;
	Wed, 03 Jun 2026 08:25:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguZ-0000000EadN-2gWN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=; b=Vg8o5+JWTZ61wsbdUzhyJyq2/I
	ZXCkerck5ttKXWIgkdEabIVSzDIpFKXcLXG2HYNrPJewKAgDgsPrV6i7VoNEgOV0aHBTAyYXh5+jP
	3/5hS4xV7rIFWg9UNUgQy01KXkBNy1mIXjvSDf+92TMnT/d6sBC4VMRFM0EWfDysvhX5LCRlGL5Fl
	y8t4qE6UmUWNmroB98DBB1DZjaYqQ0l4lhNrli2VBtUoHo/jeGmqDc1eWWpm9fhejMz+syLCEiLsh
	v2kc4F2gxWmZb0IoYt2akQA/1Q/+tZYDJyCV4dhCHG3zo+i84lAvLQDQZjTMHndoTt2iYuPOSYgrE
	c8eSXTmg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUguW-0000000BZQp-3my5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:14 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so125033755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=iVh1vWM5LgUQb8vcjQnEgU+AoW/xzgEYsef+khSIggkvxHgc5n04ZPMjX+KDIftIQN
         BPVFL4AepV1VhasrH4vhox+09FY07G9bKh6lWCBYCE/IRlM2UGF67cit8i/8JeX2Rmeb
         EepMmozLvYqZSsGasVQACaIpaLadoxiS8BKCmdG3F8b4n5nFu/wEGCn4Bg3nWvSdopJ8
         GWKTm+mMZMr1qo1OoCMG5S9VIWkI0cg+foKjm/9zjTywW3mQmW1qGv0sURzJ0G33AOcB
         YH0xTJ1D0FbLw/xqjy+xX0UgGiX4/IzVpAwF6uSKArVF3K69Qfdv4RgSdZoDi++/XdI4
         F9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/0tFFJBB/axW0BcqywiPixOQX9mP9lGcY4jX95Arkc0=;
        b=MjcWxwXwO/KCR9/fAgMcJXi5MTsIDezgUIHxSXzNKV5aYPGzof/WlJ9NOTXOGvis2c
         W4Hi1lV7bPGXfyB0daS9X2/sPFtt/eGatjWU/M6N4OF9LIfYmkXyCYONHwqSsMITMfhD
         OtiWQvDztiDlQ1Suuieu53I3nS3gM46WFob4X1GvU5oJ+P7zvrNeDVK4cPtgNRVbfEGV
         6tMFMIq5ltbuAsfo8933imGMrZRkexQSK96SUPBc8qh8dGMxpOZCGHroMfGpzqPy/j6q
         6kwHB+h/PS7VTb1AleZqD/bIPdwMarB2gJFF75iI/we8Aq5DInRsdoCK6EIJobh39Y6c
         yS6w==
X-Forwarded-Encrypted: i=1; AFNElJ9RjQIOQFZUeXU9Twly2MBsxJkHQYFonulda2hVTvslS7eK2bwKyYZr0nRWkWcncRBBvr1JZLpnBtgQqp02ZEIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzYGHaLfsJlJOAOrY4bgOqrgI94q74hBhoj+3EdX2f7++Lkejv0
	wK4H8jiO8O+mHEwsxzR7DDLyEC26UBHAqACO1G023Zr1nVN2ZanZfcpsn42ISQ==
X-Gm-Gg: Acq92OHnNygV2S729J2y7BKonLHoBhFnkDs84ir8BZ786BuESe85TWSWpap3EhZIv65
	v+SFSvnhcVVgtG+TGK+CpiSrUv9XKcf1Asib5s/mmNYFnkatV64BfacIAlcQ9KZf5QUSeEe5Qnm
	IXk3swCUiWT1yaw9ei/I/lvmnd/zSN7lvLOg4a1xU8in7pEUDUlO0FsLmofggbBJjapRV6ZFMhm
	FUFiW7SNiEEBk3Dn7dNt8mBAIvqOSSRdRKGD/pdIMuh9AZ3JZIDrKJdTAALq7Ag9pkdGuLU+hfy
	JAbuW6sxSle9N9fLMpMhauvxv7CWTf/wDPzrGZbgdOhqJe1kiQpHn5OD8WwKmw4cxv/dmQRnhmZ
	Onpvq8Dj7n1fmHH04SBZ3kAIwEO9mWMQKuzo25eL5nwhDubbMV9cpAFxTGdPoUmKpIqVZanKylB
	B0+8fUlYZtR5Ld0kd23Ui2+V6Hf9YLJ2V9cwat72QHhv3kHyjxsSkBn4lL3QTfehpi3SYWITW8X
	iBz0GT6arphrSiTG68EsHSsdAC7po+yv3CROmOcr0jsWJwZ
X-Received: by 2002:a05:600c:c174:b0:490:b258:3576 with SMTP id 5b1f17b1804b1-490b5d1cf1bmr38390695e9.7.1780475110617;
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Wed,  3 Jun 2026 10:25:03 +0200
Message-ID: <39bfb7ce8a40d041f2f23344eadeb641a1cf9275.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_092513_036394_52311A4E 
X-CRM114-Status: GOOD (  10.74  )
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

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c835394468ef..56f8744c861a 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -320,6 +320,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -442,6 +449,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3


