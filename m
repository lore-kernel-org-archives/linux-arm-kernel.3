Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A94606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nH5gEBql;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wqm7qclk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OkdQNpqFK74AqsoSuQLpJuuXQ3xGNg7YSqinWqkNxfE=; b=nH5gEBqlHFyvzf
	+b8POP2pppcNVXdxZziBZRl3cwKEi8usdVzJglSQ/5plQ8y/thDDH9/0SkruM2lagRZTp7UwNfTky
	sL+iwbi2P3ynGuXbxRLkII8BlPxzVVbruMiXEU8wr4fUeng8iGy1ZSyTbVRdulgqJ1VGc+uhSPIKa
	bS9Kqxzs14ysyVs2MgxGp9KtQx7P/DxEug5tMokwLWSa2k8tX2W2A8+7WtZ2VHAUWJNKyQcMlenzj
	YkTVth7YAeiDYFCwauUZxzbY4OPG/YjWyx6uTLX+GIC8KLVO4Tu2SKUowHn3c269wH6YmXktNSn70
	9h7U+r7NMwSShKEV//TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMph-00000008tnt-1wyH;
	Thu, 29 Oct 2026 09:54:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMpg-00000008tnT-2LGr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 09:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D67E6441F4
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4051F01828
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267643;
	bh=OkdQNpqFK74AqsoSuQLpJuuXQ3xGNg7YSqinWqkNxfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Wqm7qclkHoXKlMjWa8va4QemdTTs530yYwgHgelW2lqoy48S4AkXyDe5U3Y5twfR1
	 41N1sTVcB2cFotlHA1yCpSndHjSIEvBwht/V+xdFUj+ydF7xPTS/7Trd9htv1NDEq1
	 9X87+x4yTw+q5jXcTyRgZWCeYWZzmm7d5oLYj9wYii1hZ39cIJDwM94l+38HfyiaPQ
	 KAGxRTX7ZJlLsaA1KKXPihtpuBYglVh6ynYs2e7fMn+wgGeMMqdmHWM1V7JpoSVFyw
	 MFe0kHOS0d+PRrM+epXoh400M4s+6u+Z8L34VtGpfrFyhwP+3vC2Yw3Xp7K3RNpNsf
	 TZ8UZWTg/9hnw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2232638e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 02:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz0HjcPu9NErEa78eN6ksrdwl10KzjRBgRwv9ngnDG8Vn1gbnmdMgAvl1ZqK1kYw62oAcJfjIu3HnAILFQMjuyu@lists.infradead.org
X-Gm-Message-State: AFq9FYL3zVEEGn5gP87gakNL8AST/9CntmOabh9sGYdVxcrtl5y93Dva
	lVnOSyHaYmNkSmJbycbKTekmu15y5FNmX+a5zs7IjHFTx5jEL5HXV2cgQ61VBvBu/fVThTABjc4
	AlTE+HJD3j18Nj+Gu7esICOyNG0JrrVE=
X-Received: by 2002:a05:6512:39c5:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5bfcad8adb2mr1930089e87.33.1793267642415; Thu, 29 Oct 2026
 02:54:02 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn> <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 10:53:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkwe+Vby4swUC85buxPMjm0=ZVZXY2+UfeMStemfh3fGA@mail.gmail.com>
X-Gm-Features: AclHuK-EdA1h9oU-ad6g7JzfaGvAyb9JuROsLdwvHKxOHcdM6tjvaL_X7Nax-1E
Message-ID: <CAD++jLkwe+Vby4swUC85buxPMjm0=ZVZXY2+UfeMStemfh3fGA@mail.gmail.com>
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Han,

thanks for your patch!

On Tue, Oct 27, 2026 at 4:38=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

>  drivers/pinctrl/pinctrl-a210.c | 1212 ++++++++++++++++++++++++++++++++++=
++++++

Can you please name this pinctrl-zhihe-a210.c

> +config PINCTRL_A210

And this symbol PINCTRL_ZHIHE_A210

> +       tristate "Pinctrl driver for the ZhiHe A210 SoC"
> +       depends on 64BIT

Why?

> +       depends on OF && (ARCH_ZHIHE || COMPILE_TEST)

Isn't this enough of constraints?

> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       select PINMUX

Nice use of generic helpers!

> +struct a210_pinctrl;

Why this forward declaration? since...

> +enum a210_pinctrl_type {
> +       A210_PADCTRL_AON,
> +       A210_PADCTRL_0,
> +       A210_PADCTRL_1,
> +       A210_PADCTRL_2,
> +};
> +
> +struct a210_pad_group {
> +       const char *name;
> +       const struct pinctrl_pin_desc *pins;
> +       unsigned int npins;
> +       unsigned int offset_mux;
> +       unsigned int mask_mux;
> +       unsigned int offset_cfg;
> +       unsigned int mask_cfg;
> +       enum a210_pinctrl_type type;
> +};

... it anyway isn't used before we get here.

