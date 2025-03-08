Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE5BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 04:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S92lWIfKVIn+dIfxP3BSAW+MFQMr9+wTt9Aqjone+IQ=; b=x4qLaaAOQGKofnXwd4bvy2fwGJ
	kST7BkuDMTAyJOUeJmcXVzqIW2VsvdBg3zGaICPXuy0eI9HUkSBk0C3jW0jvG/OLdZU8B1Zg2w1Nl
	vXP3Xnq2R/baC34oYbkFiMSrIPDtKXsFpo+vQmQK84QMqWSkJ/V3qJiAp93fE+bWS9zA4f37qqxMR
	DFyTClf3CSznB/8zKgtGR5dNeKOIHrDk460heMMGgnjVRp/T5PJKQOjGF8SIQT1i7yERNe76vJKi4
	RrPv+E2iuOaES1Dg/cuADUBMMhvUpDS+3InFBmnwHurycZT4cSU4BYAoBQIoNqW9m72Y3HKfag7Ws
	O3uAhtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqlvY-0000000GB40-00EP;
	Sat, 08 Mar 2025 04:36:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqltu-0000000GB0x-2xTq;
	Sat, 08 Mar 2025 04:35:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bcad638efso14841775e9.2;
        Fri, 07 Mar 2025 20:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741408500; x=1742013300; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S92lWIfKVIn+dIfxP3BSAW+MFQMr9+wTt9Aqjone+IQ=;
        b=Uh5AtOcf8mmaUKt5FT2OlaMnsXAN2PAHxtXCx2rcvGdw8zoqGHNq3meXxFqZUnZ2z+
         z1MhNzEx2z55dSpiM703lzuUWqv4YE3a+wO1mAKQlHaGdX4hh8pURdKWch1qsOpzX3u1
         tM8QJH6iGpRoSOYTgJpU5JQO2ZdY2BcQnYuJ8/KRQvKR+4sB7B+nt0R8oByl4ImAt56m
         tToPvT1DJWUxJ30jUk9bhFF3YkebS+dvvaARM4ticJWM0xiX+PlPcwCndE7v4BEbtB3D
         q80tC/Yvy/d6+KCXorVEjMyfxa9Wp0SWv3nnXWwKbi7q7o9ASwZKRWsjn0keSVMZ7kc2
         ufbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741408500; x=1742013300;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S92lWIfKVIn+dIfxP3BSAW+MFQMr9+wTt9Aqjone+IQ=;
        b=lZKcRe0+0MSRYRaxmEb0xu1Td+KdibbJWPfNUtiJ9M44xf3sHJQV87nMfvlDifJDoX
         a0cfqD+oXO90ITTNo4e8PyqP7ixPd44pxFNkuCYhZyQH5Hl5pL3wfOiCSr7x3j104IQX
         mmKAt2GDmzLO2eKPxaoxt80A/4qJNHncyAyW4jFSDBwCJSDX0fxDqQ12JlZxuuxL3kiT
         t++GINxeN+012t2jMsfLsobvb+ot+FHQKQMWVaWZx6Ms+JgZAAMqf+ljv5qXOY9fwRvv
         K8/FyOEqaJK9jjs98heX5ULT23MhIHi5r2tXPqYlwDiiyFrQkp92tENqUoOjsdIgF1OL
         97xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHzWE7CfajJRNJVXBuAWLZPJQQWyH7EAbPdiQoTsV6pz9Z7xEQhO8ChAHUOadILG3xTgHYdxhekeYnlmxTkREp@lists.infradead.org, AJvYcCXkvVFfYAKPbZU9Tjv6v1Hkpc579SHThXZVibf0xBF1rGM/7q+Esm/6koEfCUkVu+MtdR3LHJSU8kxg0T1l2gg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv3yc4uu0EQmJ4Tw21UPRBjGBIvcNOxiXOnjiYMioCWRClAfr1
	w7i3dD+eAKVVQ4xbw+bvo0O4kj/JuInlgY2TyUJCKMznbfYbS/jZO5zZzv2xLcDgKlb0plZwLOc
	t/TkoADTj95n8qr/75je82Iw8OOw=
X-Gm-Gg: ASbGnctCTM63+Wmu5GQNMKRcrushn0i2YLdx6p8X/5srJ8AXXg0YanUtU0qse0GEmkT
	tnjdDLcqB+Rt9MWNOs+LSXcRyOOapgF1mJFtpV+yrBuxvo5Zzr5mUM/PE6kQv1m7MLITfJyLx3k
	aHrw3Mf5j3oBp8Vf6WKNLiko6QfVfThv9CYAIJ+bbfI7U+6VJjubELEle3mg==
X-Google-Smtp-Source: AGHT+IHAfzw5XZrxzz41zgMCfkMjKfpkf7QBQ6PlsSgwZXw3Uw/YaCNH673ZsxlButmZYr+AA4ocdp1HOEtWSPIb7r8=
X-Received: by 2002:a05:600c:3502:b0:43b:cd15:2eb0 with SMTP id
 5b1f17b1804b1-43ce17f6952mr18183765e9.25.1741408499618; Fri, 07 Mar 2025
 20:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20250227235623.1624-1-honyuenkwun@gmail.com> <20250227235623.1624-4-honyuenkwun@gmail.com>
 <5qi24bxuamu3agtldyxhrnlefao6zy2mw2qmx62ycsdg3v6sbz@2jeawstukcyd>
