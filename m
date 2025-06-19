Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFC5C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNC+VqtWFkCITkLNYa39qdNUp9UtQS+W0uqQdv/0Liw=; b=oI2QJeVMAMTkh11dv0YjDedmUX
	kjoiOLTALEUlxRT/90u7GeAK0Nu/rtOClaxhEaDJQThJo+Ng4G2BfOGehofKoLHOTVtuPjt+FKPgQ
	1lXVpv9wg4sTFb3oFFRr5yfhPpyys4WmiVUUg0KnT18qSyvj8Ne7q6msIpoVR6gnbB8crzP2c0+RT
	lw4sAcjCnHUKA9L6ImE7xsz7UuJQYN25wyv4v2maunQuhFmtyymxxhB7BWSs4bZ0ut2eeQeczXRJ4
	qy6k9yOiLBunZE0fK24Waf9S8ppQkhax+22vgqg43ifEQbHUfffRXBczNpXbceF4FsQQ5akFjUuTl
	P+Y/lH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfi-0000000DgYM-14oX;
	Thu, 19 Jun 2025 17:03:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGmo-0000000DLkS-2H9b;
	Thu, 19 Jun 2025 15:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03030453C6;
	Thu, 19 Jun 2025 15:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4C4C4CEEA;
	Thu, 19 Jun 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750345361;
	bh=WMUgOCPru52VAFqEHtr6GwXaBkUBQdB2s1jxRDDNld0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YX0TziWK1LG1a7QkFBlLUDt9JBwOReEQ9+u42HbJfQwQFeLvUjfTgbpIedIwqhvT2
	 IJqmHF6ev3cY1lPLf/l0TJebZiPvvp1YXfAmB7kWYNXtFJaQKyV0gz+GnlgYVWpq9W
	 1tHjLm3EDkj/QmvXjX7lfsTq5zfABrg4eUjbIuJCFZl4iKsHdpYYLvbIAFCbteRaBr
	 vXTKnEIXRniwycPDhoHypmCNdghR35KGofNaOBYiid1nnuLRkiNYKUbS8nmhZWuW8d
	 uMb0oiQtuQDlpZuPqQLZn53O0B4/cdDz4G2//V8GYYoTchb7xsswUbhLbEkmiBFqtX
	 vl+UdsYqQVbhQ==
Date: Thu, 19 Jun 2025 16:02:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, jgg@ziepe.ca, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 2/5] dt-bindings: iommu: verisilicon: Add binding for
 VSI IOMMU
Message-ID: <20250619-nape-iphone-0fd4f9889452@spud>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-3-benjamin.gaignard@collabora.com>
 <n5ddeogrpgctrljnxjfxqaz22qfnxsgm6ro7qihbjeyhd5br44@ojlzlz7gsuzb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZsCqWODAaq6bj8Vt"
Content-Disposition: inline
In-Reply-To: <n5ddeogrpgctrljnxjfxqaz22qfnxsgm6ro7qihbjeyhd5br44@ojlzlz7gsuzb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_080242_598775_2965507C 
X-CRM114-Status: GOOD (  15.31  )
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


--ZsCqWODAaq6bj8Vt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 04:19:32PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> On Thu, Jun 19, 2025 at 03:12:23PM +0200, Benjamin Gaignard wrote:
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: verisilicon,iommu
> > +      - const: rockchip,rk3588-iommu-1.2
>=20
> The entries should be ordered the other way around, so that the
> "generic" compatible is the fallback. Also the 1.2 version is from
> Verisilicon. It does not really make sense for Rockchip. So I
> think it should look like this:
>=20
> properties:
>   compatible:
>     items:
>       - const: rockchip,rk3588-av1-iommu
>       - const: verisilicon,iommu-1.2

If you're not sure Benjamin, please just ask questions. There's been
like 3 versions of this patch, soon to be 4, in like 3 days, two of
which could have been avoided if you just asked "is this what you mean"?

--ZsCqWODAaq6bj8Vt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFQmjAAKCRB4tDGHoIJi
0mu2AQDy10QjeZsSnzVsEXfW6RViKo+rWauSa17R3QQdXnwOggEArRSd9DXggCSu
+9Yh5AMC+TMbCL1HN15ms1SSzBkkVgY=
=sX7T
-----END PGP SIGNATURE-----

--ZsCqWODAaq6bj8Vt--

