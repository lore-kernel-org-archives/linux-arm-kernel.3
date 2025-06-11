Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04085C7114B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L2dGUpW09AvMNpTRzGqIRxdazsuqBgLkgcIZOJe1Z0=; b=xzKIW5OO1t1GouuzQAxvbkCXDE
	lbSf6KoaFHuTBidNeqPqPqBemP5v9K9d6trD1hzs4e0usjtdAzq26BHf92rBmfzCxmaU/4JVeXzN2
	3MqD6uLat962j0cnT53ozeRgDDg6woxVw/C63w+yRv7SuPzKDoQAQFObdX2IHAGPKsfruXiTn4NNT
	L5UJvNX6Ytv9JC37Zg/vRyBcKwGgMv6hfmxTLGmGExd+95CFx+1CefRsoVjVcLeSG43J5tWDiIgAK
	M8vO2khOvzJhFogkxrKf3h/gh2dlNmxx7fhZNQX4G4Ctf2MTGkS6HQvUfAzLiX6HSnEiNPNHJGDEA
	Y73ek21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoE-0000000BGQL-1dGp;
	Wed, 11 Jun 2025 21:16:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOCR-0000000Ab1X-3Aol;
	Wed, 11 Jun 2025 16:21:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D0E826154F;
	Wed, 11 Jun 2025 16:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966A5C4CEE3;
	Wed, 11 Jun 2025 16:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658874;
	bh=/L2dGUpW09AvMNpTRzGqIRxdazsuqBgLkgcIZOJe1Z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/PnBta6Iy+ClZux3wRoK4yrCk9t4MPLyyuTpRp0Y7qcVus/mxM+svP3md8SSnjL2
	 UCUr+Yl1neMOpEOYjBzjPUM+w2ZEFqfEamafnyotP3BEwv7F21nMnigZV3N1lwf7AW
	 5uahA+KLvgZRw2OfVrjzHyoMQ6Q/OezymhXceo/wopr4TPMNj4nrj/RN7jvKYlQhOR
	 dpAbJPIo0qgyMpmtA5o4DsbFFZGyQyyF+bTf1WsTwZaThKXLv5Tp2wpPGuJr8SKWeJ
	 wucpMB5FOLCy5qEGH/mQ6IIAApOzyB9f1euBcw58K9DeTl1bIVr+FGmw1VIqfCdIP7
	 f/VhO2cbEF5pA==
Date: Wed, 11 Jun 2025 17:21:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8183-afe-pcm: Support >32 bit
 DMA addresses
Message-ID: <e9baeb61-9cb1-4b58-b957-fe753e629f12@sirena.org.uk>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9PAPZhOpllzoEdZ4"
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-8-wenst@chromium.org>
X-Cookie: Metermaids eat their young.
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


--9PAPZhOpllzoEdZ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 06:25:01PM +0800, Chen-Yu Tsai wrote:
> The AFE DMA hardware supports up to 34 bits for DMA addresses. This is
> missing from the driver and prevents reserved memory regions from
> working properly when the allocated region is above the 4GB line.
>=20
> Fill in the related register offsets for each DAI, and also set the
> DMA mask. Also fill in the LSB end register offsets for completeness.

This doesn't apply against current code, please check and resend.

--9PAPZhOpllzoEdZ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJrPMACgkQJNaLcl1U
h9BXaAf8Cp0/Qk9S9BCu/1WQ9b7h9uIwroAKxXnge/cWjZAaw3lpUGDxTZlGp4uf
yIxD1RWhQNL2YeHVH+6Wq9x142AZ5jCCme/GswQGThwVPxau9mVVCV1nJzSMbnlf
kUfAQcRN9S4a1FpsRqcfHXIwww8LT7Kog75DmLv9weUHy5biFlThiQkqcaR5nOm7
9cbzIK8FzYHgpgP5E2nEpSbP2z/czOjR0SVGql2pwalRa0lGYoZ9/3a38cipDbc5
bCEIXr9b48FLg4ZKOPO2qRb/pXvOQ0abFlye4lOjd5OhRkFXtZEEX7u6IZSej66s
Tmv8ID9+Oy7Ej3ybPmH24gNdTcpCuA==
=W2oV
-----END PGP SIGNATURE-----

--9PAPZhOpllzoEdZ4--

