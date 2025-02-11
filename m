Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE01AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NOc5V5KS7mdTK5h0MxVCa3KEQXZ00a3fJOZR1lMwV4=; b=CwEhBYeoxjb4bDiHbJCV4j96Eq
	QKu+bg0vU5ivk9VZ7EoutBINyXbtP3g9634SbrEyAXF/b/Hr9YCQoKFqV6NVk7ieR+/Da5w/Niv33
	IDFTbbX/t4uxNVCBKnhNb9wZ2fblIYrg1T5pxgBEfos7LdqFOItQL3ENU78Y+qV84hMzeO5GPfgaT
	4RxdzM5mBs3WhLKwRt3yeNFktPVLlytvlNyBvicA1CktyxxV4WgHWVeHIG5kZCyzGHyKqMPhz2qzL
	ypovA8d+qB0EcVVE9Q9FxqkgKirgDqMVSvM3BCpi5PdIG9SeBWRBdN1+My1KCXhCw8kcFwtKxma/W
	1rN6i6cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvQN-00000004vSl-05Lp;
	Tue, 11 Feb 2025 18:55:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuJj-00000004jsh-2lp2;
	Tue, 11 Feb 2025 17:45:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5512CA4080B;
	Tue, 11 Feb 2025 17:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03AA6C4CEDD;
	Tue, 11 Feb 2025 17:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739295902;
	bh=IYEdhM4+0ThJA5HBQ6fog3jXewUj4csh1viDFDkpai0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9k3qkjgL6pH80ogRArHzdsx5uXVtG3u0YUqpr9Ctdj8+/NLeRJVtC5aWh0pv7SvB
	 APDjgEdJa1asJr+n64E1KRS82QrLsBOg7I7gWcqBKST5xUPZTywIQWHpEazNJP+rXP
	 SKyFInhbhBCQAv0NGotAeReU9GsYfF8ehoC7j7gh6mJ9RIfaMJ6qWR0aXnrQUo3VRX
	 OP2yNSSM575zXmwMDf7zWU9HICS1E8X2R1bNrXMiAPrIiyguUQZ1p4Djdojc1Bljwp
	 qvfECtxwWS2LzSLesxKSpzS/kunHUNnQ2trVkqP7xU6ByRY95YsKOT9yGqfvCwCmaD
	 kBDXUVqY2dOlg==
Date: Tue, 11 Feb 2025 17:44:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen <sunny.shen@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	"Paul Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/5] dt-bindings: display: mediatek: postmask: Modify
 rules for MT8196
Message-ID: <20250211-darkened-justify-f559a0bf2a81@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-3-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AN5oWCXPj8Gvwucf"
Content-Disposition: inline
In-Reply-To: <20250211025317.399534-3-sunny.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_094503_767891_6F434F4F 
X-CRM114-Status: GOOD (  13.35  )
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


--AN5oWCXPj8Gvwucf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:52:51AM +0800, Sunny Shen wrote:
> Add a compatible string for MediaTek MT8196 SoC

$subject and $body don't match here.

>=20
> Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,postmask.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek=
,postmask.yaml
> index fb6fe4742624..29624ac191e1 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmas=
k.yaml
> @@ -27,6 +27,7 @@ properties:
>            - enum:
>                - mediatek,mt8186-disp-postmask
>                - mediatek,mt8188-disp-postmask
> +              - mediatek,mt8196-disp-postmask
>            - const: mediatek,mt8192-disp-postmask
> =20
>    reg:
> --=20
> 2.34.1
>=20

--AN5oWCXPj8Gvwucf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uMmAAKCRB4tDGHoIJi
0q/GAQCeCuVWfWkn+7Uog5I98DkIcobNbcbPvlOVI5tiUcEtDAD6Amsq2F0zICow
GXQ53Xxni3csTCSSopUVF4waDJeG3QA=
=UYkB
-----END PGP SIGNATURE-----

--AN5oWCXPj8Gvwucf--

