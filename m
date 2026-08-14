Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACFAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLzxgQunLn3rTDnZhCwKBAHKrSDwRymxoZHim98a9WQ=; b=oFD6/JELSEGX3QfiJ6WfQEYJbl
	cDc+2bsUENvW7fJAvcRl4aqPvtRPWHOrKhuyGQxTDQz8WxdM2BNLsIsi7dW5WUhojbhG7p0hpl6Pb
	z1Uwca5MIXefPPhXK2SnJ0SYIF36tWQLFtVp+bWy6RJ/Hyiby/D+PnSM+ihcPM9aIb2CF3QejFtVS
	f9D7RHq0oHvklkVq8IWeED/MZhPsBnjH202A/3NsS7QgMXd3WDXtMI52/jEXUY9UlH6bnohMSj9C0
	Hk2F+2QyqvMOaR7rg228M1AjI7h8+I0+dWkBQdLzfJp8zvYhMtYZst8wIHb6yndcakmlfHRhaO91v
	e19WM64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumKa-000000029Gw-3ZXa;
	Fri, 14 Aug 2026 07:27:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumKa-000000029Gb-11PF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F7EF600AD;
	Fri, 14 Aug 2026 07:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1741F000E9;
	Fri, 14 Aug 2026 07:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692474;
	bh=fLzxgQunLn3rTDnZhCwKBAHKrSDwRymxoZHim98a9WQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qy8Xe91buoX7ocsf4E+E5gn8kT1wTwvYKYLm4lGfeDhamN/un+PO/+MtmLqXgBhaz
	 3qGAtS8xYbggsM3Pt4lx8dciyZ21YuUQpcy0q0Za8xcoEtAelOMGNQWg/n+niA1EyY
	 /LHoEvQFv+upPL+ygjQk0btCnKCSS+tzX0SkWRJUdeIDfI5Q+BdIwzCyKUhmMCMXHL
	 0k/n7JDQmUM1Ma1qthrgM9jx5CGkAYqG3aczByIa/QaY2iOFOrT+5xgd1HEyzV3aOE
	 G4711+8IoSLg9EXTgbH8G3YGeN3TYML4kmdlmTJjtEX5av0RpgjgzudrAtoF2RY9tt
	 Pn7cd39oY8hcA==
Date: Fri, 14 Aug 2026 09:27:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260814-indefinable-grateful-buzzard-4eefbc@quoll>
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
 <20260813161101.2274327-5-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813161101.2274327-5-mehmet.fide@gmail.com>
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

On Thu, Aug 13, 2026 at 06:11:01PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> The Iris is a small off-the-shelf carrier board for the Colibri
> family. Describe what the board itself provides: Ethernet, one USB
> host and one OTG port, the pin header UARTs, i2c with the carrier
> RTC on it, the PWM pins on the X16 header, SPI and the microSD slot.
> The host port gets its VBUS through a regulator on SODIMM 129, and
> the two GPIOs that turn the RS232 transceivers on, SODIMM 102 and
> 104, are hogged. The touchscreen is an add-on rather than part of
> the board, so it is left out.
> 
> This describes an Iris V1.1. A V2.0 carries the same signals on the
> same pins; what it adds, and what this does not describe, is the
> regulator on SODIMM 100 that can cut power to the uSD slot.
> 
> Tested on a Colibri VF50 on an Iris V1.1 running 6.18: Ethernet at

Since you booted now on v7.2, drop the version description.

> 100Mbps/Full, a USB dongle enumerating once the VBUS regulator is in
> place, the RTC read back over i2c0, all three UARTs, the SPI
> controller registering, both PWM chips registering, the microSD
> slot, the EXT_IO pin group still applied next to the carrier hog
> group, and both hogs holding their pins.
> 
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
>  arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
>  .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
>  .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++

Good old ScreeningEagle/Proceq times, had a lot of fun with this tiny
tiny board and module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


