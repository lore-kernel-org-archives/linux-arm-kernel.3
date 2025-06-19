Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9743AC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHc7BspCc4VebX3+yVBmPaBO4Z3SMOpLQiryABMTzXg=; b=nt4EOQHsZYuXRr+UikmQaBHgUR
	e9wgf1CUiK4bmK4Yjh7UUZYwfKudihihRNkjudDoTD26Rx0bU0Anoy5lGiCTRpKi8bm9F57+iwi9d
	daS09bQw/LafY53wcP6pAoLgTcw8zQw1uB4IaSItb1OxeHMS6V2s5ESaCIfcIR+vL++FBlW3q2uTF
	TDzqcip2vkoB7thrwgbjKvl7ymxfUKk6uWojWd78po2F5kebABqVxQ6FEoyCQ18WRdEkiB9xlWNnb
	LfI3853ubg66lo846lqZi1BaBOdwtVsmg4MkVNjJb6FedoYWsjJg70LBUG6VsNCd9/TZ1mXrkn8UB
	0N84h8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDTu-0000000CsqC-0uyL;
	Thu, 19 Jun 2025 11:30:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCYX-0000000Cl2P-43zT;
	Thu, 19 Jun 2025 10:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uHc7BspCc4VebX3+yVBmPaBO4Z3SMOpLQiryABMTzXg=; b=qhUUmauacre6f0NDbZEh0A209v
	PUSFAm69IOwcfWsONe8VRlmUFter+1RNbipSRBRx8Pkz1eqM7uPExZ/Jv9yT3+3VspkNVZzlc9SDk
	Abq3dkD7mVqK/P0ZUX4fivIyplQ/yR373A/gvQRZfAG28HjumuSX1eAd90imC2PqWw+ivvezsgZFq
	92/1onaEVis29tvgAVcXw2KIhbQ/HZ/kEjC+jIRjRxfMC01VaSuPxNS2zc/M80yqs5HL2xbA7Y22O
	GaeTm8Hek/Gm0+lj59FMeDzKmoSgOLyG/WU2Luea9XKiGkTRohtkk170iYUPznw/y6I/AVZwX13i2
	XMMlbEQw==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSCYS-0008Oq-0k; Thu, 19 Jun 2025 12:31:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel
 description
Date: Thu, 19 Jun 2025 12:31:35 +0200
Message-ID: <5461462.0VBMTVartN@phil>
In-Reply-To: <DAQEX04P5320.CQDU7SL7AV4A@cknow.org>
References: <20250619-dtb_fixes-v2-1-abd711d11b67@bootlin.com>
 <DAQEX04P5320.CQDU7SL7AV4A@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_033142_025645_0B3F361E 
X-CRM114-Status: GOOD (  20.28  )
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

Am Donnerstag, 19. Juni 2025, 11:46:15 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Diederik de Haas:
> Hi,
>=20
> Thanks for working on upstreaming PPP things :-)
>=20
> On Thu Jun 19, 2025 at 7:21 AM CEST, Olivier Benjamin wrote:
> > Fix a few issues in the panel section of the PinePhone Pro DTS:
> >   - add the second part of the Himax HX8394 LCD panel controller
> >     compatible
> >   - as proposed by Diederik de Haas, reuse the mipi_out and ports
> >     definitions from rk3399-base.dtsi instead of redefining them
> >   - add a pinctrl for the LCD_RST signal for LCD1, derived from
> >     LCD1_RST, which is on GPIO4_D1, as documented on pages 11
> >     and 16 of the PinePhone Pro schematic
> >
> > Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>

> > +	lcd {
> > +		lcd_reset_pin: reset-pin {
>=20
> I don't know if there's a 'hard rule' for it, but I'd recommend to use
> ``lcd1_rst_pin: lcd1-rst-pin {`` as that would match the naming from
> the schematics. I realize that some but not all (other) pinctrl nodes
> follow that 'rule', but it helps with traceability.

not a "hard" rule, but a strong preference.
I.e. we want people to ideally be able to just hit search in the
schematics PDFs for the name they saw in the devicetree.

Sometimes that is not possible, because of naming conventions or
overly strange schematic-names ... and sometimes things slip through
as well.

But following the schematic names, is the general goal.


If this stays the only suggestion though, I can fix that when
applying. Or you can send a v3 - up to you :-)


Heiko


>=20
> > +			rockchip,pins =3D <4 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> >  	leds {
> >  		red_led_pin: red-led-pin {
> >  			rockchip,pins =3D <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
>=20
> Otherwise,
>=20
> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
>=20
> Cheers,
>   Diederik
>=20





