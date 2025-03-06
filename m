Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7EFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=; b=viZQPHOJR9xUgudbrgEhrAZy/X
	ut3j7hcziw9yERmQ3WmN15sO0X+m0gG931gCPJ5tq/hd0Oh7aMAZ9+CIrrPUWIvTX7LZhrzxw7s9g
	eAHTokpk0mWFgp7jfYTVzHiDNBi+NrGoqYexuipnj2WnTEmLztMy478UXdZvaIlU4ptwxjorYWTLs
	xrsWD5jEXrYpTjxaqds8Aoki6sk3IupbqT0WkHO3r3lXydbUecBboHplpheKfn3KCcuJkHFutd7O2
	IiRcSWLVc3IECpQiY3gf06+zosgGkDHRSA15NCwMZAHU+ftefTBZrcG9oBeGNAwlI8XGW1s/79N4y
	azFeI80Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCwy-0000000BI2J-39Bi;
	Thu, 06 Mar 2025 15:15:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCtt-0000000BHlU-3XED
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 15:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=; b=GVJ/h0Pq3trQO5lgpvtQuaPr7r
	loNqRRfzjFQBsEr6oMKAEb5q8rgyveodGboq4LTm30hNZQUkIB5SREdtOZVaG4K7y1bfGbmpdrOgJ
	5yD4nwWk5SVmQimwJ7CNLpJMsw01GZ3NQA7jTDKNjG0SBUDQYriGNUGfik/aL9vsvypKG2LLGylHY
	QXjDo3cbxamuyLs/rQu4O4+RsOSzj0Nyun1hGT+jQwF9nVllI893KlYOiG9UVI+bdSfbM5U+YlNYe
	oiWE5BsIg4dkwo0puwjvpbrc5N107JcSIOM7bRoR3KtHEd3/kRIJhFfYB+cTBr3vU1EeWz/PRcbzb
	D2DhLbJQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCtp-0000000ANOQ-0T8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:12:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abec8b750ebso132772766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 07:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741273954; x=1741878754; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=;
        b=qv1VRsvL0oB1vqeBFrqwLcTmqHW082eyd/BfDhTL7KNGVOamvDgOUfikDeo8fnpFQH
         6DwPHj+J/Yed3r8PmxNL0oAEwhxuhmaPZL5tnJu4npyXNcqrXf9kTvZ19w2T43cjvhla
         3fBedTH3yxCpVgL0avSqlWYs51ef6MIc660uitWTwz3VVPF2jtJAAq7Oto0Z8FZctLq1
         yxpdm318yIVASbV1Gy5grU4IVlELQwZXdhyKFM+dxWXqhKurydLt9am8uHl/FatX7e/S
         ZOrQ0whMZYzT3BEmOwcec8v7mrBtIa921F/XDJI2VFl78xEc03F8c2V2Pr6LLWIDxUDt
         i+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273954; x=1741878754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t63bq+d/LpsIykq1hi1k/LtwI40WtvQ23p3N/1mWz+k=;
        b=je9p1gfmQkhNxplbmEoIyfptf2TmSq8n3AC0Ok6yE5oBb5hcN3yGTjuZNIH4oxqj5l
         vmy8HtghIKAXtVllmgH+0QW+AwSxgSu9Je9dG3/TzPiq2onilQMdUvd8ogwqcBIT8iQ3
         JeRmCOE/iyp0Kz1e6oh371uJM15WO4bnzPw/SFeV7fS0XLYYpMPa1LVa+0+K/hxWaif2
         pxWh1Cfv+zz1/H8uLo1IR33aP5aA19jbCUQRzlmv6CnyFr6MyUdyUQPttsOqEygdXfd6
         iOGTVdHalELH5yRa33/hJTl8Gz4dVUfEOwKek6NsSaa3npSGcNfIY0vHYTfsugu1p61A
         CHkQ==
X-Gm-Message-State: AOJu0Yy23dDsmqNkvBS6TyaoxenEfjwfEz/cUihT7meMdPBp81vFotSq
	s181ZCz7ToNXuWMlbvZ/EWYynLy8veJYwIgID6gOh8o8u1oKudYfZOxqQn/n4gU=
