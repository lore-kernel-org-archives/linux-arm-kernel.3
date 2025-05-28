Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDAEC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=; b=yMivhFuBWnVuMYtn9njSjSeVrV
	F85nH0dTru8HHGVUHzMcR3Ohvvbw6S9T1KGCtqFEzDqoXRAqcMM9ElLvzzOucUBymCni5HD+Q5VaC
	aBcztXA37u3fzfC0HMmeCkaOpFgg4wMUszZnf2V5crhEaPJHyNH9SNeXK/PYz9jTEnZrjelQSSVvR
	5vOa6JIUH5Vl/AyO3v1rbd5TuRXotyQyQYT2uUrA7KjmwyIQgln9J0jD/SnuIbplhdJip4UdzZTGB
	UlIl+6f053kyR1CwYcOddhaRpP0bSTgq31qfL5t4206wYonApbk7rUfHevPoXFRgOMhZU5v3HzDFC
	pUZS5bkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKICg-0000000DU7E-1YMO;
	Wed, 28 May 2025 14:56:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKI40-0000000DScO-3kcK;
	Wed, 28 May 2025 14:47:30 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31149f0393dso2798628a91.1;
        Wed, 28 May 2025 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748443648; x=1749048448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=TI/64BRdJhFZsddpZ6jFJEMUcAFI52xFV/nfQ6kY3rl2hBoJIoh7Uu16OXdjECgkIA
         x6GMLFW12OJXeb83XDJ7LMUBCIGii0kX1mWXMGjILdDLpHm585CZ/g59cPzSyg8tIM8S
         NhGiwd3TahVWBEQuvwfP1eHRppzT7v2oXAaC2r6lygCio62iNd1bHJqQ1kuo8/x2Pxxe
         gdlHUsvsyghLfmj5/S5k/U/OZqq2dZ8A5D0jDxeupId1KOAHQH6UXoZyPaQPrihH3u7j
         DoN3ZX3mTSMshiD68F7oTAGb2ouJ+d6nkjr4T/BMdaOcn27zNszWNxkSNCKxDhqE2usX
         XBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443648; x=1749048448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeSugzNf1/4gi32f7Z56MbpoGgBCaskHwFTFR4uqoEA=;
        b=PQjqF9pslNYNUomVil7LduxvK+BUjmFM+wLHrqOPub7jhM//zawMlkJzBZam/P2gb8
         MKaRcFUhZWxn8SapGmB8Nz5EdOS1jbBnSihgJQogE3lG85bFeHCLoVwNmB84rRKP/edz
         enKXwUZbZFZW8ulPZSsABvfXCglxNYpew3FOBKQmvUje+T9fnJ5yRt0nPZcfvW+mJVRA
         ZlDzkC3mFabE4kRxm9nlZbz31ovPUG8ievCPLy2MKGkK/Psrej7fz+nan46Lb9D62Yj/
         H3lW2U2xI5FaOdbnvHRU1RKwO8vwxmoz2aX0S+RV1soXSmak/MA8cfdXuZe4BjyB1yIo
         xmYg==
X-Forwarded-Encrypted: i=1; AJvYcCUQM0P+28dwH8b5orDY0vALVd7NH/1NZCOGaNlpkQzm8x0eVClDkZ/OarZKPEQXDurIk/Tj7Ues6p0j613s/zj4@lists.infradead.org, AJvYcCVXAQhUoKxtWrsjDld0D/mpkswYd5UrtJMbmxFzWVh1aC/eTEELCQqnwEiZjI/F//UaxjSDCJ4yEU0jkJxPazQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyO/rWtCq86wzf/HtnCE3Bz2qELdVAlULPOhz1kldqXJEIQNVC
	IeePm0jRr6tJo6Wb10+j6WS3STYpsg9SyPvk5DSGRZcgvDrLspOU0wGhtTntcpa4kJ9WAVU60RD
	uR7yZ6dWUb9I6lHQfYAfiwiUoKnWyErI=
X-Gm-Gg: ASbGncurqGo/oPMeDKUrjelEhEambcfpMQdhtXwLuBmNIgdiHWCCrZ/cM9rIH3CwkXn
	64ysPu4wx6DdJ7U98lCRFQGFkxSIZK/OYK4a3QgKDAMbjt23XsR+OgOOxh2MCHHMoWfdqkDIype
	mnW/KvxA344tE4AYPApyDG5SWwta+HkDVt
