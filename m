Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A44D1D87E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2JO7dT4mu/qzfJgFHEQIGFJwhTt/Aly7I9ZiChTjrs=; b=NRflUQwApyBf8rpdMAq0T62oCU
	5PfpYAF9Qxp41p/BZPwsnrZcEEnpNnZHQKgUb3ZY5yDlz4THs+ixLgzIk4Q8MShIfoz2knL9lQFB0
	wqc7Kr7EgSYFkpTSXXe/PUgL0kT8ljCNQ/SXQlyP+7eJURZUWI9ZTYy0hByqx0S0Fn8q36wCwh1NY
	Dn4hSB+eNv0VoRnrhOH/TwSgXxCvyiTH91QIlwzns0Amsl7aunGkiL1F+9iPgCcgAClQ7Fmyllift
	U0JtX2aPUQr8z1njluwXgO3V8KwrdlfvIdQCQbObfC0UUFnXLlc0XZRv37vkOKbDigR73FocFVarg
	ofN/zXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3vq-00000007cd7-2H5E;
	Thu, 04 Dec 2025 07:39:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR3vn-00000007cbu-3lri
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 07:39:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B07C440A7;
	Thu,  4 Dec 2025 07:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F690C113D0;
	Thu,  4 Dec 2025 07:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764833953;
	bh=Qq0GWTvBPgCqUz9m3+8fVUgJ9uPY8K9dp5GcVDT/CYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=naH7XhYEsEkbtlW6bsr51zK1N3fr04bg7n2X9YlcuhrVgKW+16Y+Zb8p2vXqWEOvm
	 p9IJks1elvXfDM72avZm44WkyA6S6axvsOO9yKOt107nN/XGV+syj1R0x2FySHa/dS
	 ZsLnhKU8Vrt4l32kXkLXUT30bZaMTIP+zLvWVRwtijoZXIbe12bkkdIac79lyYcg7w
	 KpKF8/bwnuwzXk75yU4uqCdpd7Ts3Cbb2sc+bOrThfJ9ZF+OuZIbCZk4chVYq1nAXF
	 eBYKxcJR0XQctjXiK1mK01OaMZU6amOD6yjnjSy2A5qlDw9gZJxrPmhRDDX2kCtYNA
	 8L5PdBOJKtD1g==
Message-ID: <b896d109-d707-4651-8bb0-6cf5071e46bf@kernel.org>
Date: Thu, 4 Dec 2025 08:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: Do not build obsolete API
To: david@ixit.cz, Russell King <linux@armlinux.org.uk>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_233915_980616_9527F7A8 
X-CRM114-Status: GOOD (  15.53  )
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



