Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57584E74AD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pSIsk5G4SUKk2AJgYjKxyvzzViIwm3ULz2jA8S3E0w=; b=Ac0b6FhyTpWre/f0vtXXcd9cpC
	IgYIGKfjEL6HMIVXa9vq+xV3UPB9arJ1xTGBqJxOvrW8Uvv0tHEkOXn2JP9NVifHn6dF32waBLDDw
	9Wa+0pQK03YfE7+Fz/70ifKi4XMSJbpgYSH1BjkUb/SONwHE8yhxqHiWKxEmMlsU2EFwgIOyNDB93
	Lcx3uyRLxngcMIIfWLi1hI/dWoJKBUv/x3c2ddoJzvAubkjBHuUf/e/rmUC0CUAKPBbTIIec09iEL
	U+2typ4qMxD05pT1S8/YqHDSYbzMbGMQGh88f+Yzv+S/hLnN2h0scuCqllw2d9sKNw8hPl5CdyolP
	FkotlwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZKJ-0000000Abml-1X7P;
	Tue, 03 Dec 2024 20:16:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZJH-0000000AbXf-37a0;
	Tue, 03 Dec 2024 20:15:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30A635C4CC7;
	Tue,  3 Dec 2024 20:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8EAC4CECF;
	Tue,  3 Dec 2024 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733256950;
	bh=nMvRbDWGMoteA80rhU5gF6aGUXcgXYmz/KEKmev1qRA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GUeTdkSLrwwtpyDCutlSLaSNwL8dR367APMpqZqPyfH3v/nlyyLuK9nBuPyt9fLpu
	 HQJD85FLhiZRRnTI6wXi1nAOb7xvv3+OqbOyvsBfQUifI1fP09CNjVbHcgx56Gr7aM
	 yAvoKaIzF4FTNYnQOa6V5w5ZtiDstQ1MOpJbh+ypN+thSBz2oNsALoV04wWwDjUr1n
	 YilVlZuqpC9iKY5gbA1uAfwPMv9WgZo3FZQxwdyDnaGQV97BIE1xfwa+KHB8GFtdCU
	 RRyRl8BqPN+ke4DNCi+84xlzhKPcV3INbqUrQHxiuDuNM9z/bnM4VYrnCiATJr0AIO
	 pMeOWhOwA+OVw==
Message-ID: <37b656cc8272552ba07c93c5a9a59641.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com> <f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com> <1j4j3r32ld.fsf@starbuckisacylon.baylibre.com> <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> <1jy1131kxz.fsf@starbuckisacylon.baylibre.com> <c06317c6-b2b2-4b6d-96e4-0c2cfc6846de@app.fastmail.com> <1jplmf1jqa.fsf@starbuckisacylon.baylibre.com> <ce67e512-a15b-4482-8194-b917096f4eeb@app.fastmail.com> <df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org> <1jr06pkof6.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
From: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 03 Dec 2024 12:15:48 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_121551_863308_29F20A72 
X-CRM114-Status: GOOD (  25.77  )
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

Quoting Jerome Brunet (2024-12-03 03:15:41)
> On Mon 02 Dec 2024 at 18:53, Stephen Boyd <sboyd@kernel.org> wrote:
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
> > do anything besides select AUXILIARY_BUS.
>=20
> I think this is fairly close to what I proposed in the inital RFC, but
> generic instead of specific.

Ok :-/ I've realized that we need this sort of approach in more places
to logically split the device without making it SoC specific. It's only
useful to have the registration API live in the driver when we need to
call functions provided by that module from the driver registering the
auxiliary device.

>=20
> I suspect the the generic path is likely to trigger more discussion.
> I'd like to be able to finish this migration, instead of leaving half
> finished like it is now.

Is the half finished migration a problem for this cycle? I was intending
to send the revert later this week and try again next cycle.

>=20
> May I add back the boiler plate code in drivers/clk/meson, similar to
> what was proposed in the RFC [1] and propose the generic implementation
> in parallel ? It will just be a matter of switching when/if it is approve=
d.

Sure. You can make devm_meson_clk_rst_aux_register() use the same
signature as I proposed above so that it's a one line patch later. And
definitely drop the imply RESET_MESON and depends on REGMAP part. Maybe
you can put it in the clkc-utils file?