X-Gm-Gg: ASbGncuBqquGVUplCqW9PBkRQixh1gOrHxNg/mghxTW8Drh7jxh5e6zmLAx+XK6LHGS
	rjNVNTj7Z/CJ9RcSdQi5Uqu+KsA5Ea7f+VQqh1Om+mq2k44I2215DIPAeUg0ohnLxLjPheSubnA
	1Ums+49PV9feW/ss6PJqfsOmpXZTyUmAq6VpLxuQZKuwkjzBK41Fs/zLv4iFu+PhmWFIiZqMZ1s
	XB34YNtGm4oAZq5wGPK0VwFRbser/0ZsGY4RY40FgitKc7qs7PAGF9uN1jKPf4f1f+D8p44ZAzq
	VpxMyQ4yqt6pzBILl/OMKMG7tTzgUwG/dpaONdL3/kmTmiQK
X-Google-Smtp-Source: AGHT+IH7SBrGMUK6lepD8VBY8jodF8Fc1H+Cg8ymOlKEi3QzrC0KSEIuP1OA3o6i6LlXHdXrzopcZA==
X-Received: by 2002:a17:907:7f89:b0:ac1:db49:99b7 with SMTP id a640c23a62f3a-ac20e42964amr851164166b.51.1741273954310;
        Thu, 06 Mar 2025 07:12:34 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239488be1sm110733966b.74.2025.03.06.07.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:12:33 -0800 (PST)
Message-ID: <5fe34e1193a167c24c7af900f5b7cf85140d66e0.camel@linaro.org>
Subject: Re: [PATCH v2 3/4] pinctrl: samsung: add gs101 specific eint
 suspend/resume callbacks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org, 	kernel-team@android.com,
 jaewon02.kim@samsung.com, stable@vger.kernel.org
Date: Thu, 06 Mar 2025 15:12:32 +0000
In-Reply-To: <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
References: <20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org>
	 <20250301-pinctrl-fltcon-suspend-v2-3-a7eef9bb443b@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_151237_982392_46E8B053 
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

