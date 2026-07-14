Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7408EC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/km1l4qos/3vnh74LC9dqwRWW+IxrErU5GLSExeZpk=; b=tYFU2Vz3ij8drQK2y6xNAB4dDg
	uVUwg9MKQDVS6+C22ogrf+zc4Ob7P7qGzKfpK7/LbiO/1xf6o6rvEr7nMIuwYZkJJ4RXE9IoDLOCf
	PTM8cxoNM1FMkbvmj0z08AokzwsC2xEvQ9CQ99mpmt4S65iXXl5zSU4YRl5bHPnMgz5rFHS4K+7Mc
	u5lNrJVhm2aaEAijjLFBrw4a1Q9z/SDmLWyHjtRUpeGX/gyKdZzfO7XryuBRZ6zQHebVUR2ejNikJ
	wJIb7yrVyqhMPbGf4dB8xUGUwcVLzc9nKadvhxTSjmLWC9yey8ioKiXkmmvBIbhiT/S4NGZ2UB/q6
	8zsKEk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeVH-0000000CRJo-1Aq8;
	Tue, 14 Jul 2026 14:52:59 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjeVE-0000000CRJF-0rAG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:52:57 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-726840fb461so899998137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040774; x=1784645574;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W/km1l4qos/3vnh74LC9dqwRWW+IxrErU5GLSExeZpk=;
        b=cI6WlOhoxc8N5A5u90kE2vQW9cmsT+90roWji30GM/gDQ7bztXHn0GStfKouKXLJv6
         OBnLuuhG3e0ssbHTyYV+VZD8aUINFomwQNUCq+xLyVUueMV8bdREoZvzlwDdVKKK2GZS
         Z65IwjPrCKtK43OUz99KHptWyprM502NRe0A5AcpXjGMdGaj0Ht9St+FvwGGajZUQMH2
         tYS4InENAFbcfPCmodSUe6ef3ZrcA+ujQQimZ+A97IBjUdyBGTPtlhtW5lWAlYBKURyB
         4ZWdPhtotUJ90dMHSqbaIEgVgKJlewbqnwk9q9iFvlh6j1/ChilYga14bv2j9K/q6cr+
         Nd7w==
X-Gm-Message-State: AOJu0Yw1r/0dEtcOgVDBwF/N3wmAyUzWkSw5wkZ1wSn7iNOZvBnnucYP
	Ff2ald/k1Yy+NdVxYhW41Wt0BJRLj7AtDRsjUibp/f6QZzW2UPxJVXvzCeoU8AdJ5Bg=
X-Gm-Gg: AfdE7cn9A4AqTJDXhMl7a+bSvMThXK8BJyU2miUErKJFLyzJInH9six/Pobtkc019D3
	srVhwrjNBkk3vYjMW5osfW8tX91QmJBiRwcRMFD1tl6VZu5ZVGnsYLKN9nX1/zUj51M0oSnhcdw
	RTxAzE+ynR+l/E7+ZLPLH9j+m57Bn6JmwWLxf7jA3JUTaTENFKBswxDW+4MoAxUbjYfqojcLmXs
	L2JHf6B+OUyi+AJ+kNMVun+9fTB0GyEqx0nn0+qZov4EQdrZCcUp4zYgqsJnzPr40a+DPaDBDQq
	MxtxmPhk2sxZ3N5KxnlHQ9X5qvbaJxf1d34qo9jc9npGge1pE9XWFY3ndrHujuxaHwZxFWAeL03
	zQ+zgEOI8rVflmtL2eVa6dNhi4feEQ29X+wvCgbgpFXpp754EeqztRbCgZpjO9rCnZNE+N7/pku
	lbYZCjp6DOttQ+0dC7T4zAWYNuwdm4WxTnXVhcgQBT05RK9yrYiA==