X-Google-Smtp-Source: AGHT+IHQJXU3p+rSsWqzxaLHSULaSjkoRZugP1vvKeH7LmxHkr7nUsvjweRVqC9eZYhDskDFMsLev7oBi7HQV+tKXmM=
X-Received: by 2002:a17:90b:4b8b:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-311d670ad95mr4555012a91.21.1748443647809; Wed, 28 May 2025
 07:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de> <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de> <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
 <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
In-Reply-To: <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 28 May 2025 09:47:14 -0500
X-Gm-Features: AX0GCFs7evzjkWRmfqngQQTZHj2yQaZWL0ja3DzZVNAah62H09qmX0qG_o41Jko
Message-ID: <CAHCN7xJJz2cOHBbyT0mr3QTndiB4Z6_Gtgy4k2giJt5qg4fH6A@mail.gmail.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com, 
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
X-CRM114-CacheID: sfid-20250528_074728_938202_C15F47C4 
X-CRM114-Status: GOOD (  35.87  )
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

On Wed, May 28, 2025 at 9:14=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le mardi 27 mai 2025 =C3=A0 22:05 -0500, Adam Ford a =C3=A9crit :
> > On Fri, May 2, 2025 at 11:55=E2=80=AFAM Marco Felsch <m.felsch@pengutro=
nix.de> wrote:
> > >
> > > On 25-05-02, Adam Ford wrote:
> > > > On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@peng=
utronix.de> wrote:
> > > > >
> > > > > The VPU_PLL clock must be set before the VPU_BUS clock which is d=
erived
> > > > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 6=
00MHz.
> >
> > I did verify the current clock rate ends up at 300MHz instead of the
> > desired 600 or 800MHz, so we should do something.
> >
>
> This reminded me of:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20250217-b4-hantr=
o-av1-clock-rate-v2-1-e179fad52641@collabora.com/
>
> Which also made me discover that this patch wasn't picked despite being m=
ark accepted. We
> will favour DT clock settings from here, since its not really managable o=
therwise, old board
> will stay like this, otherwise we face backward compatibility issues.
>
> Note that G2 and VC8K can be run at higher rate, but to be stable, you ne=
ed
> to also control voltage and proper cooling, not something we want "by def=
ault".

From what I can tell, imx8m_vpu_hw.c doesn't actually set the clock
rates.  It looks like it just enables and disables them.  I think the
clocks are all set via the device tree.  The 8MP datasheets list the
clock rates based on what they call 'nominal' and 'overdrive' which
determined by some SoC voltages.  600MHz seems reasonable for what NXP
states as Nominal.  I didn't see any NXP downstream voltage or cooling
options.

adam

>
> Nicolas
>
> >
> > > > >
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mp.dtsi
> > > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>=
;
> > > > >                         clock-names =3D "g1", "g2", "vc8000e";
> > > > > -                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_=
BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > > -                       assigned-clock-parents =3D <&clk IMX8MP_V=
PU_PLL_OUT>;
> > > > > +                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>=
, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > > +                       assigned-clock-parents =3D <0>, <&clk IMX=
8MP_VPU_PLL_OUT>;
> > > > >                         assigned-clock-rates =3D <600000000>, <60=
0000000>;
> > > >
> > > > I think there was a move to make the default be overdrive [1]  and =
[2]
> > > > and use a 'nominal' device tree for those who are not in overdrive
> > > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > > > values here should be 800MHz and if we should add the nominal value=
s
> > > > of 600MHz to the imx8m-nominal.dtsi file.
> > >
> > > You're right, Ahamd and Lucas did change this. I will adapt it later =
on.
> >
> > I updated my device tree to run in overdrive mode and ran fluster at
> > the higher rates:
> > VPU_G1 - 800MHz,
> > VPU-G2 - 700MHz
> > VPU-Bus - 800MHz
> >
> > ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> > Ran 57/61 tests successfully               in 5.922 secs
> > (vs 7.059 secs at nominal speed)
> >
> > ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> > Ran 129/135 tests successfully               in 40.107 secs
> > (vs 45.741 secs at nominal speed)
> >
> > If you want, I can submit the clock updates I have for overdrive or
> > send them to you to save you some time.
> >
> > adam
> >
> > >
> > > Regards,
> > >   Marco

