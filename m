Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09610D3177C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNEAlyMpv4/QSa8dethAiQseRxvXopup9fe1tEoOWvs=; b=xCZ9jnE6tHMaajgfCl9W3vlwKL
	ICmtUz+HHMR7J7t4IcIVpeMg30fzxqZW1X26rkz32AEJptPqurtUCUnTkEK0Cz6KGoVcG14oMm437
	q5AqVqVQWJoNg+M9rwwx4Z87mAKQJlW5wCFVcujQlbuEDDTqb0ztysvQIrutRpM7C6HEcPY0aJYb/
	Fn+ouuZ77HkYq0k7PuOx6n3JWJDiRNk+tcWLJhFmAH9Pz39Wej+DEwcXMqs5qeiAJxJ8Ldw5sSyNz
	zF2CMFhH25cHRB0Jpg2CUV+7x73txHnk/1KaPk5I0RApiJPB5hHDIgo/L25b2mhwSwPFhSEzzdQb1
	eghPhdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Nw7-00000000Je4-1YpU;
	Tue, 05 Nov 2024 18:05:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8NuP-00000000JS0-39lZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CFA65C53C2;
	Tue,  5 Nov 2024 18:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6341C4CECF;
	Tue,  5 Nov 2024 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730829838;
	bh=8+cIHaDK/PkRLZQNzEkaeipacB3Q8GDm8j9Yz0buIQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8G1C9oo+hPHLWRYPvwmxqqVWfHAG4XeiZuNblLd111x+Q1yzSS+pJOqgM8/6hOP2
	 O6thypMRrVz2WVEA24bcBHBMuR9V1vAzyt0HK6k8y+1ektuHJ9JSNhqxgTE9U5PZWX
	 Rh0lHZ1hOHE+03rczdO2u4fjZGRbJcAa1Tq/pUWbtbNWyqkQ3n4RlUO+hQOtnYFJxS
	 eVBZNlk8JwRT59FtFGMvz5eObS/DEFzf1JAMQd0jAXIZnCYN6zwNjZAqlxfVa+I+yP
	 YBKoHvubYo0TbL/ynmb06QAsnQbzrqFKBJOeHXxUsdMR1UnPIrVs0u4tybuS9zIUZ1
	 UxJlWTmX1IUSg==
Date: Tue, 5 Nov 2024 18:03:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 08/21] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20241105-sulfite-justness-d7b7fb98905c@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xQXEB5mU2yf0jpDO"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_100405_928493_5EC37A5A 
X-CRM114-Status: GOOD (  10.08  )
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


--xQXEB5mU2yf0jpDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:14PM +0000, Matt Coster wrote:
> +    / {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +        interrupt-controller;
> +        #interrupt-cells =3D <3>;
> +
> +        gpu@4e20000000 {
> +            compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img=
-rogue";
> +            reg =3D /bits/ 64 <0x4e20000000 0x80000>;

Can you format this normally please? Drop the #address/size-cells down
to 1 if you're against having 0x0s.

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


> +            clocks =3D <&k3_clks 130 1>;
> +            clock-names =3D "core";
> +            interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +            power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> +                            <&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> +            power-domain-names =3D "a", "b";
> +            dma-coherent;
> +        };
> +    };
>=20
> --=20
> 2.47.0
>=20

--xQXEB5mU2yf0jpDO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypeCAAKCRB4tDGHoIJi
0rKRAQCPc+IctwmoZoddo4GAQ3JphX1ttBvWgJigLa3DJ8BDkgEA3T1r9hN1I0La
vZrB0DbYFGc/m61hAVWkIrElbvEhwwo=
=3MKw
-----END PGP SIGNATURE-----

--xQXEB5mU2yf0jpDO--

