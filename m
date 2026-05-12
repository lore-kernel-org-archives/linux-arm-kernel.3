Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC3ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCoTCTQ9QeY5v2rxtk4mFU/0h6WzNAdCNvFNNbGqxyU=; b=sOFXPtluHIWDPNz5z2W8kIiyJb
	ZQJPVK1Hc7y/VG543VYE4b/ZaRWGCQYcskdiId9bZfukokfb+fviLwCo74Ml1+mmzPwpg2knTkQfO
	tBZ8UZS8X76bCtzfwkbibkR5jOv2OJGRKrApUqoS1+nqiiFBA5tdMmHXgD2G9Cw/naTORbY3f9dls
	cr7WGxFUSLDXXhbx43h7Bk9fUtm0/ng08r8hf8ZgcdtfXN77CJPc8hyLoKdzfiq6Gmr2shg3I4Ai/
	K/yqnxdvOp1DC8LCMryu0Xhzj+7+VkJR3M0NwS4UgU6UvFv6iQvxpfQwyoOciFwq8Q2RqwOkkvTGG
	FkjomS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnF1-0000000GroM-1G0e;
	Tue, 12 May 2026 13:33:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnEz-0000000GrnH-3PzE;
	Tue, 12 May 2026 13:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6769461338;
	Tue, 12 May 2026 13:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2CAC2BCB0;
	Tue, 12 May 2026 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778592820;
	bh=tCoTCTQ9QeY5v2rxtk4mFU/0h6WzNAdCNvFNNbGqxyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A4+lqBpE04t1qca+VdtmT3sCUPPAsltMG2GlPngcd3brhJvA31inKG15xDUX48nwr
	 YECrTaYY8Soa0fxK7VLLJmMFWqb2r0eW/LGDKyuPLqLPF7IWPGVxh1RLb4Vhaku9IQ
	 L8+zPjWZGQXSbMn9mLaZVrwoLuWdmtRdRYoVkED4IeMwQ6N2W/koIvTs0lzOuT5Xw7
	 4TBPh6j6E+zDk1S6kVDMzouf9PoRBBMTpqlwItGk/wGi4rhBlk329exqLHlfxI9EIH
	 Mdqf4sAbLNMx3AAcpu1hMx/mHuMTy8MGJkIx/xno8IXGEPf00pBamGV05o2NqYQyxK
	 dpOWLojURsZbw==
Date: Tue, 12 May 2026 14:33:25 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Roman Vivchar <rva333@protonmail.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael
 J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
Message-ID: <20260512143325.026b6341@jic23-huawei>
In-Reply-To: <agMI2phk0AQF6QP9@ashevche-desk.local>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
	<20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
	<CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
	<j2uhavC9edilBoD6VJnlz8cCmMPhE9rQavh1epqLk61zrlZ3k1rqlyj8fVYWnkddIY1fEfPk1DfcW09i39hd-Q7I9Y8Vxd0w8C2eCjVGLc4=@protonmail.com>
	<agMI2phk0AQF6QP9@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Tue, 12 May 2026 14:02:50 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, May 12, 2026 at 08:55:44AM +0000, Roman Vivchar wrote:
> > On Tuesday, May 12th, 2026 at 10:05 AM, Andy Shevchenko <andy.shevchenk=
o@gmail.com> wrote: =20
> > > On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
> > > <devnull+rva333.protonmail.com@kernel.org> wrote: =20
>=20
> ...
>=20
> > > > +#include <linux/kernel.h> =20
> > >
> > > No way the driver(s) nowadays use this header. Please, drop it and add
> > > the ones that are really in use (there are missing ones). =20
> >=20
> > Is there a tool or script that can check for IWYU? =20
>=20
> The `iwyu` tool with customised configuration is the closest what we have
> (but quite far from ideal), you can read this thread [2].

For what it is worth the various AI tools don't do badly if you ask
them and Sasiko often comments on this now (running on all of linux-iio)
This series is pending though - might be done tomorrow:
https://sashiko.dev/#/patchset/20260512-mt6323-v2-0-3efcba579e88%40protonma=
il.com

>=20
> > For example,
> > the u32 and s32 types are defined in the asm-generic/int-ll64.h, which
> > is not used by any device driver. Instead, types.h should be used.
> > It's difficult to guess which header to use for a given type/function. =
=20
>=20
> I know. I got this knowledge because:
> - I do a lot of reviews and patches and gathered it from the experience
> - I am the one who reshuffled *some* of the headers
>=20
> > I've tried include-what-you-use [1], but it gives bad results like
> > "add #include <asm-generic/int-ll64.h> // for u32". =20
>=20
> See above.
>=20
> > > > +#include <linux/module.h>
> > > > +#include <linux/nvmem-consumer.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h> =20
> > > =20
> > > > +#include <linux/slab.h> =20
> > >
> > > Is it used? =20
> >=20
> > Yes, without slab.h the __free would complain about missing __free_kfre=
e,
> > which is DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))=
. =20
>=20
> Ah, indeed. I forgot that this is not the part of cleanup.h.
>=20
> ...
>=20
> > 1: https://github.com/include-what-you-use/include-what-you-use =20
> [2]: https://lore.kernel.org/all/20260512073505.1310-1-joshua.crofts1@gma=
il.com/
>=20


