Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE8FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHLLYUb5aKmiYBywLpOydX2GHG7acjnCRadd5iwWBCE=; b=fhdvYvOYiiTB5wBE4dhcKXBnP+
	/xjcnUNnAd0tG2z7wEBuyA6oa0krmhb9ApAxm/JHvMdMLW/tvMsGHxGujuDooq0E43s8bbgKUKFwf
	0NY3pOuxfSBzpi6V2Dai3+gxUk/pJsb4sFH5cAco9bsyeJZ8vVJ6eNOHsJ/wmY4ajb3W4mj4Yh240
	nfi/zlW8r+2aHFLVOumAe9HLcZ/YAbmJQA2JXFkl46wngnr7NJTZBWtO20kkmwyQ+ThUOnLzEmlon
	BWcCMj/aT+5BsxZ0ptWBv688JzfPY67g+CXzwxZ3lzCc0kFRbgz1QBu7GU4t0LyFrSfysCZEqiZrI
	UGXN4+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzz8-0000000BXMo-3G5J;
	Tue, 10 Dec 2024 13:09:06 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzro-0000000BVqw-32Yj;
	Tue, 10 Dec 2024 13:01:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so3074808a12.1;
        Tue, 10 Dec 2024 05:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733835690; x=1734440490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHLLYUb5aKmiYBywLpOydX2GHG7acjnCRadd5iwWBCE=;
        b=Fl+1Qfjh0JVlUhoLD6Won7IgkcOtH1CX3Igxr0ogju3R/uwHe4gcHXbs2RXjINxoCi
         JkYsf/TUz0VvDHZfvyXB+5QK9SND6hj3G8jpolOGEi05Cp/tfKFV9bhZyYiBwUUBdThb
         NXPPWRhuH98rEGg1Snd6TYqZBiSX7sCEDrNP2lPsSnObUnlgL9omx0J7FW7RVmKO3bW8
         tk3BiE1nQwnZ1iQQCI7mbd+E9qigd/IGEv7Om7bL4a1vrsUfK28LYOXrkoG+xhxJuxQV
         9N86NW9DDmhbYLkE83DpzmvF/kIOtR5U3ocT53q42xe0CrONXjq021t5HA+DVNX6p0eV
         WWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835690; x=1734440490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHLLYUb5aKmiYBywLpOydX2GHG7acjnCRadd5iwWBCE=;
        b=CHesIzc9iIS5JK4qAR7rJirr0XCkHWQX5MUkuyUxgnJeYcRcfdvs1s36bM9K+4hG/K
         E4QFzsmIkqScNlfd7ALfKFY3fZbuNlICixZfK78394Q4NUArGjVC5tvsUjeTQ8r4kTSy
         /Yw4w7sgQHUGkQEIydnySKd5lCli3R44bykkEnLLgEzxuByIZoKa99xpSF+HJw6K7oue
         JfZI4sTZ+8eN2vp0HizCVO4f7V9cTpYKJtMHIRs23lhDHsS9z3acRI4JXUX/3dOfwhRD
         +8G6V3HhD+2eaP5XkshO99a0OQksgGjdOuhGrJ/b5Wzc3TnlwONcjI0IzJUrPa87QbUI
         O15w==
X-Forwarded-Encrypted: i=1; AJvYcCU5A8lC0qsngu3IlzUvWtF7iMR87xdNQLlvqfr5X5Vm9dWcVG+gJgcQbIuxbXpXKkUOwBFo8bLBOPGb95/HPkwV@lists.infradead.org, AJvYcCWVdUCygmOaWfLEclVQr/P8nXgeZzeitvrgL9Za73ttFi0EwSO0U4IXlg0FqctwHT7NBjE70FfuQ91AhHeHcXA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxp6VdX6v1GZ+Z5mTIDPOpp1sB1eyUE1ly/MxrncrPc9Deui+T
	PnLA+dHh6eo37yolXCX20NCh1dP3QBOC4K11SsGxZh6VQykyQwBzIOytuY0Sd2tRg6gXqxzlMgF
	yw2h/1h4ptjLbEPUNtAlNXZnXxIY=
X-Gm-Gg: ASbGncv34B/ZmpOMSWm8Osnd8HdU+zP95/Tj3IO+iu3mQSNWLeb/sXj6pDzL028Glc5
	QIz3xf5lPoqCz+Yx3uBTBBmJaIKee+3FP+QhMuU5CjFCypyxUYRlDgafaiWQ=
X-Google-Smtp-Source: AGHT+IE+3dBsg9ycaXlihQEkFOTl6FWUvTA1IQqCmYlgGVvNU9+J2ICqAS0Ely7TDkGOnJtbTgHRvmD88oh1lqiohSs=
X-Received: by 2002:a05:6402:234f:b0:5d3:ba42:e9fa with SMTP id
 4fb4d7f45d1cf-5d41853edb2mr10277905a12.16.1733835688916; Tue, 10 Dec 2024
 05:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-6-pgwipeout@gmail.com>
 <14451790.lVVuGzaMjS@diego>
In-Reply-To: <14451790.lVVuGzaMjS@diego>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 08:01:19 -0500
Message-ID: <CAMdYzYquzAnwbUidBjif3OXOcLaGD+3GdB79Op94BCno2ZtBAQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: correct rk3328-roc regulator map
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>, 
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Levin Du <djw@t-chip.com.cn>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_050132_759787_59241223 
X-CRM114-Status: GOOD (  19.52  )
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

On Tue, Dec 10, 2024 at 5:54=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Dienstag, 10. Dezember 2024, 02:30:09 CET schrieb Peter Geis:
> > The rk3328-roc-cc input power is sourced from a micro-usb port, while
> > the rk3328-roc-pc input power is sourced from a usb-c port. Both inputs
> > are 5vdc only. Remove the 12v input from the device tree.
>
> full stop. Please don't do "While we are at it" commits.
>
> > While we are at it, add missing voltages and supply to vcc_phy, missing
> > voltages to vcc_host1_5v, and standardize the order of regulator
> > properties among the fixed regulators.
>
> This second part wants to be its own commit :-) .

Thank you, you're right I was torn between doing not enough and doing
too much and ended up doing both. Thinking about it now this should be
at least three patches:
- Power input
- Drop the phy regulator (it's directly tied to vcc_io, not a separate devi=
ce)
- Cosmetic changes.

Thanks again!
Peter

>
> Thanks
> Heiko
>
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
> >
>
>
>
>

