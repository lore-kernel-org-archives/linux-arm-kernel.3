Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA01CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4Swvm6t30TKp3PUMGED3d9NNBiRV7uTCu2p5L3Ws8o=; b=X6XYdsFhvwlBiJPdnYNrQp+h9r
	hTTEMRYYb2659KwLzWkilhHUg8l2MxZr6Zk+8qoY2HsmyCkJ6jjxqjnohaduyianphju6nnNqThZx
	Bux0bip9pehFmonIkt1iFuMClFCbpHCWrRUJTHsW5OXBPJuCXWjuxv+wzpkGKHutsFlGmjs7+PJuD
	wbTJtWuN71gs8cnnHcmHu8AatQ4EUrxV/g3RsJNF9THm5UcPWrWV2h3YMPdtwoWXkUp1kYpAd5sV+
	PjpOe5seqRqG+YVts/q+3/V5tMyPYMfvgZFeKddO69u/hmuI2RT2/OuRvK9AvoHkUBFXCNYKxifob
	ZkcdyoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTB0-0000000E9VP-3jr9;
	Mon, 11 May 2026 16:08:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTAu-0000000E9Tr-1oQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:08:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22102400E7;
	Mon, 11 May 2026 16:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC861C2BCB0;
	Mon, 11 May 2026 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778515688;
	bh=4+YVwqftH/V2MQCzm5/4uWvWWj0IF+tYzH9cTaeGnB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcyoECn3uwj9icUZTdLM2oZLlxskv9hv3vwvurnDLBm17tgRhl4zjK9k7Xupv/OeF
	 6ZbpVJpK2A3mdTEzz3chZWb45kSRcLk+9yXKwes2pMojxoVfz8MIgr/NFKmDeuhJuy
	 TcdtszJuL2xnu9t4pmEhzH3Qsbkl3TATQk5ZvrDsUxCFxvKLyAXhY6TrHQVKjnLuZa
	 xvbZQrdzYeqdBJpvK8BSx0uWjuuDwA9fe5WeJJXLLtb0kx+ccAiOTNOO30hMt887U/
	 5B+8w7Dx91qIm7lC+gBNC/ytMrvSxI5VEZVqCWNv+mI1LMfORMckifnoki1wygF0Sr
	 r5MljoMs26PTQ==
Date: Mon, 11 May 2026 17:08:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: sunxi: Add Baijie HelperBoard
 A133 compatible
Message-ID: <20260511-stock-elitism-f1f703bee1a3@spud>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CPp9akVKR9jELSsV"
Content-Disposition: inline
In-Reply-To: <20260510201644.4143710-3-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090808_487857_53A8FDE5 
X-CRM114-Status: GOOD (  16.57  )
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


--CPp9akVKR9jELSsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 10:16:39PM +0200, Alexander Sverdlin wrote:
> Baijie HelperBoard A133 is a development board around their A133 Core
> board. Introduce a compatible for both the Core and the development
> boards.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>=20
> Changelog:
> v2:
> - introduced baijie,helper-a133-core compatible for the Core (SoM) board
>=20
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index e6443c266fa1..d7b9dec81165 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -96,6 +96,17 @@ properties:
>            - const: allwinner,ba10-tvbox
>            - const: allwinner,sun4i-a10
> =20
> +      - description: Baijie Helper A133
> +        items:
> +          - const: baijie,helper-a133
> +          - const: baijie,helper-a133-core
> +          - const: allwinner,sun50i-a100
> +
> +      - description: HelperBoardA133 Core
> +        items:
> +          - const: baijie,helper-a133-core
> +          - const: allwinner,sun50i-a100

Does this make sense? Can the core board be used without a carrier?

> +
>        - description: BananaPi
>          items:
>            - const: lemaker,bananapi
> --=20
> 2.54.0
>=20

--CPp9akVKR9jELSsV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagH+4wAKCRB4tDGHoIJi
0mW6AP9DvfuKHTGqz4JjMkDtxaKdGP8hPEdcpm8cQNXqDnoTQQD9G1ABhg2nfzHt
F+3oiyL/9EdspccM1fzQwf1GeYZDWQ8=
=s5Ca
-----END PGP SIGNATURE-----

--CPp9akVKR9jELSsV--

