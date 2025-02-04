Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A467C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXid/J3qZBjcfg0RqWr6jcSgu94Ix6LoKEM0fp/erdM=; b=X/x6sN4YlReuIGAD+WUu0nFrru
	VS+l+czJl/UlCu3eep9AuZCMOv0VR/9SE+MJoxJZwdjv3WUzOZYJDRyn5B7AaX2vbGKlEBk/IOX5i
	X9+qHEoP3pXW/LnQ8kTRM53FZSj5vdEpK3tO4CPSp/8qh484cJR/DAfLe1QcwDCdsQmyBshsjbDiO
	yrqSovTw2/jtXaXjGdqcCka4VIoqE6MkJ+9o/DjaEshOIU66YAxSxjSegehUikzpOKNOHVMpe8HKx
	ObuVJuWanfSrRdBSCIojO1EDpYBvKMB3J0DoRNtZpEvusMFiiOXkOMMq7iI+Cd06f0YEaD2BhHCNE
	9OP7Wj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfP6P-00000001STh-3EkA;
	Tue, 04 Feb 2025 20:00:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOsl-00000001Pdv-1oIE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 19:46:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 922B9A42D21;
	Tue,  4 Feb 2025 19:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E93C4CEDF;
	Tue,  4 Feb 2025 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698410;
	bh=sXid/J3qZBjcfg0RqWr6jcSgu94Ix6LoKEM0fp/erdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsyMArj6/mMtWVOZ+WTeXl/rPdQ5XfqnLAOcXNWyq/x9qInfLVkp5d/KXb6m9Mtga
	 orTf8cnsncBRRgvqWgMnR0KNbaHhwtekirlq8yzlgHMI/ZP24zeZr2y4jNtOORn+GO
	 MyHRxjwF5mONk7whytUs5wWMTEcKI/iigg51Ba5qymaQfZgrlLGfkuOJB4WjXXBOGu
	 Q0v+D06LKTebZO0WojTuUD4H/XgLcms8/7id0kHFy4cnvdFZd/yyTz4avadyCmg0jR
	 1QTnWzLsdHN8dHbPNkmkR7e3d8oLwEwWopPpyqePdZyPYZlgtNN9Mpe5D1FKq9LJ4k
	 IW9alerFZ4yIw==
Date: Tue, 4 Feb 2025 19:46:46 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] marvell: DT root compatible fixes
Message-ID: <20250204-headfirst-evergreen-ec92900ee782@spud>
References: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x5UnwaTJWdRGDlJX"
Content-Disposition: inline
In-Reply-To: <20250131-dt-marvell-fixes-v1-0-55f9f6acd4b1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_114651_531652_07FD0632 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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


--x5UnwaTJWdRGDlJX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 03:08:24PM -0600, Rob Herring (Arm) wrote:
> This series adds some missing root node compatibles and fixes some=20
> errors in dts files for the root node compatibles.
>=20
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--x5UnwaTJWdRGDlJX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JupgAKCRB4tDGHoIJi
0s1SAP983MbztBx9JW7mBOtkH1RQR6fb//Ogubt4WA6KjWQuJgD+PsBZmZQOqJHm
IKTDZ/R+p+gKllClHDwNHhRp81SUBgA=
=tCWb
-----END PGP SIGNATURE-----

--x5UnwaTJWdRGDlJX--

