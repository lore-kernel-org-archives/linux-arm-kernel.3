Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17365E7716F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 01:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmY128hLLsZSkLyQnAO+inPpFdU2SYtNdTmH6knAX/U=; b=OVKXiuzVwe9ln1qQKhdst1X1YQ
	UReen9kB1Z0iK9jW9iqeO3sYl5FmUGCP+x8Vl7AgY+7gWZgVsbcwUylyk/o9nSL0WLs99jWjT1RGq
	ByK8No2N82JVjgRrWrYC1xht7Xkuhvl/aIdtrfnGDdoM4kOtwGcJrn+9jxy9N5rxszP8mjEaCm02x
	x0rs4y3oLnKjmUw3vta/4hPYXBV+70kt3HwhlryQBlIf33dox/RRomddRVsCduaDOF9KgkGeh5Z15
	ytbXvXn5EINEUjiC3E+dQ+AmqkUyvCtGGxpA61pOUKAJEfOi8Z/z3zr/5LL6QP5ZDWAT0zVeJKOBM
	1vqgLMxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0lH-0000000ETm6-2y0R;
	Thu, 05 Dec 2024 01:34:35 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ0kG-0000000ETg7-0Gvy;
	Thu, 05 Dec 2024 01:33:33 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d0cd67766aso359425a12.2;
        Wed, 04 Dec 2024 17:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733362409; x=1733967209; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmY128hLLsZSkLyQnAO+inPpFdU2SYtNdTmH6knAX/U=;
        b=JtZd4LarQuMkaVfAeTF2ChyMmlWgeOKslwN2npfD9cQDrDnlbDmcljtm+zFQyP0Pv4
         uFyXkxmAB7ZdVB94cfYvDj8sZw68zULcyb/e8j5QflFrBlnkj/90t77ZyRRqnVyL/huN
         sJBoQMYpiM5PgP1H93yPXRT//lypuxVBF9w8Ms9TA3mU2moGsxvFWUjF7Om7rBx4Qz3j
         kqgMEUyL2rOXXLyHBbZdIj2IwKcM9iC8DBH/+ugW+RIREbGXaSMkRE087JjeXvz9b+yx
         LHezZUfxkAQY+GmhDWvMPNJF+O2J2Q9kDquOtZ6rSHQHNR7R5D7wHQJG8QNYt9yAfPoY
         4PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733362409; x=1733967209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmY128hLLsZSkLyQnAO+inPpFdU2SYtNdTmH6knAX/U=;
        b=fieBr/znIral4FVLfnnVw8biDbLab1NVIEZpwVTe1+xnRRQ7ZvCQfODgHk/uq3ajUk
         U+EX4GW/+R6UhCh7WOq1V0l9cMtd+A9n6tMb37DZTmQnu4RtqZ0B71tmDY8pFjzU+fNx
         7mtrNPeHhhAPzLPh8P0OrATxv8Fo75tDitR/3voxCi6PeGKSfaLG4X0Ecc0PtNZJiuXA
         OCsKanKlab+4jnWDSYC4dOk17bWjUgkGiFESKU4dmCP8hh9xsIbqbuXFQfZHjWRFzCMV
         HS7I8rou+PUazYBclehFi1fcL9NW2Fb40EdUGtnrH3o/rRPQ9jqfqdf9//XOGtBjyicD
         WdGA==
X-Forwarded-Encrypted: i=1; AJvYcCUzidykUdvz7vPP0F0ZGIuNF1dVtkrK2iDT2+iJDiuuA3aWcZWzhvMSDyD6ydkJPEQGp9njIWLAV0TJ0E8BeaU=@lists.infradead.org, AJvYcCXOzGyh4i+olPNy7x4vnEfI/D7o5OViicTK4lxVnthJiE1t5caGR6IfakjlnAzG6YDspmKCWc44+bYaQ7VBRKmE@lists.infradead.org
X-Gm-Message-State: AOJu0YyiMPOpaf3rd0PJ3E9Q0py4A0xnv6GqdW865nv/xwwOicp0YG/3
	uDJuqJ9HFDlUeHIvihVPmaxqhR9GYrf1flYpsHPaLteysqhXwUMLvrSliroT/GdAmW6N6GwEJRU
	2NUS6oHE+Q+h/7vHngj/vPO0Ojq7ML+VV
X-Gm-Gg: ASbGnctTIop6ZUnCny1xpw+vRN5cnROTpsM1cqXzJQ16KaA5gDGTBs0/dV5FSiMkeNM
	csIRgoYgyH9tVmv1izqINj4KzlsuhH0Ob
X-Google-Smtp-Source: AGHT+IGu14tQuy4YA+pl+VRTeC/EhlZsBCpudHv1pXmMQhBMw4Kj54oDa0ew0+2Yf/3xN1DFUoO8tAA/uR4K5It/c00=
X-Received: by 2002:a05:6402:5106:b0:5d0:feec:e160 with SMTP id
 4fb4d7f45d1cf-5d10cb82702mr6569303a12.22.1733362409228; Wed, 04 Dec 2024
 17:33:29 -0800 (PST)
