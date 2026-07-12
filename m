Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15664C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WRc5d7D7WzeJTab5qtDY3JXeaqsh7qoDA26O08VMAY=; b=jPTwB3ZOwH0rnOzCJmPYjprUPA
	Sc4ep8MJoy4ATWCp6QsAAKpoHw8+GqOt2VoYe41K8Tezh3G3IuiLWcdm/EwLvCNbMM0MASdwrT1Nc
	O3CUbIixtvIy1FKvhafZwF75WGJPNpkZkc+B1quBwsTuiouJaxZAdaKE32yzxd+M0PmfbW4D3s3gc
	StdM8+S7NALW2x4SyvgNJT3rRO3kw4cHTziJju0q+zTAam/jLzZ0kazW+mBiVqzsg7J7H9vuPbGvh
	HqrrL/pVSWwKjpVquaAU7Dx761cRFDisM5YprA20BtrJM/x66NyBFLRbmlCPgVo3eukTPSwSAqgb9
	diPGKfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijCP-00000006zDF-0nth;
	Sun, 12 Jul 2026 01:41:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wijCN-00000006zD4-1r9U;
	Sun, 12 Jul 2026 01:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 058D26136B;
	Sun, 12 Jul 2026 01:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4261F00A3E;
	Sun, 12 Jul 2026 01:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783820496;
	bh=2WRc5d7D7WzeJTab5qtDY3JXeaqsh7qoDA26O08VMAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jxgYtHZqNyIRqvp8Azf5ZzQ/j85EvfVRxpfCT9gHYCyvD6EqicsLtqllsbMSy1tXY
	 rpm7WgMUji4Ffjrmz642e21b1r7+yeQKwcsyj6NN79oYqy+lqo+qF/BA+J6E83HBwV
	 +0tT7mkuaoJ6R73ew8hj4zR5ayt5fo5TXWTO/0Em0RVzs83DJ8ITt8569KH4PsFwT4
	 s60EzCaVlOdiLS/D7UOD8ZFKHe6wICiWLYrwJSRyVdk9ssPn22mUPW9vyLKiVS4Zra
	 F4cmwulAKwNIKaGl+DyoT6nbaEFUJ7gSF+oBfsCH0chWCu7Xpez/Wjnr/NILTMIvgx
	 6He8SSpQAnmxw==
Date: Sun, 12 Jul 2026 02:41:30 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee
 Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ben Grisdale <bengris32@protonmail.ch>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
Message-ID: <20260712024130.7a087d35@jic23-huawei>
In-Reply-To: <KnchjScV7RNnhDi3rI7qqdZSgivkk8WJiQEGWYifNJJjMzzJrEFfZGEuPWSrQisnh_JDj15_CLSLtO2HEjUFe6Jr4wgramAhYwmJjHy6aiw=@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
	<20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com>
	<alChi9oG0-2XUFXK@monoceros>
	<KnchjScV7RNnhDi3rI7qqdZSgivkk8WJiQEGWYifNJJjMzzJrEFfZGEuPWSrQisnh_JDj15_CLSLtO2HEjUFe6Jr4wgramAhYwmJjHy6aiw=@protonmail.com>
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

On Fri, 10 Jul 2026 10:06:05 +0000
Roman Vivchar <rva333@protonmail.com> wrote:

> Hi Uwe,
>=20
> On Friday, July 10th, 2026 at 10:39 AM, Uwe Kleine-K=C3=B6nig <u.kleine-k=
oenig@baylibre.com> wrote:
>=20
> > Hello,
> >
> > On Thu, Jul 09, 2026 at 01:52:48PM +0300, Roman Vivchar via B4 Relay wr=
ote: =20
> > > +#include <linux/mod_devicetable.h> =20
> >
> > Please don't add new users for this header file. Only use those
> > <linux/device-id/*.h> that you actually need (if any).
> > =20
>=20
> Jonathan, since you've already picked up the driver to the iio testing
> tree, would you prefer v6 or a separate patch on top of iio tree?
Yes please.  That will be one less for Uwe or me to do.

J
>=20
> In any case, I will drop the header since it's not needed.
>=20
> Best regards,
> Roman


