Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4ECA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44rVfTJaedy6ulAmPOyH9+r4cR8AIYmnpPrgFRifdsM=; b=ChNJQXXp1aneRdws6SCY5iv8YT
	cm+MGPdjZX/PXMLZ3xduKp853aQxKgbTHvVoPA1dXxFBgSaSGaxBpY8DkO25tKKIw8Ald8UvZ5b5j
	aPhb6Vr7OAnb1BH4WvZ7Iin/mcYWApfs5+zMt7EmC8hKVD2FvhOY/OxJGqM+j8TbcIe6iHwDEiGxp
	aZlfvOA/n9/Vjy/RHgVtfOwIn0EUKiwj8t4C7dKXvH+x4g/Dr88jHWUhGISkZyAclhS+P982opkIC
	0ua+2pRArEPa0EFDfOLqlyu/XJwZaElSM6yIdu//YJB/UYArIpROx6cWiaLjyiIzUCitxnSbwzmUu
	dhOiFxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAK-0000000HIZY-38vT;
	Tue, 02 Sep 2025 12:31:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNqw-0000000GYop-0NvR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74E5A4485C;
	Tue,  2 Sep 2025 10:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52EFC4CEF5;
	Tue,  2 Sep 2025 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756807381;
	bh=6GGN+vSC6nAw0rmyQPYra2aimD8RCfZCmVauB2qSJ0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O8g6WRWjnz00IdBM+0NXEGJFvekqwjMUPlmGg9KMT2A+XuL5Ng9/WXfAc8BOeqRHe
	 wGzkfrgy0RVox5f2jPjW6AvGD47VgGow9LPKn7VetMcjSQfK4iNX2zv81QHCX7/QDl
	 1Cuks4Y3lPUEwH6GDZ5NJbtfwrz60fBFVWBYmzAIjLZg91ynUig6PI0lBAnbiBauPi
	 AO3U3NKeiJmr7h53HrKOOY6BGf4/zQoQpwV3Dr8QGm05RSUbwrMFY2MAPfkkIWFMuk
	 VNOFLgMs2AWCBJNBMpNq3rKsTLL0jmottWFueh5OtiFL2HKTELwPI+MMPwAdPuSoSs
	 cl3IIs1qBlzMw==
Date: Tue, 2 Sep 2025 11:02:54 +0100
From: Lee Jones <lee@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 4/9] mfd: at91-usart: Make it selectable for
 ARCH_MICROCHIP
Message-ID: <20250902100254.GD2163762@google.com>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-5-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813174720.540015-5-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_030302_157920_D1BA359D 
X-CRM114-Status: GOOD (  16.55  )
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

On Wed, 13 Aug 2025, Robert Marko wrote:

> LAN969x uses the Atmel USART, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 425c5fba6cb1..8f11b2df1470 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>  config MFD_AT91_USART
>  	tristate "AT91 USART Driver"
>  	select MFD_CORE
> -	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	help
>  	  Select this to get support for AT91 USART IP. This is a wrapper
>  	  over at91-usart-serial driver and usart-spi-driver. Only one function

Let me know when the deps are in Mainline.

-- 
Lee Jones [李琼斯]

