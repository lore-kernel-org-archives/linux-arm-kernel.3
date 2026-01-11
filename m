Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FD4D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2F+wtW2B2tq7BsEJcg+uHjqj3junFFF4szv2VXtjwo=; b=btMZJEIOxsmoJx1+3TN/gm3TJx
	VFPTm8JPAh8XR5GOSUGbk28fZKr8IXuq+mALon02qIIs/THK4JTyJdRJdE4rfxIuAVKwvQgT0ksHp
	P6kV8XR7NZoSwyjaNmdmYS/CfCLmofMUDXhHNwjdbc/65v47pAq2lLdbs+djDJ8w69gm7qBNZ/wnw
	42TTy1qFCdU7rfc5N0SE9LmHQ7UmYgzQNOCmNKGVwha024Zdi+8LUBUcY7UTIwYORDEPCVwmwgrEy
	PDidNyraFeQSiZDoG+TiKNe8GLCbKnCq2pwvkzQhcnlctQIVvXNBZi4c2PwbgKFPg8XgRVC7PhBYf
	dpH3tjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexEp-00000004K2s-1wKZ;
	Sun, 11 Jan 2026 15:20:19 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexEn-00000004K2P-0UB4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:20:18 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-78fb7704cb4so54328777b3.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768144815; x=1768749615; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2F+wtW2B2tq7BsEJcg+uHjqj3junFFF4szv2VXtjwo=;
        b=U1qCY7EuV0GoeuBnr4n0uVSanHMmMvE/L+/kcdmdTU4Von47EN/dAI2UoXGJVy7S0Q
         MvFrLKYP4/8TOcNDuPUs1K59HrAyUFNj8j2/muS+HX9Cs8gWZ4Xv/G5UKzuRd69E0WU8
         C2PPUx8W5psTWnI8IX0+IPg3PRpee2z7+lAys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768144815; x=1768749615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s2F+wtW2B2tq7BsEJcg+uHjqj3junFFF4szv2VXtjwo=;
        b=ROD1hetbmK4xjN7VsaU3VZoexiegCV+Nja2pfA/1KMI3Itt0FTuwr+pOeRvwN1EcyN
         CoWreT1aPO1sPg6/5EFeDBPYhm03aTSWzOLMn7pRxMelMOvtBPS4VBCBfaXMPHqwhnc3
         j07n4bLRJ4FIfpS/0eXWWCQ5eKvBiMLmgj7rwjhZpR04GnnPZbZd31P/TMZILEApz7Id
         jqW9dixZCpzC6I8uL8hwF4Smk6UBysfKb6D5NKpPU8dnU2Vx6KJ/gToLJ6mcjPY8vJiZ
         ueZ7S1YJuAHBJx/y5XvtkrbJ9LT1/7W1Io1/08eJPprGqzJ4su8pu6lkdSGN6lG447cL
         0udA==
X-Forwarded-Encrypted: i=1; AJvYcCUVGx/jER3N3Zr3YmHg6FbeLqP3T/CyEimPJy73qY2eF5rHVpVg6WgRLEQqw4pp3szzKiwxwk4awOU15RhbX8QB@lists.infradead.org
X-Gm-Message-State: AOJu0YyVoP4CGcmiUF7+19dj3D6nYwTEDIxvf/izXF1rJ8i/q+sMXRus
	OZcktHBCY9YqQEmEr+qCNUWRfulsoqKJKkZ/RJPmex1y1A+VSXOHUBJNdob2yA8CdsBrBSz6EMl
	ZnSLBfvDhMdEtMZCM1prtZhaVTWUl5cd9GShV3Es76w==
