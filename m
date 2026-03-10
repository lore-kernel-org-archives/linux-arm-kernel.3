Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AF9FD4F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 17:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0toh0IOX8UTVKgXReHT+LAIBjBMlHBFvuP0h0qLImU=; b=2xu2Kz8xBmAyBHNJ+gaWogy9+r
	LNbpWxoC7G7sFipLe8q/VQiVqLvBTvEZIRCQQiYH4K+MHXl+DysAXyLkNVwuoKQZ1/OcjrNLqF3ht
	d+oUewmT92X74049df/4HQzA/4iC8QbrGHOX1xutuKrwb+oLTSBEdUxHIDGpv8xf/QnPR1Qm15yOK
	ZkJfAd4T457nVXCCBEZzc9lyufxraBjOlQHDNlqJ96R8Wo9IxIEuj68ANLjcC0OcHJzcft1y03SNY
	NecuhGpdAXY0zudTLj2l8yYulQMxediixNPcv7dlnDEL6wD2wK7fLMXX25lTbknmzq4NRKVT9TP1K
	gxSf68iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Y1-00000009wve-4ATv;
	Tue, 10 Mar 2026 17:07:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Y0-00000009wvH-3K0i;
	Tue, 10 Mar 2026 17:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E004A60054;
	Tue, 10 Mar 2026 17:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD66C19423;
	Tue, 10 Mar 2026 17:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773162427;
	bh=q7pbf99+I8vUNFAI20TKd98+Bh5cPQ0Gjl2/ZF/p3so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zbb7jjwFJ5WnmP3lX5+PqqT6+Z0xxFe2NV2HPyql4F0XtI7uJML6UXgVOGIXn+NZG
	 0KVdrYXjhg9jp+DCtOFlOIh3qY4Z4HxThkWPZqrLCvZDDlZfAJftrzsboyh3U6wy55
	 Hxi/QCx3A2gFtck89QPZJU9vfEYUeFJpbUJnyJ2l660HntvzZfIG/PyC4Y/RVrprZl
	 qUkit6FQUIXttpo2eGE6iSIgfPaiYOImJ9piF6bjNbOgvUHZboZStQh2xw2aGOmrUw
	 HrZq2IEBSvALWueR2eKj1PyFi/k+ucuNToVAK3jBZ8MApADt3C7EjH6CDRc7JpDecR
	 cdq2ej6yqQO3Q==
Date: Tue, 10 Mar 2026 18:07:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: airoha: en7581: Enable spi nand
 controller for EN7581 EVB
Message-ID: <abBPufvrG8I8UP69@lore-desk>
References: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mnhLociRa4wDMSFh"
Content-Disposition: inline
In-Reply-To: <20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org>
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


--mnhLociRa4wDMSFh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Enable spi controller used for snand memory device for EN7581 evaluation
> board.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi all,

it seems this patch has been reviewed by AngeloGioacchino, but it has never
been applied to linux-mediatek tree (or at least I can't find it). It is ma=
rked
as 'New, archived' in patchwork [0]. Am I missing something?

Regards,
Lorenzo

[0] https://patchwork.kernel.org/project/linux-mediatek/patch/20250225-en75=
81-snfi-probe-fix-v2-1-92e35add701b@kernel.org/

> ---
> Changes in v2:
> - Clarify the commit title
> - Link to v1: https://lore.kernel.org/r/20250225-en7581-snfi-probe-fix-v1=
-1-77e4769574e4@kernel.org
> ---
>  arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
>  arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/=
dts/airoha/en7581-evb.dts
> index d53b72d18242e3cee8b37c7b1b719d662fd6db8d..cc69f698c27b804953b1bb671=
e128d4401744bf5 100644
> --- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
> +++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
> @@ -25,6 +25,10 @@ memory@80000000 {
>  	};
>  };
> =20
> +&snfi {
> +	status =3D "okay";
> +};
> +
>  &spi_nand {
>  	partitions {
>  		compatible =3D "fixed-partitions";
> diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts=
/airoha/en7581.dtsi
> index 26b13694091735da7af977e42f8f546d7d5cb078..49c061d38d7860b3b41661072=
3791a7a91edcb69 100644
> --- a/arch/arm64/boot/dts/airoha/en7581.dtsi
> +++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
> @@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
>  			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  		};
> =20
> -		spi@1fa10000 {
> +		snfi: spi@1fa10000 {
>  			compatible =3D "airoha,en7581-snand";
>  			reg =3D <0x0 0x1fa10000 0x0 0x140>,
>  			      <0x0 0x1fa11000 0x0 0x160>;
>=20
> ---
> base-commit: 0092294492fafe79a537915e486576a3d69c9a7c
> change-id: 20250225-en7581-snfi-probe-fix-c325bedded9e
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--mnhLociRa4wDMSFh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabBPuAAKCRA6cBh0uS2t
rP1ZAP9kz75TUPNM3K4TxCKoN3dziQZVGLiekwemyNCDMk61hgD/cGH1CQa3sWRw
8uwjHH6ikCDSNHqAVXd8Ck69JVtDRQM=
=Kql2
-----END PGP SIGNATURE-----

--mnhLociRa4wDMSFh--

