Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461EDCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp0YaEHA+Vz07FZCGn4HZFYiAua40SZzSJgjDcDx34I=; b=K7uiX6ZXaHq1oZ6cqPW2FX80O+
	g1nTU2iY+3Gmt1NhnLHNeljN1Ih20YA2aGMhVOt8OXL4ndeL6IQaS6R0mC8ZWWOvAkWCZd5iO7olg
	CRrlqQiehLDBEKvUDvpKS+Aou4KIvtyMaynsqbeJ3mrjPkc6IPUcR2PkDC9GgJo/w/yZ4yGi6ljNl
	m/iuwZyxp+BSSgn+CZw6cNtA7OXLzvQwJTyZYbRv1fkv8p8DBdKb0H/WDyAHIbjtEadBR4erHFewU
	UO/uiLYZwhTAAfxueMjySwU3I3QG9dx5i4yX7Hm/6cz8bSpikao01qJyOw3F96QTTClU8/tU+5RAP
	vaxiJJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZye-00000000Yv8-3SWx;
	Wed, 06 May 2026 10:59:40 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZyc-00000000Ytl-47KB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778065173; x=1778324373;
	bh=Vp0YaEHA+Vz07FZCGn4HZFYiAua40SZzSJgjDcDx34I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EGvbsrKRp1zTJyOrjN5rl3dTlWGFVpAz7bq3iUMc856yy0WajiUiNmBoE98uFZwHb
	 ykdM8CowM5+bdvhIWDGn/bOquMNDH3qQbBNbUNYYcIHks6ZiSyKRAeUST60HSRvX5R
	 IlMYZxq5ha+Wqiwhpy7e9xNrZ3jSD0BIdSKDvFzoG3PvI39J4aXFoIF3zq/WXKsvBH
	 gPaae4kOBbCZUEaxc5fCn+oX6Y2+g+8dn73HAu5zkr5dedRensLsNleyTMlI9B0L+/
	 Y1N1N1tC6rchd1GSkbGloTh1k10xUJGSBmwk1HK1A9n/iqg4Pezkz87lRXumhtE1HT
	 H5LqCYAtGqxlQ==
Date: Wed, 06 May 2026 10:59:29 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 01/13] dt-bindings: iio: adc: add mt6323 PMIC AUXADC
Message-ID: <evJBbJD1B9GjUyj5xyiJVUw-Ufib330tbUxxamM8-e4kJeNlwcENufbYZHdDWb0ZItz1fsEAbDaSFk0ObL4y0zenRr4vA4KOn6IHxuBP4VQ=@protonmail.com>
In-Reply-To: <389917bb-c64c-4ac2-ab8f-b28ab0a89ecb@kernel.org>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com> <20260504-mt6323-v1-1-799b58b355ff@protonmail.com> <389917bb-c64c-4ac2-ab8f-b28ab0a89ecb@kernel.org>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c2fe990d4bbda504abf775e2c63ea9d8db350fca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_035939_172175_974FFBF4 
X-CRM114-Status: GOOD (  10.11  )
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

On Wednesday, May 6th, 2026 at 10:56 AM, Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:

> On 04/05/2026 20:24, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > The MediaTek mt6323 PMIC includes an AUXADC used for battery voltage,
> > temperature, and other internal measurements.
> >

...

> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6323-auxadc
> > +
> > +  "#io-channel-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - "#io-channel-cells"
>=20
>=20
> This is heavily incomplete node... or unnecessarily split. Why it cannot
> be part of parent binding? Or even parent node?
>

The MediaTek mt6359 AUXADC also has a very similar binding. The mt6323
cannot be merged there because it has a different hardware.

Should this go as a child for the mt6397 mfd like mediatek,mt6323-led?
It currently references only mediatek,mt6359-auxadc.yaml, so perhaps
the mt6359 should be merged to the mfd, and then use oneOf for the
compatible property?

Best regards,
Roman

