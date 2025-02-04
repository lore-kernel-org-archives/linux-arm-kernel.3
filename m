Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CCFC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1wT9qVF3f4f4tUE1P5oM6Q6VhPe74PG5Vx6sGjHCWo=; b=Zby/08yV4SfSN6G3FqI8C1qivD
	C0ZjW5BNm+PqWbmvK/G0ZIvxwij2x8lL1yfIMuErXjUjZ6DahUEwaplDxoenadIE1G7jPhgwZkeHl
	xr/yz3RIPjwCnVWX4/t74DDbHekY/DF7vU1EfBp+l/5dnT+nfrAfWqNQRG1YkWvDU03f4z8OtEPEA
	94nOWhosYgx/1z73MftdMHFqrkFAvbVdm3oLei3qumDiqkcJktSTep9YktfX5XtQtuRtx03jO67/b
	gVeCja25nqVcLldcKUNMBeXO7npWelG0h90gbBTri7ZJkLHXg+n3epThu8qi0MqFsq+W7nlYVv45E
	ugucKERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOiX-00000001NXY-15hX;
	Tue, 04 Feb 2025 19:36:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOdP-00000001Mut-2TsP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 400225C67BB;
	Tue,  4 Feb 2025 19:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EF8C4CEE2;
	Tue,  4 Feb 2025 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697458;
	bh=xHGH4a/Ywo4+o/ZzmwaCuhzBpYplcQuCjUSy9UL7dtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMpnY06Cph7s50YtSLnzh0whrBYj3+19NY8J/lXEJ5PtGPfiAqMLpaMv8pnJTFb0P
	 93oj+nkxIft/kgW92UACbNRdrZHHsuam2LDq3HHEy+Q2UlC5ngXXAjzLiTFmLRLuDx
	 43mtYvjCbAu2z+dzJzeQcFMNir+YLla30E7ytuMnJqpXDT0D9O+o3rpdwm1QMEqK52
	 eNZ4kpudcDR3Y8h8h8Uj61hw9nLJA6nXk92J694aOrDyitUUm8+Kp11wNoEbYE/LSG
	 FEpgIxGpOVPrGgqzJZYNcv6igP9KVImNEoKuY1qzDC/Toh2oV82rNQisd0Q2ALOSm9
	 gPhd3dYCEHM1A==
Date: Tue, 4 Feb 2025 19:30:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: eajames@linux.ibm.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@aj.id.au, linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: convert aspeed-video.txt to dt-schema
Message-ID: <20250204-from-catsup-132a4af05f49@spud>
References: <20250204062822.3738037-1-jammy_huang@aspeedtech.com>
 <20250204-acronym-unshaved-18b89a389091@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S4lsoQVavYeukAq/"
Content-Disposition: inline
In-Reply-To: <20250204-acronym-unshaved-18b89a389091@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_113059_693185_CF305E90 
X-CRM114-Status: GOOD (  13.94  )
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


--S4lsoQVavYeukAq/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 07:30:03PM +0000, Conor Dooley wrote:
> On Tue, Feb 04, 2025 at 02:28:22PM +0800, Jammy Huang wrote:
> > +  aspeed,scu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the scu node that is needed if video wants to capture
> > +      from sources other than Host VGA.
> > +
> > +  aspeed,gfx:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Specifies the Soc Display(gfx) node that needs to be queried to =
get
> > +      related information if video wants to use gfx as capture source.
>=20
> These two phandle properties are new and not mentioned in your commit
> message. Why have they been added?

nvm, I see Krzysztof has already responded to the v2

--S4lsoQVavYeukAq/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Jq7QAKCRB4tDGHoIJi
0u/dAP9W0ZzsPi1nGv0y3Mt5OGgJcbcIllWIJygiE1g/EgrSHAEA/s0hskJKMuu/
a2utbby4wEBmS2pfmG8tdx84sTac9gY=
=jK5r
-----END PGP SIGNATURE-----

--S4lsoQVavYeukAq/--

