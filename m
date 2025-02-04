Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F309C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNIr7E1EOGW6+JLXzu+l8I3qSiaeoXZdrs5cQc+nLo8=; b=0xOypRNzg5cIXu4ALpegJBGjE7
	YtQTVvEVTNsxewyoBDQ3y/UPbzYcnVDP0pes/XEJSbtoiKo3UfLm3vpE1NKTcoX5gfx69j4wFfX7i
	eWDb9IowjN2IMjZj4nwMe9CnUi/2qx7sbZkCZqqMN0A1gBCjQervO0JvEAaEv3UR6li1jKSfgdALJ
	Alv6RWibvLT4Z3Rselywkq9lSgAlE/KuLrpeT5yFidbR08LpKvA3jxaKv40hwUjpJseR7E381Btv/
	aYDG5fvyg1CnOt24VuoohB03A+48rXGhpi6s996lPncKodONxzHnezaQIhuF30hXOyQzlNIGyaKDJ
	iptm9QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOmk-00000001Nv8-0On8;
	Tue, 04 Feb 2025 19:40:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOlP-00000001NoO-0yyA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D90EA42CA7;
	Tue,  4 Feb 2025 19:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD47C4CEDF;
	Tue,  4 Feb 2025 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697954;
	bh=sNIr7E1EOGW6+JLXzu+l8I3qSiaeoXZdrs5cQc+nLo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiJ4OfWEcCC1CohJGgsg1/2cyogyorT2ExrJ2P2MpHot7RLl7TaV40/U1z2fCtE55
	 OmKDiw5yG29N/FHW/p75MXSnfalzdo5dmuW7hokZIzJgPJvoTPVkM5hmIYCX6O/LCJ
	 sTzXMB82EGKUE0yVUG1f22omMDpPDj9HBoWQd3aAc/9b+GCsjllyzVEo+/YNhBUxvx
	 /rWMIdtjFE9skhtiZhCvAX7gtjXW6JGheZ8Dy6OgxF5P9hAAlpB6q+2Gn8todMZYXQ
	 xG2qbXgp692BQx/e34d+VGPIyvbVnW/Q3uARAi175QEWPLGJSSjkZtF/5pB/nUU2n6
	 cslrxdbYr6lag==
Date: Tue, 4 Feb 2025 19:39:09 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: imx: fsl,aips-bus: Ensure all properties
 are defined
Message-ID: <20250204-unclaimed-crook-9119c6e07ba7@spud>
References: <20250203213027.8284-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZqKUl5802oiVuaPY"
Content-Disposition: inline
In-Reply-To: <20250203213027.8284-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_113915_339359_51A0D74C 
X-CRM114-Status: GOOD (  10.29  )
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


--ZqKUl5802oiVuaPY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:26PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> simple-bus.yaml which has the additional properties used, and fix this
> constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--ZqKUl5802oiVuaPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Js3QAKCRB4tDGHoIJi
0u1OAPwP4dDgkZt6eKCDjQgofROOS9PimClqi9SO16o1+uArKQEArhXEWoKCBuP9
ZmQGi5sCHIdO4890WefAROi9f33aEQk=
=zzn5
-----END PGP SIGNATURE-----

--ZqKUl5802oiVuaPY--

