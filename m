Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61808CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C6fWWUSV15Z2XahiLhodLd1FusftW6HVqjIbYlKS54=; b=o0ZDZNfNbXcb7qlDX1zR5l3SJh
	lcgJp2OYwH9+hS9oTQFI3snXzvFn8FdcbyFm0wxJC6BrgpxDqOhxf9Z12WvGYlSZp8jl6BKrNPEWq
	KzG7bH+7by0ncBTFG0psiTVJc3HCT8vWbsvNkg1FyPRAU4pk+zJ0z+6S54K3HTdFisobOt7jNn3TI
	zMsL0MDA4d67hHDlF6A5QOhlHWRKkqJalLuhgFEU0oe/zzlUSYxd7jM0DmhfsPdk3VVMdPnqk7JI8
	gIcXx2a1nDBJ9DxMady2UgbjAKeJEBp8wLkTu+rUfesweWpKbxrAAWZGAFwqDlv6STDymmZ7QF5uL
	hPudpjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdv1-00000002QqS-3Wup;
	Fri, 16 Oct 2026 09:08:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdv0-00000002Qq8-3Qm1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:08:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E384560018
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3911F000C6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 09:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141681;
	bh=/C6fWWUSV15Z2XahiLhodLd1FusftW6HVqjIbYlKS54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qz8DpAU/W8clG9FDfnfdKXyOO7YyHNVMQ3oA8muzF6m69TBQ6/0uIrxNCw6cRaBSF
	 5d0O6jgsiscK1BO+ISB1y4hRfpV/caLpzSC62+jPk7+7FQxkWathiZ2UPKIeaf6XzT
	 i+y1/ccj+GUUkK3nqS5HApsjvCadW2f8wpKuV35mgfFOPBHDA9ss+u4nkxvq6oTdHT
	 n0UO/PlUPZhGZa+I8hvvGW6gOaX1ijyhm8prAJBQDCMtx58tZg6IDsWKgcjWnHGBBr
	 A/OmrIEb9QpjmqBjcOu2WwJudIHPlORTeu+ESYYYEmWdDyowntpwV7epI0SiM4x+7D
	 T/NFZL+4rDuQQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba3fba0080so4446609e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:08:01 -0700 (PDT)
X-Gm-Message-State: AFq9FYJUMUZQ1Jv2rfjbSbBvjjoDQBQPgDjCFWx18UrRTA4wV7wrWNUg
	P+LindDTNdAitc7LI329pQqlW0NPiypHWQwS65CV71JTdQCwzMruAItNJ2pwkR1CQiz6Er/pHhn
	HMR1mAI3Vu4v+eW0QnkZBZ+Fr+t+C3Vg=
X-Received: by 2002:a05:6512:1054:b0:5bc:b4d0:df9b with SMTP id
 2adb3069b0e04-5bcde6c97a4mr8515990e87.25.1792141680365; Fri, 16 Oct 2026
 02:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com> <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
In-Reply-To: <aV_PM_GzRW6aLmK6NF7ttw@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 11:07:48 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
X-Gm-Features: AclHuK_5noOpKkEBY1kNxBuxnUvrwxeiNqLeHpNvpG3o-TRMB7o13R_Nlzy6JOs
Message-ID: <CAD++jL=TeOkPDq+xwGdUHdvJx31VtvGR9X53wJS0r0J9s2yLqw@mail.gmail.com>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, 
	robh@kernel.org, krzk@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Oct 11, 2026 at 2:13=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:
> Am Samstag, 10. Oktober 2026, 14:59:47 Mitteleurop=C3=A4ische Sommerzeit =
schrieben
> Sie:
> > +/*
> > + * Each bank has 16 lines, one bit per line in each register. The regi=
sters
> > + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not
> > supported + * yet.
> > + */
> > +#define ZX279128S_GPIO_DIR   0x00    /* 1: output */
> > +#define ZX279128S_GPIO_DATA  0x14    /* line level */
> > +#define ZX279128S_GPIO_SET   0x18    /* write 1: drive high */
> > +#define ZX279128S_GPIO_CLEAR 0x1c    /* write 1: drive low */
>
> This looks identical to mine, which itself matches the old zx29 GPIO driv=
er
> with IRQ support etc that was removed in 89d4f98ae90d ("ARM: remove zte  =
zx
> platform"). This old driver had support for IRQs.
>
> My hardware has the same register layout, but no IRQ support (related
> registers are always 0). So I wasn't planning on reviving the old driver =
and
> just using regmap-gpio like you do here. If your hardware has indeed work=
ing
> GPIO IRQs it would make sense to revive the old driver.

It does sounds a bit like churn if we remove a driver from the kernel
and then add it back after some years...

However if this is using GENERIC_GPIO (regmap is something else)
this is a better base.

I think it's easy for an LLM to port over the IRQ support from the
old driver to this new one, given the code is already there and
this way keep the best of both worlds?

> My hardware has one annoyance: There is one GPIO line (not one block of 1=
6,
> just one single line) that has an inverted direction bit - and this line =
is
> necessary to run the routers on battery. I don't yet know what the nicest=
 way
> to deal with this is. If we have a good reason to have our own zx gpio dr=
iver
> then life would be easier :-)

I don't believe that the hardware block inside the SoC actually
has a single inverted direction bit. Prove it :D

This sounds much more like someone using open drain to drive
the line high when setting it to input mode and has hacked
their way around that behaviour instead of just asking the
GPIOlib core to do the right thing:

gpios =3D <&gpio 0 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;

Yours,
Linus Walleij

