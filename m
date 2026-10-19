Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4960740AD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3mWY0LW+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=; b=3mWY0LW+9EIVTepPSl0ABiMskm
	RtKf08pH4XQSEGci2ERAuZqNNoTFs/EbRLOSMIT+wKye1+leOiLBPCRb+R6KI1udxUd3/W8VcTBgF
	PnQKjXitA8QcSQrM4HJuDA8r20yvLUsDZJI/8A4nmu1wApX2a/2Ll7IK0q6JNsD31HcUO3DZye4Jx
	1SbYsGvSfn0jTdACpFz1swUtqbPEvqiPWTNV0JEujwhtKrsi0NcD+OHjEEltUxG1vhJ7/aKjXr1O8
	c9OLuP9vMXBDXjPAMJny/ADe0d+QiMau+ddY56PkvZOGXGID7kIgJjr6jWPJ3AXmjYAcKe/1BwkMM
	/IDITtpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIon6-00000007nDT-2E4C;
	Mon, 19 Oct 2026 14:56:44 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIon3-00000007nCn-2kwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:56:43 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac925bac3so176569e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421800; x=1793026600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yo6/2OGJfxhXILo4QGIB9gHfvFskGfKjbh+hNyiFvf8=;
        b=Tcy4YoI2Lv2dqTxMxmd8/DU7SIjII+jXHAXMteTL+QknYzdo4BErpTpk6Zp2BVmuz3
         kM11T3sFcubdY9OwAJW1/HODFmWoza95CKfgQfxQP1ZPvV20u5x9AreyhiQHX96zw2sR
         A0NtkjPAi/cI+cuUMFp4CLfiqsIEgVKUOCVKGsdM3707cZSsBtV5w+A087twUWgacZC4
         TA/PyxYKx4AfFmyeFTCfkGBu1FOpBxE5E0HC+N6hgdKTiyXCNNXvrbYWjUnx26eN4QEY
         PK4g7TjuB19EI6C2Gvq5wSqcLRuij608LXBv0JVbEq7dELES+ZHjdKPAMR2BsMiy5BXC
         r71w==
X-Forwarded-Encrypted: i=1; AKwUvBzVxO0V5d7+iJPRga/tAgwd+PMUL6i4rzIFkNux0Hxe2bc67ZwFrdYsg82iGECwUbexZ5msUhxOUxPTDLjC8MiA@lists.infradead.org
X-Gm-Message-State: AFq9FYIuFz4/FFySYUc04HP5Pzq1KEKH27VC+2QiD6HwP9QG4qcgGNtl
	WxRbN8ypkMMAQhrjPyqW7wU9jfk0c4DyR2uNv2B2Snk35tROKysf0cLZmmUcl9ThCxs=
X-Gm-Gg: AYBFou2HyKL/wcZELExHTb5mrzO7MwA5JpF8fNx/sVljn0zvPX7xNSyx44fgpjfvlD8
	l9XrdFaAxKUhJZKwzUypPHpKSLS/3eOxskq8wpTMZZl31Ebt01qRVmF2OhbqtS5CQaBhL7ijDv6
	synxqGs/XmOfK1slYI9cqCfjMkeceBT8Mr2i/EypAxvgCe10NIeEhgWVJiyBWktkzg87iuvoGHD
	fqpP1k4Npp5hXuXODQJ+6JQajOQ1Eq6IZozIOpfxAncA9fvpPnmFlR+QN05wW0rb8Y+YzhoRvTp
	E9/n1EhJ5BVq9rWBfePXAEhDCdqXjMF6/WUOWsCi53i9J+3XVIn81S9DVBiDy0d2HO2AF8TDoMS
	NN/NP7+xOg205fgj1R5WSgxQ3cfzaztFbAWWN1tanBq7F1PIVeMcAxQz4qjrCSxDSwBO0e//QBU
	cCexxKnao0RqljS3hklKXi8BqEY+XlWEJEM4rGZIOtNMrWPOZDdkszh6F43M+JfDmG+xi9D+LNz
	JlqvuIWJI28uD8PEFh5m38L5vdOPFrKqGOi
X-Received: by 2002:a05:6123:2c7:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5eaa9ecd330mr2555110e0c.0.1792421799773;
        Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b518bc8sm9847684e0c.11.2026.10.19.07.56.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-988c7371716so598239241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 07:56:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0m5ZOmmDkGMtnQ3mngcZCgrew9MeIoUEPmDudMkyMt0mjvMzk2RY4CYgsQ8NO6Zt6+OKopKFW79eZLXdug8Nc@lists.infradead.org
X-Received: by 2002:a05:6102:f86:b0:7cb:288a:b66d with SMTP id
 ada2fe7eead31-7cc369ac7b5mr1684195137.20.1792421799154; Mon, 19 Oct 2026
 07:56:39 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <1d7da50cfb58232c6dd4c4afefb938fd7e62fdcd.1792163045.git.geert+renesas@glider.be>
 <20261019144256.GC763679@killaraus.ideasonboard.com>