In-Reply-To: <5qi24bxuamu3agtldyxhrnlefao6zy2mw2qmx62ycsdg3v6sbz@2jeawstukcyd>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 7 Mar 2025 22:34:48 -0600
X-Gm-Features: AQ5f1JoI5m6n5697WKDKj8u5pVOu_T48foDQrrZDPAuJnh6Ijn2qNDM1LR15lvU
Message-ID: <CALWfF7LcUUFUnESrGTE10VS7S1+G=sXWkD7iZjbufpgGWQnFbg@mail.gmail.com>
Subject: Re: [PATCH UNTESTED 3/4] arm64: dts: rockchip: Enable HDMI1 on Orange
 Pi 5 Plus
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Cenk Uluisik <cenk.uluisik@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Florian Klink <flokli@flokli.de>, Muhammed Efe Cetin <efectn@protonmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_203502_749153_6FC3AFE0 
X-CRM114-Status: GOOD (  29.02  )
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

On Fri, Feb 28, 2025 at 5:15=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:
>
> Hello Jimmy,
>
> On Thu, Feb 27, 2025 at 05:56:22PM -0600, Jimmy Hon wrote:
> > Enable the second HDMI output port on the Orange Pi 5 Plus
>
> RK3588 hardware design guide states that:
>
>   - When working in HDMI2.1 mode, HDMI0_TX_ON_H is configured as low leve=
l,
>     Q1700, Q1701, Q1702, and Q1703 are not turned on.
>
>   - When working in HDMI2.0 and below modes, HDMI0_TX_ON_H is configured =
as high
>     level, Q5007, Q5004, Q5005, and Q5006 are turned on, and the 499ohm r=
esistor
>     to ground and the 50ohm pull-up resistor at the Sink end form a DC bi=
as of
>     about 3V.
>
>   If you only need to support HDMI2.0 and below modes, Q5007, Q5004, Q500=
5, and
>   Q5006 cannot be omitted. It is necessary to ensure that the tube is not=
 turned
>   on when the machine is not turned on, because the HDMI CTS Test ID 7-3 =
TMDS
>   Voff test item requires that the Voff voltage must be within AVcc+-10mV=
 when
>   the DUT is not powered on, otherwise this test item cannot pass. 2: The=
 Coss
>   of the control MOS tube cannot be too large, otherwise it will affect t=
he
>   signal quality. It is recommended to follow the reference figure model =
or the
>   corresponding Coss value.
>
> And Orange Pi 5 schematic (which has almost the same circuit as Plus vari=
ant)
> states this explicitely too:
>
>   https://megous.com/dl/tmp/5dc98e91dfee3b5a.png
>
> The same applies to HDMI1.
>
> Maybe it would be better to pull up HDMI1_TX_ON_H more explicitely for no=
w via:
>
> &hdmi1 {
> + pinctrl-0 =3D <&hdmim2_tx1_cec &hdmim0_tx1_hpd
> +              &hdmim1_tx1_scl &hdmim1_tx1_sda
> +              &hdmi1_tx_on_h>;
> };
>
> &pinctrl {
> ...
> + hdmi {
> +         hdmi1_tx_on_h: hdmi1-tx-on-h {
> +                 rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>=
;
> +         };
> + };
> ...
> };
>
> AFAIK FRL is not supported, yet, so this may be a better default for HDMI=
1_TX_ON_H.
I am going to defer adding a temporary workaround and keep hdmi1
behavior the same as hdmi0. [1] I don't want to introduce something
that will hinder the upcoming FRL development when it tries to support
an old DTB. I'm hoping Cristian could start adding the HDMI0_TX_ON_H
to the dt-bindings, even before the full FRL support is added, so at
least all the DTS could have "enable-gpios" property defined [2], and
then the DTSs be ready to go when FRL support is ready. That way the
HDMI0_TX_ON_H will be pulled correctly depending what mode is being
used.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts?h=3Dv6.14-rc1#=
n113
[2] https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr4.1/arch/arm64/b=
oot/dts/rockchip/rk3588-rock-5b.dts#L564

>
> In any case,
>
> Reviewed-by: Ondrej Jirman <megi@xff.cz>
>
>
> And I've also tested and used identical patch for a few weeks already on =
my
> Orange Pi 5+. :)
>
> Kind regards,
>         o.
>
> > Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> > ---
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 0f874b87b47e..53797f633d3a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -26,6 +26,17 @@ hdmi0_con_in: endpoint {
> >               };
> >       };
> >
> > +     hdmi1-con {
> > +             compatible =3D "hdmi-connector";
> > +             type =3D "a";
> > +
> > +             port {
> > +                     hdmi1_con_in: endpoint {
> > +                             remote-endpoint =3D <&hdmi1_out_con>;
> > +                     };
> > +             };
> > +     };
> > +
> >       ir-receiver {
> >               compatible =3D "gpio-ir-receiver";
> >               gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> > @@ -125,10 +136,30 @@ hdmi0_out_con: endpoint {
> >       };
> >  };
> >
> > +&hdmi1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&hdmi1_in {
> > +     hdmi1_in_vp1: endpoint {
> > +             remote-endpoint =3D <&vp1_out_hdmi1>;
> > +     };
> > +};
> > +
> > +&hdmi1_out {
> > +     hdmi1_out_con: endpoint {
> > +             remote-endpoint =3D <&hdmi1_con_in>;
> > +     };
> > +};
> > +
> >  &hdptxphy0 {
> >       status =3D "okay";
> >  };
> >
> > +&hdptxphy1 {
> > +     status =3D "okay";
> > +};
> > +
> >  &hym8563 {
> >       interrupt-parent =3D <&gpio0>;
> >       interrupts =3D <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> > @@ -342,3 +373,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> >               remote-endpoint =3D <&hdmi0_in_vp0>;
> >       };
> >  };
> > +
> > +&vp1 {
> > +     vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
> > +             reg =3D <ROCKCHIP_VOP2_EP_HDMI1>;
> > +             remote-endpoint =3D <&hdmi1_in_vp1>;
> > +     };
> > +};
> > --
> > 2.48.1
> >

