Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6A0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYg6fgvglOEUOS0tGf68vRf9+3J6E84/lSBqd1aI1sk=; b=SAEPQMHxxbgTKl/syVE5FKd0UX
	wM0ku29567cd9ljRZDCU2n97l6sm5UrMzRKoB5GRxEnuCSiWIkvQF8jJf6GgsqcEFTnaLDVDI8a4w
	5C6jr9zZbT2uBXpWrkXkrbfkbnmu7ZztuYxL7Y8Q8DetYSjoXgOQw8Y8ndwUxb2OMJKJty744/Tsm
	mcW04F6szxgZHucsZkq5luawz5xpMw9cfP8LfNFZ47adSZERmxRLiUH4afs30TLkh72VjM6pqurr3
	Ts7pcELiMrT35eL98Gvc881hbzrgAKHFhMNrils8Fb0Eo3bD+TQrJjcql52dndnvgWqAGW3WDB9al
	Sx8dTbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH419-0000000G2mt-2ak1;
	Thu, 06 Nov 2025 17:43:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH418-0000000G2mg-2M3S;
	Thu, 06 Nov 2025 17:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6490D618FE;
	Thu,  6 Nov 2025 17:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1992C116B1;
	Thu,  6 Nov 2025 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762451005;
	bh=RYg6fgvglOEUOS0tGf68vRf9+3J6E84/lSBqd1aI1sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPnTsvEgCJHP5uPcj0x5eVXQi3cMNZ3Qh0DH6GuT2Brcz4OAEObzwAJFdboPG/gLX
	 8GSHcYXT4Noef9AFiK1iBJDo8YlryvJdp0kxSD1sV2+gROS0x+l6Lv7F7TbTkhL6ll
	 KJyhAn7zGvRZpQpU2xOXGt1lI7N4mwWaaZzdb6T4ypEaPz+apFQ4Gau8pm2iDkkGrb
	 XhCb5DKYZfYBditTwh/GpFgDqFcLaEjy4sNqxMPOu4QHrVDxwInnT7D4LzblzB4sMm
	 zopAbMSwiK5hI/KA/AIeAN/EUF3QskeLr+5n66PxysHmlJ3EacoVgpy/0lUsbcaFtb
	 mxPaP5xiSPlEw==
Date: Thu, 6 Nov 2025 17:43:19 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogiocchino.delregno@collabora.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: mt7988: allow gpio-hogs
Message-ID: <20251106-strewn-carport-a33a8b812794@spud>
References: <20251105195007.199229-1-linux@fw-web.de>
 <20251105195007.199229-2-linux@fw-web.de>
 <5DB7D99D-A30D-42A1-8E3E-B0204A1E6E6D@public-files.de>
 <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxHVsfn4TTebUpw9"
Content-Disposition: inline
In-Reply-To: <1af7077b-42a3-4efe-a8cb-6117136c8f2a@collabora.com>
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


--kxHVsfn4TTebUpw9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 10:01:41AM +0100, AngeloGioacchino Del Regno wrote:
> Il 05/11/25 21:01, Frank Wunderlich ha scritto:
> > Am 5. November 2025 20:50:01 MEZ schrieb Frank Wunderlich <linux@fw-web=
=2Ede>:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> > >=20
> > > Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
> > >=20
> > > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Reviewed-by: AngeloGioacchino Del Regno <angelogiocchino.delregno@col=
labora.com>
> >=20
> > Seems Angelos RB tag is missing "a" in "Gioacchino" in email
> >=20
> > Got error:
> > said: 550 5.1.1 User does not exist -
> > <angelogiocchino.delregno@collabora.com> (in reply to RCPT TO command)
> >=20
> > maybe this can be fixed while applying?
> >=20
> > regards Frank
>=20
> Eh, have I typoed my own name?
>=20
> So cool. Lol
>=20
> Just in case it's needed:
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

I have a vim macro to a) save my hands typing lots of tags b) make sure
I don't typo. ;)


--kxHVsfn4TTebUpw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzeNwAKCRB4tDGHoIJi
0sEBAQDh3ELz8Pk02klEc4eajrCSPIBQRJI5YYEM84+8jup61wD/TIDv3g+lbIbM
UpPplLaIvc9wo+kbqV2fcUYFO7jELAY=
=yvxB
-----END PGP SIGNATURE-----

--kxHVsfn4TTebUpw9--

