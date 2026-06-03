Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A85CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P45qutj83EPuBcxc7lV8YTtEi6GE80sIlzmJ+HSce+I=; b=B8UddY/Ut0yoF61Ab64IfcrRRE
	Ejn87RYs0YVUugQOsetNm5ap8umWEYxTns/PtQy2Zf8tDj+8NfC8ayFLqVX3S/mDx7jQp+/31zHD2
	HxtkV0/zwV7n+rAzaVQ2Fd5AGrKEJbXujsd4cNPj3lyk7miKKRF/OCmYa5qncDVC4tybFPNp2P+g3
	LidTMWEr5vXrnfRj4naANto3VydBtqIikTdJO4OYRG5cTOIRKwEPSlI1Tlpu5NuSh0uqQI9NP1Zx0
	g9ZfnlV2D3vmE3umFyI3cCidjcpUFCwZqaooVQ6dllLw8xS8rdVI+KmzneneNZyCV+sIEvf1UqvOM
	GP55WPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjiL-0000000EvyV-27OE;
	Wed, 03 Jun 2026 11:24:49 +0000
Received: from mail-24429.protonmail.ch ([109.224.244.29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjiI-0000000Evwu-2ArY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780485882; x=1780745082;
	bh=P45qutj83EPuBcxc7lV8YTtEi6GE80sIlzmJ+HSce+I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MRpgLKYK4k+5y4H94xvCl6mldixarjou5AVOOKQYEqmpdAnG+mmwrV7krO1EWADHv
	 aIWlAxRZZkhxKlNzNIp8edSNuRtsGBAMb8BQ/V4mwEUjIc5rp7M4567lNK2PMvInP4
	 6TnQ/n4H15vzo/wjeOXPTbphLcVQyf0rUIwCEFYOx53sKXri9+aEPkiKnG+ujwAxHx
	 VDQLLeqI+1ZU/lRanp1vRHwQxSENibnLBQLKaKPmvSFXqOdUfSY86KDTPvwQHvVTG3
	 8UzWb8SQ54cbR9n6k0nOWhrEsmn9dUNCCx8j/skIdpm4LaAnk08ID8F4b9p+kJ+1zd
	 QwGCJc5ywhPvQ==
Date: Wed, 03 Jun 2026 11:24:37 +0000
To: =?utf-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
Message-ID: <RRvh9UBBrqdfKoCLaqgfcQ06UY-BSM2hQ0F6F1YkdB2k2RXYMQmlCG4phXk72oGY03t1g1kDI4z-SDeKlYkUv84-AjNLaWK7tDQlpEFQVKk=@protonmail.com>
In-Reply-To: <2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com> <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com> <2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 23b503d43eacd82716b8210413e6edddc9faa175
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_042446_727007_13BF05C3 
X-CRM114-Status: GOOD (  14.40  )
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

Hi Nuno,

On Tuesday, June 2nd, 2026 at 7:42 PM, Nuno S=C3=A1 <noname.nuno@gmail.com>=
 wrote:

> On Tue, 2026-06-02 at 15:46 +0300, Roman Vivchar via B4 Relay wrote:

...

> >
> > +MEDIATEK MT6323 PMIC AUXADC DRIVER
> > +M:=09Roman Vivchar <rva333@protonmail.com>
> > +L:=09linux-iio@vger.kernel.org
> > +L:=09linux-mediatek@lists.infradead.org (moderated for non-subscribers=
)
> > +S:=09Maintained
> > +F:=09drivers/iio/adc/mt6323-auxadc.c
> > +F:=09include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h
>
> The above file was not added in this patch

The header file is added in patch 1 (dt-bindings). Following Krzysztof's
feedback on the previous version, I squashed the MAINTAINERS into this patc=
h.
Please let me know if I misunderstood anything.

...

> > +=09MTK_PMIC_IIO_CHAN(accdet,    MT6323_AUXADC_ACCDET,    MT6323_AUXADC=
_ADC7,
> > IIO_VOLTAGE),
> > +};
>
> All of the above are IIO_VOLTAGE. Just remove _ch_type then.

Ack.

> > +
> > +/**
> > + * struct mt6323_auxadc - Main driver structure
> > + * @regmap:        Regmap from PWRAP
> > + * @lock:          Mutex to serialize AUXADC reading vs configuration
> > + *
> > + * The MediaTek MT6323 (as well as a lot of other PMICs) has the follo=
wing
> > hierarchy:
> > + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> > + *
> > + * Therefore, PWRAP regmap should be obtained using dev->parent->paren=
t.
> > + */
>
> The above kerneldoc seems unnecessary to me.

Ack.

...

> > +=09case IIO_CHAN_INFO_RAW:
> > +=09=09scoped_guard(mutex, &auxadc->lock) {
> > +=09=09=09ret =3D mt6323_auxadc_prepare_channel(auxadc);
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
> > +
> > +=09=09=09ret =3D mt6323_auxadc_request(auxadc, chan->channel);
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
> > +
> > +=09=09=09/* Hardware limitation: the AUXADC needs a delay to become
> > ready. */
> > +=09=09=09fsleep(300);
> > +
> > +=09=09=09ret =3D mt6323_auxadc_read(auxadc, chan, val);
> > +=09=09=09if (ret)
> > +=09=09=09=09return ret;
>
> Could be return mt6323_auxadc_read(...)

The mt6323_auxadc_read returns 0, while IIO expects IIO_VAL_INT (defined as=
 1).
Should the mt6323_auxadc_read function return 1 for success?

Best regards,
Roman

