Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D97E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYMf51hbwh0y4SlVLJRmvMBBa3wNftbLie6alipMgHM=; b=b5FLv8W+q2wF76dLgqRrZfi5Zl
	mI9ZiH5md34jyFLGkUT1/vqB8xc9NnA5VUYyVV2UQDV4GAR9DAh3p1lO85xbBS49PcGh15RmnFvgw
	rSqyt1Yazyv+KLcbX5bBlp0aX+aUYefwidPdmPGgvL0je8oPTl40biKb1NxYvj36oKKRIDr+HPspO
	2VhAKMNcb6WMVLWTO33PvyrfNRN10pQTE6ifzWojyb01IU/JnPyInBesD6+QehctMFbO2AhNl86B2
	tHvta089PETxbrHJfXuzh4IwgVcgFPiox2DMF8Cu9QS/9M79K9O4qosMQ9aXhwsLReG6ViWXdme30
	XpobiO3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL04E-0000000BYAF-3Sum;
	Tue, 10 Dec 2024 13:14:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzv4-0000000BWh3-1Pt0;
	Tue, 10 Dec 2024 13:04:55 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d0f6fa6f8bso7919009a12.0;
        Tue, 10 Dec 2024 05:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733835892; x=1734440692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYMf51hbwh0y4SlVLJRmvMBBa3wNftbLie6alipMgHM=;
        b=MCgE+71FOkkjGTm+bKahF3fZPvTUiibYGW8WJoktD7saeH2/PhrfLeKUxa3rLQnpmS
         Z6082BZNLngGNM+Yqy2LVKafbCQWv/qqjsOiET5cHjoFJtWEDdd7hvRy5nGNmyqSaphf
         JShHpCrOax9r9d57a2CplZNQtIpnObOK4OhJviYAcCOJuNDjffTbcLCTL2Vs9/hismxa
         AtEVah7n/jPJgKNvNfYGTy0QdzhdwBvJF0EeWtwK36lKBdyQuoOqfdDED2r1RiAyUTIi
         el+OyFbADs88fFWTvW23m38nqF7e2tyPL+7Zz9oMlw1Hy8LCbwX0EUpXaK5+6/zWJE2K
         yRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835892; x=1734440692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYMf51hbwh0y4SlVLJRmvMBBa3wNftbLie6alipMgHM=;
        b=LCi2CZAkLwA4x7762lo/3MZ3+CMN3NBWsv4CJZm0J21X0twgNF79bsSeOV/ovrUWJB
         QGKMu1EeACaPjJ6SgkBoqjRst1uXsVLy/0MH982iQmFFeH1FeSrXqIyjDGGPN7qRwWmH
         U0J8rQlH1Y4bmJOYK/CUTR+5PHaKKoMJ9Qwhov3LbosBth5Le3IAF+A0wnYi3iAu1t3Q
         Iy7v5WVn4De8DBiRugJ/Psq9A0KQ2e+T/Q4UnZs12l+LxApnnEnB5rkMIPqkFvbIMoOv
         ZAD7uwrSLeYZFSY6LcdR2QNFItfd6fTSRy1yZyPUKwqvun4FDi5kQsOPL49GdTwOjmaq
         1hog==
X-Forwarded-Encrypted: i=1; AJvYcCV0oBjFAHMNSdLA+kFRGMfNPKB2PE0RlmdlBSU5AstD6PG8Xcg69NgylRaeZmQbWiF14om8zO+ijJ+GsXVHyff9@lists.infradead.org, AJvYcCWdFYZnb9L52JipCm9+Q/FkViebXnbBq1wcDCbTZr36Qv6+hUMxznp56c5aXPDaNdqLyXjLeS11T4b9LrJeR3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YwImIIBU7p3OmPDw+gvnAr8HRd0GN7RmBXPVFMMEdBcUOiJS+mf
	tAjK3xC2mnv1b211n1+isbufENYENpiw7V0hXIo5xSwzZTT8J17PiU6Qp5OoGbagxAoButfCPOe
	uyeJ8L7bXAOZW3XWzNGggPPJU6xY=
X-Gm-Gg: ASbGncv5VxCkxei97tylTMibVWZ7tsFCqZZHySZ6iMYqwlBvYK1qGjWO+ISNTFQAljt
	LV029pDVjIgMYoLz9vu5qVEqv1PCbpSmQxzhE62LpvU9vaU2u7NuInMRrzRk=
X-Google-Smtp-Source: AGHT+IGICcjixAzI2SIhHHtwX1o19IzdeFrNyrwuHTNzsJc3Mbcq6z2Y41yDiwu7RsNEQv44rmtawJBTP3F2DCV1BXs=
X-Received: by 2002:a05:6402:4005:b0:5d0:bdc1:75df with SMTP id
 4fb4d7f45d1cf-5d4185ff932mr5610289a12.24.1733835892180; Tue, 10 Dec 2024
 05:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-6-pgwipeout@gmail.com>
 <D67ZJ6MOM5TH.2WBYCCU20DDJO@cknow.org>
