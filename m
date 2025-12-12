Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D7ED43375
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9puDF0qsf7d+cFofikh+YMcfLgLR89soFFQ1eEsTxk=; b=UmjZ7NOTqjTJkLaKnbqLltZOwP
	QAbLSnjBa+HnZNviZ8XbpxHdCr5elPy/tejzLVKdBCdEKPQoWyP/GP9KH4NClaqIHoUeMVbRYNU98
	tAcF0xUxQsk0MY5BiZ5TBbPZDIIGgqOKOmJTIvbHocUBIXcCOG4FE8Boanq+BAdFrv3Y3Ehj3Otpx
	UE7mh1sSpfujj6NBd7Agyt+CHCLbdfUcOXLy1Zk5ZSGf5Rcvpvrxj/NZbmu24kK8dLXCLPMLgNHHZ
	HfQze2OSr4p5BY7ufsw37gOUf6l7tOqeq0hJXc/mxl1EoERCwb+HI/ba/kjZ5NO9pJ2KnUKUhJQmR
	cS9FP0Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmj-00000000DQp-2YgR;
	Fri, 12 Dec 2025 07:41:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxmf-00000000DMw-3Jtc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 07:41:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69B231A211B;
	Fri, 12 Dec 2025 07:41:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38EDD606DF;
	Fri, 12 Dec 2025 07:41:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD040103C8E02;
	Fri, 12 Dec 2025 08:41:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765525307; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F9puDF0qsf7d+cFofikh+YMcfLgLR89soFFQ1eEsTxk=;
	b=k+piAqcjXVqixAW9nA4n4GOhvuTBd+kxGQgFiyNcasMQ3hFs0bdzvH7I85URKQLVK4f26W
	RuSJTmfANA4JnjhBmHZT6m4O26LTyjwsHzz58eQqGIK89AoNFQAhn2qroK7epPNHGwkt6Q
	Zz+3xFuiV4yMG3BGDTmbdaTrBpw6vd6wgmb7VuvR3gudBwOG1cEmBkZtqy4amBde7gz7VQ
	XDhRJFwqduwSD/5PwYiXP2aofHagKD0dwfnukoCeifueospPJG4b0Ssz5KkSpLaYvX9qy4
	eyTPXcaoZ2+SjaElFEycVWoVVAkLfz+1IeV026Ammjp+hQT07h1IjxNXYncQlg==
From: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Date: Fri, 12 Dec 2025 08:41:11 +0100
Subject: [PATCH 8/8] MAINTAINERS: Add entry for AAEON SRG-IMX8PL MCU driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251212-dev-b4-aaeon-mcu-driver-v1-8-6bd65bc8ef12@bootlin.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_234149_966028_D74D2802 
X-CRM114-Status: UNSURE (   7.69  )
X-CRM114-Notice: Please train this message.
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

Add maintainer entry for the Aaeon SRG-IMX8PL MCU MFD driver and its
sub-device drivers (GPIO and watchdog).

Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c9e416ba74c64e90629c0b7d7941f879c9ac589e..13a4eced229acd970b9e5de864a441f28fa2aa91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -186,6 +186,15 @@ W:	http://www.adaptec.com/
 F:	Documentation/scsi/aacraid.rst
 F:	drivers/scsi/aacraid/
 
+AAEON SRG-IMX8PL CONTROLLER MFD DRIVER
+M:	Thomas Perrot <thomas.perrot@bootlin.com>
+R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
+S:	Maintained
+F:	drivers/gpio/gpio-aaeon-mcu.c
+F:	drivers/mfd/aaeon-mcu.c
+F:	drivers/watchdog/aaeon_mcu_wdt.c
+F:	include/linux/mfd/aaeon-mcu.h
+
 AAEON UPBOARD FPGA MFD DRIVER
 M:	Thomas Richard <thomas.richard@bootlin.com>
 S:	Maintained

-- 
2.52.0


