Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A0CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkBQfJ5TxwQinnF2S5Nb1OwyL2FsUW+lAQB1x+AgnVc=; b=DA1Gi520mOcEWC9EStPzzNBTWW
	eIX+4rp5U2Ghp2jmroj3tSF0lHG8KAE5y5nXObtqr7K31ZSRJsNFO3g0mxmgMD5f6y/GwbDI/iaWr
	vQpeuLFWD2/V/9RsZrvsGuuWF/vOb1D0qH98BhmbAduNDLkN4DhQ9hzIIWpcpmUkKXQqh1AH6h+c7
	2VMynRcQYUm8B8Qtga0f7VDyuuc7gMRJ33tynGvJ/znHkHszJxqRM1h5FZehtQEmh6KxhKnsFqbKB
	JQjbDEUmMp8ds6oTA+pu9FMqutSWylxXSZ9Vr/Dm0Tl/fqVG0dovEgHl1RLROOl61NLDtakMn0oeB
	YqPszYgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGRr-0000000Evcd-3E28;
	Mon, 15 Jun 2026 23:10:31 +0000
Received: from mail-24428.protonmail.ch ([109.224.244.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGRp-0000000EvcF-0EOg;
	Mon, 15 Jun 2026 23:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781565025; x=1781824225;
	bh=HkBQfJ5TxwQinnF2S5Nb1OwyL2FsUW+lAQB1x+AgnVc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ihtlWpy52uFD/PcKYtX0bwhDVrPMOQVTrn4j23/qRLTnFvUE9KEr3rvvYRkmFIBzS
	 U5ZD8uxPvPZoogWGtS4pEY5TH60k6pe2kWDytm7X4u2Y3qfkYTV0NseUbTYiwzG/K7
	 g4PbtS46MUk9J6kXchKsNYhOeDPb8QDXdVcqUxiGsKUqz45zU99mpOEUDNji2KNRlP
	 g2eJAxBAMMTkoA5EhBWCppM9hIwqi5MXNHf5wTjhTuH4oWXysMPeMtxn7Iu5vyzGoJ
	 ZuIR7HHXvovo2Dh2PCgSz8px0MFus0qO9141fKTQo6sh+OE2C1v7BUR3uRdZ+5duXO
	 mFAA8E4dzBNXw==
Date: Mon, 15 Jun 2026 23:10:20 +0000
To: Lee Jones <lee@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Message-ID: <ycj3k-vV_tQv6u9OfCTP9G9kkeeE-_dbzg_oeHPXn2pb1oZe_Sa1BH6GUGuSd_gD6uPSJiTX7tz6MTlFcqGdWX-f3GMfyW2sLgAOCw6YeNE=@protonmail.com>
In-Reply-To: <20260611163748.GB1212816@google.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com> <20260602-mt6323-adc-v1-3-68ec737508ee@protonmail.com> <20260611163748.GB1212816@google.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 182c5d52f74017e86f4085f21809f8879f8a1b6b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_161029_257505_4F9B78DF 
X-CRM114-Status: GOOD (  19.30  )
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

Hi Lee,

On Thursday, June 11th, 2026 at 7:37 PM, Lee Jones <lee@kernel.org> wrote:
> Interesting.  Has this been considered?
>=20
> /* Sashiko Automation: Issues Found (1 Findings) */
>=20
> On Tue, 02 Jun 2026, Roman Vivchar via B4 Relay wrote:
>=20
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
> > devices array to allow the corresponding driver to probe using compatib=
le
> > string.
> >
> > Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2n=
d Generation)
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >  drivers/mfd/mt6397-core.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 3e58d0764c7e..013b0857fb54 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[=
] =3D {
> >
> >  static const struct mfd_cell mt6323_devs[] =3D {
> >  =09{
> > +=09=09.name =3D "mt6323-auxadc",
> > +=09=09.of_compatible =3D "mediatek,mt6323-auxadc",
>=20
> [Severity: High]
> Does adding this compatible string expose an unhandled edge case in the
> auxadc driver?
>=20
> If this device is instantiated directly from a Device Tree without an MFD
> parent (e.g., at the DT root), dev->parent could be the platform bus
> (which has a NULL parent) or NULL itself.
>=20
> Looking at mt6323_auxadc_probe() in drivers/iio/adc/mt6323-auxadc.c:
>=20
>     regmap =3D dev_get_regmap(dev->parent->parent, NULL);
>=20
> Could blindly dereferencing dev->parent->parent here, or passing a NULL
> device to dev_get_regmap() (which calls devres_find()), result in a
> kernel oops if probed as a root node?

This is intended behavior, ADC always should be probed as a child of
the mt6323 MFD because it doesn't have own MMIO space. Otherwise the
devicetree is malformed. Recent mt6359 ADC driver has same thing with
dev->parent->parent regmap.

Best regards,
Roman