On Sat, 2025-03-01 at 11:43 +0000, Peter Griffin wrote:
> gs101 differs to other SoCs in that fltcon1 register doesn't
> always exist. Additionally the offset of fltcon0 is not fixed
> and needs to use the newly added eint_fltcon_offset variable.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configurati=
on")
> Cc: stable@vger.kernel.org
> ---
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 24 ++++-----
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 71 ++++++++++++++++++++++++++
> =C2=A0drivers/pinctrl/samsung/pinctrl-exynos.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +
> =C2=A03 files changed, 85 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pin=
ctrl/samsung/pinctrl-exynos-arm64.c
> index 57c98d2451b5..fca447ebc5f5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> @@ -1455,15 +1455,15 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
> =C2=A0		.pin_banks	=3D gs101_pin_alive,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_alive),
> =C2=A0		.eint_wkup_init =3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (FAR_ALIVE) */
> =C2=A0		.pin_banks	=3D gs101_pin_far_alive,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_far_alive),
> =C2=A0		.eint_wkup_init =3D exynos_eint_wkup_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (GSACORE) */
> =C2=A0		.pin_banks	=3D gs101_pin_gsacore,
> @@ -1477,29 +1477,29 @@ static const struct samsung_pin_ctrl gs101_pin_ct=
rl[] __initconst =3D {
> =C2=A0		.pin_banks	=3D gs101_pin_peric0,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_peric0),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (PERIC1) */
> =C2=A0		.pin_banks	=3D gs101_pin_peric1,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_peric1),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume	=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (HSI1) */
> =C2=A0		.pin_banks	=3D gs101_pin_hsi1,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_hsi1),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	}, {
> =C2=A0		/* pin banks of gs101 pin-controller (HSI2) */
> =C2=A0		.pin_banks	=3D gs101_pin_hsi2,
> =C2=A0		.nr_banks	=3D ARRAY_SIZE(gs101_pin_hsi2),
> =C2=A0		.eint_gpio_init =3D exynos_eint_gpio_init,
> -		.suspend	=3D exynos_pinctrl_suspend,
> -		.resume		=3D exynos_pinctrl_resume,
> +		.suspend	=3D gs101_pinctrl_suspend,
> +		.resume		=3D gs101_pinctrl_resume,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index d65a9fba0781..ddc7245ec2e5 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -801,6 +801,41 @@ void exynos_pinctrl_suspend(struct samsung_pin_bank =
*bank)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank)
> +{
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +	const void __iomem *regs =3D bank->eint_base;
> +
> +	exynos_set_wakeup(bank);

As for patch 2, would be good to have this if / else, to make it more
obvious that this is conditional, too.

> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +
> +		save->eint_fltcon0 =3D readl(regs + EXYNOS_GPIO_EFLTCON_OFFSET +
> +					=C2=A0=C2=A0 bank->eint_fltcon_offset);

If there's another version, maybe align style where the '+'
is placed (end of line vs start of line). It seems this file
generally uses + at start of line.

> +
> +		/* fltcon1 register only exists for pins 4-7 */
> +		if (bank->nr_pins > 4)
> +			save->eint_fltcon1 =3D readl(regs +
> +						EXYNOS_GPIO_EFLTCON_OFFSET +
> +						bank->eint_fltcon_offset + 4);
> +
> +		save->eint_mask =3D readl(regs + bank->irq_chip->eint_mask
> +					+ bank->eint_offset);
> +
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x\n",
> +			 bank->name, save->eint_con);
> +		pr_debug("%s: save fltcon0 %#010x\n",
> +			 bank->name, save->eint_fltcon0);
> +		if (bank->nr_pins > 4)
> +			pr_debug("%s: save fltcon1 %#010x\n",
> +				 bank->name, save->eint_fltcon1);
> +		pr_debug("%s: save=C2=A0=C2=A0=C2=A0 mask %#010x\n",
> +			 bank->name, save->eint_mask);
> +	}
> +}
> +
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> @@ -820,6 +855,42 @@ void exynosautov920_pinctrl_suspend(struct samsung_p=
in_bank *bank)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +void gs101_pinctrl_resume(struct samsung_pin_bank *bank)
> +{
> +	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> +
> +	void __iomem *regs =3D bank->eint_base;
> +	void __iomem *eint_fltcfg0 =3D regs + EXYNOS_GPIO_EFLTCON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_fltcon_offset;
> +
> +	if (bank->eint_type =3D=3D EINT_TYPE_GPIO) {
> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0=C2=A0 con %#010x =3D> %#010x\n", bank-=
>name,
> +			 readl(regs + EXYNOS_GPIO_ECON_OFFSET
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_con);
> +
> +		pr_debug("%s: fltcon0 %#010x =3D> %#010x\n", bank->name,
> +			 readl(eint_fltcfg0), save->eint_fltcon0);
> +
> +		/* fltcon1 register only exists for pins 4-7 */
> +		if (bank->nr_pins > 4) {
> +			pr_debug("%s: fltcon1 %#010x =3D> %#010x\n", bank->name,
> +				 readl(eint_fltcfg0 + 4), save->eint_fltcon1);
> +		}

If there's another version, braces are not needed here.

Cheers,
Andre'


> +		pr_debug("%s:=C2=A0=C2=A0=C2=A0 mask %#010x =3D> %#010x\n", bank->name=
,
> +			 readl(regs + bank->irq_chip->eint_mask
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset), save->eint=
_mask);
> +
> +		writel(save->eint_con, regs + EXYNOS_GPIO_ECON_OFFSET
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +		writel(save->eint_fltcon0, eint_fltcfg0);
> +
> +		if (bank->nr_pins > 4)
> +			writel(save->eint_fltcon1, eint_fltcfg0 + 4);
> +		writel(save->eint_mask, regs + bank->irq_chip->eint_mask
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + bank->eint_offset);
> +	}
> +}
> +
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank)
> =C2=A0{
> =C2=A0	struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/s=
amsung/pinctrl-exynos.h
> index 35c2bc4ea488..773f161a82a3 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
> @@ -225,6 +225,8 @@ void exynosautov920_pinctrl_resume(struct samsung_pin=
_bank *bank);
> =C2=A0void exynosautov920_pinctrl_suspend(struct samsung_pin_bank *bank);
> =C2=A0void exynos_pinctrl_suspend(struct samsung_pin_bank *bank);
> =C2=A0void exynos_pinctrl_resume(struct samsung_pin_bank *bank);
> +void gs101_pinctrl_suspend(struct samsung_pin_bank *bank);
> +void gs101_pinctrl_resume(struct samsung_pin_bank *bank);
> =C2=A0struct samsung_retention_ctrl *
> =C2=A0exynos_retention_init(struct samsung_pinctrl_drv_data *drvdata,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct samsung_retention_dat=
a *data);
>=20


