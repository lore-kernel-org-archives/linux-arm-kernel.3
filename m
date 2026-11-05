Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 23:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vuW6g74M;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfCU20bl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YaBcuTS2/J1mzNJ1LILtsklT83XrE9jGAVFB2V2Mc28=; b=vuW6g74MI+v7nM
	TlgEWHuf3XRy2ZbUyOEn768j1IM6LPvwCNVkFSBJ71xmrG3aYwCi2axVHmhmtpDsni77cvcDa0MvK
	P8SuP1HQDvpBvsBv9LMa+taoaCu/wCCJWnWBNk/PtloH59n4+zPTk8ZSbIMc+eok2ahkQdykQy1am
	d2y16aM8xarj97zCVoGNV+zGZmVJlKciZTYoZBR/lryxPLA7uUKsZeNGaCNM4LCO9PEp6DQVC2GTM
	L0+BoQeMu5HkeDJTeUifX7Ek/H6akDaVNdvVaL9Q+sXpx52NTv9OjH4/XFABcGxqoYR+Yfg/LqnUZ
	3NCRvYypTSm5xXVObUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6XU-0000000Aqll-3b0G;
	Thu, 05 Nov 2026 23:06:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6XS-0000000AqlO-09TP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 23:06:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 703BF43EB0
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 23:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581291F008A2
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793919993;
	bh=YaBcuTS2/J1mzNJ1LILtsklT83XrE9jGAVFB2V2Mc28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YfCU20bl5BO8wiSlNqEOUlaPEOjSEKdEZ1tP0SQeC+sbSm8Ylz2A1J83L573TwGJj
	 LRYptvU5PS1s7p/S6vUmxHEC9jOz8zU9563xmG8dDB7Kq4PrSzY+aKwvPaeXADd7xT
	 ytS9Hh08EYRFfPsRu6Tt7NLI137BqSqFSx9hSQVq6cHyV8xdTDK21jPBCR2/IquQWQ
	 JbxDbaTwHWnmcDr/Tw3W7JSEieJIFbr9m4JV8+k41O8TPbUVNCS33PnKEbuTZm2gOl
	 O5kuf4FmNB4pUYdjvsKOTXBO89ukTb26mXnqfzrlrGm8vv9daUIlIVQikqiN9a4gsK
	 yZduW67QlWtQg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso40196e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 15:06:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzB7wzzW3/T5VGaKWJlzccxaZXfh2lNTRAWD8hK34gWIAGMQ7YdMayvph4mAjR+r270nx0uc/6F8nEBQ1zAo1qq@lists.infradead.org
X-Gm-Message-State: APuU4Z+f4NJ/W47XjF2ZO9zb1eW+iSoOcx2d4kXjsJ4FoBhNH9p0mp2e
	JCRprIIdFvpaW4PH3r5pO7k99ChVY4HnT0wiUaSt/oKvkUBLKTNqyxEMUgyxN6rTXAp5i7/TWOA
	z3piq05uIwmeUOx3DaP3iP3nOicYxfyU=
X-Received: by 2002:a05:6512:12d6:b0:5bf:d072:fa3f with SMTP id
 2adb3069b0e04-5c003aedaf5mr130898e87.54.1793919991966; Thu, 05 Nov 2026
 15:06:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261101-xg6846b-bcmbca-xrdp-reset-v2-0-455fe9eed5ee@kernel.org>
 <20261101-xg6846b-bcmbca-xrdp-reset-v2-5-455fe9eed5ee@kernel.org> <179383086680.620422.9240673673295480953.b4-review@b4>
In-Reply-To: <179383086680.620422.9240673673295480953.b4-review@b4>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 00:06:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLnKQof8mO1KNRvZxE6Tin65w8jdSaZT5OqV_O7pwVD_8g@mail.gmail.com>
X-Gm-Features: AclHuK9TCTCv47BMRDRzDvAaOOJPAOA3SDISY1H9ALtJZ7Baq-LrE9h49u9eXP8
Message-ID: <CAD++jLnKQof8mO1KNRvZxE6Tin65w8jdSaZT5OqV_O7pwVD_8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] clk: bcm: Add BCMBCA PMB clocks
To: Brian Masney <masneyb@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brian,

thanks for reviewing!

On Wed, Nov 4, 2026 at 11:21=E2=80=AFPM Brian Masney <masneyb@kernel.org> w=
rote:

> > +static int bcmbca_pmb_clock_prepare(struct clk_hw *hw)
> > +{
> > +     struct bcmbca_pmb_clock *clock =3D to_pmb_clock(hw);
> > +     const struct bcmbca_pmb_clock_desc *desc =3D clock->desc;
> > +     unsigned int shift =3D (desc->channel % 2) * 16;
> > +     unsigned int reg =3D BCMBCA_PMB_REG(desc->bus, desc->device, desc=
->reg);
> > +     u32 value;
> > +     int ret;
> > +
> > +     switch (desc->type) {
> > +     case PMB_PLL_CHANNEL: {
> > +             unsigned int regs[] =3D {
> > +                     BCMBCA_PMB_REG(desc->bus, desc->device, desc->pll=
->status),
> > +                     BCMBCA_PMB_REG(desc->bus, desc->device,
> > +                                    desc->pll->ch01 + desc->channel / =
2),
> > +             };
> > +             u32 values[ARRAY_SIZE(regs)];
> > +
> > +             ret =3D regmap_multi_reg_read(clock->regmap, regs, values=
, ARRAY_SIZE(regs));
> > +             if (ret)
> > +                     return ret;
> > +             /* Firmware owns PLL power and reset. */
> > +             if (!(values[0] & PLL_LOCK))
> > +                     return -EAGAIN;
>
> Should this be -EPROBE_DEFER instead?

Not here since it is a .prepare() callback which is called at runtime,
it would be weird to get this return code from preparing a clock?

> > +static int bcmbca_pmb_clock_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct regmap *regmap =3D dev_get_regmap(dev->parent, NULL);
> > +     struct clk_hw_onecell_data *data;
> > +     struct bcmbca_pmb_clock *clocks;
> > +     struct clk *ref;
> > +     unsigned int i;
> > +     int ret;
> > +
> > +     if (!regmap)
> > +             return -ENODEV;
> > +
> > +     ref =3D devm_clk_get(dev, "ref");
>
> This is never used. Is this to defer probe until the ref exists?

Yep.

> > +     for (i =3D 0; i < data->num; i++) {
> > +             const struct bcmbca_pmb_clock_desc *desc =3D &bcm6846_clo=
cks[i];
> > +             struct clk_parent_data parent =3D {};
> > +             struct clk_init_data init =3D {
> > +                     .ops =3D &bcmbca_pmb_clock_ops,
> > +                     .flags =3D CLK_GET_RATE_NOCACHE | CLK_IGNORE_UNUS=
ED,
>
> The CLK_IGNORE_UNUSED has no effect since there's no disable /
> disable_unused ops.
>
> Also why CLK_GET_RATE_NOCACHE on all clocks?

The latter is only needed on PLL outputs as they need to read
the state of some hardware dividers. I'll restrict it to those.

I fixed the rest!

Yours,
Linus Walleij