X-Received: by 2002:a05:6102:946:b0:738:be7b:add3 with SMTP id ada2fe7eead31-7457e687dc1mr2289753137.6.1784040774432;
        Tue, 14 Jul 2026 07:52:54 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed6737807sm8749549241.13.2026.07.14.07.52.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 07:52:53 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9696369925aso1471957241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 07:52:53 -0700 (PDT)
X-Received: by 2002:a05:6102:50a3:b0:722:a46b:2f2c with SMTP id
 ada2fe7eead31-7457e8e365emr2275003137.15.1784040773753; Tue, 14 Jul 2026
 07:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260701212353.2196041-1-arnd@kernel.org> <20260701212353.2196041-6-arnd@kernel.org>
In-Reply-To: <20260701212353.2196041-6-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 16:52:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVKcyA6YVR8MRAF=uQFiF73Mbnhh0f8jei82_Ev41BVog@mail.gmail.com>
X-Gm-Features: AUfX_mzWdd5ndgb4V5c32_Too4L9v4meC5g5UkXGWDIweQBOL5XU43xcgrFTB8s
Message-ID: <CAMuHMdVKcyA6YVR8MRAF=uQFiF73Mbnhh0f8jei82_Ev41BVog@mail.gmail.com>
Subject: Re: [PATCH v2 05/19] ARM: turn CONFIG_ATAGS off by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Daniel Mack <daniel@zonque.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_075256_500190_2126C5B3 
X-CRM114-Status: GOOD (  42.49  )
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

Hi Arnd,

On Wed, 1 Jul 2026 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Only a very small number of machines remain that rely on
> traditional board files with the ATAGS boot data instead
> of devicetree, and we have not accepted new ones for
> a decade.
>
> Most of the remaining ones are on their way out of the
> kernel, but the Kconfig option that controls ATAGS
> is still enabled by default.
>
> To reflect the actual status of ATAGS support and alert
> the remaining users of upstream and out-of-tree platforms
> with this, chanyge it to being default-disabled and
> add a dependency on CONFIG_EXPERT.
>
> The board specific defconfig files that rely on ATAGS
> are changed to turn on both EXPERT and ATAGS if they
> were not doing thath already, and the ones that explicitly
> turned it off before no longer need to.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch, which is now commit 4d9226b820c165b7 ("ARM:
turn CONFIG_ATAGS off by default") in soc/for-next.

> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1390,12 +1390,15 @@ config ARCH_WANT_FLAT_DTB_INSTALL
>
>  config ATAGS
>         bool "Support for the traditional ATAGS boot data passing"
> -       default y
> +       depends on EXPERT
>         help
> -         This is the traditional way of passing data to the kernel at boot
> -         time. If you are solely relying on the flattened device tree (or
> -         the ARM_ATAG_DTB_COMPAT option) then you may unselect this option
> -         to remove ATAGS support from your kernel binary.
> +         This is the traditional way of passing data to the kernel at
> +         boot but is now only used by a few of the oldest ARMv4 and
> +         ARMv5 machines.  Users that still rely on ATAGS should plan
> +         on migrating to devicetree based booting.
> +
> +         Support for ATAGS will be removed when the last machine using
> +         it is either converted to DT or removed.
>
>  config DEPRECATED_PARAM_STRUCT
>         bool "Provide old way to pass kernel parameters"

I don't know how much of this is used by systems with old boot loaders
that use a combination of (appended) DT and ATAGS.

E.g. the old U-Boots on Marzen (R-Car H1) and KZM-A9-GT (SH-Mobile AG5)
rely on CONFIG_ARM_ATAG_DTB_COMPAT=y to pass the kernel command line,
and that still seems to work fine without ATAGS.

Note that to boot a proper multi-platform kernel on KZM-A9-GT, I still
need "[PATCH v2 1/2] ARM: decompressor: support memory start validation
for appended DTB"[1], which RMK doesn't like. That patch is so old
that I forgot how to make upstream boot on KZM-A9-GT without it...

Anyway, it looks like all my boards boot without CONFIG_ATAGS.
Thanks!

[1] https://lore.kernel.org/20240121203009.9257-2-ansuelsmth@gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

