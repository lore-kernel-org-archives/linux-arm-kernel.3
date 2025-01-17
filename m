Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A283C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg+SetWFqRed9XCrJetM7sHWQTGMKeHQZW0P/dnItU4=; b=LhPP00eM5mmajyHDEclVRrRQNE
	/cP/WRNYrhm703BCkrPr5xgUv6LLrL6jiesvoqKUcDi/WeeWgpSr8V4VPKbI1lNEUKO/+xDgj2pZJ
	YirGIyltfzKWMPpYdGXMhYY85KIG3RjTe1xqbjjc0o1cIl68CrGabb5WVzRxSa71bg10MdPxP7S9O
	/trepTuEfsHy4xr9D65r6V/cvKP/BADN1dnGrnTFOdnt2q1fabHVKUgpYNoHoO2A08xB4C0MtLa5u
	1LB+/IhLNTsUNtM+bBtHlCN2qNxbu571no7jrx4+qXI9YVx7nSmQB2fkhDq9tYAX+GawpViNIo1g+
	kIYFfEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnVA-00000000Veq-3MOp;
	Fri, 17 Jan 2025 14:39:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnTt-00000000VVd-3F5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 14:37:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04F90A42BCA;
	Fri, 17 Jan 2025 14:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4BDC4CEDD;
	Fri, 17 Jan 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737124672;
	bh=Tg+SetWFqRed9XCrJetM7sHWQTGMKeHQZW0P/dnItU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GktwO+mthOAqo2D/lONvaKSzjp2HcibLrnTszkJtTCBFh43T9V7JepbI088+/jVYr
	 OnM2q/Amst90vijwQoa+p7SzmVHgyb3bPp/p7QKrJYEl7OZbkfMsVYuVc4xmdrCRiT
	 VF6B3pdiTsi1RCEu/e64PkU14SN2B9p+qDnTK5njiF6PdT0JSI/xHk27eYzmKtkL0L
	 0hmTPdZxWr6rO0+eFZBpuY7izGsFRo8jlUfLv49g73cbm0vyczf8cUpdDNJTaejEUp
	 FiGvW+X5W65UenaEpp4Mtbld+4sHHjMRCKB48E+9uPqPvxBPdK0S5WKAwg94BIs5Jn
	 vnKzTKi6t8vgw==
Date: Fri, 17 Jan 2025 15:37:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-bettong-of-radical-prestige-0d81a5@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
 <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dgam3kkeewc5mr2f"
Content-Disposition: inline
In-Reply-To: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_063753_941650_DCD5DCED 
X-CRM114-Status: GOOD (  16.47  )
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


--dgam3kkeewc5mr2f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 03:17:32PM +0100, Sasha Finkelstein wrote:
> On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > I was thinking about using drmm_ here, as the DRM device is also crea=
ted
> > > and destroyed each time. But I might be mistaken here.
> >
> > Ah, right, it makes sense then, thanks!
> > Maxime
>=20
> Not sure i understand. The drm device is created in probe(), and is
> destroyed by devm.

Not really. The reference your driver has on the drm device is given up
by devm. It will be destroyed when the last app will close its fd to the
drm device file.

> I do not see a path where it can be created/destroyed without a trip
> via probe/remove, and so tying the lifetime of the bridge in question
> to devm seems correct?

And while someone has an opened fd, it can still call into the driver
through ioctls, so any KMS-facing resources need to be tied to the life
of the drm device, not its underlying device.

Maxime

--dgam3kkeewc5mr2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4prNQAKCRAnX84Zoj2+
dhwVAYC1HkBz00di/tl/bhJvyHA0BUGUrSGUL30bpdPjubUR9YoA0357NpDKr6cs
fzqAUj4BgJUl/fzSkgqnOFLEkHiohz4oKitUhEGMjGdEYPlG4+Z5uN6IG5GN+C35
9qfOm/2gDw==
=Z3VM
-----END PGP SIGNATURE-----

--dgam3kkeewc5mr2f--

