Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEHa30YI/D4TB5d5TCkCAkeAxF1mnHvfzhEDix3qPkY=; b=rgo9WcaqO5i8AIhocW2Aeou7h+
	qeqH2ppBmihuqS8+sfCCXtn/FIfvk/Bec19gostsQ9OPkrjGhrlEStg/UJ3/P1tnkn+WFdhAfJASd
	9d6wDQ86apprhT3sHKxosbrOlQjzEYAkPFTGlzpCvtpNgN1fs87xBmQ6/O8z3Pu4KFxyRllqqeyxl
	m8fUaujI497+NX12C9zuLBRDdj3eRywnwyLt360OqsHGOywYlZze/P/W5OLu6XbyzU9UOtKIk/byP
	AJJBCO0FeTgeKtKODnEG+X++X44ZJwEDg25MTxsnys2OCZWdrPVOYzMfLG3I8FfdF34rcHZ5UMmB4
	XzSZpPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzaq-0000000BI7d-21Dn;
	Wed, 15 Jan 2025 09:21:44 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzTj-0000000BFeh-2Lvt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 09:14:24 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3a7d7db4d89so17707655ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 01:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736932462; x=1737537262; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEHa30YI/D4TB5d5TCkCAkeAxF1mnHvfzhEDix3qPkY=;
        b=Ph/FzgMCz6adp1BO5+7AeZC9ImIp2eFP9t9BzdGafmivAxulO5EXMO8rO+VLb8prHA
         44JJ/xTP4dPUwjPNunNrUrHXGpC9Q3LihnR4VZOWH2mcwmO6Uc15DXJf33GskzHZQGrs
         /iiVAtIG4C2wC5snLMjsiFp0HGEjyHEBif161KfjhryfJoN2iMFFJkfN+2Vs4fMQOXly
         lflwh63y2LeunA7uBcn+240rEZWCFWRzBRRvdEurThc71atJxnycTTJfM6SbYWgxU94c
         44SZpUoQIdvun5E46RBiwtP38u7SC7F7Z07+IWsnRv8wMC9HJy4evcDggu3I6s3rfp5D
         PQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932462; x=1737537262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEHa30YI/D4TB5d5TCkCAkeAxF1mnHvfzhEDix3qPkY=;
        b=HX9iHtEOQLbIfp8ppT7Ll/lPUXw4BZFfdp/eVKXXk+Wuc6+IBQv1pDAKZyN2RBPwCM
         tbl5CpQObR1x+NkLhoMWBIFeo7Lpr+2f88Sxs1s/35cUKD99cMEbGbBaWdJFSJkGSBYa
         YZPN17ykHPmK4E517zjcMvhV5WkV9Z/dkFCcMfKFKf+dKL7kpFlL6T94jhDam5DQ6cW1
         p2dG4rjujhWj6YKVXq8MgJbBRt8fEZXoBYR+2amI51Tesu1UEQxz+V7qXaqXqXObLCxm
         U1j3cxtip301pzG09GP3VSfs420texMl5cutH6DY+UTWlPEJvfx/E0VcODR1KxWpk8uS
         r/yg==
X-Forwarded-Encrypted: i=1; AJvYcCWHPxFhT4/DmRbuLZQzCyTDBIDIEVbnjcWTT4HOVNyi1gcRFmJwAfbaJik9s2YC+ry0y5Ybvy8HdcsD4tMLY/3e@lists.infradead.org
X-Gm-Message-State: AOJu0YzK8kp0lx3uvntbLPZZBuRwzHrC0Bwo81rYWYQhlfVyFNlg3+uE
	rMmbAGR8ikOBzxGWjhTr1zXVxVS89UNDhFZfwmUy6M7PKSozBgFWTdt2DJ187acFqUQrlXadZIt
	addEjYIcWOwQ7uaNmfMjwIHuN4A2YNHhLqDY=
X-Gm-Gg: ASbGncsreFdDo+0JOuLFtuNj256WSOEkfSmR8HhbykYUgI2FcMlsAxJCKuwvWvS2iVA
	8BuhbrU07rirPIPeuiK5jtAtlSAN9rmhr44VK8Q==
X-Google-Smtp-Source: AGHT+IHp2yxisjfC0hLM91sJ5IJ902hsppuSwXi035/jhixqUZj488OZUhs3oen2jZMSUhBJ8zUTJKPr8r3rc8NuV+M=
X-Received: by 2002:a05:6e02:1388:b0:3ce:7b61:588 with SMTP id
 e9e14a558f8ab-3ce7b6105admr42289285ab.14.1736932462018; Wed, 15 Jan 2025
 01:14:22 -0800 (PST)