> +struct a210_pinctrl {
> +       struct pinctrl_desc desc;
> +       raw_spinlock_t lock; /* serialize register access */
> +       void __iomem *base;
> +       struct clk *clk;
> +       bool clk_enabled;
> +       unsigned int offset_mux;
> +       unsigned int mask_mux;
> +       unsigned int offset_cfg;
> +       unsigned int mask_cfg;
> +       enum a210_pinctrl_type type;
> +       struct pinctrl_dev *pctl;
> +#ifdef CONFIG_PM_SLEEP
> +       struct a210_register_state cfg_state[A210_MAX_CFG_REGS];
> +       struct a210_register_state mux_state[A210_MAX_MUX_REGS];
> +#endif
> +};
> +
> +static void __iomem *a210_padcfg(struct a210_pinctrl *pp, unsigned int p=
in)
> +{
> +       int width =3D hweight32(pp->mask_cfg);
> +
> +       return pp->base + pp->offset_cfg + 4 * (pin * width / 32);

Explain in a comment in the code exactly what is going on here, why 4*
why /32 why hweight32 etc. People can't parse this.

> +static unsigned int a210_padcfg_shift(struct a210_pinctrl *pp, unsigned =
int pin)
> +{
> +       int width =3D hweight32(pp->mask_cfg);
> +
> +       return width * (pin & (32 / width - 1));

Dito.

> +static void __iomem *a210_muxcfg(struct a210_pinctrl *pp, unsigned int p=
in)
> +{
> +       int width =3D hweight32(pp->mask_mux);
> +
> +       return pp->base + pp->offset_mux + 4 * (pin * width / 32);

Here is is fine to reference earlier explanation.


> +static unsigned int a210_muxcfg_shift(struct a210_pinctrl *pp, unsigned =
int pin)
> +{
> +       int width =3D hweight32(pp->mask_mux);
> +
> +       if (pp->type =3D=3D A210_PADCTRL_2)
> +               return 0;
> +
> +       return width * (pin & (32 / width - 1));

Here is is fine to reference earlier explanation.

> +enum a210_muxtype {
> +       A210_MUX_____,

I've seen this *______ stuff in other drivers, I guess it's something
with making things readable, just explain it to me please.

> +static const struct pinctrl_pin_desc a210_group0_pins[] =3D {
> +       A210_PAD(0, OSC_CLK_IN, ____, ____, ____, ____, ____, ____, ____,=
 ____, A210_PAD_NO_PADCFG),

I guess for this to mean "no pad here for this setting" or something.

> +static const u8 a210_drive_strength_in_ma[16] =3D {
> +       1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25,
> +};
> +
> +static int a210_drive_strength_from_ma(u32 arg)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(a210_drive_strength_in_ma); i++)
> +               if (arg =3D=3D a210_drive_strength_in_ma[i])
> +                       return i;

Don't you want some fuzzing here?

arg <=3D a210_drive_strength_in_ma[i]? So you get 5 if you list 4.

Default to 25 if > 25? Or no maybe that should indeed fail...

> +static int a210_padcfg_rmw(struct a210_pinctrl *pp, unsigned int pin, u3=
2 mask, u32 value)
> +{
> +       void __iomem *padcfg =3D a210_padcfg(pp, pin);
> +       unsigned int shift =3D a210_padcfg_shift(pp, pin);
> +       u32 tmp;
> +
> +       mask <<=3D shift;
> +       value <<=3D shift;

That's pretty straight forward and easy to read, thanks!

> +
> +       scoped_guard(raw_spinlock_irqsave, &pp->lock) {
> +               tmp =3D readl_relaxed(padcfg);
> +               tmp =3D (tmp & ~mask) | value;
> +               writel_relaxed(tmp, padcfg);
> +#ifdef CONFIG_PM_SLEEP
> +               pp->cfg_state[pin * hweight32(pp->mask_cfg) / 32].mask |=
=3D mask;

What's going on here and why? Add a comment explaining it.

> +static int a210_sdio_pinconf_get(struct a210_pinctrl *pp, unsigned int p=
in,
> +                                unsigned long *config)
> +{
> +       enum pin_config_param param =3D pinconf_to_config_param(*config);
> +       u32 value =3D readl_relaxed(a210_padcfg(pp, pin)) & A210_SDIO_BIA=
S;
> +
> +       switch (param) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +               if (value)
> +                       return -EINVAL;
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +               if (value !=3D A210_SDIO_PULL_UP)
> +                       return -EINVAL;
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +               if (value !=3D A210_SDIO_PULL_DOWN)
> +                       return -EINVAL;
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       *config =3D pinconf_to_config_packed(param, param !=3D PIN_CONFIG=
_BIAS_DISABLE);

Explain why *config is set like this in a comment.

> +static int a210_sdio_pinconf_set(struct a210_pinctrl *pp, unsigned int p=
in,
> +                                unsigned long *configs, unsigned int num=
_configs)

This is pretty straight forward to read though.

> +static int a210_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pi=
n, unsigned long *config)

So is this.

Review cut short due to time problems, will review next version!

Yours,
Linus Walleij