In-Reply-To: <D67ZJ6MOM5TH.2WBYCCU20DDJO@cknow.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 08:04:42 -0500
Message-ID: <CAMdYzYorTNiAybGhPu0u_YPj2J7qxCO72KBU1ozTde+2zK9Hxg@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: correct rk3328-roc regulator map
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Levin Du <djw@t-chip.com.cn>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050454_373881_3FD38F77 
X-CRM114-Status: GOOD (  22.27  )
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

On Tue, Dec 10, 2024 at 6:31=E2=80=AFAM Diederik de Haas <didi.debian@cknow=
.org> wrote:
>
> Hi Peter,
>
> Thanks for this series, I already saw some familiar error msgs
> mentioned, so will try this series out soon (tm).
>
> On Tue Dec 10, 2024 at 2:30 AM CET, Peter Geis wrote:
> > The rk3328-roc-cc input power is sourced from a micro-usb port, while
> > the rk3328-roc-pc input power is sourced from a usb-c port. Both inputs
> > are 5vdc only. Remove the 12v input from the device tree.
> >
> > While we are at it, add missing voltages and supply to vcc_phy, missing
> > voltages to vcc_host1_5v, and standardize the order of regulator
> > properties among the fixed regulators.
>
> Big fan of standardization :-) ...
>
> >
> > Fixes: 2171f4fdac06 ("arm64: dts: rockchip: add roc-rk3328-cc board")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >
> >  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 23 +++++++++++++-------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3328-roc.dtsi
> > index f782c8220dd3..6984387ff8b3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > @@ -24,22 +24,23 @@ gmac_clkin: external-gmac-clock {
> >               #clock-cells =3D <0>;
> >       };
> >
> > -     dc_12v: regulator-dc-12v {
> > +     /* fed from passive usb input connector */
> > +     dc_5v: regulator-dc-5v {
> >               compatible =3D "regulator-fixed";
> > -             regulator-name =3D "dc_12v";
> > +             regulator-name =3D "dc_5v";
> >               regulator-always-on;
> >               regulator-boot-on;
> > -             regulator-min-microvolt =3D <12000000>;
> > -             regulator-max-microvolt =3D <12000000>;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> >       };
> >
> >       vcc_sd: regulator-sdmmc {
> >               compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc_sd";
> >               gpio =3D <&gpio0 RK_PD6 GPIO_ACTIVE_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&sdmmc0m1_pin>;
> >               regulator-boot-on;
> > -             regulator-name =3D "vcc_sd";
> >               regulator-min-microvolt =3D <3300000>;
> >               regulator-max-microvolt =3D <3300000>;
> >               vin-supply =3D <&vcc_io>;
>
> ... but why not put regulator-name as the first of the regulator
> properties as is done in the rk3328-rock64.dts ...
>
> > @@ -50,22 +51,25 @@ vcc_sdio: regulator-sdmmcio {
> >               states =3D <1800000 0x1>, <3300000 0x0>;
> >               regulator-name =3D "vcc_sdio";
> >               regulator-type =3D "voltage";
> > +             regulator-always-on;
> >               regulator-min-microvolt =3D <1800000>;
> >               regulator-max-microvolt =3D <3300000>;
> > -             regulator-always-on;
> >               vin-supply =3D <&vcc_sys>;
> >       };
> >
> >       vcc_host1_5v: vcc_otg_5v: regulator-vcc-host1-5v {
> >               compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc_host1_5v";
> >               enable-active-high;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&usb20_host_drv>;
> > -             regulator-name =3D "vcc_host1_5v";
> >               regulator-always-on;
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> >               vin-supply =3D <&vcc_sys>;
> >       };
>
> ... and was the case here?

That's fair, thank you. I like the alphabetical approach, I'll go that
way when I split this out.

>
> Cheers,
>   Diederik
>
> >
> > +     /* sourced from usb input through 3A fuse */
> >       vcc_sys: regulator-vcc-sys {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "vcc_sys";
> > @@ -73,7 +77,7 @@ vcc_sys: regulator-vcc-sys {
> >               regulator-boot-on;
> >               regulator-min-microvolt =3D <5000000>;
> >               regulator-max-microvolt =3D <5000000>;
> > -             vin-supply =3D <&dc_12v>;
> > +             vin-supply =3D <&dc_5v>;
> >       };
> >
> >       vcc_phy: regulator-vcc-phy {
> > @@ -81,6 +85,9 @@ vcc_phy: regulator-vcc-phy {
> >               regulator-name =3D "vcc_phy";
> >               regulator-always-on;
> >               regulator-boot-on;
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             vin-supply =3D <&vcc_io>;
> >       };
> >
> >       leds {
>