In-Reply-To: <20261019144256.GC763679@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:56:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
X-Gm-Features: AclHuK9UZUEUyPMO3TO_vFhUiV57c9SStFUdXlV8TRdwkOQjKO9ySUhEkuMfo5c
Message-ID: <CAMuHMdWkAvkxHkzRVviF_NkZHP7UeCBjebxciE6jFN_8ViM=aQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] clk: renesas: r8a78000: Add clk_hw to clk_map
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_075641_712194_C6E62068 
X-CRM114-Status: GOOD (  37.08  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On Mon, 19 Oct 2026 at 16:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Oct 16, 2026 at 05:55:40PM +0200, Geert Uytterhoeven wrote:
> > Prepare for mapping to other than fixed-rate clocks by adding a clk_hw
> > pointer to the clk_map structure, and populating it up-front.
> >
> > Move r8a78000_cpg_priv.fixed_hws into fill_clk_map(), as it is no longer
> > needed afterwards, and drop NUM_FIXED_CLKS.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/r8a78000-cpg.c
> > +++ b/drivers/clk/renesas/r8a78000-cpg.c
> > @@ -16,19 +16,24 @@
> >
> >  #include <dt-bindings/clock/renesas,r8a78000-cpg.h>
> >
> > +struct clk_map_in {
>
> The "_in" suffix isn't very explicit.

I can add a comment...

> > +     int dt_id;              /* DT binding clock ID or -1 sentinel */
> > +     u32 fw_id;              /* FIXED_CLK() ID */
> > +};
> > +
> >  struct clk_map {
> >       int dt_id;              /* DT binding clock ID or -1 sentinel */
> >       u32 fw_id;              /* FIXED_CLK() ID */

BTW, do you think it would be worthwhile to reuse clk_map_in here?

> > +     struct clk_hw *hw;
> >  };

> > @@ -92,35 +94,69 @@ static struct clk_hw *r8a78000_clk_get(struct of_phandle_args *spec,
> >       return hw;
> >  }
> >
> > -static int register_fixed_clks(struct r8a78000_cpg_priv *priv)
> > +static struct clk_hw **register_fixed_clks(struct device *dev)
> >  {
> > -     struct device *dev = priv->dev;
> > +     unsigned int n = ARRAY_SIZE(fixed_clk_rates);
> > +     struct clk_hw **hws, *hw;
> >       unsigned long rate;
> > -     struct clk_hw *hw;
> >       const char *name;
> >
> > -     for (unsigned int i = 0; i < ARRAY_SIZE(fixed_clk_rates); i++) {
> > +     hws = devm_kcalloc(dev, n, sizeof(*hws), GFP_KERNEL);
> > +     if (!hws)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (unsigned int i = 0; i < n; i++) {
> >               rate = fixed_clk_rates[i];
> >               name = devm_kasprintf(dev, GFP_KERNEL, "cpg-%lu", rate);
> >               if (!name)
> > -                     return -ENOMEM;
> > +                     return ERR_PTR(-ENOMEM);
> >
> >               hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
> >               if (IS_ERR(hw))
> > -                     return PTR_ERR(hw);
> > +                     return ERR_CAST(hw);
> >
> > -             priv->fixed_hws[i] = hw;
> > +             hws[i] = hw;
> >       }
> >
> > -     return 0;
> > +     return hws;
> > +}
> > +
> > +static const struct clk_map *fill_clk_map(struct r8a78000_cpg_priv *priv,
> > +                                       const struct clk_map_in *map_in)
> > +{
> > +     struct device *dev = priv->dev;
> > +     struct clk_hw **fixed_hws;
> > +     struct clk_map *map;
> > +     unsigned int i;
> > +
> > +     fixed_hws = register_fixed_clks(dev);
> > +     if (IS_ERR(fixed_hws))
> > +             return ERR_CAST(fixed_hws);
> > +
> > +     for (i = 0; map_in[i].dt_id >= 0; i++) { }
>
> This is avoidable by passing { map, ARRAY_SIZE(map) } as match data
> instead of just the map.

True, and I did consider this.
The same mechanism is used in the MDLC driver, where using ARRAY_SIZE()
would quickly became a bigger burden due to the presence of many
more maps.  So for consistency, I kept it the same in both drivers.
An initialization macro might make it more manageable, though.

> > +
> > +     map = devm_kcalloc(dev, i + 1, sizeof(*map), GFP_KERNEL);
> > +     if (!map)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     for (i = 0; ; i++) {
> > +             map[i].dt_id = map_in[i].dt_id;
> > +             if (map[i].dt_id < 0)
> > +                     break;
> > +
> > +             map[i].fw_id = map_in[i].fw_id;
> > +             map[i].hw = fixed_hws[map[i].fw_id];
> > +     }
> > +
> > +     devm_kfree(dev, fixed_hws);
>
> Why not plain kcalloc/kfree ?

To avoid having to free it manually at multiple (three) locations,
both in the error paths and the success path?

>
> > +     return map;
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

