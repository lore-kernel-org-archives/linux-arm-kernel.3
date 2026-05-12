Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F4CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkOaXzKPMuxC5YGc6fREz2IvVZ152n0pdW2k9zoo3oc=; b=UCPyE8sB0TjyA7z/MVVoegbp7T
	lL9i7wkDBRkk3SG3izj4eZ3k5Pbgjclxygk2XviuvC1NH0iQ6J+ShrVri0auqySz3hYQl+e1f0B57
	AGo6kOBnTSSBgz44JUYweK822avpY2wRmnqfzepXs/H5I5Tduf+3MIUXji8ljruGT/yYMyJ1U38po
	r8jwxRierlxajJBZp8FIp+VjvPeucztsodgiXVm+YYGpotzD+BsPWdvpFPYGfs3p45ycF9ryYWlHE
	btaakPnsN/NEQYTgGW9XRxOAOEgHtSWBc6s/83QjQF8zPDzhcYqwx25UH2bWQLyGxxgXNDwCVop9U
	RmH5hGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiuX-0000000GAC4-3Qfv;
	Tue, 12 May 2026 08:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiuV-0000000GABJ-2rOK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 08:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WkOaXzKPMuxC5YGc6fREz2IvVZ152n0pdW2k9zoo3oc=; b=OJF/ilO3zEZe5P8n6Ome/RcZTx
	wlHABT8K75934rgOHkU7hSbz2AJf92kS99LR+op/bV9CDX/pHJMUWP7Ugekp1mecR+zibcACmwi+7
	7LEv+VMnBj/+W/JYAwSWdryR+e/Crlzairj3gsZpoq30zqlgX0Vc4VjoMzhNkueKKK4TmEqaonPbm
	CMZGaTMbjrV2Mdxer9Gldhrf7SuCPfX8PCGLwTxSahO7GTvzOI2a3T30ean/9+Xo5WE/lNwNmc/UC
	NdmzWZF7qC+ylXPBk3m3zp/4KxeMSj5i3V7e/ay4bYMr+3Ajbo8H6zIb1LxrXwViOz29XqQqQJ6QZ
	rWuun/4g==;
Received: from mail-10697.protonmail.ch ([79.135.106.97])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiuI-0000000EAHk-0NME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778576151; x=1778835351;
	bh=WkOaXzKPMuxC5YGc6fREz2IvVZ152n0pdW2k9zoo3oc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=u3/+/i0kg2rBQhVXxJemYSUcFAGCTQQ5eoCfvqgeXVzweKsu9dyDZqh1kHcAT5SEY
	 mQ+DTe+TrXX/uL/DZc3SyZ38hw2gO7HNpiFSj7TD7Ehq+pYyzxurFV0HjjLtu1eNTl
	 zrEeGMKk5pPvFwKkLtIVxUzMgdCgcNofjtO6D1gElCGO1lVHG7UNzUyJ+hAhDhYHfR
	 UpfJlX6JvTnkRYftUjyZpxc/eaBPdcFV9B6BmBDUbi0E7mx0pXKK+uZuOCkVYSWg6P
	 eS5OQmKBJPZMQrY0w+r996i5NkPtz0X/7ppBiM8aATXs99rfikyPazuN2FL/Jb3G/h
	 Eqn06hkG1gDlg==
Date: Tue, 12 May 2026 08:55:44 +0000
To: Andy Shevchenko <andy.shevchenko@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
Message-ID: <j2uhavC9edilBoD6VJnlz8cCmMPhE9rQavh1epqLk61zrlZ3k1rqlyj8fVYWnkddIY1fEfPk1DfcW09i39hd-Q7I9Y8Vxd0w8C2eCjVGLc4=@protonmail.com>
In-Reply-To: <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-7-3efcba579e88@protonmail.com> <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 981c736e97e4dbd1e20caa42f42d8805c8c23015
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_095602_800551_A7CCCEFD 
X-CRM114-Status: GOOD (  13.52  )
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

On Tuesday, May 12th, 2026 at 10:05 AM, Andy Shevchenko <andy.shevchenko@gm=
ail.com> wrote:

> On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
> <devnull+rva333.protonmail.com@kernel.org> wrote:

...

> > +#include <linux/kernel.h>
>
> No way the driver(s) nowadays use this header. Please, drop it and add
> the ones that are really in use (there are missing ones).

Is there a tool or script that can check for IWYU? For example,
the u32 and s32 types are defined in the asm-generic/int-ll64.h, which
is not used by any device driver. Instead, types.h should be used.
It's difficult to guess which header to use for a given type/function.

I've tried include-what-you-use [1], but it gives bad results like
"add #include <asm-generic/int-ll64.h> // for u32".

> > +#include <linux/module.h>
> > +#include <linux/nvmem-consumer.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
>
> > +#include <linux/slab.h>
>
> Is it used?

Yes, without slab.h the __free would complain about missing __free_kfree,
which is DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T)).

...

> > +#define MT6323_ADC_VOLTAGE_RANGE       1800
> > +#define MT6323_ADC_RESOLUTION          32768
>
> These two ring a bell with the first code patch. Are they the same?
> Can they be deduplicated?

They can, but I doubt it's worth creating a header just for 2 constants.
It would look too small compared to the other headers in the include/linux/=
iio/adc.

1: https://github.com/include-what-you-use/include-what-you-use

Best regards,
Roman

