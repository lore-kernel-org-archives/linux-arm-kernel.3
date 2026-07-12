Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7310C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 12:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gy9MJ063WpQuTdSQRRK8YP6m6riIIdrXysJgOkGPzeE=; b=NfkIPrcQpzAMrXL2+8QEVqL5OC
	5kL4sQOtLpwgVnJL81J+4uLpswP8cuBhnVrWTi2tI2vPBZGxADYlSXq3Uf50f/vgzgNTBBO1mPCvB
	xh77QHj9Ph0iDu30yp3J7RonhLvAGHxXLIufapXzVPSHB10y9O54EHwofprUtwWHziEWouXxuk9DR
	83oQVE8kLxlCxCi/RET9+KAp1GLedUO4/nRL2QWhn+vO1eMsan3cRfS+b4DBgt2GgglEOtjBp/A9O
	tzkycJwOukB1hU12EDhHVpY2SsfK4+LBBI8jj/ScgUjB95AR2aKGTayW7Ih+8eSoEeb44VjpdvdAe
	yz91whzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1witKi-00000007RwT-2ghd;
	Sun, 12 Jul 2026 12:30:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1witKi-00000007RwN-0KPu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 12:30:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 58CCC43B80;
	Sun, 12 Jul 2026 12:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9BD1F000E9;
	Sun, 12 Jul 2026 12:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783859454;
	bh=Gy9MJ063WpQuTdSQRRK8YP6m6riIIdrXysJgOkGPzeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H7qwpalIOgjV9fonMoUa6xGWNGLUj7bPBCVer5pjNyKeehxUgyS8Y2rRLtsESuYBa
	 Nuc12plGqFOKkNVMjYB3VpTnqhVh0Qgj8d6tZ1e3RfAAwl8mUtrdk3aRRQhAQfOUK7
	 q2VZbud6iihamDK5/B0NKAwaNIKyfTkk2m1ZpvY8dQ4xFBbA64t4rJLG/jdaXHrxKL
	 4GACJqUuQtINVqxS/iY7OKwFLKeLAydfSwNB8zKhG1AxCFg972iCF2Ub16Y7A2yCu8
	 kuh6nYb3sQb6lcGwRiuOee9DWLXRPXhaQCdPwGqdhid/gr7RGPwkTYTnkCgQdjSjiF
	 I4UaP1WpTHekQ==
Date: Sun, 12 Jul 2026 14:30:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	Conor Dooley <conor.dooley@microchip.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 00/10] Remove support for platform data from samsung
 keypad
Message-ID: <20260712-musical-shrimp-of-fruition-b921df@quoll>
References: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-samsung-kp-v3-0-b2fcaba77aff@gmail.com>
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

On Sat, Jul 11, 2026 at 07:12:41PM -0700, Dmitry Torokhov wrote:
> Hi,
> 
> This series converts the Samsung keypad driver and the Cragganmore 6410
> board to generic device properties, allowing the removal of legacy platform
> data and GPIO lookup tables.
> 
> We rework the Samsung keypad driver to stop using platform data, utilizing
> a new compact matrix keypad binding. To support this on the Cragganmore
> board, we add infrastructure to associate software nodes with Samsung
> gpio_chips, and add software node propagation support to the wm831x MFD
> core to route DVS GPIO to the PMIC regulator.
> 
> Finally, we convert all peripherals on the Cragganmore board (including
> keypad, GPIO keys, PMIC, WM1250, SPI0, basic-mmio-gpio, and LEDs) to
> software properties. This allows us to eliminate all legacy GPIO lookup
> tables and fixes incorrect GPIO chip names from previous conversions.
> 
> Mark, it would be great if you could give this a spin on Cragganmore.
> 
> The majority of changes are in arch/board code, with a couple of input
> matches and one for MFD. If everyone agrees maybe we can merge it all
> through the soc tree?

Yes, I could take it via samsung-soc. I assume I have your acks for
unput parts.

Best regards,
Krzysztof


