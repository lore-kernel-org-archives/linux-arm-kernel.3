Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06514CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASWqzKjXrD7GPPPq7eqcATqg6A70mPRmdB4ZyDBwEK0=; b=rGFfOTunQm89Qrj0PAgI++zZdO
	P1eGKOEDa/4ZN5GGQCFCd4FUN4hlI8rJouGu+wMVxDXMk2uaZQqy3h6R7pE+hW2iqml2hBSfoE7Me
	gTqTmyuyaXcNyejyH4+PaNAmxULKgp4hzGdCwnz04DwCoOhKdLQpY/FAMx9yGAb+wFdY0Xs9u1JbQ
	jB48TMpikA4O73FMgIkiUhXOCZd3yiixjOrL/HdGRQtIuN/ZiKy5BDhdcDsNqpkBiIyKpBCpf9k7Q
	V01l+ieepQWi2DLWXVXuYcJbl/AO8MJAGo03M10WkHYL4rtcSzINwor4WMn98kBkT4a1842iJPTrl
	QeWubPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIZq-0000000Gs0J-2GAC;
	Tue, 05 May 2026 16:24:54 +0000
Received: from mail-24427.protonmail.ch ([109.224.244.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIZn-0000000Gryd-3gON
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:24:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1777998287; x=1778257487;
	bh=ASWqzKjXrD7GPPPq7eqcATqg6A70mPRmdB4ZyDBwEK0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M+F3yhx7dJ2rhFSJAZcFeXyevkNolOGRHAyGx9L5V9zEwV48mNW0/j1DxaK2EZV3A
	 sOI77K5RJdv6vOQ4iT0XOz7d7KLFmOkC+jHajqCLIfMwCKTNmoZk26ZlwEiaoyoM9j
	 b0Jm6p/Ff5EtNIHmXiEyFH/VfiVWcUCBVrOwkIFsGzbQoFISKrRmmTf1YBwE6BKG50
	 jEC/Wpla8r4KX6aKV8Ln+iyPz5DRcWZf6WmD+D+yqDdYEw+FuY37PxcYMtVcMYDeHg
	 ZFaIG7dN5yXP2FY+Ojke22qfg31drHoBz2zpt6/kca1w+FzeqPMI0bs85GKPo37cug
	 sJC/bk/aU+nQA==
Date: Tue, 05 May 2026 16:24:41 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH 05/13] nvmem: add mt6323 PMIC EFUSE driver
Message-ID: <Bn1O24yJ2aBvKUTpiFUzxnqbuuybRirR73G7R38ghYtwhFvQqWJb3HPgcikEa1otDw6n07nX_g8khZUHXJ_QRA--LrV5yj5Mcg1QzrWt6vA=@protonmail.com>
In-Reply-To: <afmjfWtt7Vii6xfH@ashevche-desk.local>
References: <20260504-mt6323-v1-0-799b58b355ff@protonmail.com> <20260504-mt6323-v1-5-799b58b355ff@protonmail.com> <afmjfWtt7Vii6xfH@ashevche-desk.local>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 70e68a78b3333f71307d661d5a8c93410d5d2dc7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_092452_072395_281BDA34 
X-CRM114-Status: GOOD (  21.20  )
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

On Tuesday, May 5th, 2026 at 11:00 AM, Andy Shevchenko <andriy.shevchenko@i=
ntel.com> wrote:

> On Mon, May 04, 2026 at 09:24:57PM +0300, Roman Vivchar via B4 Relay wrot=
e:
>=20
> > Add support for the EFUSE controller found in the Mediatek MT6323 PMIC.
> > The MT6323 EFUSE stores 24 bytes of hardware-related data, such as
> > thermal sensor calibration values.
>=20
> Besides below comments, check for the similar issues that previous patche=
s in
> the series have.
>=20
> ...
>=20
> > +#include <linux/device.h>
>=20
> Not needed as platform_device.h implies this ("is this good or bad?" is a
> different story).
>=20
> > +#include <linux/io.h>
> > +#include <linux/mfd/mt6323/registers.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>=20
> Follow IWYU. At least missing types.h.
>=20
> ...
>=20
> > +struct mt6323_efuse {
> > +=09struct regmap *regmap;
> > +};
>=20
> Do you really need a custom wrapper data structure? Can't regmap be used
> directly?
>=20
> ...
>=20
> > +static int mt6323_efuse_read(void *context, unsigned int offset, void =
*val,
> > +=09=09=09     size_t bytes)
> > +{
> > +=09struct mt6323_efuse *efuse =3D context;
> > +=09u32 tmp;
>=20
> > +=09u16 *buf =3D val;
>=20
> Really? CPU order all the time?
>=20
> > +=09int i, ret;
>=20
> Why is 'i' signed?
>=20
> > +=09for (i =3D 0; i < bytes; i +=3D 2) {
>=20
> sizeof()?
>=20
> And since 'i' is used only inside the loop
>=20
> =09for (size_t i =3D 0; i < bytes; i +=3D sizeof(*buf)) {
>=20
> > +=09=09ret =3D regmap_read(efuse->regmap,
> > +=09=09=09=09  MT6323_EFUSE_DOUT_BASE + offset + i, &tmp);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> > +=09=09buf[i / 2] =3D tmp;
> > +=09}
>=20
> + blank line.
>=20
> Isn't this reimplementation of bulk read? Why the latter may not be used?

Yes, but the PWRAP (the regmap which the driver uses) doesn't support read
callback, only reg_read is implemented in the driver.
It hits the map->cache_type =3D=3D REGCACHE_NONE in the regmap_read_raw, an=
d falls
for the !map->read check, so regmap_bulk_read neither the regmap_read_raw
can be used.

Technically the PMIC is not continuous address space, but rather non-MMIO F=
SM,
so it makes sense to not implement the read callback. I guess the custom
implementation is fine then?

All other suggestions will be applied for v2.

>=20
> > +=09return 0;
> > +}
>=20
> ...
>=20
> > +static const struct of_device_id mt6323_efuse_of_match[] =3D {
> > +=09{ .compatible =3D "mediatek,mt6323-efuse" },
> > +=09{ /* sentinel */ },
>=20
> Having trailing comma in the terminator is nonsense. Do we expect anythin=
g
> behind it?
>=20
> > +};
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20
>=20
>

Best regards,
Roman

