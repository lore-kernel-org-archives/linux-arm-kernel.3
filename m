Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C994AE74ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSD7DiwGUZWI4XWGih2YIwr3/NDPM7VlksXYWtIHOg8=; b=kQxgGLtwT/+3Ktr5H6P/pwbOT8
	S5xjL4xjhgILrn1HSuY7sJTFLjQuIdtFiEAJmU6sBb0dYqaXlt/Nc7FvMQJw+jqNWKTZDjrYRTOGc
	AQnKLOMHvsU5HStxo5h6OtH8SQA1DtGE5CaK9vR3ZwX8uTN6B91XGJVeHXzjpjDn55+UOWCGjesOn
	fTZpiWo3Q2bhIotZjgYBD3bkqAz/MQxviafvTyhtT8kJwUoB2IqUsUhQiltNlDIFEw072R9zFNENp
	iz6lZkPMeMYCHXAUawqqXxccRE9G0laVgmH8Vo2jzwksxi9wHljXrWZZDFVDmDt2Qu+Onn4xvCGUx
	1u2pNOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZQN-0000000AcXe-3Fth;
	Tue, 03 Dec 2024 20:23:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZPA-0000000AcKm-1W55;
	Tue, 03 Dec 2024 20:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 217B8A40BBB;
	Tue,  3 Dec 2024 20:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE8D9C4CED6;
	Tue,  3 Dec 2024 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733257315;
	bh=XvHonDC5Zqxszw1JDIsgXnXHPmUro0m9SxjIASwNeoY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pT74FNcNxVkwjB2rO21AYzErpMozWgTU1hTUGLgG4jrT/AT9oTopc+JJA2k5xCnPc
	 QRhKyQxHvSPCH9GpGhlq199vQsqESY27KWU5qxMGQOZuYkYI6IhjUtkNwDS4HyQ9mg
	 iR4NqZ9P7ie3R4/an+2UTmtdLM03G3KE6WPfJxbFMZZk8L6QE7NdFyiBazL+LkBUn8
	 kL9Jx5YT/23Q/+LN2eiZech0HVdiXU9QuDAE0Sa+F93HRf3f9x9bz/k8sk/gwOTAHc
	 hirQL9oa7nLkeOG62oyKY7AWwzd/zUnMna4NaWvrFHLS4nLM2hfZatzqVh9ga+JlSi
	 E5MB+w+PEzKGA==
Message-ID: <c9556de589e289cb1d278d41014791a6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0f07300a-8b32-4d3e-a447-b3fe3cf1ca81@app.fastmail.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com> <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com> <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com> <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> <1jy1131kxz.fsf@starbuckisacylon.baylibre.com> <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com> <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org> <0f07300a-8b32-4d3e-a447-b3fe3cf1ca81@app.fastmail.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 03 Dec 2024 12:21:52 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_122156_530677_99D894B8 
X-CRM114-Status: GOOD (  29.95  )
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

Quoting Arnd Bergmann (2024-12-03 04:43:03)
> On Tue, Dec 3, 2024, at 03:53, Stephen Boyd wrote:
> > Quoting Arnd Bergmann (2024-11-28 07:34:46)
> >> On Thu, Nov 28, 2024, at 16:06, Jerome Brunet wrote:
> >> Stephen, can you please take a look here and see if you
> >> have a better idea for either decoupling the two drivers
> >> enough to avoid the link time dependency, or to reintegrate
> >> the reset controller code into the clk driver and avoid
> >> the complexity?
> >
> > I think the best approach is to add the reset auxilary device with a
> > function that creates the auxiliary device directly by string name and
> > does nothing else. Maybe we can have some helper in the auxiliary
> > layer that does that all for us, because it's quite a bit of boiler
> > plate that we need to write over and over again. Something like:
> >
> >   int devm_auxiliary_device_create(struct device *parent, const char *n=
ame)
> >
> > that does the whole kzalloc() + ida dance that
> > devm_meson_rst_aux_register() is doing today and wraps it all up so that
> > the device is removed when the parent driver unbinds. Then this clk
> > driver can register the reset device with a single call and not need to
> > do anything besides select AUXILIARY_BUS. The regmap can be acquired
> > from the parent device in the auxiliary driver probe with
> > dev_get_regmap(adev->parent).
>=20
> I like the idea. Two questions about the interface:
>=20
>  - should there be a 'void *platform_data' argument anyway?
>    Even if this can be looked up from the parent, it seems
>    useful enough

Sure. Probably that can be added as some variant like
devm_auxiliary_device_create_pdata() when/if it's needed.

>=20
>  - What is the scope of the 'ida' number? My impression was
>    this should be local to one parent device, but I don't
>    know how the number is used in the end, so maybe a global
>    number allocator is sufficient.
>=20

From what I can tell it's only used for the device name and not for
driver matching. That's probably to make it so we don't get conflicts in
sysfs with devices because they all share the same bus. I'd guess that a
global allocator is sufficient.

