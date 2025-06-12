Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDDDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEJs2y5lh32zGmKZ8Qzhu9KFrGD77yTrgBvMh7VvKkA=; b=FwpuZyUN48qU0B82VHBT1JS4nH
	WkNG7ayaNOjzXY01If9oDXZUkwkIysRu1FLFM/wdNh/eb+V2Rwi84L/EWh/nqjxK5I8J5rtgVNnb2
	Z1PNY1ivkoGp3j0L3To10CQWts3w6f6YqYbPJ28Re0+uIDJuiIRz1Viido7ooVm7sttU0hRiuHDdN
	05q0IxvZvI0pQSUeFaYl4cRnuTd7gfH6hkeMMkCP12cyMGoXJW4gbnU0SM0nkSXNCrl9Tb9cmyKe4
	YR04k93vVP/oQGaMpOEfZueT3WuYlnNWbEN4FjcKaLv1OeNyS/FynONMrgenpXTm2NOb/589l1dyT
	Ms43JwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrG-0000000DPTE-2u04;
	Thu, 12 Jun 2025 13:20:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPh3U-0000000DG0z-3rNi;
	Thu, 12 Jun 2025 12:29:17 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ad883afdf0cso187153266b.0;
        Thu, 12 Jun 2025 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749731355; x=1750336155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEJs2y5lh32zGmKZ8Qzhu9KFrGD77yTrgBvMh7VvKkA=;
        b=Di3Ov1OeubLTypJEW8AJatj34sNFmqaFU38IOGz6poIZmoDCikdV1Z8WOKxahJWHmk
         B8QAJEknXNSySZk3cgb6uL8MljatUA8J7p9hb0gUhejyWgOwiHfjosDevAE/lcBvTp5T
         sY5VJOMOGsKBvOgVWOPTRUis/V/ZtNN6H+5rLQXEitdjdnrshGS207iS3BD3+iMWtaa+
         lxBklZJPpO4MNSjJRM6UuSCe6vjT4lFKrwVDGtqzYj9KfB/RAv/A1uDhhHdTQPjxaaZb
         sn9guF6SyTg4mqouygmBpogOtzq5z9IcvoXylK45z1uorECCPAp7cFoPky569WOvObD5
         2UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731355; x=1750336155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEJs2y5lh32zGmKZ8Qzhu9KFrGD77yTrgBvMh7VvKkA=;
        b=ubhTAn3U+h4TgHjcnUWb7MNB5hHyNLOtptd6iXxTkY5G9B/mfMwtdYPYAi/e7tT/wQ
         /nT3/hMVa4cx0aP8VnINzcCCrc1A3WaSFzrVbeomfsWcq+cWQNAF8138vFZ1vM35AM3q
         +pjmeEFouGfSILzFtH07bZbFhcTbL49sCXWifgglFRzxx2LhmTfCqMgPMWx9P1jnRidb
         4aKm8I+U60K4x6KD3UbPv1JAs/JQUaREt22WrjAPYBsDKDBXfNsiHq4NpCRSbp8vcgeW
         f4cHB5qPm65qa/Zprg9lL48kCO1Bbv1Us5kRAoPWrX8D51EP571jLhIuZycJIdF6niM0
         UEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9WNcHAIjnhxjL8hpmixMnSqKrKhRZEAsGAatXfdciuX5aNAt1dCq3v4i+BC0Dp1bom0vqW/hTLpuxwetlfr8F@lists.infradead.org, AJvYcCWe6an5WKwr8s8X1+o+NFFWPo8Qlee+w7xlxxqUfy4nRpuT/e5fw/HlfhtCuEANtmjZk53y01Nauh8UKGonZ6g=@lists.infradead.org, AJvYcCWrGRe+DS9U1YfHXJZTC4D3/bsnUWP91ovzcA8mpVlq+z+AWftk/bW/Yw+x1K61l5nlncwJT+GoaEeO3RjEbI4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd1+jShpk/HAJ9BvKyQ3xNqCzk7dWehVZY6PcdmUFu+3XA7hUo
	JL9+2lj1mvbZ4T2j8IlYEE3pdt2ON5OQEcpJH31MbXcAk+mNXu4iWLUC7VgPf9IjGKcVFn04Uf+
	cyUrxHowxsB3YukrtFcvsJjCL+C3jJkY=
