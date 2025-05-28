Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB6C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 03:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=; b=ytVU/5SDbaOrKqWeDNeCFHt8t7
	8zcINCZmTeTtDvF2x/0diEtQew0BD8XYVI6RIG+vM0Jtd5NYMCufFYX6fbI2N3BhyLEE+fjdwM8FY
	q0Bm9hSpHW7up3VD7TjQkEk+wVfKj0p1nI6nh1O8Np1cWYtg1L9OLNxBEXnAaTzr+7sC5eRYXJJig
	N3xFBblhGWgYEys8uXM0/uahNmK2uZU9hos+bi2hsfW3AlVVWyBxhlZzqcaswQL9RUaj0rR0heFa2
	G7ShwrNaBzOP8cW9MOU1JJUvgonaIv5M4qvDL0Zs+XYQSbGHJaEydhE4G9m2Y8aFWkW/3WntbohBx
	4vz/Q1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK78t-0000000C1YJ-3BWX;
	Wed, 28 May 2025 03:07:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK76m-0000000C1Pu-1bmX;
	Wed, 28 May 2025 03:05:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-31149f0393dso2309200a91.1;
        Tue, 27 May 2025 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748401535; x=1749006335; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=ZHMAsfZc5YNpPZ/T7nY/qV1ZQVfyTt5LpEaiz4b66itgXfbnu8Lo8x+HmgMX6XcKSU
         0TE6ICAMAmSjPRHFezKJugQg2kPXseSDOxja38PDskpZ5mu6dybxGpTX4xIaw8ABpXsu
         7thDMW13rh+yGuC7HUVMrpE2lkGnxxildmVAOc3NSVJkbu3ALOAxrcny26EHTMwtr8vl
         6WkKfpFmvaJAJJKIjFLGYRpFd6Aj0hTF5agMrN1oVM3qozhURCj4Pi8M1z6sLf9DNrYL
         SnS+fPhpyRbgHj5S9RheNlU87l6QuMiRv0h9Jye6YH9q96G6yApgj2GOMZubDevUPDFK
         1qzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748401535; x=1749006335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYmnbtrMxduOKu9ITGTitlSbMtTKd5M645QiTbXrAaY=;
        b=NTJncceniYRVW6QdJP13HJUCzVtmUAxcovZtCJ/xL4qAAZgkIOleHmPyxReorlPl+5
         0xmsfhqdtxLMrcOe/U1tO/2a0lQ951jCgCFc6f0KJnrJL/41cUmonzakL4soelOphA+I
         nT9P8VEEv7vz/9GwkdUyFHKjFvxTJSmi9yF5TasCroEEoYp7uq0CGK4sm5XMTiMrIyUk
         DpJLTJy7uHCBNWY8CuildeLigIPmNyDByvtNLlqI1UCB10a4rVdQkflPpcgU0B0AhGIR
         Gt0rH6dynecW5wEULKtGZ3eM+wKsbvcInGioCmbq0QJwagFuI7PGuhGG37crVfwxFjWO
         HXwg==
X-Forwarded-Encrypted: i=1; AJvYcCVDlnmZStMEkXrkh6PbIWus0fvM+fQ31d4+XrpYuQq4zdG2h+cKRjOwwP6Qa8JAYR2ZjI7P4njlLWqQT1rNOIXa@lists.infradead.org, AJvYcCXFr9jMfPFVaGqyPhfXLSrLk690PTnRNFsJ86KZiGiRGdQrhewskHQjAwZjyoxiRbVQAFSLgsGX4BNpa8QXxy8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd5MgIOYnSGosJcl0ctJ2bfAO69dHig0jjYEV1rNYcnx9KKN0y
	3om4dFaP5iqo83FbnLYsflLo3lqpUN7doVks2WfeWE0qG0g+015Jv/d8yT2GTBen1O9yRvEHUzm
	SlZMEo1rLA1XuzWUWtW5w6MxBGo48r9Y=
X-Gm-Gg: ASbGncs07mOvHWpryUWMuJXq/oM/bwDFRyzhY1X+BGm4nl/NxrR7szmghqQRQ9O6j7J
	V5IyDZv53infbxw+SXIDsLxTd0ICWFXE47sfZPNe81q0fXQBwbepuN9Cd87c0Q8YER0afdRGXli
	a/i3CEAyfr4tNYp5eO4/eaazKFt9004L4wutCT6JqTMpQ=
X-Google-Smtp-Source: AGHT+IEZ6LkUmKwlZlKmCgrqaa17DjFrtDszVlcH7RcGvuUieg+Ee25K0BY70YK/3VI5vchDvPkcpByMtCn4N3Ku04o=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr2330419a91.21.1748401535339; Tue, 27 May 2025
 20:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
In-Reply-To: <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 22:05:23 -0500
X-Gm-Features: AX0GCFu8yyPWk2ODj0OO3w1sV1GGZuj2FPHpU_Gczh74crcCq6_GDYUbvmDndvY
Message-ID: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_200536_429585_40F1B237 
X-CRM114-Status: GOOD (  25.68  )
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

On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> On 25-05-02, Adam Ford wrote:
> > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > The VPU_PLL clock must be set before the VPU_BUS clock which is deriv=
ed
> > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MH=
z.

I did verify the current clock rate ends up at 300MHz instead of the
desired 600 or 800MHz, so we should do something.

> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 97b09b647ec7..7f4bdefb3480 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_BUS>=
, <&clk IMX8MP_VPU_PLL>;
> > > -                       assigned-clock-parents =3D <&clk IMX8MP_VPU_P=
LL_OUT>;
> > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&=
clk IMX8MP_CLK_VPU_BUS>;
> > > +                       assigned-clock-parents =3D <0>, <&clk IMX8MP_=
VPU_PLL_OUT>;
> > >                         assigned-clock-rates =3D <600000000>, <600000=
000>;
> >
> > I think there was a move to make the default be overdrive [1]  and [2]
> > and use a 'nominal' device tree for those who are not in overdrive
> > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > values here should be 800MHz and if we should add the nominal values
> > of 600MHz to the imx8m-nominal.dtsi file.
>
> You're right, Ahamd and Lucas did change this. I will adapt it later on.

I updated my device tree to run in overdrive mode and ran fluster at
the higher rates:
VPU_G1 - 800MHz,
VPU-G2 - 700MHz
VPU-Bus - 800MHz

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 5.922 secs
(vs 7.059 secs at nominal speed)

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 40.107 secs
(vs 45.741 secs at nominal speed)

If you want, I can submit the clock updates I have for overdrive or
send them to you to save you some time.

adam

>
> Regards,
>   Marco

