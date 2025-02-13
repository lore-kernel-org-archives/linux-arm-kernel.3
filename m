Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B74C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYndkZ7X06XuaJ3uIArVkvyppTe1jVZZrkXisnlAISo=; b=TTMRK5DQnjNjGqGWF0SPp7vDOQ
	4cOSQ4cdssz7NG/30d+F+RGuJezKJiPC6M5UVCKNAP9cNY0eorT3+arkgcURHmBBJXHlzBw3CVS4J
	tGGNWqAP57Mr7HbWgOMdQnDLoZfPRDcw3gss8sLp3F1qf1GlbK9BIB0voNVH5lc0T6AgnGBewrDxm
	aGf1U+2ZImuztAxRrvE1uAydhiMg7CnBqznleZ5OJt+UCUT6x7efpVWvTpLrLNOMCEbdiZ0BTl3Aw
	4iahYJNmhng6cZ8U1ZwEzW3pVmWB8KMbIaA9khdgBBnbxSxiU27QZsG2gs1Jt6l4yk18UoBDMtbEg
	LUp22ajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifsG-0000000CY1H-02te;
	Thu, 13 Feb 2025 20:31:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifqc-0000000CXo8-2Zio
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 992855C59E2;
	Thu, 13 Feb 2025 20:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AC9C4CED1;
	Thu, 13 Feb 2025 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739478609;
	bh=uyWlRmXMXeDRjKN/QUZuzNs4AKAFWK4bYiZ6ygpiavw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AFRcPhLyZikC9/6PqjY8KJrAgqbk0gOkYLwYjOSsJen/HfJFjW61itYcER1NPRrJf
	 eAx/eaUN9USWPphz671vKhfECtHB/bPOgxqkS1RcJ77quZdGdPI8yRIo3ZGeiVQirM
	 hTw7VVo2ybfj/xwwLw4nhb4MZA3O6LYtWTxSY8IG8sO+U3oJx6FpzvwXcOe+JmlWoc
	 h8dXoATZ2dQrMsnSKFjFLtO0btzFLfiOB2eLF1QIA1U6J8LIY5+XQcqwMLYbE8o17T
	 XIwaezxQdCnBVJ6AiEYUOcHjsB5VC/+yBrQOfEP9Ka3EC41IIOsq08zxT/NI873UTj
	 jN+a9yU6C8Oqw==
Date: Thu, 13 Feb 2025 20:30:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: mfd: syscon: add
 microchip,sama7d65-sfrbu
Message-ID: <20250213-shrouded-carnage-65e11cff5bb4@spud>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
 <4cac19e32295c708d72b9fc6ba342b5c961fb6c3.1739221064.git.Ryan.Wanner@microchip.com>
 <20250211-therapeutic-futuristic-parakeet-204cae@krzk-bin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HXlCXwCYNYh2B+qP"
Content-Disposition: inline
In-Reply-To: <20250211-therapeutic-futuristic-parakeet-204cae@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_123010_700556_13432132 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: linux-rtc@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Ryan.Wanner@microchip.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, lee@kernel.org, claudiu.beznea@tuxon.dev, sre@kernel.org, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--HXlCXwCYNYh2B+qP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 09:14:05AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Feb 10, 2025 at 02:13:02PM -0700, Ryan.Wanner@microchip.com wrote:
> > From: Ryan Wanner <Ryan.Wanner@microchip.com>
> >=20
> > Add SAMA7D65 SFRBU compatible string to DT bindings documentation
> >=20
> > Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Docume=
ntation/devicetree/bindings/mfd/syscon.yaml
> > index 51d896c88dafa..727292ffe092e 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -91,6 +91,7 @@ select:
> >            - microchip,mpfs-sysreg-scb
> >            - microchip,sam9x60-sfr
> >            - microchip,sama7d65-ddr3phy
> > +          - microchip,sama7d65-sfrbu
>=20
> You got comment on #1 of your v1, so if you make exactly the same
> mistake in other patches then fix it there as well.
>=20
> Apply v1 Rob's comments to all your patches.

Actually, this patch v1 did put it in both lists, but here it got
dropped from the second list:
https://lore.kernel.org/all/20250130233431.GB1868322-robh@kernel.org/

--HXlCXwCYNYh2B+qP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ65WTAAKCRB4tDGHoIJi
0kVRAQDXcFGQWxRkf6rUQyT1YQd5ec+0uVx8aLWtL0v8PANMVAD/dw9OVEVJxTSD
cWfK2bjdj7nz/WVP88GLvUJRr54Wmgo=
=110u
-----END PGP SIGNATURE-----

--HXlCXwCYNYh2B+qP--

