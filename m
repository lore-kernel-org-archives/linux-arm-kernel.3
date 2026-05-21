Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A88CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy4BKpHNHM+d+C5MQaz0Pfp3rV7HUmKvJcZNuYOmGCA=; b=iZ1Ycl01E8TRLk3de/VzmEqI76
	g3vPVkZ0sgkhaH023L6jcn3itEElfPVL6ePhsu/Z5OHaby4PwRdf5VSJlh0BoB535a+2GfCAiwbwg
	Q68zaNd8USp1rdR8c2wppJtQHDmZJnHetdrmizHzjcXR5G7D6m+cOLMzbmujULANtY0eb1pQ/JKvF
	0bBJBboHl4l9PT2CuGu2LGXlHWrkLGcJ7lVAT24USUSrKfY9Q2MZ0QioMaBIyizXJ7/A4CihNlfIA
	2j/gb4Z9jSNx1SsbxJ1dYnI+Ha1NbguCQ2tvuZemi1+CMfX6iWtKH1egBtK750sLm+8X2W8CPwm2E
	bca6h1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAiI-000000096dp-0kBs;
	Thu, 21 May 2026 21:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAiG-000000096dT-1IFD;
	Thu, 21 May 2026 21:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Sy4BKpHNHM+d+C5MQaz0Pfp3rV7HUmKvJcZNuYOmGCA=; b=dRlk4x/TVNfepMEunR/XV2wW7L
	+WXTOyoyTUWwOxrmoxDIbupQ6QBb7znQJlAD3qmn1PhbXU34c9c4XpvLGIIz4kYGmiPpFk88o4jVF
	NGN4JtqfKA3NGtTCtb1+Wq/KIHlbJWtJobTsFhmnPGrHlRpdIAqo2ihKpryJXmjGiOfpUVrOsqsrt
	VQbQE9ThBCrzU+vqwxg4seKk3Fq3PWvuD+GttqyZopEwDBNhETZnimPE7Ecr1hUqDcleooMIdyFvG
	/se18GXFughT6PzGlk5+phHuHJTjRyUa8gGT3wN4LEwVxOBCCrY/3GAv4upZVXuyvWXaau9eGXQ7d
	CRKoR7fg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQAiC-00000002xRu-0ey0;
	Thu, 21 May 2026 21:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sy4BKpHNHM+d+C5MQaz0Pfp3rV7HUmKvJcZNuYOmGCA=; b=M5tdlvk2EZxV1mvppezSooHfQG
	VAniydlKL1Ot1Fgfr0pur2EWaHcb4YnxDtLKOYP25T8rmUcf9rmzdxIp51bRlmCC6GYWtIzC0XLBp
	rbP/jf8iJHYXlpLxYqiJic8r8+umWHLXnHHzAYpDyhHRxIWDmwwPnOLZUaIODWy/9aZKgz4i9vY/P
	SJiRxJHRFZV+s127ZrNwDhldbuD01dtGLeeB9r5micviUE8Cgoqax2oWhtRs1oT+3vw1Hx/jz+/Wv
	+F0fOWjU1j675w03m96k90rAakIbhc69K55T8o5j9KYp3UjotNiR+6zkgGoyFVKkh0wXXsfPBaYhz
	bXfqFfiw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Steven Price <steven.price@arm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: rockchip: keep reset control around
Date: Thu, 21 May 2026 23:13:46 +0200
Message-ID: <12983716.zapYfy813O@phil>
In-Reply-To: <20260521210915.2331176-1-heiko@sntech.de>
References: <20260521210915.2331176-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_221348_740854_F79AE2BD 
X-CRM114-Status: GOOD (  21.16  )
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

Am Donnerstag, 21. Mai 2026, 23:09:15 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Heiko Stuebner:
> Do not put the reset control, retain exclusive control over it.
> After turning on a CPU, the corresponding reset line must stay
> deasserted.
>=20
> This also avoids calling reset_control_put() before workqueues
> are operational.
>=20
> Fixes: 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

=46orgot to add Bartosz to the Cc list, sorry


Heiko

> ---
>  arch/arm/mach-rockchip/platsmp.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/pl=
atsmp.c
> index f432d22bfed8..f659d894bfae 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -34,6 +34,7 @@ static int ncores;
> =20
>  static struct regmap *pmu;
>  static int has_pmu =3D true;
> +static struct reset_control *cpu_rstc[4];
> =20
>  static int pmu_power_domain_is_on(int pd)
>  {
> @@ -64,9 +65,11 @@ static struct reset_control *rockchip_get_core_reset(i=
nt cpu)
>  static int pmu_set_power_domain(int pd, bool on)
>  {
>  	u32 val =3D (on) ? 0 : BIT(pd);
> -	struct reset_control *rstc =3D rockchip_get_core_reset(pd);
> +	struct reset_control *rstc;
>  	int ret;
> =20
> +	rstc =3D pd < ARRAY_SIZE(cpu_rstc) ? cpu_rstc[pd] : ERR_PTR(-EINVAL);
> +
>  	if (IS_ERR(rstc) && read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9) {
>  		pr_err("%s: could not get reset control for core %d\n",
>  		       __func__, pd);
> @@ -100,11 +103,8 @@ static int pmu_set_power_domain(int pd, bool on)
>  		}
>  	}
> =20
> -	if (!IS_ERR(rstc)) {
> -		if (on)
> -			reset_control_deassert(rstc);
> -		reset_control_put(rstc);
> -	}
> +	if (!IS_ERR(rstc) && on)
> +		reset_control_deassert(rstc);
> =20
>  	return 0;
>  }
> @@ -312,6 +312,10 @@ static void __init rockchip_smp_prepare_cpus(unsigne=
d int max_cpus)
>  		ncores =3D ((l2ctlr >> 24) & 0x3) + 1;
>  	}
> =20
> +	/* Collect cpu core reset control for each core */
> +	for (i =3D 0; i < ncores; i++)
> +		cpu_rstc[i] =3D rockchip_get_core_reset(i);
> +
>  	/* Make sure that all cores except the first are really off */
>  	for (i =3D 1; i < ncores; i++)
>  		pmu_set_power_domain(0 + i, false);
>=20





