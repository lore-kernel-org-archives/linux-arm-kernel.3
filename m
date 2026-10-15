Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC6CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnnHiNAiW95Nj48NkwkHpodyvcASUuC5OMZdQ+b9tVQ=; b=2hmHnsEX8s1XACgurYmfXE6hyq
	/GMkwdkYdjA6bJp9MRkEify/q3Zowjf5JE8DP3Cvh5mDWuLPWvXqWYxSNtfbNp62OnyBKIZ9lbug6
	sLXzWXzJ15fdgwgy7YmwZRCEc9mCZupgKYiPqXtqP49LfoFgsj7Uh7u0a4dPfk/7WA3ufA54q8oDd
	tbgnd/rJj8043RT1/ttDN5OO5Ga1jDHcr5soUdqiiYDltObNm/+gec6aJ4G+i1UZGD1KK+/LBtnYn
	DJVy9B30qQtzCTFvoUJy/iGzqbZMz8bZGxc6C7uQgoPvzfmMFPrTY+CYy+JLq+rpfhyTdE5GYFnpX
	2gBUJ9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP0Q-00000000xET-0vc3;
	Thu, 15 Oct 2026 17:12:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP0O-00000000xEC-3Vdl;
	Thu, 15 Oct 2026 17:12:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id F313760267;
	Thu, 15 Oct 2026 17:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 29EA31F000C4;
	Thu, 15 Oct 2026 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792084355;
	bh=DnnHiNAiW95Nj48NkwkHpodyvcASUuC5OMZdQ+b9tVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RcjbF0FIpvsaiXOIOFm5HjelbDLthaGxlgh1MkRd9B9iydwN7cX3DoP/00A2gsdYu
	 KTwt1IJHLTERBSYcC4jBXRpSt1hJYFJxzGrFs1+3LDd9vDV1sEL93ZCKXq53LOjTxe
	 RBQ/CBuDkDuQMPYG3ber+DjhfvcOx8ELzKfXplGkHSM05TZD4k2udjhmPz3fjYaP/d
	 ywMVIWcBbzxUeRy/KG+ad8JmqrXemuQzzSs+dIKh3Agsc2afNmhDP4I77XwMov5bFF
	 X68/GXa+mMpxMA51CMJGjCViJAgGOvkpa5yRyOSaGvx19c9AyrEuJBlvS3eB8XtyWf
	 aK+AjYOweSmPg==
Date: Thu, 15 Oct 2026 19:12:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: meson: Convert to waveform API
Message-ID: <atEJA3Tf_-AJL75W@monoceros>
References: <20260717-pwm_meson_convert_to_waveform_api-v1-1-d7dbdae1318d@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2xg6pvfu72f3g5cg"
Content-Disposition: inline
In-Reply-To: <20260717-pwm_meson_convert_to_waveform_api-v1-1-d7dbdae1318d@baylibre.com>
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


--2xg6pvfu72f3g5cg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: meson: Convert to waveform API
MIME-Version: 1.0

Hello Alexandre,

On Fri, Jul 17, 2026 at 09:18:17PM +0200, Alexandre Mergnat wrote:
> The PWM subsystem introduced a new waveform abstraction that
> describes a PWM signal by period length, duty length and duty offset
> instead of period, duty cycle and polarity. The meson driver still
> uses the legacy .apply() and .get_state() callbacks and does not
> implement the waveform callbacks, so consumers cannot use the
> pwm_*_waveform() helper functions with it.
>=20
> Adopt the new API by implementing .round_waveform_tohw(),
> .round_waveform_fromhw(), .read_waveform() and .write_waveform()
> with a private meson_pwm_waveform struct holding the hardware
> representation. The cached channel state fields (rate, hi, lo,
> constant, inverted) are removed; counter values are now computed in
> .round_waveform_tohw() via clk_round_rate() without register writes,
> then committed in .write_waveform().
>=20
> The hardware invert bit places the duty active phase at the end of the
> period on revisions that have it. Input clock rates are kept at or
> below 1 GHz so each counter cycle remains representable in nanoseconds
> by .round_waveform_fromhw(). Requests for which clk_round_rate() cannot
> provide such a rate are rejected. Otherwise, period counts above the
> 16-bit range are clamped, while a zero count is rounded up to one and
> signalled by .round_waveform_tohw() returning 1.
>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

I applied your patch now to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
nexxt

as v7.5-rc1 material (sorry, I was to slow for the upcoming merge
window, I want that patch cook in next for some time).

Thanks for your patience
Uwe

--2xg6pvfu72f3g5cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrRCX4ACgkQj4D7WH0S
/k6TQQf/efb5VXK9xmAkdKGOSO1kf3kZYIB42Ug6bMGMo6wgaCUCsH7FfLY/qvO/
Ltg49fEHW9Ub2pBPnhpSdqb1nPNrF0EvFCyiYxYVS0g4i4CjxnXVCmvaG/PsGzew
ld4gXMse/qsncxe2lpFVGwDmWgx7eAVE1cOv5wN1wLn3l3MBBvWV0MarrqH2FEdC
41AMdjDsXUgNsn8VezVhU5RgUcCp1NU6KPahjVIc51RGlVXmz6qPZLp6k4IQyJIp
84s2qnpgbTx3xa7qvMGNzwVU/OaoIW3jawCFsocyPMM/n5NDpLP7Kz7edGO0wYFA
kzvSf9bTVcWoZibsVu5ZgX3bejw2AA==
=4Kmq
-----END PGP SIGNATURE-----

--2xg6pvfu72f3g5cg--

