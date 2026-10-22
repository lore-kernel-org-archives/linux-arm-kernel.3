Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC1A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zCpmJRUh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ixrteNqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RhKt16of56GSIqtS3K+XfsNEUpLs5ygGgmwiyfLWjSI=; b=zCpmJRUhgmIBpdwzcVmy4Q+s2e
	J5z6TKU89DAa1lTx5GYIzSEYZ4/iJaClTqz6Cm8zLjFEJNs/mme6zfWau+uxw9XsTQo4c++KmBH02
	F5hJW+/Da7JB5KBjBMOf+5bxOs+idvaf8ppa0UN7jHGykjxe/a7bMVQJbwXf1GB9TBIjTSmfRdTWq
	rbFOjcY1+7nRNcDGpNOkzPKkxpivDR0E3bFpcRn8Q+LI2yifuQzkBJ3bfH0Ju8G59igMWQJPN8xRk
	A4tam8S1iSsGjDGtZIDD/VckW213WVENIJv7vwt7GUIlCQQ8eoQsH3MRP4J5ruS8vH4tc/ijPVATG
	yoiBg32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvn-0000000El3K-3g7g;
	Thu, 22 Oct 2026 18:54:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvm-0000000El2J-2Uh7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 18:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RhKt16of56GSIqtS3K+XfsNEUpLs5ygGgmwiyfLWjSI=; b=ixrteNqs7F8wDIEQxpV+JxJYO5
	0i5CsfggraEYPNmYpPWPXEx5se/wxeS6jDEEkDPO4wQUroGz5nrdNogtVHvZHMG82wdN+Dd8L463Z
	3CNz1xq/BmGA0S8eU0egqC2Qog6u04tj5zRSXIAn4jcBGlgaZWDRuMAS8j6mU3uj7x/PmeiRjprwO
	cX1IluqNyRvfuO9E8A3LQIRGzkX9CAwP3AyAxxatsWr6jzeioxLGQZBLxS89b54Xv80GKDTMTUo0d
	tlmQD+hhohpFK4KOPpM77S7fdumAqnL0tdU9UiSiMHh6xdVx/aE15c/6fm8onKiWZIJbQGly5S50P
	vyjMtz3Q==;
Received: from elvis.franken.de ([193.175.24.41])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxvj-00000007mEq-1FSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:54:25 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xJxva-00029X-00; Thu, 22 Oct 2026 20:54:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7C50EC0970; Thu, 22 Oct 2026 20:50:52 +0200 (CEST)
Date: Thu, 22 Oct 2026 20:50:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-media@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 5/7] MIPS: BCM63XX: Remove one time use
 ephy_reset_gpio_flags
Message-ID: <atpbDFIFtFCntTeU@alpha.franken.de>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
 <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715185112.1323510-6-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_195423_609310_EAA86676 
X-CRM114-Status: GOOD (  22.53  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Jul 15, 2026 at 08:46:45PM +0200, Andy Shevchenko wrote:
> ephy_reset_gpio_flags exists solely to supply polarity to the reset GPIO.
> But in practice it's kept all the same and currently only a single user
> present. Drop the member and use hard coded GPIO flags instead.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/mips/bcm63xx/boards/board_bcm963xx.c           | 7 +++----
>  arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h | 3 ---
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index c5617b889b1c..57e916c06792 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -42,7 +42,7 @@ static struct board_info __initdata board_cvg834g = {
>  	.expected_cpu_id = 0x3368,
>  
>  	.ephy_reset_gpio = 36,
> -	.ephy_reset_gpio_flags = GPIOF_OUT_INIT_HIGH,
> +
>  	.has_pci = 1,
>  	.has_uart0 = 1,
>  	.has_uart1 = 1,
> @@ -903,9 +903,8 @@ int __init board_register_devices(void)
>  
>  	platform_device_register(&bcm63xx_gpio_leds);
>  
> -	if (board.ephy_reset_gpio && board.ephy_reset_gpio_flags)
> -		gpio_request_one(board.ephy_reset_gpio,
> -				board.ephy_reset_gpio_flags, "ephy-reset");
> +	if (board.ephy_reset_gpio)
> +		gpio_request_one(board.ephy_reset_gpio, GPIOF_OUT_INIT_HIGH, "ephy-reset");
>  
>  	return 0;
>  }
> diff --git a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> index 830f53f28e3f..018a56cbc328 100644
> --- a/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> +++ b/arch/mips/include/asm/mach-bcm63xx/board_bcm963xx.h
> @@ -46,9 +46,6 @@ struct board_info {
>  
>  	/* External PHY reset GPIO */
>  	unsigned int ephy_reset_gpio;
> -
> -	/* External PHY reset GPIO flags from gpio.h */
> -	unsigned long ephy_reset_gpio_flags;
>  };
>  
>  #endif /* ! BOARD_BCM963XX_H_ */
> -- 
> 2.50.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