Le 03/12/2025 à 23:34, David Heidelberg via B4 Relay a écrit :
> [Vous ne recevez pas souvent de courriers de devnull+david.ixit.cz@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: David Heidelberg <david@ixit.cz>
> 
> ALSA 0.9.0-rc3 is from 2002, 23 years old.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Maybe I could drop also the code and Kconfig option?
> 
> David
> ---
>   arch/arm/configs/am200epdkit_defconfig    | 1 -
>   arch/arm/configs/lpc32xx_defconfig        | 1 -
>   arch/arm/configs/omap1_defconfig          | 1 -
>   arch/arm/configs/tegra_defconfig          | 1 -
>   arch/mips/configs/gcw0_defconfig          | 1 -
>   arch/mips/configs/loongson1_defconfig     | 1 -
>   arch/mips/configs/qi_lb60_defconfig       | 1 -
>   arch/mips/configs/rbtx49xx_defconfig      | 1 -
>   arch/mips/configs/rs90_defconfig          | 1 -
>   arch/powerpc/configs/85xx-hw.config       | 1 -
>   arch/powerpc/configs/86xx-hw.config       | 1 -
>   arch/powerpc/configs/mpc5200_defconfig    | 1 -
>   arch/powerpc/configs/ppc6xx_defconfig     | 1 -

For powerpc:

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>



>   arch/sh/configs/edosk7760_defconfig       | 1 -
>   arch/sh/configs/se7724_defconfig          | 1 -
>   arch/sh/configs/sh7785lcr_32bit_defconfig | 1 -
>   sound/core/Kconfig                        | 2 +-
>   17 files changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
> index 134a559aba3dd..2367b1685c1cf 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -68,7 +68,6 @@ CONFIG_SOUND=m
>   CONFIG_SND=m
>   CONFIG_SND_MIXER_OSS=m
>   CONFIG_SND_PCM_OSS=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   CONFIG_SND_PXA2XX_AC97=m
>   CONFIG_USB_GADGET=y
> diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
> index 2bddb0924a8c0..b9e2e603cd95e 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -113,7 +113,6 @@ CONFIG_LOGO=y
>   # CONFIG_LOGO_LINUX_VGA16 is not set
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   CONFIG_SND_DEBUG=y
>   CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index dee820474f444..df88763fc7c3d 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -148,7 +148,6 @@ CONFIG_SOUND=y
>   CONFIG_SND=y
>   CONFIG_SND_MIXER_OSS=y
>   CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   CONFIG_SND_DUMMY=y
>   CONFIG_SND_USB_AUDIO=y
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index ce70ff07c978a..68aedaf92667a 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -219,7 +219,6 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>   CONFIG_LOGO=y
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_DRIVERS is not set
>   CONFIG_SND_HDA_TEGRA=y
>   CONFIG_SND_HDA_INPUT_BEEP=y
> diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
> index fda9971bdd8d9..adb9fd62ddb0d 100644
> --- a/arch/mips/configs/gcw0_defconfig
> +++ b/arch/mips/configs/gcw0_defconfig
> @@ -79,7 +79,6 @@ CONFIG_LOGO=y
>   # CONFIG_LOGO_LINUX_VGA16 is not set
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_PROC_FS is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
> index 02d29110f7024..1d9781ff96986 100644
> --- a/arch/mips/configs/loongson1_defconfig
> +++ b/arch/mips/configs/loongson1_defconfig
> @@ -119,7 +119,6 @@ CONFIG_WATCHDOG_SYSFS=y
>   CONFIG_LOONGSON1_WDT=y
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_MIPS is not set
>   # CONFIG_SND_USB is not set
> diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
> index 5f5b0254d75e7..a1bb0792f6eb1 100644
> --- a/arch/mips/configs/qi_lb60_defconfig
> +++ b/arch/mips/configs/qi_lb60_defconfig
> @@ -81,7 +81,6 @@ CONFIG_LOGO=y
>   # CONFIG_LOGO_LINUX_CLUT224 is not set
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_SPI is not set
> diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
> index 03a7bbe28a532..49c709d663beb 100644
> --- a/arch/mips/configs/rbtx49xx_defconfig
> +++ b/arch/mips/configs/rbtx49xx_defconfig
> @@ -53,7 +53,6 @@ CONFIG_TXX9_WDT=m
>   # CONFIG_VGA_ARB is not set
>   CONFIG_SOUND=m
>   CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_PCI is not set
> diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
> index a53dd66e9b864..8382d535e6dc1 100644
> --- a/arch/mips/configs/rs90_defconfig
> +++ b/arch/mips/configs/rs90_defconfig
> @@ -105,7 +105,6 @@ CONFIG_LOGO=y
>   CONFIG_SOUND=y
>   CONFIG_SND=y
>   # CONFIG_SND_PCM_TIMER is not set
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_PROC_FS is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_MIPS is not set
> diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
> index 8aff832173977..2b19c20a9a2c4 100644
> --- a/arch/powerpc/configs/85xx-hw.config
> +++ b/arch/powerpc/configs/85xx-hw.config
> @@ -117,7 +117,6 @@ CONFIG_SND_INTEL8X0=y
>   CONFIG_SND_POWERPC_SOC=y
>   # CONFIG_SND_PPC is not set
>   CONFIG_SND_SOC=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_USB is not set
>   CONFIG_SND=y
>   CONFIG_SOUND=y
> diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
> index e7bd265fae5a4..07f30ab881e59 100644
> --- a/arch/powerpc/configs/86xx-hw.config
> +++ b/arch/powerpc/configs/86xx-hw.config
> @@ -80,7 +80,6 @@ CONFIG_SERIO_LIBPS2=y
>   CONFIG_SND_INTEL8X0=y
>   CONFIG_SND_MIXER_OSS=y
>   CONFIG_SND_PCM_OSS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   CONFIG_SND=y
>   CONFIG_SOUND=y
>   CONFIG_ULI526X=y
> diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
> index c0fe5e76604a0..617650cea56a9 100644
> --- a/arch/powerpc/configs/mpc5200_defconfig
> +++ b/arch/powerpc/configs/mpc5200_defconfig
> @@ -75,7 +75,6 @@ CONFIG_FB_SM501=m
>   CONFIG_LOGO=y
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_PCI is not set
>   # CONFIG_SND_PPC is not set
> diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
> index b082c1fae13c9..787d707f64a42 100644
> --- a/arch/powerpc/configs/ppc6xx_defconfig
> +++ b/arch/powerpc/configs/ppc6xx_defconfig
> @@ -726,7 +726,6 @@ CONFIG_SND_OSSEMUL=y
>   CONFIG_SND_MIXER_OSS=m
>   CONFIG_SND_PCM_OSS=m
>   CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   CONFIG_SND_VERBOSE_PRINTK=y
>   CONFIG_SND_DEBUG=y
>   CONFIG_SND_DEBUG_VERBOSE=y
> diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
> index abeae220606a3..905fac1072845 100644
> --- a/arch/sh/configs/edosk7760_defconfig
> +++ b/arch/sh/configs/edosk7760_defconfig
> @@ -79,7 +79,6 @@ CONFIG_FB_TILEBLITTING=y
>   CONFIG_FB_SH_MOBILE_LCDC=m
>   CONFIG_SOUND=y
>   CONFIG_SND=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   CONFIG_SND_VERBOSE_PRINTK=y
>   CONFIG_SND_SOC=y
> diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
> index 9e3a54936f76f..8ca46d704c8ba 100644
> --- a/arch/sh/configs/se7724_defconfig
> +++ b/arch/sh/configs/se7724_defconfig
> @@ -83,7 +83,6 @@ CONFIG_LOGO=y
>   # CONFIG_LOGO_SUPERH_VGA16 is not set
>   CONFIG_SOUND=y
>   CONFIG_SND=m
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_DRIVERS is not set
>   # CONFIG_SND_SPI is not set
>   # CONFIG_SND_SUPERH is not set
> diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
> index eb63aa61b0465..5468cc53cddb4 100644
> --- a/arch/sh/configs/sh7785lcr_32bit_defconfig
> +++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
> @@ -93,7 +93,6 @@ CONFIG_SND_PCM_OSS=y
>   CONFIG_SND_SEQUENCER_OSS=y
>   CONFIG_SND_HRTIMER=y
>   CONFIG_SND_DYNAMIC_MINORS=y
> -# CONFIG_SND_SUPPORT_OLD_API is not set
>   # CONFIG_SND_VERBOSE_PROCFS is not set
>   CONFIG_SND_VERBOSE_PRINTK=y
>   CONFIG_SND_DEBUG=y
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index 48db44fa56feb..4e7bc370ffd7f 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -155,7 +155,7 @@ config SND_MAX_CARDS
> 
>   config SND_SUPPORT_OLD_API
>          bool "Support old ALSA API"
> -       default y
> +       default n
>          help
>            Say Y here to support the obsolete ALSA PCM API (ver.0.9.0 rc3
>            or older).
> 
> ---
> base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
> change-id: 20251203-old-alsa-fa2c2cb038e1
> 
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
> 
> 