MIME-Version: 1.0
References: <20241202090408.201662-1-jakob.unterwurzacher@cherry.de>
 <63b3be80-cb6c-49e5-858f-70fd826140c5@cherry.de> <2578458.4XsnlVU6TS@diego>
In-Reply-To: <2578458.4XsnlVU6TS@diego>
From: Peter Geis <pgwipeout@gmail.com>
Date: Wed, 4 Dec 2024 20:33:17 -0500
Message-ID: <CAMdYzYr9bULWou5gf43G-AywREWRCOhHmJ-fOQ1cEDWJSmGSdQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: increase gmac rx_delay to 0x11 on rk3399-puma
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Jakob Unterwurzacher <jakobunt@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Iskander Amara <iskander.amara@theobroma-systems.com>, 
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>, 
	Vahe Grigoryan <vahe.grigoryan@theobroma-systems.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_173332_104909_03DA0476 
X-CRM114-Status: GOOD (  37.19  )
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

On Mon, Dec 2, 2024 at 4:58=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>
> Am Montag, 2. Dezember 2024, 10:52:06 CET schrieb Quentin Schulz:
> > Hi Jakob,
> >
> > On 12/2/24 10:04 AM, Jakob Unterwurzacher wrote:
> > > During mass manufacturing, we noticed the mmc_rx_crc_error counter,
> > > as reported by "ethtool -S eth0 | grep mmc_rx_crc_error" to increase
> > > above zero during nuttcp speedtests.
> > >
> > > Cycling through the rx_delay range on two boards shows that is a larg=
e
> > > "good" region from 0x11 to 0x35 (see below for details).
> > >
> >
> > Is this missing a "there" after that? "that there is a large good regio=
n"?

That large good region is actually an eye that you are aligning to the
clock signal. The board is on the tail end of the eye where it is
barely working. This value is supposed to be tuned to be in the middle
of that eye. You may want to test the old boards against the new
boards, because if the original board was tuned correctly something
may have changed in hardware that caused a significant shift in the
eye location. Examples of this would be changing to a new phy,
enabling phy delays, or changes in the trace length. If this is the
case, you'll probably want to make a new variant of the dts to cover
this.

> >
> > > This commit increases rx_delay to 0x11, which is the smallest
> > > possible change that fixes the issue we are seeing on the KSZ9031 PHY=
.
> > > This also matches what most other rk3399 boards do.
> > >
> > > Tests for Puma PCBA S/N TT0069903:
> > >
> > >     rx_delay mmc_rx_crc_error
> > >     -------- ----------------
> > >     0x09 (dhcp broken)
> > >     0x10 897
> > >     0x11 0
> > >     0x20 0
> > >     0x30 0
> > >     0x35 0
> > >     0x3a 745
> > >     0x3b 11375
> > >     0x3c 36680
> > >     0x40 (dhcp broken)
> > >     0x7f (dhcp broken)
> > >
> > > Tests for Puma PCBA S/N TT0157733:
> > >
> > >     rx_delay mmc_rx_crc_error
> > >     -------- ----------------
> > >     0x10 59
> > >     0x11 0
> > >     0x35 0
> > >
> > > Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
> >
> > This would be a candidate for backporting I believe.
> >
> > Therefore, a
>
> also please include a
>
> Fixes: 2c66fc34e945 ("arm64: dts: rockchip: add RK3399-Q7 (Puma) SoM")
>
> > Cc: <stable@vger.kernel.org>
> >
> > here would have been nice (in the commit log), c.f.
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
select-the-recipients-for-your-patch
> >
> > > ---
> > >   arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3399-puma.dtsi
> > > index 9efcdce0f593..13d0c511046b 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> > > @@ -181,7 +181,7 @@ &gmac {
> > >     snps,reset-active-low;
> > >     snps,reset-delays-us =3D <0 10000 50000>;
> > >     tx_delay =3D <0x10>;
> > > -   rx_delay =3D <0x10>;
> > > +   rx_delay =3D <0x11>;
> >
> > While at it, we could reorder this alphabetically and move rx_delay
>
> I would disagree. This is a "fix", so should ideally only do the minimal
> changes to make life of the stable people easier.
>
> Doing this one-line change is way easier to understand than stuff also
> moving around.
>
> Heiko
>
> > between pinctrl-0 and snps,reset-gpio? c.f.
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-s=
tyle.html#order-of-properties-in-device-node
> > rx_delay and tx_delay seem to be vendor-specific but without the vendor
> > prefix, but so is snps,reset-gpio so that should be fine to reorder thi=
s
> > way.
> >
> > Considering we have an option for KSZ9031 on RK3588 Jaguar and RK3588
> > Tiger and the "same" MAC IP is used and that we use the same TXD and RX=
D
> > delay than on RK3399 Puma right now, I guess we would want to check
> > those don't need a change as well? (funnily enough, all RK3588-based
> > boards in 6.12 actually have 0x00 for rx_delay and 0x43/0x44 for
> > tx_delay, except ours which are at 0x10). Not a blocker for this patch
> > though, so:
> >
> > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> >
> > Thanks!
> > Quentin
> >
>
>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

