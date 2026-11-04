Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D62E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 00:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eWkuUEUx;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=LcTLJLdN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3vylrWaRZ6HTp6CEg2k0KLkoq+UuiUfB7tpMoG7CCXM=; b=eWkuUEUxESCge5
	jriXAOy9imxUrYFu2haFFXc9tPVsXDrNb9dKN7GRyMIg4/seNd8BULphaiHkArvaKhjP9XtnNPjz3
	QMdJvbhQeqtglWx/1k/imQR7z9Xq+28bcPM9/7cqveRxL15xlrtMGEXnU4pPgOo9pXcZq55uCfs6A
	ecoGSUdfdaSuhcGA8TdSTzW60oKP+plszTyzTsHp4aFxQa9B3TMy+a0JyO9Bs66Nw0oy4/RLLqEKW
	MqGwOXnby4fdldT5PChUan2/XaHq9WOCvUym2/CiK0mygCTzGnuwKICFicSFXkS2ZvxKC83094WGv
	ijAOgj+//Pv6zPyWoumg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOaa-00000003zLw-1Z1X;
	Wed, 04 Nov 2026 00:10:52 +0000
Received: from mail-106103.protonmail.ch ([79.135.106.103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOaX-00000003zL2-1rhO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 00:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793751043; x=1794010243;
	bh=3vylrWaRZ6HTp6CEg2k0KLkoq+UuiUfB7tpMoG7CCXM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LcTLJLdN7dls1Eb42LjjU0sljfzej/j0mRoJCoI/JEqpz84Og45n/iAdrYUTB7qG7
	 g4zwCByzoKv14Lg9zt0AEEq+MZ7AXrWsiw2bO47lSaY3F9cMLdb2KF3mrra2drFOcl
	 +RIsuP+9RS5hgnNbCT6DbgLsdNEUrnYeGkDfevYF6tFuuC1uugqvLCCm7i5u6NZaQ+
	 /yNolww2zoiJrn668P4B5LcgdEQNEDrwd2tJbeDdRh+0xUYcD/XQ+e/poKB7QTGEZv
	 iJORxSXjVKAOJfrDjGJSiXAXYNG0ArLRwPuYYH46IQ9RcfJ71dBvuQ2mXwmMoXysPp
	 NHyujTgIkhH8A==
Date: Wed, 04 Nov 2026 00:10:38 +0000
To: Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] iio: adc: mt6359-auxadc: correct channel types to IIO_VOLTAGE
Message-ID: <NgiLKE_H7ipL5Sr4a9BtoD_3Vgwbi2p9ENNExEER_LDALvpVi6rifnVhx_RgWJGljssso5HfyJ6KD61_viHbOnbv5EAQ7HpKZXWy4vsSf5c=@protonmail.com>
In-Reply-To: <20261103234237.0dbbe924@jic23-hlaptop>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com> <20261103-6768-6358-fixes-v1-1-2a868a33152b@protonmail.com> <20261103234237.0dbbe924@jic23-hlaptop>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 301f01c9cbd70ca9bf64fe0e7c75769350a9adc5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_161049_633487_E03AFAC8 
X-CRM114-Status: GOOD (  22.18  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Jonathan,

On Wednesday, November 4th, 2026 at 1:42 AM, Jonathan Cameron <jic23@kernel=
.org> wrote:

> On Tue, 03 Nov 2026 18:32:07 +0200
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:
>=20
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > All mt6357, mt6358, mt6359 and mt6363 declare their channel types as
> > voltage, resistance and temperature. This is wrong, since the PMIC
> > doesn't include any built-in conversion block. It simply measures
> > voltage, while consumers are supposed to convert these readings to
> > the actual temperature or resistance using efuse calibration.
> Hi Roman,
>=20
> Useful to have an example of the consumer that is doing this.

I have sent a PMIC thermal driver in the past for mt6323. I will send
a new version soon, but it will take some time. It should be compatible
with both mt6323 and mt6358, since they use very similar formulas.

>=20
> >
> > Correct all channel types to IIO_VOLTAGE.
> >
> > Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Aux=
iliary ADC")
> > Fixes: d6f49313272b ("iio: adc: mt6359: Add support for MediaTek MT6363=
 PMIC AUXADC")
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
>=20
> This one makes me very nervous, not because it is wrong but rather
> because there may be a bunch of userspace relying on these wrong
> channel types.
>=20
> It is horrible but I think we can't touch that :(  What we can do is
> put the right interface in place as well. Thankfully it looks like
> the channel index is independent of the channel type so we can duplicate
> the wrong channels with voltage ones + some comments to make sure this
> doesn't propagate to any new supported devices.

I believe it's a bug, because all MediaTek PMICs I know can't report
temperature or resistance without consumer. Some channels like battery
voltage were overflowing sysfs, producing garbage result.

> AngeloGioacchino, why did you go with the different channel types?
>=20
> If we do decide to go ahead with this approach, are there other channels
> that are validly using the channel type for non voltage? If not change
> the macro to drop the parameter.

I think mt6359 may be able to report battery current. I can't really tell
though. mt6358 seems to wire current sensing to FGADC, which is separate
block. Perhaps someone from MediaTek or ChromeOS knows more about this.

Best regards,
Roman

