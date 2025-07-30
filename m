Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369D0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=; b=zB8QAo8Eywy4p4UlymL2dPWU0G
	Hurkr2rQNSflmAlCGImYwyr5fgRyZ/H0daVwVSVqtax7/EGPE30noc3jQsh81m8klW6v1tZR4tv/p
	NeXHJdqBPiTpJeA6rfowjAfdjhoFOWb7npBkIj4vponsE7mJTqPyPjG20DNpIbRS0tSwHUSQlJGto
	+GHiMj4tQCz4yBwWRlakZUSNwglRTpW7O3BKeToCbD7NkMh0DiWha1nYAzGw7x4KHOrn/jOG+JzYQ
	owq16pnrlwHNet2IUCuYkfkPhIN+PYT6EUDa8ZaFsid3+JZsMosyVtezip6+h189z196IHz4hXmC9
	390pdl9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6vn-00000001cCj-0ltG;
	Wed, 30 Jul 2025 13:33:19 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh6tI-00000001byf-1MWd;
	Wed, 30 Jul 2025 13:30:45 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1160069566b.2;
        Wed, 30 Jul 2025 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753882243; x=1754487043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=E6nSRu3pCjd/+RDAfDFgb6PXM1+3nEO0xKRsDWDJuMyxyC49l3nnZjySqmcgSsyHo2
         5xy9NmWk6vMGJGNARBlk44iY5nMCXC3PnQpzb3VGt3aMSa4pqnTqaRitG3hsPZa1bzWH
         F/VKPXvWuwxeh4GIIOCxMX8fIThhf04nx2W39cQ1R7+KiJVtBI+WAvisoKNmL8cvNtrE
         VajJABMmWFgOwfY/soXolOyKsBFYZkDHSg5+PE3FjjgVYVVESOZ7HUzouTk61Af9w1AK
         rvseZ8yYaPl8pbDvSKj5xc58jbncWVZhUC0dhBAI7W8uJ0br+q368hfJ7dao5cc332GP
         VEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882243; x=1754487043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi9l6TBdgjaQnQAqpjO6D0pjlwGQDGt3b3+CN6Y3/yI=;
        b=QrofqkykPmIff97iXeSG9gFCYTM/7rRDVeyCc4bu0fD924AEN4/+PU1BqJnbNM3jT7
         8832rBp1aGm5V3kpGVsk+eZUE7CPASMwv7WoAdZ8QVkFQ3QKd6sCIwIv9tRxoonQP4qP
         7OOAWzWahW+I6x0awbb3Exdg9iAHrWQLofFl2Pz5T+54oNEJvvP9COkI0p+qjRHjjPo+
         RRLAcTP/qnpGOTSUtC+m5L3cvvRWZk4sJMvCTQz6XJsZUpXbXcSDB+AW2CMfJVnUYnmd
         PHB7P52mkawXad+pE3Wycz7EuJLVYUYWw10Q1FRdwPRVteyxI8H2bUrN0L8ra4dZzEvM
         8lCA==
X-Forwarded-Encrypted: i=1; AJvYcCVgnIQS6X6AK2ywI7SmHLe8fqn3pJmPPTD+4n/dvay9aC/NvajiYzr4UE/UOry4oVcFFvxQO1r07KvxPLnP0XU=@lists.infradead.org, AJvYcCW05GwBQc8E7xHBUdzB/aDB6+cIvwqZnSgaBAntH2KdM9+3kkTN+QcvgIFmmM5o5cdW/MuuT8B32rXiV3AJaFV/@lists.infradead.org
X-Gm-Message-State: AOJu0YxQaH5FvKP4yz3v5S3dchChMK812YmWp1KCxAboprLoZAzE2j+M
	fjqdB2KP4UgJ1W7UnW6th64QBMYELp1yQ/wKv2CiyT+wEIO/7HEeO8Z42hb2DJjqcHOwqVraJNQ
	4QP3Ymkzf2/PVsrTe1aB9Es5XjHot90c=
X-Gm-Gg: ASbGncuWTEmIevjPnxrK/xTwa7VSMIi99LPyduRiH3C3vaX1C/Lq/4S9YNmrlRpHK0V
	KZ6i9U0aj55aD3c0s7l1yRdwWOKxN6IyX0l1AFSMHSjOEpJ9oOkETMjYOOCmY0CKNC9tiuRtPD8
	btz5FqXL0m1LOeXQvatInzaVE+DlLMIzek/UbkVPYPgVk44fJ5skLtI4bT93ekXhQ0eE/XU6J4w
	+5OCMQHU4a8RCKgQiBk
X-Google-Smtp-Source: AGHT+IE7FH6m4Dj0jSn6Xv2SOxyVdUI56jx+oEPv/YLtr96ycR8jtmVTuCl5DRsdQyIzWn8vHcnXCm+w9rLeyqQEmTc=
X-Received: by 2002:a17:907:dab:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af8fda93d6emr386293566b.58.1753882242487; Wed, 30 Jul 2025
 06:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
 <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
 <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
 <CAHp75VcV=K-DfOGs0z64==nO+wQNoEB2Ngd2vc+dLYr3WLChjg@mail.gmail.com> <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
In-Reply-To: <CAMRc=MeVOEFkdqf+SwQ-a=7ZPvpoerb4G_kn-aZgNLR3aTTUog@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 30 Jul 2025 15:30:04 +0200
X-Gm-Features: Ac12FXyFKinLiyKOfaCHk8Jvp-MCK0UJT4pw-WeZSCiJVFAceB4TVkbq9UOtwlo
Message-ID: <CAHp75Vd_5HVwzuiV17XKkzpEvzd8dzPDRRx5w-VqZnjuCz6m6A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250730_063044_362329_CFF4F692 
X-CRM114-Status: GOOD (  23.49  )
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

On Wed, Jul 30, 2025 at 2:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Wed, Jul 30, 2025 at 2:50=E2=80=AFPM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Jul 30, 2025 at 11:54=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> > > On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > >
> > > > >  struct pinfunction {
> > > > >         const char *name;
> > > > >         const char * const *groups;
> > > > >         size_t ngroups;
> > > > > +       unsigned long flags;
> > > >
> > > > Not sure we need this. If the function is GPIO, pin control already
> > > > knows about this. The pin muxing has gpio request / release callbac=
ks
> > > > that change the state. Why do we need an additional flag(s)?
> > >
> > > I'm not following, how does the pin controller know that the function
> > > is GPIO exactly, other than by the bit set in this field?
> >
> > AFAICS the gpio_owner !=3D NULL means that. No need to have a duplicate
> > of this information.
>
> No, that's not at all what this series does... gpio_owner is the
> consumer label of a pin used by the GPIOLIB framework. The flag I'm
> introducing it telling the pinctrl core - before GPIOLIB is ever
> involved - that *this pin can be requested as a GPIO by GPIOLIB*.

The certain pin control driver may even not know about this. But even
though the proposed change is an overkill. If it indeed needs to be
done, the solution of valid_mask approach sounds to me much better. It
will be a single bitmask per pin control to tell this.

> It's
> the other way around - without knowing this, for strict pinmuxers,
> GPIOLIB would never be able to request this pin if it was muxed to a
> function (even if the function is called "GPIO").

I need to read the series again, but I truly believe we don't need
this new field in the struct pinfunction.



--=20
With Best Regards,
Andy Shevchenko

