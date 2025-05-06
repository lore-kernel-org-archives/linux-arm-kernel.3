Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE08C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlPNA86qa9oRdKj/2uateHLKKMOfnTFcdu/S20SpH28=; b=wcCy8eZtYct75p7wSQ5PlrreE0
	aK77XdGWdLCqoEn1580H1/MS2F3uKu6xLMkVUMftObTrreK7cGIxH42XQawRY5JeTCJDgFyvoAb2H
	X2MhG+3ar8JyLA0M0T6NptXaPk4+CqcR5++XANZIBJjqFODGPS+PombWLN/Y+QCXIG+BJb7DCr5He
	duvROWSbIT+1xVcc8M4Koi7PmILm66pEiZka7kaamfMtkjAWPNPtFMgxk5TJlNOH0KQjcNp2PBg12
	F8ZRyNPQUje/fLBPAAqx4nH8qPpwSZkL0ntZxo5WG+8e+nVgmmcZ6/0suW6xu4xuMzf6CBihtdemN
	rFDWL9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOdB-0000000DKjm-0Wst;
	Tue, 06 May 2025 20:11:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCL3B-0000000CebC-3rZl;
	Tue, 06 May 2025 16:21:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33DF5A4D692;
	Tue,  6 May 2025 16:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EF0C4CEE4;
	Tue,  6 May 2025 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746548504;
	bh=Y5vB3RUwm/jQB8fSOOeUJbh+2DxhwOmT4Fj6JhKOiSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q8jwC9WDmnDsANLxcaOE0kri9jAfO3Z0S8LmgIdUeC1Dyhha15VolybR25EWWSxTH
	 XpEQ918zIv7sHK/8TokDEJbpTEbl4vcIpfSasui0aOgIfd2wTf/Z5pQE5Am0DuVkIA
	 WSsqUibNTsv4ICXwt4Kaxaaf5gEuAGsxfC3NMBK1kszL8UqGVeOPlA1xskmZlKsZif
	 Uof9Gg7HBm4FBQBJMmkPFWNMNvnExJ1m7TQsJKPvjb+6ve9ozUhbn2ds6qsoEF2uUw
	 ykwvbG7fo4gXSPXHUr48CbC1zKMVV6vQnJ4eaLi4Y7FiNcjGRzrfmvYhCRvg89ZpCo
	 s07+b/Uk3W0tQ==
Date: Tue, 6 May 2025 17:21:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
Message-ID: <20250506-yesterday-married-28c9228a3746@spud>
References: <20250503202532.992033-1-heiko@sntech.de>
 <20250503202532.992033-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FxJ1Bes51ilW0HN+"
Content-Disposition: inline
In-Reply-To: <20250503202532.992033-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_092146_021387_8B6D53C3 
X-CRM114-Status: GOOD (  16.35  )
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


--FxJ1Bes51ilW0HN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2025 at 10:25:29PM +0200, Heiko Stuebner wrote:
> Contrary to how it is implemented right now, the usb480m clock is a
> controllable mux that can switch between the 24MHz oscillator and the
> clock output of the usb2phy.
>=20
> Add the needed clock-id to allow setting this mux from DT.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  include/dt-bindings/clock/rk3036-cru.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings=
/clock/rk3036-cru.h
> index 99cc617e1e54..5cbc0e2b08ff 100644
> --- a/include/dt-bindings/clock/rk3036-cru.h
> +++ b/include/dt-bindings/clock/rk3036-cru.h
> @@ -47,6 +47,7 @@
>  #define SCLK_MACREF		152
>  #define SCLK_MACPLL		153
>  #define SCLK_SFC		160
> +#define SCLK_USB480M		161
> =20
>  /* aclk gates */
>  #define ACLK_DMAC2		194
> --=20
> 2.47.2
>=20

--FxJ1Bes51ilW0HN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo3FAAKCRB4tDGHoIJi
0ltiAP9FWMNhoWrVMp0z/pgUZyM0tQBD8W3Hi+tKT+ENQfDz5wEAvhQtk1bN5pLM
OuU0p7M6sggc8PRBtdbQnL66XBSi0Qs=
=+Blf
-----END PGP SIGNATURE-----

--FxJ1Bes51ilW0HN+--

