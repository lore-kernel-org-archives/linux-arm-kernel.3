Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E0DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75f1P6iVf+i4W13Qo+NmU3fW0Iy4nt+5CCt2TeREJe8=; b=A9QrUPZZfX2TQ42x4QpSX8GqDe
	nzqqPc0bVZCU0Rvx8kzl6sMwxiR+4D8pvFAyKImey0BPYABhdxhSJzz2j2EnX4VcQNBldEilBmvN+
	IvaObf7vEPtU9e22/5WoBH2wtLb+rOU4j/vPs2d0Cg/6JfjIAzohBsuHTMm95n4U7kzFkFC+CaZPG
	uRFD64m5XQTdtY272fn+1gcaBQuHPfsr+OPZo6yskSiWSyoUk8y0tjwhIXfbL56je6ho+kyLX8Ih2
	KX5Kuj2YoyGdQsCTG/lX9mPQrJeiuuHHnb/yar/6DmInSgYrkj/jemXXPJ6WW15Y8Hf286gej+ynX
	CVl78fZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy2G-00000005oJI-3g6n;
	Thu, 06 Feb 2025 09:19:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy0t-00000005oA9-0Sol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 09:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 561705C4BE6;
	Thu,  6 Feb 2025 09:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE27C4CEDD;
	Thu,  6 Feb 2025 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738833453;
	bh=OprUX3sf+GllvjoTCMMHPEd9To8pLBDgBAKjQLuN4bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlMqEO9yqjddagGvhpyIFTCCScBLoIgdQQqQMCaV3jJZ5roJ3Rafcskhyg91jS88z
	 xc9fT2zVeuM5WPf+6livRm1gQCXzW7oGbxdNYQ+/KVEUGbD1WvseO/ekE4tGTWcY70
	 GEQY5xeGHhTx7J7YCnhVjokZcMMV/BvL1/7awqvro9cQ8JbJ5amYNcG8pC86iSRMZY
	 bHFhuNo0O27tmaNs/EMKJTeS3TlYwayG0ddQng4Y3Qk4pb+qIV565y2Dzk08wYHNwC
	 MzreoZNOVi/InNqbtYb8gJRqJLiAJELAABvnWp43MQ4EFpu29Tzfm2glpZGhG7CDZK
	 xQXdLzaDPiX4w==
Date: Thu, 6 Feb 2025 10:17:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
Message-ID: <20250206-caped-premium-squid-595ecd@houat>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="s5i444uyid5tefem"
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-5-4e4ec979bbf2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_011735_230516_F6C8EE86 
X-CRM114-Status: GOOD (  15.38  )
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


--s5i444uyid5tefem
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0

On Wed, Feb 05, 2025 at 11:10:54PM +0100, Sasha Finkelstein via B4 Relay wr=
ote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>=20
> Add the MAINTAINERS entries for the driver
>=20
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..4ce0d3bcf67910d909ba41261=
535dcb14a24a7b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2189,6 +2189,9 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.=
yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> @@ -2208,6 +2211,8 @@ F:	drivers/bluetooth/hci_bcm4377.c
>  F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c

Sorry to figure it out that late, but how do you plan on maintaining it?
Where will the patches go through, and who will you send PR to?

Maxime

--s5i444uyid5tefem
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6R+KQAKCRAnX84Zoj2+
dpFcAX9vWLHvXu193dJYEBiwU4fhNxzryOdXkTE4drAdUIoskcpd7us4hCIDO00j
dW3IY38BfRaxBKVSxfcDLKpB5L6e3vgphx4Fp+ODyheOilHTZ2A2Heqy+uVVhSmE
jpTyN5zhyA==
=D+sS
-----END PGP SIGNATURE-----

--s5i444uyid5tefem--