X-Gm-Gg: ASbGncvwu8LPe3Mw0J4gz62duAB36ep3AcV4/lSUBvVY0hppGI07TFYc5u+a9NcfOT9
	ZyM+CNQgbtgXh61+K+TA99Plt2Cow04NHfoQxpJS9BEFpd/SEmtK+hxKp0H6opo9DtPTHpMGtkQ
	3/aF64qqGtyH6FX+gqAIwAgGEkvlqWIZuxlraxT2Dy85w=
X-Google-Smtp-Source: AGHT+IGlkqMkspvLMpeTjF8aN4KiUGRrevrrBMyqe/WGI6YMF5fU2+dVwFdEvs12L1YJUL60yY3huaWNWMMfCo5r7oM=
X-Received: by 2002:a17:907:1c9e:b0:ade:5ba:40e1 with SMTP id
 a640c23a62f3a-adea270e2f5mr330585366b.0.1749731354468; Thu, 12 Jun 2025
 05:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <aEqbQPvz0FsLXt0Z@duo.ucw.cz> <2243943.irdbgypaU6@workhorse>
In-Reply-To: <2243943.irdbgypaU6@workhorse>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 12 Jun 2025 15:28:37 +0300
X-Gm-Features: AX0GCFscYljXh7LJwJGoGDo8-EH4wvCa4kp802_hSw1Ko3S3oAJ3o3w3MKMG3Hc
Message-ID: <CAHp75VdVB1OogZay+FDYVY0XajxcOx6t8T8LJSs+zSZg8TkaDQ@mail.gmail.com>
Subject: Re: [PATCH 00/28] iio: zero init stack with { } instead of memset()
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, linux-rockchip@lists.infradead.org, 
	Michael Hennerich <michael.hennerich@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Roan van Dijk <roan@protonic.nl>, Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Mudit Sharma <muditsharma.info@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Andreas Klinger <ak@it-klinger.de>, Petre Rodan <petre.rodan@subdimension.ro>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_052916_960098_5E349C54 
X-CRM114-Status: GOOD (  30.21  )
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

On Thu, Jun 12, 2025 at 3:12=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:

> I thought I'd chime in as someone uninvolved because this seemed
> interesting.

Welcome! Other opinions on such a topic are always appreciated.

> On Thursday, 12 June 2025 11:17:52 Central European Summer Time Pavel Mac=
hek wrote:
> >
> > > Jonathan mentioned recently that he would like to get away from using
> > > memset() to zero-initialize stack memory in the IIO subsystem. And we
> > > have it on good authority that initializing a struct or array with =
=3D { }
> > > is the preferred way to do this in the kernel [1]. So here is a serie=
s
> > > to take care of that.
> >
> > 1) Is it worth the churn?
> >
> > 2) Will this fail to initialize padding with some obscure compiler?
>
> as of right now, the only two C compilers that are supported are
> GCC >=3D 8.1, and Clang >=3D 13.0.1. If anyone even manages to get the ke=
rnel
> to finish a build with something else, I think the compiler not
> implementing the C standard correctly is the least of their worries.
>
> My bigger worry is that =3D { } is only guaranteed to be as correct as
> memset on C23, and the kernel's standard right now is C11. For that
> reason alone, I don't think memset should be moved away from for now,
> unless someone can verify that every GCC release >=3D 8.1 and every
> Clang release >=3D 13.0.1 does the right thing here regardless.
>
> >
> > 3) Why do you believe that {} is the preffered way? All we have is
> > Kees' email that explains that =3D {} maybe works in configs he tested.
>
> =3D { } is guaranteed to work in C23, as per the standard, but again we'r=
e
> not on C23.
>
> The reason to prefer this is likely that it's easier for static analysis
> to see the struct as initialised, but that's me making assumptions here.
>
> A more human-centric argument is that once we're on a C standards version
> where =3D { } is guaranteed to be correct, then =3D { } is much more obvi=
ously
> correct to a reader than a memset with a value and a size somewhere later
> in the code. This argument is evident from the number of patches in this
> series where the memset and the declaration are not in the same hunk.
> That's the kind of stuff that keeps me awake at night, sweating profusely=
.

While all you said seems true and I agree with, the pedantism here is
not needed as in the Linux kernel we have {} used for ages in tons of
code and if something went wrong with that we should have had bug
reports already. Are you aware of such? Personally I haven't heard
even one related to this. But if you know, I am really more than
interested to read about (please, give pointers to such a discussion).

--=20
With Best Regards,
Andy Shevchenko

