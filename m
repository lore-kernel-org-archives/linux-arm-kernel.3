Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51934CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/gjY+tiP6Q990ZKxbsr2C9qQXKBuiCDXC4VdCYZdiw=; b=xxmupd0hJOj4zYoURS2wcjAJmy
	W2YhKnk0KVn68AyOGGfQVc+5etBB2+Ty3X2c5pMNzEjLlaIL7HOhg0iKkbPQPy3fmPrTejrNpmJqu
	HR7vEq2FX3Xbuo/QPdSmvL55a5E6nwnoTY+PdnE/bxTVrGpc9sC3MSU+i+um+UckDyzZPTphH8t/q
	LWfPpqJCzOHT+ZqppfTuhawwwht1b9YtvJiRicg7fCdG00D4uXYg6UtcRKqv3lujMO+SrPDaQ03HO
	qzY/r6fctO+Eo/OUz7yNkYKkzKDb3L+LZOX9TyJOhWF+S5QQgCD2NnIKYGZzLcLL8jbBUggwY9LnC
	mck1zf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBv-0000000Euyt-3rZq;
	Mon, 15 Jun 2026 22:54:03 +0000
Received: from mail-10698.protonmail.ch ([79.135.106.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBs-0000000Euup-2bGE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 22:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1781564035; x=1781823235;
	bh=r/gjY+tiP6Q990ZKxbsr2C9qQXKBuiCDXC4VdCYZdiw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=N1NMtcJH8qaIp8aWHopwJAMhIp+0afBCHYBGMk1a7yNPPFvH0IUD+E0lg82PbCXAC
	 lDn2yefILSBfBN0V2abnmi67D+yvj1/BeTlEdmFEgxNmP2iSNuTlNYLvQqIx1Bg996
	 Ippdqv0SzLJsyHMzRos2tau8AcLSLHmKqF4stSRwvHqVTH/1onJH9LpwN0iM/gNGmc
	 +CCZyZvKzNSJuKGH8rXX/0/Aerthe3tDhExEHbxVpJfOh4X2xbAsZsjR2YLabxSpJv
	 MvYvgFR94+smSVXBrEdE4ltvU6WhRddiRIipZgLjpg2Mr+qi/KduIcrPmMJxhfen+I
	 hYH6F7VeumdVA==
Date: Mon, 15 Jun 2026 22:52:57 +0000
To: Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
Message-ID: <E5H72l1Cg-JQGpaYAFl5TIyITmghqMsTaHQTR8VkuFtlzmfCGTpVlceNp8c2BDW7UoheO0Fx6NLJHmu56WHRNWdPNLsaoIKMCftj_bnyvEI=@protonmail.com>
In-Reply-To: <20260614182214.65d052e4@jic23-huawei>
References: <20260609-mt6323-adc-v2-0-aa93a22309f9@protonmail.com> <20260609-mt6323-adc-v2-2-aa93a22309f9@protonmail.com> <20260614182214.65d052e4@jic23-huawei>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c61ec01342be96adbdf14dac7b7b7d5c99c1cee8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_155400_823794_C13C0731 
X-CRM114-Status: GOOD (  24.98  )
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

Hi Jonathan,

On Sunday, June 14th, 2026 at 8:22 PM, Jonathan Cameron <jic23@kernel.org> =
wrote:
> On Tue, 09 Jun 2026 16:31:59 +0300
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:

...
=20
> > +
> > +#define MTK_PMIC_IIO_CHAN(_name, _chan, _addr)                  \
> > +{                                                               \
> > +=09.type =3D IIO_VOLTAGE,                                    \
> > +=09.indexed =3D 1,                                           \
> > +=09.channel =3D _chan,                                       \
> > +=09.address =3D _addr,                                       \
> > +=09.datasheet_name =3D __stringify(_name),                   \
> > +=09.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |          \
> > +=09=09=09      BIT(IIO_CHAN_INFO_SCALE),         \
> > +}
> > +
> > +static const struct iio_chan_spec mt6323_auxadc_channels[] =3D {
> > +=09MTK_PMIC_IIO_CHAN(baton2,    MT6323_AUXADC_BATON2,    MT6323_AUXADC=
_ADC6),
> > +=09MTK_PMIC_IIO_CHAN(ch6,       MT6323_AUXADC_CH6,       MT6323_AUXADC=
_ADC11),
> > +=09MTK_PMIC_IIO_CHAN(bat_temp,  MT6323_AUXADC_BAT_TEMP,  MT6323_AUXADC=
_ADC5),
>=20
> Reasonable query from Sashiko on why temperature channels are presented a=
s voltages.
> If for some reason that is the right choice, then maybe a comment here.

mt6323 ADC always returns voltage. The thermal driver (which was in the
previous series and will be sent later) is required to map these to the
actual temperature. Ack.

...

> > +/*
> > + * The MediaTek MT6323 (as well as a lot of other PMICs) has the follo=
wing hierarchy:
> > + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> > + *
> > + * Therefore, PWRAP regmap should be obtained using dev->parent->paren=
t.
> > + */
> > +struct mt6323_auxadc {
> > +=09struct regmap *regmap;
> > +=09struct mutex lock;
> Locks should always have a comment on what data they are protecting.
> I think this one is about protecting the state of a device during a chann=
el read
> by serializing those reads.

Nuno said kerneldoc looks unnecessary on v1 [1]. How the comment should
look?

...

> > +static int mt6323_auxadc_request(struct mt6323_auxadc *auxadc,
> > +=09=09=09=09 unsigned long channel)
> > +{
> > +=09struct regmap *map =3D auxadc->regmap;
> > +=09int ret;
> > +
> > +=09ret =3D regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF=
_EN);
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
>=20
> I'm not sure whether the sashiko question on this is valid or not. Make s=
ure to take
> a look.
>=20
> https://sashiko.dev/#/patchset/20260609-mt6323-adc-v2-0-aa93a22309f9%40pr=
otonmail.com
> You may have carefully selected the numbering so the channel numbering ma=
tches
> the bits in this register.  If so, it is probably worth a comment in the =
header
> to provide a cross reference.  No idea if Sashiko will notice that, but a=
t least
> humans should!

The hardware is pretty weird, but dt-bindings have correct numbers.
I have double checked with the vendor driver and the logic is the same.

'If regmap_set_bits() fails to set MT6323_AUXADC_CON22, does this leave the
AUXADC voltage buffer (VBUF) permanently enabled?' - if this happens,
then there's something really wrong with PWRAP and disabling VBUF may
not be possible. Same about the 'mt6323_auxadc_release' comment.

...

> > +=09case IIO_CHAN_INFO_RAW:
>=20
> What Andy suggested here is the preferred path in IIO at least.
> Mainly because it reduced indent without hurting readability.
> Just be careful to define the scope with { }

Ack.

>=20
>=20
> > +=09=09scoped_guard(mutex, &auxadc->lock) {
> > +=09=09=09ret =3D mt6323_auxadc_prepare_channel(auxadc);
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
> > +
> > +=09=09=09ret =3D mt6323_auxadc_request(auxadc, chan->channel);
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
> > +
> > +=09=09=09/* Hardware limitation: the AUXADC needs a delay to become re=
ady. */
> > +=09=09=09fsleep(300);
> > +
> > +=09=09=09ret =3D mt6323_auxadc_read(auxadc, chan, val);
> > +
> > +=09=09=09if (mt6323_auxadc_release(auxadc, chan->channel))
> > +=09=09=09=09dev_err(&indio_dev->dev,
> > +=09=09=09=09=09"failed to release channel %d\n", chan->channel);
> > +
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
> > +=09=09}
> > +=09=09return IIO_VAL_INT;
> > +=09default:
> > +=09=09return -EINVAL;
> > +=09}
> > +}
>=20
>=20

After these changes, should I keep or drop Andy's Reviewed-by?

[1]: https://lore.kernel.org/linux-iio/2df4cad5e29fbcb4c5c5f59ea0bf322c7a30=
1bdc.camel@gmail.com/

Best regards,
Roman

