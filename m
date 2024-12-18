Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E205E77184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 01:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOTqUIOzXp/F1/VDnY3B8hbJ1LBkzayHMoadbBXxvqY=; b=pIyJrGTzQ1oAU0eNcb3BQp8QUP
	eUj0wW2Y2q8Ynx1jbGQNVkMszFv/bpKwzyyC289UfQPRq3I05SZwn5HQhJ1DF7uEdlIyFAUB7HXID
	NfsSTtat4BiIPCCpCk9T+AJAd27kDkeIm4tGWTUfh1G8tZwvLdXJ/1UxlZNcI4HcWzH9Umnyp9NiP
	oJn6l8D38awatHON/bg+zfksCaLT7IhFVm1vwS/p74gX61AUtZVVpS/Xe74ByD13q8L91ATu5kZKj
	iIUmix/EL9o9KFs9P3ZeZilRx15leisZZa4kxCJ8ExtwOqXSo4KApuj4aegZST0uiGZ1YLueZJRTv
	oMkdCQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNj3D-0000000FJqJ-0Mu9;
	Wed, 18 Dec 2024 01:40:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNj27-0000000FJiS-1WqI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 01:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECC68FEC;
	Tue, 17 Dec 2024 17:39:53 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FB753F720;
	Tue, 17 Dec 2024 17:39:23 -0800 (PST)
Date: Wed, 18 Dec 2024 01:38:36 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek
 <me@crly.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and
 PLL_MIPI
Message-ID: <20241218013836.421cc616@minigeek.lan>
In-Reply-To: <d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
References: <20241215053639.738890-1-anarsoul@gmail.com>
	<20241215053639.738890-2-anarsoul@gmail.com>
	<qbtp4jvkx3r5azufe4k3vtapqpfs54dyjiu4cy5v5wkkzumrzx@vy3xzkfplbue>
	<CA+E=qVeQ8uHBCeFtw6_2cY3252-YXc6eWrf5_YdeVgbp5LJo5g@mail.gmail.com>
	<20241217211505.7f9c9e4e@minigeek.lan>
	<d0bf0d9cd2df65dc2e17eb203d56eb13@manjaro.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_173927_489604_E45DEECA 
X-CRM114-Status: GOOD (  27.94  )
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

On Tue, 17 Dec 2024 23:02:43 +0100
Dragan Simic <dsimic@manjaro.org> wrote:

Hi Dragan,

> Hello all,
>=20
> On 2024-12-17 22:15, Andre Przywara wrote:
> > On Tue, 17 Dec 2024 10:00:45 -0800
> > Vasily Khoruzhick <anarsoul@gmail.com> wrote: =20
> >> On Mon, Dec 16, 2024 at 11:33=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org>=20
> >> wrote: =20
> >> >
> >> > On Sat, Dec 14, 2024 at 09:34:57PM -0800, Vasily Khoruzhick wrote: =
=20
> >> > > These will be used to explicitly select TCON0 clock parent in dts
> >> > >
> >> > > Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in=
 TCON0 mux")
> >> > > Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> >> > > ---
> >> > >  drivers/clk/sunxi-ng/ccu-sun50i-a64.h      | 2 --
> >> > >  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 + =20
> >>  =20
> >> > You cannot combine these changes. =20
> >>=20
> >> The patch basically moves defines out from ccu-sun50i-a64.h to
> >> sun50i-a64-ccu.h. How do I split the change without introducing
> >> compilation failure? =20
> >=20
> > You can just have the binding part first, adding the (same) definition
> > to the binding headers. As long as the #define's are not conflicting,
> > this is fine.
> > Then remove the now redundant definitions in the kernel headers, with a
> > subsequent patch. =20
>=20
> Yes, that would be a way to make it formally correct, but also much
> less readable and understandable later, as part of the source code
> repository.  FWIW, I find this to be an example of the form being
> more important than the actual function.

Not sure I understand your last sentence, exactly, but what
Krzysztof pointed out is that one part (the header change in
include/dt-bindings) is a DT binding patch, so part of a spec, if you
like, the other is Linux *code*. There is the DT rebasing repo, which
cherry-picks DT patches, so they form a separate history there, and
Linux code has no place in there. U-Boot for instance pull this
repo now on a regular basis. So keeping those things strictly separate
is really important here.

Cheers,
Andre.

> >> > Please run scripts/checkpatch.pl and fix reported warnings. Then ple=
ase
> >> > run 'scripts/checkpatch.pl --strict' and (probably) fix more warning=
s.
> >> > Some warnings can be ignored, especially from --strict run, but the =
code
> >> > here looks like it needs a fix. Feel free to get in touch if the war=
ning
> >> > is not clear. =20
> >>=20
> >> Yeah, it is not clear what do you want me to do, assuming the previous
> >> similar change to sun50i-a64-ccu.h did essentially the same, see
> >> 71b597ef5d46a326fb0d5cbfc1c6ff1d73cdc7f9 =20
>=20


