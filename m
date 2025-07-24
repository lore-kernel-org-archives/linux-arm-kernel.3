Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B8C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=; b=ZTudYdTyQuBwW62VWtYYK74yUy
	0U+uoxjO2RcRktiMeG7vOGfQGIchA5gfrqZji9ExezRYe3mqhGlkGTJoq/xgr4Uir6dIAqRIagArL
	+hm3c2lfTs390IXF6gh4NwuKE3YIVZcRXz5T4mp1UCxbgoKQJigRNQl+qMfBvJEaLYQmisolXXVzX
	DKO2KjqcfM45C1HKnhG6qjEVJA2Q6+9zNSZq+tSh9oX0L7BKcwwT8pG7e8iUCRqXLZAh1IsAhcgwI
	5afd/axnnGBEHMrQCl7qQrDvhE3J+4fsB4ULl+rhq3Dk8Oq44ApskZsqlCS5eOln7llnGNE1Ol49Y
	XSGGBpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOt-00000007cOx-3J3s;
	Thu, 24 Jul 2025 13:54:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuxz-00000007PB6-36xJ;
	Thu, 24 Jul 2025 12:22:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae0d7b32322so149904866b.2;
        Thu, 24 Jul 2025 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753359750; x=1753964550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=apvgJLClgt488rSSoFFzUmAEPEbNLkXZj/4etqobm/UqAA6mc60GEWkYetEbj06NUi
         xP+Roz2RE732ssxImhLdjULfSvMYWhasY60QHrtYDlgQrElUN8DuMjtevRYUJHE+ycHv
         8S664MD3aXDDR26llrOVq6o9nWCiCgx7nU2BFwYPBhZdzp0wZoyXzzoR7HwRFmSOaNSy
         7M9g/Yx1b4ZuX6oy66k5dQoIX9LpAaHBVHMqft6kIlhw4kC7RSV1nbZeOA652aTOFU1j
         sqTUsOX3u97oleuffaCKvB+xQo9qw2hOZi1tmba/P4fk8u3rwhAbkIdcahTVbQQUnweK
         qe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359750; x=1753964550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=qNfPvBO8wb0Glo1PZSwdmmRqADxpvm1hG3rA+OcAmbGE5dVRMY83QmhJBT6W0WjzeX
         7OuHAZHtOA2kEbjvoWaNetGErn05VsCuhk9Wr5rayhIoSzIh1l5md1DqTLHsWPPQ/oTW
         S0aBd/IDegUmyunC0Qhw3mnI4TX9bir0Xml/h/IuA6FDghi/LJyPTbhaiTuRkNPSFfSu
         Op/LsacoBpkSzg2meU9UmwiaAkhhMxYRffMQwq83R+Eartl8McGVNcQDM34e0w3Lz8UQ
         2hfSb4OTdqqXI43smccPF6VMOC0tGVb9WxnoX6xjuNyrcSVnvfmGOd6EwZVoPzkBAW8o
         ytAA==
X-Forwarded-Encrypted: i=1; AJvYcCXCo5rZbOEFZmnGwqLRIJJAicnMKC296LF+gttvUXL+lQnoGW09Oc2jzxgj4VBylTa8Md/v5yIdZbt2irGnXtDI@lists.infradead.org, AJvYcCXkpDi85iRRgtnfibpm44jBX/Dkvo2nIn/e7kRGe5aZWb5IJnCnnoRV3+xLsFn+YQufIuOGe4Z0manY0ymkgDg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiXNzT9b2DXwqvxa3ybK04Bzkc7D413vhWVV+/UdzavbHeWVYF
	2zLZXpwHGkqcPxfFoJ1316vr2zN5snPZ12QlZY44ErSfnA23TMv9T6EZXWtw0ckUC/RTuXOV9ww
	Dm0xjQe/f3IRMpi4iU8uXUSJIpu7EzSU=
X-Gm-Gg: ASbGncs4ISP8vJXO1wA2gqbszkTEKBt0Wp1vpQvIbZNNobrnaf4Qhvpy4QaYpi9FDYG
	NusvoNuw3vVGvPuU2QWPgDb9J8aZ5Xy484/rdDlf+yMtCA4PgEdNVKyQKeTEL8fTmVi8jfedVW1
	WWbVP0HuuqOzAQqHiAn4OhE8x6vClQ5w5J9veo8Vws1SoJtxgepjN6cg0gwBG5YBXd4ug9aAdSV
	iSCJW2zHA==
X-Google-Smtp-Source: AGHT+IHK0IoDJ6PED5zWXfzDhpKgh5VZvydISu4XMaUvDPUT/I7krIj8dXVVfHCUqibcmSSRfe/rVr8gG8zy8ado+mw=
X-Received: by 2002:a17:907:60cb:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af2f9385acfmr671282766b.56.1753359749816; Thu, 24 Jul 2025
 05:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 14:21:53 +0200
X-Gm-Features: Ac12FXz2KOnsH_foq66JE5xieoDhq1Ik71OykKjuCvc1b-KzV3FeiggPCBwSd4M
Message-ID: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_052231_782597_9BE03F91 
X-CRM114-Status: GOOD (  24.72  )
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

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core. While we could go with

passing
to the pinctrl

> a boolean "is_gpio" field, a flags field is more future-proof.
>
> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers. Add a new

"...the pin, which is muxed to it, ..."

> callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
> core to inspect a function and see if it's a GPIO one. Provide a generic
> implementation of this callback.

...

> -       if (ops->strict && desc->mux_usecount)
> +       if (ops->function_is_gpio && mux_setting)

Seems mux_setting presence is prior to the GPIO checks, I would swap
the parameters of &&.

> +               func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                    mux_setting->func);

One line is okay.

> +       if (ops->strict && desc->mux_usecount && !func_is_gpio)
>                 return false;
>
>         return !(ops->strict && !!desc->gpio_owner);

I think this whole if/return chain can be made slightly more readable,
but I haven't had something to provide right now. Lemme think about
it,

...

> +               if (ops->function_is_gpio && mux_setting)
> +                       func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                            mux_setting-=
>func);
> +               if ((!gpio_range || ops->strict) && !func_is_gpio &&
>                     desc->mux_usecount && strcmp(desc->mux_owner, owner))=
 {

This is very similar to the above check, I think at bare minimum here
can be a helper for both cases.

...

> +/**
> + * pinmux_generic_function_is_gpio() - returns true if given function is=
 a GPIO
> + * @pctldev: pin controller device
> + * @selector: function number

Missing Return section. Please run kernel-doc validator against new kernel-=
docs.

> + */
> +bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
> +                                    unsigned int selector)
> +{
> +       struct function_desc *function;
> +
> +       function =3D radix_tree_lookup(&pctldev->pin_function_tree,
> +                                    selector);

One line is okay.

> +       if (!function)
> +               return false;
> +
> +       return function->func->flags & PINFUNCTION_FLAG_GPIO;
> +}

...

>  struct pinfunction {
>         const char *name;
>         const char * const *groups;
>         size_t ngroups;
> +       unsigned long flags;

Not sure we need this. If the function is GPIO, pin control already
knows about this. The pin muxing has gpio request / release callbacks
that change the state. Why do we need an additional flag(s)?

>  };

--=20
With Best Regards,
Andy Shevchenko