MIME-Version: 1.0
References: <20250113094654.12998-1-eichest@gmail.com> <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop> <Z4dy3LiEAQ_gkQGG@eichest-laptop>
In-Reply-To: <Z4dy3LiEAQ_gkQGG@eichest-laptop>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 Jan 2025 17:14:09 +0800
X-Gm-Features: AbW1kvbGmYmFi47HyTpnehrf6vLaFKFPTfU5SSwIThsPUsGc6UrAlSPVPKgHKy4
Message-ID: <CAA+D8AO75MLyP5AWDJoogw8ae4GRtZfSR-HT+S26bXoaVs8saQ@mail.gmail.com>
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
To: Stefan Eichenberger <eichest@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com, 
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_011423_597981_CA7103EB 
X-CRM114-Status: GOOD (  40.35  )
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

On Wed, Jan 15, 2025 at 4:33=E2=80=AFPM Stefan Eichenberger <eichest@gmail.=
com> wrote:
>
> Hi Shengjiu Wang,
>
> On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> > Hi Shengjiu Wang,
> >
> > On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > > On Mon, Jan 13, 2025 at 5:54=E2=80=AFPM Stefan Eichenberger <eichest@=
gmail.com> wrote:
> > > >
> > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > >
> > > > Currently, the flags for the ACM clocks are set to 0. This configur=
ation
> > > > causes the fsl-sai audio driver to fail when attempting to set the
> > > > sysclk, returning an EINVAL error. The following error messages
> > > > highlight the issue:
> > > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 5909=
0000.sai: -22
> > > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > >
> > > The reason for this error is that the current clock parent can't
> > > support the rate
> > > you require (I think you want 11289600).
> > >
> > > We can configure the dts to provide such source, for example:
> > >
> > >  &sai5 {
> > > +       assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>=
,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_=
BUS>,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_=
BUS>,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>=
,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_=
BUS>,
> > > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_=
BUS>,
> > > +                       <&sai5_lpcg 0>;
> > > +       assigned-clock-parents =3D <&aud_pll_div0_lpcg 0>, <&aud_rec1=
_lpcg 0>;
> > > +       assigned-clock-rates =3D <0>, <0>, <786432000>, <49152000>, <=
12288000>,
> > > +                                <722534400>, <45158400>, <11289600>,
> > > +                               <49152000>;
> > >         status =3D "okay";
> > >  };
> > >
> > > Then your case should work.
> > >
> > > >
> > > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the AC=
M
> > >
> > > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will c=
ause
> > > the driver don't get an error from clk_set_rate().
> >
> > Thanks for the proposal, I will try it out tomorrow. Isn't this a
> > problem if other SAIs use the same clock source but with different
> > rates?
> >
> > If we have to define fixed rates in the DTS or else the clock driver
> > will return an error, isn't that a problem? Maybe I should change the
> > sai driver so that it ignores the failure and just takes the rate
> > configured? In the end audio works, even if it can't set the requested
> > rate.
>
> The following clock tree change would allow the driver to work
> in our scenario:
> &sai5 {
>         assigned-clocks =3D <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
>                           <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
>         assigned-clock-parents =3D <&aud_pll_div1_lpcg 0>;
>         assigned-clock-rates =3D <0>, <11289600>;
> };

In which we configure PLL_0 for 48KHz series (8kHz/16kHz/32kHz/48kHz),
PLL_1 for 44kHz series (11kHz/22kHz/44kHz),
which should fit for most audio requirements.

>
> However, this means we have to switch the parent clock to the audio pll
> 1. For the simple setup with two SAIs, one for analog audio and one for
> HDMI this wouldn't be a problem. But I'm not sure if this is a good
> solution if a customer would add a third SAI which requires again a
> different parent clock rate.

We won't change the PLL's rate in the driver,  so as PLL_0 for 48kHz,
PLL_1 for 44kHz,  even with a third SAI or more,  they should work.

>
> One potential solution could be that the SAI driver tries to first
> derive the clock from the current parent and only if this fails it tries
> to modify its parent clock. What do you think about this solution?
>

It's better to avoid modifying parent rate, as drivers don't know if the pa=
rent
is used by another instance.

Best regards
Shengjiu Wang

