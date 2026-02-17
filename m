Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B531E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuzP1RjH2J93oglEEmMjAhLwguv68kNmitEf4HtcFgE=; b=C831sZQ4DH20I78OO1xwvp2e/e
	Q18Ga6Ptow0CM9G3a+bLK7reevTI/3oJqBbfLefFoCLd6lYFanJln/LO1phTiUnwjDaxx0i7p+T/2
	UO3mniMrf3LGL70E/YlvzkTHOjeWzaVebE+SORzosaw2ApwPa4ZGVFkDl6NUjx3UrYKhH8RW1VQe+
	rOLnN3Uk0c/icjM2h9/7u+0CsnuR3NMV7VuPZej7WWVqi0Q8LXEf6kY/+uj8ZlggDGcD7k9krh8aY
	lGZrSLV1E21bQauneHIO5nZb10EgQmqAh+U8aISBMU4EddS+DelF+62oViQUa2XKSlY7OgFTul8K0
	32skJc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQf2-00000008nnW-1dSI;
	Tue, 17 Feb 2026 19:23:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQf1-00000008nnK-4C6q;
	Tue, 17 Feb 2026 19:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 189A460053;
	Tue, 17 Feb 2026 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297B1C4CEF7;
	Tue, 17 Feb 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771356182;
	bh=AuzP1RjH2J93oglEEmMjAhLwguv68kNmitEf4HtcFgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkvlKQ1sAlkJX0vA8Tfn/Qm6cXriGO4FcK4Iq+24smpf4EOQUndrJZuiEfBUsvDTb
	 8f5oygBZtahKpGeWEtE9ucsZrCF9lp2nOLIPJrr2qGUAYQlxS1ON62M5jFt0LdlJ20
	 m8NrK2gPPqO/16qTZ2SatXHf3a2dTo20wfa+LvXccSrpz+UjlDMi9Z1V68l8Evv9NF
	 GfGTL8E+sRfYbyO9Wkru7Lv3HYqvO1ANbgDyxKXtfwCRSbOX7VJZKA0QyBplFI+i9w
	 kkkKZE3VVU4vbv0aw/OFHK6tZh8BF65PofnAs6fFBBJJt3yIvKPjyhrZPe7o2yrY7Z
	 AZC0uat5+b0Rw==
Date: Tue, 17 Feb 2026 19:22:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2QkDNKpLEvUVJ3W"
Content-Disposition: inline
In-Reply-To: <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
X-Cookie: I'm into SOFTWARE!
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


--r2QkDNKpLEvUVJ3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 10:54:04AM +0100, Luca Ceresoli wrote:

> I'm afraid I just found this commit breaks audio capture on the RK3308.

Can you please send a revert explaining the issue so we can drop the
patch (unless a fix is forthcoming which doesn't seem likely right now,
we can always re-add the support later)?

--r2QkDNKpLEvUVJ3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUwBAACgkQJNaLcl1U
h9Dd2Af9HGtRQCrve806p8Dm1UkaY3VZUZSB8RwkclUugeGfGhNUiOQJuarjCy6n
U5Nh1vijddpOuXxHlFWzj3QXeCLnbnHixhdua3InE577kp6SYrV+B+DQQecLtRHe
jy6zRPH/HsN3147BbqLYuAeAP3Zo+fwGxbhcvkIOUqmergCqBXHTSbRbI8E1C2iW
YaBHlV/HR3J6kAwjKK6a739hGCWzS4D21f3TE5trL/+buFSstLcki67zTBJDnKVZ
z09GrxLYVcmTcILzSUplO0s9kWzfRbbjcdid1OnYH+vyO0Q+GOWRav7jnL77C1ip
u19vZSXZGcCE+wzi9nh6cE1A4gLUfQ==
=wiOT
-----END PGP SIGNATURE-----

--r2QkDNKpLEvUVJ3W--

