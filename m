Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE331FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl2CWt7YHq4CVRiW39M9dYA9426AAtJnr6XrWA5BtKQ=; b=OWyhn7ZNdBujPcq+wxzNmdHa7f
	9MhNiZoPMvlg4WHBLd2oKIQJ3BkNgiRiLIZLU9e3Osc0+McrZA5BWGuB8K4BcjKyLPWqc9y3pgg9S
	PyyPMmgjkvUoA48JJf87DgcRY5jyju82B7o/oMvkgjyTobWqjgxaB8k2QSYx7OEVPISwGyLhbxm9v
	1Sgx5SXkyWjwz5w3IF2i8TZhx+mzQ7gdiTRVr5n7G51otPLgZknwAF63DMBNzoIInNn4WNoYceKJ8
	M+iw/huidj1fBgoPeyNmIcIlZksWhxuC5+HLE/+rTKrOQxopNz0vYowmSeFhT15m5fCnJi3AGC7Lt
	crQCrDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGzBx-0000000FZ5I-0mO1;
	Sun, 26 Apr 2026 13:06:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGzBu-0000000FZ4W-29aW;
	Sun, 26 Apr 2026 13:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90BEC4445A;
	Sun, 26 Apr 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85EBC2BCAF;
	Sun, 26 Apr 2026 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777208788;
	bh=F7Ik3qSyzNonPaKu0ttctdmlliVl+oK+J9sKk+2aqjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVPJMv6FIVTpry6AKVRzDTg0KfalajIzBsXsUzu24Cws86nrohzBFJzf+Wv72+kji
	 1HYFrHN3DxmC7Xs+Wwm1ltwpzBkNEpXk7UfJSoXFHpC6J8rJwUh/4FsaDvFaWsrOlv
	 4q+epwJNpg3iN5J+fkC/ODUEgXT2Em79cwYNVxmiEgQf1xWAAxpLBPxQ7ybVGCwrZM
	 ZHT5f56Gnp+plPyy/4XhBg9/+wx8sY/55rPGY9QSRfTNMxlJj1kBffQgB4vs4/oVGE
	 W/oL88hac6IL4KOifWVXTvRoHjEOHpoc8ed692KnHXmbQUIBW+U33CZCQTAZiou/WY
	 7jellAU74+3jQ==
Date: Sun, 26 Apr 2026 15:06:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>, 
	Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
Message-ID: <ae4MCRE_hGJ-VcBQ@monoceros>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
 <4592b323-bebd-4242-ae31-892a51b5b3be@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqdlulvhi33joyyv"
Content-Disposition: inline
In-Reply-To: <4592b323-bebd-4242-ae31-892a51b5b3be@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_060630_615940_169F4812 
X-CRM114-Status: GOOD (  23.12  )
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


--eqdlulvhi33joyyv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
MIME-Version: 1.0

Hello,

first of all thanks for your extensive testing, very appreciated.

On Sun, Apr 26, 2026 at 05:44:46PM +0800, Damon Ding wrote:
> On 4/20/2026 9:52 PM, Nicolas Frattaroli wrote:
> > The Rockchip RK3576 brings with it a new PWM IP, in downstream code
> > referred to as "v4". This new IP is different enough from the previous
> > Rockchip IP that I felt it necessary to add a new driver for it, instead
> > of shoehorning it in the old one.
> >=20
> > Add this new driver, based on the PWM core's waveform APIs. Its platform
> > device is registered by the parent mfpwm driver, from which it also
> > receives a little platform data struct, so that mfpwm can guarantee that
> > all the platform device drivers spread across different subsystems for
> > this specific hardware IP do not interfere with each other.
> >=20
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Tested-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> The continuous mode of all PWM channels has been preliminarily tested
> and verified working on the RK3576 IoT board.
>=20
> I have tested with several typical period and duty cycle configurations.
>=20
> Following Uwe's suggestion [0], I also tested with libpwm using commands
> similar to the following:
>=20
> ./pwmset -c 0 -p 0 -P 1000000 -D 500000 -s 5000

This one is good if you have an oscilloscope (or something similar) to
verify the output. Without that (or additionally) pwmtestperf creates a
series of requests that in combination with PWM_DEBUG should uncover
rounding errors in the .tohw and .fromhw callbacks.

A good set of calls then is:

	pwmtestperf -p ... -c ... -P 50000 -S1
	pwmtestperf -p ... -c ... -P 50000 -S1 -I

	pwmtestperf -p ... -c ... -P 50000 -S-1
	pwmtestperf -p ... -c ... -P 50000 -S-1 -I

(Assuming that 50000 is a sensible period for the device under test.)

And yes, I know, I need to document that using something more permanent
than a mailing list post.

Best regards
Uwe

--eqdlulvhi33joyyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnuDccACgkQj4D7WH0S
/k514AgAoS8CgfuXs5XqIUpaG6DUWC9TEK90N9rTPcFI3q1Wfki2g130cEx3h+HQ
URD/O3wMAg5buTbtEJCYFaecSEVEYsQdyOCd1rOmNCOJRhGSNkWTfcz+LTeSwbb/
HZkA4FKcd5bn/KSJ0lymXx60zgeOZDCLkz2hOBIOK/wNm9oIJ3nBbHFU+4K3nhBf
bU0jUkFPgxIq6i8rCb/sewIqpTo0/dAME5F1/ELNCsFhZpACwDZXmCn7xdd4/J4i
wAZwp5rZWex9L8lIoSM6O0ue72lrrPBdxeMA1DlWeD1u9FV9o5NYFIGUuL8Vrum7
3KLGPiD/nTpf9LY7Ns5EfDcuKPeJ7w==
=zN39
-----END PGP SIGNATURE-----

--eqdlulvhi33joyyv--