X-Gm-Gg: AY/fxX5w+YlMFG6kUHu/7VW6smMd0byxgrCu2lq3bFUNx4IyyHREjddyyVy8IAoNnLs
	0R1uwEeTw40ebQs807d+vtCP1NIykaK4/4wN5Eo5cDztXRNh8WYgAHdyOT0ACKELl+4sxRH8MJB
	3C//NL9k1mdqvF8fl5uAAWCq6w5y7CdUlmI1PJib4+gfiCBEVGms370thKmSKOcJjcU5GNKxJG4
	ZeWUPmE/mpccB7ndFPTJgZeuppxBlhOh5KjNWIGKXALGQKsXR3qloe4rq5nj+eRFjuwfFucl4yr
	3i51aVD+lMikt6aidX8UtWyXeg==
X-Google-Smtp-Source: AGHT+IEJEJ7k3ehyLTPliKyhrb/A8vsiv4gmMtQ/Bm40VuLX6dMeiGkvDwyYywXWPJ3D1t/yNNUsPFQGqqJW0lMTk4M=
X-Received: by 2002:a05:690e:1501:b0:646:e354:7325 with SMTP id
 956f58d0204a3-64716b6ff9emr13204975d50.22.1768144815134; Sun, 11 Jan 2026
 07:20:15 -0800 (PST)
MIME-Version: 1.0
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
 <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com> <58006bf6-425a-4016-996b-4a01fdb22cea@foss.st.com>
In-Reply-To: <58006bf6-425a-4016-996b-4a01fdb22cea@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 11 Jan 2026 16:20:04 +0100
X-Gm-Features: AZwV_QjEh5isWh6rzhvUm7qUpn5m3290bgM2aqJv_0TrtCZXLOfst-o_irVmNjk
Message-ID: <CABGWkvrgH6tNsaq3P4xctQxV2w2pkAkko-qGy4Oay=yAwitufA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] arm64: dts: st: add TAMP-NVRAM support
 for STM32MP25
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_072017_330148_64F00BF7 
X-CRM114-Status: GOOD (  17.76  )
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

Hello Patrice,

On Fri, Jan 9, 2026 at 11:40=E2=80=AFAM Patrice CHOTARD
<patrice.chotard@foss.st.com> wrote:
>
>
>
> On 1/7/26 20:45, Dario Binacchi wrote:
> > Add the TAMP node along with its NVRAM child node and define the
> > fixed-layout for fwu_info and boot_mode registers.
> >
> > The TAMP (Tamper and backup registers) block is a system controller tha=
t
> > provides access to backup registers as NVMEM storage that persists acro=
ss
> > reboots.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> >  arch/arm64/boot/dts/st/stm32mp251.dtsi | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/d=
ts/st/stm32mp251.dtsi
> > index a8e6e0f77b83..c7839e732f31 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> > +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> > @@ -2084,6 +2084,32 @@ rtc: rtc@46000000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             tamp: tamp@46010000 {
> > +                     compatible =3D "st,stm32-tamp", "syscon", "simple=
-mfd";
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <1>;
> > +                     reg =3D <0x46010000 0x400>;
> > +                     ranges;
> > +
> > +                     nvram: nvram@46010100 {
> > +                             compatible =3D "st,stm32mp25-tamp-nvram";
> > +                             reg =3D <0x46010100 0x200>;
> > +                             nvmem-layout {
> > +                                     compatible =3D "fixed-layout";
> > +                                     #address-cells =3D <1>;
> > +                                     #size-cells =3D <1>;
> > +
> > +                                     fwu_info: tamp-bkp@c0 {
> > +                                             reg =3D <0xc0 0x4>;
> > +                                     };
> > +
> > +                                     boot_mode: tamp-bkp@180 {
> > +                                             reg =3D <0x180 0x4>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> >               pinctrl_z: pinctrl@46200000 {
> >                       #address-cells =3D <1>;
> >                       #size-cells =3D <1>;
> Hi Dario
>
> At STMicroelectronics we intend to upstream tamp-vram driver for STM32MP =
series.
> If you don't see any objection, we prefer to manage it in our side.

Ok, no problems.

Thanks and regards,
Dario
>
> Thanks
> Patrice



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

