Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0452C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 22:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZu5jeody6oxpz4x8MYrbb46BHii47kNRlyxqpDsps4=; b=E9C/tXmmF12LLq
	O871U/11fXWqR21jPcVs/mAMQH7IjDDTDdEA/2dfAdDNknRJYoNCd6376URqvLJek50JmZRfKclrz
	N1YtC+ekBTJsHXKhbgkaCF/wz7NpabLSrQqtHxeTy1DyveWMyXXDxvd4Bq5rOpAvgXK41V76fKnFA
	e5STJMI4eNYMAyJHnEZVtBw2Cx5GJXZVeTf/NXR1OkWSeHoBTcHe9syk1lDcPxrur52ChASw6pJXn
	vQk2yj7l8Kkvp4eUENZtUhleUiW9quOe0MRDn0wXhXdiC/hmvY755IcyhJPeivOQtLUZBihB+8Azl
	zkbmaKy8sJr55mn68rVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZeGf-00000004Pn7-0XcG;
	Sun, 19 Jan 2025 22:59:45 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZeE8-00000004PVV-0Gv5;
	Sun, 19 Jan 2025 22:57:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9326A1C0002;
	Sun, 19 Jan 2025 22:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737327422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QZu5jeody6oxpz4x8MYrbb46BHii47kNRlyxqpDsps4=;
	b=YKPcMmIS4RHbLrv+EC1jcqqGgBR5ymzURQAjmsaV6LUXiR2bm3WR1mxBEWF8fZaswSEzXC
	6dXtlQAqLxZ5cXf163spiLGsUPPOLP/RTUsDKit6TSOxZQxEMGaG49sL291c/V3nXcjHhV
	Uzttb1W7DH8z0j6zHXQPKsN/vOByXOHsJw2P4kHCcnhIxNYSaQbrqxWvMFv/3goJxF3RHp
	5eTsekIVU9eDRMFTp9oiUPJjvGqu84UfcKH/wHOK2KE0xMa4ha0fofYHUnuebPjlILYuTY
	ZQU9TSEKm68hF+amDZXkdGlcFz2gasgKCb1FkQSf6TANrUaxN0CMnW9mcXgfvw==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Subject: [PATCH 0/2] Describe the cameras in the PinePhone Pro dts
Date: Sun, 19 Jan 2025 23:56:58 +0100
Message-Id: <20250119-camera-v1-0-320be4f0dc2b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADqDjWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0NL3eTE3NSiRF1jIwPjRLNEQ4NUgzQloOKCotS0zAqwQdGxtbUAatz
 Wf1gAAAA=
X-Change-ID: 20250119-camera-3203a6a10e0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 Dragan Simic <dsimic@manjaro.org>, Ondrej Jirman <megi@xff.cz>
X-Mailer: b4 0.14.2
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_145708_394584_40F3A023 
X-CRM114-Status: UNSURE (   7.73  )
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

This series adds support for the Pine64 PinePhone Pro's rear and front
cameras in Device Tree.
This is based on some of Ondrej Jirman's patches hosted in his tree at
https://codeberg.org/megi/linux, but I have also fully reviewed and
re-written the code from the RK3399 datasheet, the PinePhone Pro
schematic, and the IMX258-0AQH5 software reference manual.

I have tested these changes on my PinePhone Pro and am able to take
photos from both cameras using libcamera's cam.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
Olivier Benjamin (2):
      arm64: dts: PinePhone Pro: describe I2c Bus 1 and IMX258 world camera
      arm64: dts: PinePhone Pro: describe the OV8858 user camera

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)
---
-- 
Olivier Benjamin <olivier.benjamin@bootlin.com>


