Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DE0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnF3aQdkXNx4oU+Fl+i9D15DW8KRXhFLW9FERxBFTB4=; b=e+VSMRxJWkbELQ24lrNBucneX5
	hoOVMPCG1N3rXU/zToITtZ48Ku1BT3ZP0g1rvzPZXWF8zCWraGrRXDE0hXV1I4WniPJFjNqwvg7Ez
	jNNhNrqiaqNLVPmHPcxX4ahCaMp3J6Pg3xU8bHG4eN3T8wNe/EiHNaK7WBzP8AcVop61CvdJtg/NU
	yn5CBycb6Lf5Sx1Tvknm9SvUxvPV7a8WUauoo0WNGB/slO3jZT8r/lmy+RtR5esJ0ivekRLvv9gyi
	gVKyJyn5bbk07Xv8mzhTPZ7rc2rIKxTb/m1yFei4oOE1UpjE6hOqS/8ClJx7Z/zDjJwTR5aj9fRv3
	3g88GF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wton0-0000000EP87-1AAS;
	Tue, 11 Aug 2026 15:53:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtomy-0000000EP7n-1CJh;
	Tue, 11 Aug 2026 15:53:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40FA6600AF;
	Tue, 11 Aug 2026 15:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16171F000E9;
	Tue, 11 Aug 2026 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786463595;
	bh=DnF3aQdkXNx4oU+Fl+i9D15DW8KRXhFLW9FERxBFTB4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AnBX8YUZAaCz4DWFbJVo8gwN0rMr0SQ87izcGiOCA8nKHT0RqjFPMsRZojovf1ARD
	 R5XkNTvGzeFQAU5mg2idWrFbIwVVzAD9RSLBSFdfsCWYwNHz4H+gjbsAPn88kJWRk+
	 wveagclyOQ7huxROaH9sdj2yv6rNO1qXpteNII8BFYSFExL2MDPOcYxWHR7f3mm5LR
	 /jU41Z3dF5zhd1omvwkQVRIy5/zaud7PaVIy3tHMqxf3jNtOXwVGNc/ZXUC3X6uwqq
	 DjWjoFk+g0u02Vd8xPFPyxWH/V95eAmH0jPD/oqP3vkmOrLhHgrclkzlhC5O0382d6
	 uCdkZ/wtPpeJA==
Date: Tue, 11 Aug 2026 08:53:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Vladislav Leonov <vlad@zlab.su>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Aurelien Jarno <aurelien@aurel32.net>, Brian
 Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Daniel
 Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>,
 David Wu <david.wu@rock-chips.com>, Eric Dumazet <edumazet@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner
 <heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Olivia Mackall <olivia@selenic.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 00/25] ARM: rockchip: Add peripheral support for RV1106
Message-ID: <20260811085313.379ac489@kernel.org>
In-Reply-To: <anq1ouUnKA02Eauj@monoceros>
References: <20260810121121.210040-1-vlad@zlab.su>
	<20260810113548.7fd24d56@kernel.org>
	<anq1ouUnKA02Eauj@monoceros>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Tue, 11 Aug 2026 07:43:16 +0200 Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Aug 10, 2026 at 11:35:48AM -0700, Jakub Kicinski wrote:
> > On Mon, 10 Aug 2026 15:10:51 +0300 Vladislav Leonov wrote: =20
> > > Basic support for the Rockchip RV1106/RV1103 SoCs currently under rev=
iew.
> > > This series builds on top of that and enables the peripherals needed =
to
> > > bring up a board beyond a serial console: =20
> >=20
> > Don't expect maintainers to dig out patches for their subsystems
> > from a big series. This is not how upstream development works. =20
>=20
> I see this from time to time and I personally think it's fine to have
> these patches together. Also the only the patch that affects my
> subsystem was Cc:d to me which is how I like it (but I think opinions
> differ on that one, too).
>=20
> `b4 am -P _` is great!

We have automation and CI systems which ignore anything that isn't
scoped to networking to save cost. Not sure if there's a polite way=20
to say this but the smaller the subsystem the more flexibility can=20
be afforded? Let's stick to the existing process, please.

