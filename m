Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9396AFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGBdavIaqnVL2bFEtTe5Ml/xW7w8rZK2JeFY/jWQ3kI=; b=isPj6IYuXPImXozH4Sgwvi9prw
	kUHW8teqWZiMUKroWL1Q4dZ5iOPHeLHbIWVg3lRGoSlPRk+eJ0vXXFUlFsBPp0DFHATYGJtZUH352
	ujm6GTGr2TaBar0gFyHysFZWI2j/cUqxz0w0nXZnFuXSq/xRNdUg7tGrZrXpdwuKjLqtUXOQkY//u
	8aNQg5UcFWyEgCYo5CZGVBPiILtpI6O2EKNMXxFtJCtEvByo0giwJMQVoIw/ajT7eXitfKzo0+Lbt
	4r7liOzFqJOxmCED0Y1z5VVMuDa7HH91UooNsUXPOdNPOhsbBztHusQHQC3IcpLaruPbYY3Zip1ne
	D9bytLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJfd-0000000GjwB-0yDe;
	Mon, 27 Apr 2026 10:58:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJfa-0000000GjvF-0b3e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dGBdavIaqnVL2bFEtTe5Ml/xW7w8rZK2JeFY/jWQ3kI=; b=mLv5x2ELnnYv8KJwqrsZ6PgyMF
	xIRHSKxzYv/IWoSBMYF+aHJxWRNUmzb25/HRQlzPl0kBlk/xwvz/mCaXX8qarfsw4a3rdhzQCxDwq
	DNKhiPptxpL1nEakVi7Fm4053EN+BaAbPTQyC4p0L/iQdvXOwEFrJummjJNqUKDR0nHE5vOsfefAV
	+5mVEwhxV3pdCWhPI8eZn0ruQn2KdC3ICZbvpjXapeQ6Z2k3ZOIL49UX4QNB/wWLsfyNkcSE69+fG
	EZOcFlQ6x0OB3rBVLdwNo/0Z/WJ2j8D21QBnQj2xDG1U3lBeUZFghSaJE80b39SSyBCaPQHSXQ5dd
	IDYlSPxg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48392)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wHJfO-000000006tA-0MDk;
	Mon, 27 Apr 2026 11:58:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wHJfL-000000005JE-339f;
	Mon, 27 Apr 2026 11:58:15 +0100
Date: Mon, 27 Apr 2026 11:58:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
Message-ID: <ae9BR5vW_6jvNOYY@shell.armlinux.org.uk>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
 <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_035830_489542_12596ECB 
X-CRM114-Status: GOOD (  23.35  )
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

On Mon, Apr 27, 2026 at 12:14:34PM +0200, Bartosz Golaszewski wrote:
> Software node describing the GPIO controller for the pxa25x platforms is
> currently "dangling" - it's not actually attached to the relevant
> controller and doesn't allow real fwnode lookup. Attach it once it's
> registered as a firmware node before adding the platform device.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  arch/arm/mach-pxa/pxa25x.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
> index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
> --- a/arch/arm/mach-pxa/pxa25x.c
> +++ b/arch/arm/mach-pxa/pxa25x.c
> @@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
>  }
>  
>  static struct platform_device *pxa25x_devices[] __initdata = {
> -	&pxa25x_device_gpio,
>  	&pxa25x_device_udc,
>  	&pxa_device_pmu,
>  	&pxa_device_i2s,
> @@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
>  
>  		if (!of_have_populated_dt()) {
>  			software_node_register(&pxa2xx_gpiochip_node);
> +			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
> +								&pxa2xx_gpiochip_node);
> +			platform_device_register(&pxa25x_device_gpio);
> +
>  			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
>  			ret = platform_add_devices(pxa25x_devices,
>  						   ARRAY_SIZE(pxa25x_devices));

Why do you need to explicitly register using platform_device_register()
rather than leaving the device in the pxa25x_devices list and letting
platform_add_devices() do that for you? platform_add_devices() is just
a wrapper around platform_device_register() which calls that for all
devices in the array.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

