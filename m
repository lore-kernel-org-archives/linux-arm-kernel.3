Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190D5D6E2DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMI8gahPCkzfyAYCyt7orDE3Hlig6obQSOnVubX38hw=; b=iqFa9WcG634f/8Z7lcuuMickfj
	vktn+9sXgew6mFDfJRufI1Bjsdz/Jj51zQd8wN0PlXga3/pbCXn9Hy1xVdyMdFfbUtvIa1GwrTJXW
	uyVAlRrmjGnmxVG4hHPBMMyGm1bNyawKQrr7sa65YOemGDAcBx6QCprogW4o8BmwwizIkjgVjoS0J
	dYy2yK7jvOTGKLpNm1nyK2TIYGuOu5fmJZJRSPjrHD7uD+GhOfsvAquUWSNCKQhKvmzKC+c/N4Vpf
	ATeZx4TfM6kD437ee5HVIduQ4ViKV9gWP3N/sXVvhenRw0N0V9U0qJcooDMovHGG0z91azlfb4P2m
	5qW6iRLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJXo-000000094kW-2Iwk;
	Thu, 18 Dec 2025 19:20:12 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJXl-000000094jd-0Hss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:20:11 +0000
Date: Thu, 18 Dec 2025 20:19:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1766085588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMI8gahPCkzfyAYCyt7orDE3Hlig6obQSOnVubX38hw=;
	b=ayQeIOYWIhuWrcl1GyU8FZ8BHEhQhUVd/Pw/svHsWCKBWgvEJNIymCmuaxZq4bYlXCavMY
	+2JWoQDVXxj5qLtJNKgjsyeVtYjouI7V/IiDsneJK4ULcIFqa4EXnd5DnMnlZ61q6VCupa
	Hml87eBKtAduyqvV/5JOJNL01d7J14w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH v3 3/3] ARM: samsung: exynos5250: Allow CPU1 to boot
Message-ID: <20251218191944.GA63330@l14.localdomain>
References: <20251215-lat3st-staging-v3-0-2e4914b64dd8@timmermann.space>
 <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-lat3st-staging-v3-3-2e4914b64dd8@timmermann.space>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112009_785763_1D1353B0 
X-CRM114-Status: GOOD (  23.80  )
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

Hi Lukas,

On Mon, Dec 15, 2025 at 04:05:24PM +0100, Lukas Timmermann wrote:
> From: Alexandre Marquet <tb@a-marquet.fr>
> 
> The firmware trustzone needs a special call to bring up the secondary
> cpu core on the Manta board. This seems to be not needed on other
> exynos5 boards and comes down to the available firmware on
> a particular board.
> 
> Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

I had a look at the manta bootloader, but have not been able to
pinpoint where the smc calls are handled. Nevertheless, Seems like
manta might be the only Exynos 5 android device that needs CPU1BOOT. I
tried to track down exynos5250-arndale's tzsw to compare with, but
seems like it is no longer available anywhere unfortunately.

Here's a summary of my findings from looking at sboot/the tzsw from
various devices, where `CPU1BOOT SMC is handled == yes` means that the
device needs the SMC call.

.----------------------.--------------.--------------.--------------.
| Device (exynos-)     | Similar tzsw | CPU1BOOT SMC | sboot/tzsw   |
|                      | to odroidxu? | is handled?  |   source     |
.----------------------.--------------.--------------.--------------.
  4212-tab3            | yes          | yes          | T310XXSBQB2
  4412-i9300           | yes          | yes          | I9300XXUGPE1
  4412-i9305           | yes          | yes          | I9305XXUFPB1
  4412-odroid{x,x2,u3} | yes          | yes          | wiki.odroid.com/_media/en/boot.tar.gz
  4412-origen          | no           | don't know   | Linaro's origen hwpack 20130130
  5260-hllte (SM-N7505)| no           | don't know   | N7505XXSDRI2
  5410-odroidxu        | yes          | no           | github.com/hsnaves/exynos5410-firmware
  5410-ja3g            | no           | don't know   | I9500XXUHPK1
  5420-chagall-wifi    | no           | no           | T800XXU1CRJ1
  5420-arndale-octa    | yes          | no           | Linaro's arndale-octa hwpack 20140323
  5422-odroid-xu{3,4}  | yes          | no           | Hardkernel's u-boot 2020.01 branch
  5422-samsung-k3g     | no           | don't know   | G900HXXU1CVG7

As can be seen none of the Exynos 5 devices in the list have been
confirmed to need/handle CPU1BOOT.

Best regards,
Henrik Grimler


> ---
>  arch/arm/mach-exynos/firmware.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/firmware.c b/arch/arm/mach-exynos/firmware.c
> index a5e22678e27b..e9b0ed07bb90 100644
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@ -61,10 +61,10 @@ static int exynos_cpu_boot(int cpu)
>  	 * Exynos3250 doesn't need to send smc command for secondary CPU boot
>  	 * because Exynos3250 removes WFE in secure mode.
>  	 *
> -	 * On Exynos5 devices the call is ignored by trustzone firmware.
> +	 * On most Exynos5 devices the call is ignored by trustzone firmware.
>  	 */
>  	if (!soc_is_exynos4210() && !soc_is_exynos4212() &&
> -	    !soc_is_exynos4412())
> +	    !soc_is_exynos4412() && !of_machine_is_compatible("google,manta"))
>  		return 0;
>  
>  	/*
> 
> -- 
> 2.52.0
> 
> 

