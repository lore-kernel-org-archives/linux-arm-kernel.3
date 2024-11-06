Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DED44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 12:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vis9DrxowZ/AktTU/z9vKtuDIMJQDhrIDdxt5nA9NwY=; b=icbBpPgFPHL8Ic4g6mLgm2pPec
	e7/cBkgPz4e4cDLfezGXnlCs4mC3HcNk6pG08Jx1yFCTPRv1Xk8GaxxmCsGSgxNujiaQxl9Vr2HhS
	ip6y2x9PSRVHOKk/nnzy5iRkf8Y7sV9b2x/iVmf9OhIpHUzoClmNK/Gok2WroJtdO55yNaHBpzs7H
	8XkZQJiU12G/GkzSllk/QUvbqY/SSFfreLLQzRrlvZAn2lmqPoB7BzIIsVSBzReexY96/RF8uHvKZ
	xgRltzTD3C0XSwebDKEceA1zxrwGUAe6WcHkHkw0Zj2HkPtMiMQRov8j598nvdD3MiBRySNB+UvTe
	+utdhTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8f2B-00000003A9R-3Ab1;
	Wed, 06 Nov 2024 12:21:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8e9V-00000002uf7-2ZMk;
	Wed, 06 Nov 2024 11:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vis9DrxowZ/AktTU/z9vKtuDIMJQDhrIDdxt5nA9NwY=; b=L2/RcPKXHIPU7IIHUAjSMoHx/t
	8HwvGQ4D+Nx8SxCH+ld24GX/I1F/AGJa2YN4UCFEzlmJGCv++/nfFb08IIaFlmVOo6P+WahmEAgdX
	PKfAHuLOoHEBE4AL2RZv3nCcBGB0F8oIhz7M/B3474NeBCIzHwG2BGGuHnOR4pvmMkpNd+IkNIXAa
	+c08jdnycrbGBoB3aq3Z3ZgHyxaux14UQ7flR3AIWzNhtSNoBMRT89eKjSAbzMY3NWilBGd9tk4TD
	AsN45eQSfr4wBAeKg4K/OZWeoG0QbyVWnwW1qBKDiWSNIHZpQEeMFAaNEgq1qNREZyhL1meX+AIHn
	+V6T2c3Q==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t8e9S-0006fE-Av; Wed, 06 Nov 2024 12:24:42 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
 Quentin Schulz <quentin.schulz@cherry.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alchark@gmail.com
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add OPP voltage ranges to RK3399 OP1 SoC
 dtsi
Date: Wed, 06 Nov 2024 12:24:41 +0100
Message-ID: <3515804.QJadu78ljV@diego>
In-Reply-To: <77bc2898bbbd2633d6713b4935bd5ee3@manjaro.org>
References: <dbee35c002bda99e44f8533623d94f202a60da95.1730881777.git.dsimic@manjaro.org>
 <3252308.5fSG56mABF@diego> <77bc2898bbbd2633d6713b4935bd5ee3@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_032445_700928_5CC3848A 
X-CRM114-Status: GOOD (  32.96  )
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

Am Mittwoch, 6. November 2024, 11:45:06 CET schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2024-11-06 10:41, Heiko St=FCbner wrote:
> > Am Mittwoch, 6. November 2024, 10:32:06 CET schrieb Quentin Schulz:
> >> On 11/6/24 9:33 AM, Dragan Simic wrote:
> >> > Add support for voltage ranges to the CPU, GPU and DMC OPPs defined =
in the
> >> > SoC dtsi for Rockchip OP1, as a variant of the Rockchip RK3399.  Thi=
s may be
> >> > useful if there are any OP1-based boards whose associated voltage re=
gulators
> >> > are unable to deliver the exact voltages; otherwise, it causes no fu=
nctional
> >> > changes to the resulting OPP voltages at runtime.
> >> >
> >> > These changes cannot cause stability issues or any kind of damage, b=
ecause
> >> > it's perfectly safe to use the highest voltage from an OPP group for=
 each OPP
> >> > in the same group.  The only possible negative effect of using highe=
r voltages
> >> > is wasted energy in form of some additionally generated heat.
> >> >
> >> > Reported-by: Quentin Schulz <quentin.schulz@cherry.de>
> >>=20
> >> Well, I merely highlighted that the voltage was different on OP1
> >> compared to RK3399 for the 600MHz OPP :)
> >>=20
> >> So... If there's ONE SoC I'm pretty sure is working as expected it's=20
> >> the
> >> OP1 fitted on the Gru Chromebooks with the ChromiumOS kernel fork
> >> (though yes, I believe all Gru CB are EoL since August 2023). In the=20
> >> 6.1
> >> kernel fork, there's also no range:
> >> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs=
/heads/chromeos-6.1/arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi
> >=20
> > yeah, this somehow goes quite a bit into the "stuff that doesn't need=20
> > to
> > change" area. On the one hand it does make "some" sense to unify things
> > if we're using ranges everywhere else.
>=20
> I agree that it might be unneeded, but there's no possible harm, and
> unifying the things may be seen as beneficial.
>=20
> > On the other hand, as Quentin noted below, all existing OP1 devices=20
> > seem
> > to run just fine, and there won't be any more entering the kernel.
>=20
> Hmm, why can't we add more OP1-based devices?  As I mentioned in my
> earlier response to Quentin, my plan is to implement the board dts
> for OP1-based TinkerBoard 2S, so I'd like to know is there something
> that might prevent that board dts from becoming merged?
>=20
> > So what do we realisitically gain here, except hiding existing=20
> > git-history
> > under another layer?
>=20
> Sorry, I'm not sure what would become hidden by this patch?

When you change a part of the file, a git blame points to you,
hiding the previous blame, so it makes traversing history a tiny
bit harder.

If you're actually doing the Tinkerboard and thus adding new things this
changes the whole judgement a bit too.
Like I was on the mindset-road of rk3399 is mostly done in terms of new
boards, so what's in the kernel now will at max get some new peripherals
but is in general already mostly working.

If we're still adding new rk3399 boards, it does make more sense to go
back and make the underlying parts nicer :-)


Heiko



