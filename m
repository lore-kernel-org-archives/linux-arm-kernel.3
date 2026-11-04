Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F98606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=35YiRhjr;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Bw3v76YO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0ItBfrW6T5nMzkdXKiGCSfuf/xa8iYQADg+BPBvetAo=; b=35YiRhjrwNB/ge
	2PGaqS3auoZonjqrfgIGLdNdJhnLLmFfSRK0PjQW7h8EgncLRHgekVB7QcDBdF+xePgLmVWHT7pPa
	g5WovQsiDEpUMql+P7Zq37RMnnr/ucMafQmjQiDLOB3cPfncxRMDfRCsHZrbffcBYmusRLM4p3kpd
	6a8DkierczMr2Y7c930IQ7n02XZE8SbLPrCDfaQoDgoajP90ZO+xvNkesmIxqZEXyYMYYe29hKzho
	35USs3hqK3Pt/jaGlzzdRvQ3teZr197Ul+RyfFx5IQUbZ2GGml2b0rIveLZeLuuz43IZLpQPR4pAJ
	ueShPAv0F6JDraxAGumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOjC-00000003zd4-14Ms;
	Wed, 04 Nov 2026 00:19:46 +0000
Received: from mail-24425.protonmail.ch ([109.224.244.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOj9-00000003zcL-2Sta
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 00:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793751580; x=1794010780;
	bh=0ItBfrW6T5nMzkdXKiGCSfuf/xa8iYQADg+BPBvetAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bw3v76YOeHVBXomTxUM6r4KQxj9sxxCabXk4DTZ4GJjJlxwMALjZVyRYJr5lXMaBy
	 qn9g+Drfh5D0NaRsPUGsYOX6A5rHIrUCZDljNucwpYmjXW17imU+EUesg3S0PcJ3yK
	 Lt5+JK7i1eLSQcXEXqEK+CLC72oNUS0xNpeqfB0C6xKPWXOX/0Jf5wNbWlu7E+QIUU
	 8YORn1GSGU8N/irpk5orYXH50aOSTPH5VXmG2Zj3lFPpfSxUbRm/1tmdnLt+ytxHzr
	 SO24zDIcvwyUBXbJuKc8uSU9Yn0jGvRotoH+ad5W6OaTxjAVrTwas69uYw9WnNrOzR
	 GwHwE268CkwdA==
Date: Wed, 04 Nov 2026 00:19:33 +0000
To: Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] iio: adc: mt6359-auxadc: mask conversion ready bit in mt6358_read_imp
Message-ID: <hAkgxe6jt5EJW-8bHBs53r3CWCxKxjjzGm6u-l-RzYaGedsBunJrv8nOB48zDSLaMD_jJqtC1Xt1wlz0zDdGF28li-clCdIjUzE9xSbh7Hk=@protonmail.com>
In-Reply-To: <20261103234540.46cc8c1b@jic23-hlaptop>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com> <20261103-6768-6358-fixes-v1-2-2a868a33152b@protonmail.com> <20261103234540.46cc8c1b@jic23-hlaptop>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: c9cf3f3a78a2e0e449b8377418b2a0c862befc67
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_161943_806397_F4888C5A 
X-CRM114-Status: GOOD (  19.08  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, November 4th, 2026 at 1:45 AM, Jonathan Cameron <jic23@kernel=
.org> wrote:

> On Tue, 03 Nov 2026 18:32:08 +0200
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:
>=20
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > In mt6358_read_imp() the raw ADC value is returned directly without
> > masking out ready bit, resulting in incorrect battery voltage reporting=
.
>=20
> Can you add where the ready bit is.  That might help someone
> looking at wrong values and wondering if this is what is causing them.

It's at the end of mt6359_auxadc_read_adc() function, which is included in
the commit message. Do you mean include the code part too?
"*out =3D val & GENMASK(chan->scan_type.realbits - 1, 0);"

> This one is pretty glaring as bugs go (given I think this means the
> top bit is set?) so any reason it wasn't obvious to anyone testing
> this device?

I can't really tell if the driver was properly tested. As far as I understa=
nd,
Chromebook devices use some embedded controller, which likely manages this
kind of stuff without PMIC ADC. There's no in-tree mobile SoCs with mt6357,
6358 or 6359, nor fuel gauge or thermal drivers (yet), so maybe that's why.

> Jonathan
>=20
>=20
> >
> > Apply the mask to strip the ready bit, matching the behavior in
> > mt6359_auxadc_read_adc() function.
> >
> > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Aux=
iliary ADC")
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >  drivers/iio/adc/mt6359-auxadc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-a=
uxadc.c
> > index 951d236f972b..09432d0974cf 100644
> > --- a/drivers/iio/adc/mt6359-auxadc.c
> > +++ b/drivers/iio/adc/mt6359-auxadc.c
> > @@ -502,7 +502,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *ad=
c_dev,
> >  =09mt6358_stop_imp_conv(adc_dev);
> >
> >  =09if (vbat)
> > -=09=09*vbat =3D val_v;
> > +=09=09*vbat =3D val_v & GENMASK(chan->scan_type.realbits - 1, 0);
> >  =09if (ibat)
> >  =09=09*ibat =3D 0;
> >
> >
>=20
>

