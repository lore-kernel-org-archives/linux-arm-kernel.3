Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F6CCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=; b=IGX0gsmMTQlgArZVw05l0RUmqw
	B/5RcdAe8J7NDc4n/3XIX0K4984F7Ov5UkOf6hZpOpOlEZvD2jyQpHc20+NdPrW5qPadtjlVA9eqt
	n7OIP76IUllQCU0aPsn6/JItDNygNclcLfBe4d6q4ILgCjgqIYuRSGBXOg7ALJhcPLoqwS5VmyoRa
	86LSRoVIhvjiJ9sJ4Iw+GN5mihxR9Izr4MtLO/8ZsJhyEWArMI8/FfudvBQFNZAjBGT4kABIyzXp4
	vgBwPyI9v6B6Qr21WT9KrO5TbO50tkjsCzQwUFTXEpgdoW/u5P2hkWKeDFRF3vg7TSCZ2MocgTi0+
	fRSWYK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoF0u-00000009Ra1-0zRV;
	Tue, 19 Aug 2025 05:36:04 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEuz-00000009Qwp-0HPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:29:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso5302008e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755581395; x=1756186195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=JrndwijeO3lA0+IIX9h2GAsYxPSmbpfmGRlIjy9ColM3968+64PaHoWpAVQ9gT+aTB
         OdXVdCuHDcpkcA7IKe20rPP94CI3lmyhxiIU3CRzfmpzxKopgDlOYjkR8oVjfQSVvuHe
         X2ZJyDMG2G8T6uOuWq9WOyIU1GYPfrCdgzTlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581395; x=1756186195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY416xR1xycZgMaHjJKQxeOxL60iUIwXBSq8Px9VqF4=;
        b=oZ3p230eaWmmr90O6mTyKugyL0Vc8V9RmAFk+j4/oF+CBs7ourWaW6vJnGbbDJ3G6r
         yEZosSyhO/OF3HlgmLpOikfOUwHD3upTEah+kBkTl4/dB0zCduvCL9WHxOdPEruk84l+
         kfiFnf5XHIvvlm4i3cULzfWm7oYiP7jI8edrPQ0srT2I6skJ7D1B7rvQaNYbmKhDxBAM
         VMTYiy3UZ+dPjUEu/oGa8A6V8aF5XXrSVNmpklTsCPkMyqTKQRabAeINVpyJhItHTMJ+
         JxmZGTLIoxNPK17kPFgtOwdiCNjULIUqQ7hGGX7/aLdEIQKIn8bs0tni5D8xZekoaOMS
         N+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZpYa7TqPrLKuJwPpvs903CPjCS2hDZn9mPJorCosLKcQZfp1jg0am970QLgo0x27CRcgCZdj+wgSJ1+TxFjk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp5cGVD1H7948wkgr8oWQ+yCJwkyS5YzYWlfpGeZtskKrjSFoF
	FZDFn195CMRO5gyAqB/o17gOgsPmhq7YPIX3bc9gDl1ftLIYv2qoJZVWenSjyS/QENjAy8exlY0
	BrzWG8qXdH++cC+4slKeZWWkzxoycz0lwSFCVbBWL
X-Gm-Gg: ASbGnctyd69arp7u7YVIx7QoFc4gz7z2UV/Br2XmjMyI+GRO0Ej9fui1Rztt3vtoaZe
	RJC/N1SBW+MJzG+vDkX+svmTgLKwUqc5yot14PnojBhx8zBiOWYrke+Q8Cua6OoyOsV+UGiNFxA
	loVdHmxQyuz2tjRvE7YAYSVoB1XuZfuu5sDVTPUETaTRoJB3aCAAN/gxwwlMLtOyiPXKnnBZrLA
	kSMtui0wi6xgD7qcQutyn9xxgZ5qT31s9U=
X-Google-Smtp-Source: AGHT+IFc+cNqQJD94yOsJXvxKRjOpffc7Ia22z42Fq9ZyFSlD4taXbrHvujNSr7HuBf9iSSI7SrVxD3w4KS0qImpweY=
X-Received: by 2002:a05:6512:3f14:b0:55c:cc6a:a212 with SMTP id
 2adb3069b0e04-55e008451ebmr402983e87.39.1755581395466; Mon, 18 Aug 2025
 22:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-8-6ba4e432427b@collabora.com>
 <CAGXv+5EHk=f62+KiLo-aWMcd0-q+_59kno+uOW5rdYaq5q+5tQ@mail.gmail.com>
 <CACRpkdbWctNH0XJfcHfVJM9Etp0WCXpdyhhyaQemH-Xc0LDr0A@mail.gmail.com> <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
In-Reply-To: <CAGXv+5ECsP7_wbdcaAkWuD=RyJiJpPe4r60bhD5U8xUvEBzmXw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Aug 2025 13:29:44 +0800
X-Gm-Features: Ac12FXx-vk1JhaQ3rCWpmDReEnhaHNW7M5aboaWtjp9aXHyjGH_2VPoF2xHclbY
Message-ID: <CAGXv+5FXZ_byK8Ftb9LjfQMkgtLd7mTmWgz_Nsvcv8=jy53T=g@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: mediatek: mt8183-kukui: Fix
 pull-down/up-adv values
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, 
	Sean Wang <sean.wang@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_222957_103387_3B87490E 
X-CRM114-Status: GOOD (  25.64  )
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

On Tue, Aug 19, 2025 at 1:27=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Mon, Aug 18, 2025 at 11:22=E2=80=AFPM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
> >
> > On Wed, Aug 6, 2025 at 8:38=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org=
> wrote:
> > > On Fri, Aug 1, 2025 at 7:18=E2=80=AFPM Julien Massot wrote
> >
> > > >                 pins-clk {
> > > >                         pinmux =3D <PINMUX_GPIO124__FUNC_MSDC0_CLK>=
;
> > > >                         drive-strength =3D <MTK_DRIVE_14mA>;
> > > > -                       mediatek,pull-down-adv =3D <10>;
> > > > +                       mediatek,pull-down-adv =3D <2>;
> > >
> > >         bias-pull-down =3D <MTK_PUPD_SET_R1R0_10>;
> > >
> > > and so on.
> > >
> > > ChenYu
> >
> > I agree with ChenYu, the more standardized properties are the better it=
 is.
> >
> > All the custom properties makes sense for an engineer working with just
> > that one SoC (like the SoC vendor...) but for field engineers who have
> > to use different SoCs every day this is just a big mess for the mind.
> >
> > The standard properties are clear, concise and tell you exactly what
> > they are about.
> >
> > The argument should be in Ohms though, according to the standard
> > bindings, but maybe the value of MTK_PUPD_SET_R1R0_10 is
> > something like that?
>
> For reasons I can't recall clearly these are just placeholder values
> that the driver then maps to the R1 and R0 settings. But at least they
> use the standard properties.
>
> The reason was either one of the following or both:
>
>   a. not every group of pins had the same resistance values for R1 & R0
>   b. there are no known precise values; the values depend on the process
>      and batch

Also, their customers seemed more accustomed to dealing with toggling
R1 & R0 vs setting some actual value. I presume that comes with the
uncertainty of the actual hardware value, and they just try which
combination works better.

ChenYu

