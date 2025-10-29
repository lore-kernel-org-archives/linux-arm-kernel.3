Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEA5CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQ6u8qLg9RAS3sQx0DZqTPCs2pfg037ebM1hlPoMVXs=; b=KwTQdjzxbsF6WZhiqqJu5F7A9c
	UwRi4e6D08uya5XSOShxxJp6BD80PFe+6cfIVWHtg+lLgGDDF5D5ktKaKDHdkAHiTOawNdIL+NZNg
	wOUd8RHz/JNjV0fJED9EW8C2BC0orPDlOggepUCkYMQdRB/YsXohcVj3NI5JkAkgKcZXa8YblbOTy
	fa+dMys9ebUP5EyTp4FoHupVFHZAx9pfjXWoSYx1X8vIpYT6q50foXMnh3s+XQk+8hlbztuwZm4uQ
	x4eUoYCV8gacgrHbq38EQHHOpyjYb2/mo8tubshiTgHtA+AtcpjGoLGNA/b8kdHaoUZAEDEoAcHsr
	/vG6bVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA48-00000002DSn-2lcn;
	Wed, 29 Oct 2025 17:34:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEA47-00000002DSN-3zsV;
	Wed, 29 Oct 2025 17:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B6C16149D;
	Wed, 29 Oct 2025 17:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F1EC4CEF7;
	Wed, 29 Oct 2025 17:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761759270;
	bh=cQ6u8qLg9RAS3sQx0DZqTPCs2pfg037ebM1hlPoMVXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOYx8S1rgIjusrjqz5VxUMOjhk3aNW3LmV8MgkEo9Y9VNnbrIfBVxoYuTwPg0nHtL
	 mcCUbVOpfKeEC1cN2axA3/YfwSHw1NIqe+l2nK9wdbUGlODAR5j0KGXqdlUsCcKo07
	 XCEA1Sj+AH3NDzVhiD/KqQZnOFBZHietE9xwzC47GnjefybvJdeFi2qNXV2PR3moN6
	 JuIWWbFOA95vl2vJtR9ZATQvdc/V691BkICvNgzU5sjWx/dpSRdnpb/uThT8ht6YzC
	 tgn1SCfDnm6Inqnf3/WDDK/5H0WPp64DjCCwtyPt4eJAvSv7otHsWS2HNvgyyBd+mc
	 zqMge5B1EBpoA==
Date: Wed, 29 Oct 2025 17:34:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, kernel@collabora.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add compatible for MT8189 SoC
Message-ID: <20251029-gamma-unmixable-05a8c5dc0960@spud>
References: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kATwFr4KYeHZakeU"
Content-Disposition: inline
In-Reply-To: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
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


--kATwFr4KYeHZakeU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 03:52:53PM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for MT8189 SoC.
> The AUXADC IP in this chip is fully compatible with the one found in
> MT8173 SoC.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--kATwFr4KYeHZakeU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJQIQAKCRB4tDGHoIJi
0laNAP9C38Qssv8uwb97bAU24YVQ1YwFUV2QSTpsq2dvEnILjgD/ZpYNtjV63fqu
FACQa0/m0zVdoiWZl+u4KK02fETcsAA=
=yxko
-----END PGP SIGNATURE-----

--kATwFr4KYeHZakeU--

