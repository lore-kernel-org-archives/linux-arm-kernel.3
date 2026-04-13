Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F72F34C62
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiB2JUcWKoxdITPz0J++ZvNF9aYSvcMa8rHzJjTfZp8=; b=qlOCZ3+ytrjHqytBpcpZFQ7p9v
	Xt2UICn1R3/HzoAs27Qc+9zZUU/EsbHZ0OcvGKBfxhuScwWA7LDaD6xDQ0G0mo6h4IEnOe5s1kfIJ
	LyUb6trlCQfC9bVWLKSwub1GHuvp4hRdj0YzZkJpcN+d68oa2bXL5AKpfFrooB7aCw1jCOdT1/eMs
	9oByqhR/01InJxFJIrExqHpBZOE7fnbGnf6Op4dvXIDGM9J9lFTBJ3EpUf/9ZyLkQgLcOvsREELEX
	Um5xbrNbvB9iVRW+RVqR8IBW+At8UAnyKr9ifvbU6QeN4IoPjmplEvjjUVz2fJMjjZ646R9kocAf2
	CKDR/K5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJOc-0000000FzNu-3COP;
	Mon, 13 Apr 2026 15:40:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJOb-0000000FzMc-2PD3;
	Mon, 13 Apr 2026 15:40:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87AF36132F;
	Mon, 13 Apr 2026 15:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8ECC2BCB0;
	Mon, 13 Apr 2026 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776094816;
	bh=aHXOlXLBnV7UlZptakys60ytQxlgey+InItFueoAcSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgoiIU9YXAMhhNLWe3EcROUjkJ92dAczKRrGN8x818+HdXazyrKifc4vPovBPpc2q
	 z4f2t3yT7t3mpN1nJX1oRYGQMEIDoP/kZkbPonOdsTBrdyelYXeKaoQsk+QbGc+J4F
	 BeveV17gfW/AZhLZ7kkdHgqP4sLatl+34CIB6wvKBxKEAlYzUJY/0jGCb3okCh1r0V
	 eF0KFFeDSEjh5Q8EaBi9Gj18dVGr5o7/OT6+3cpAvHa8/OQR+W12GEznPNSZJ8rIrU
	 WGrYdigOz8U1o4UawHqQ4QdzW2AZmtDV2MR2gu815MoH4OM6s95wt4xg+fMhw3LZ/0
	 6aAwj8jtTnCBg==
Date: Mon, 13 Apr 2026 16:40:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] dt-bindings: phy: mediatek,xsphy: add
 property to set disconnect threshold
Message-ID: <20260413-disorder-quote-8d8ee49c97eb@spud>
References: <20260413122836.4848-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOeBsFTfE7j7c4kz"
Content-Disposition: inline
In-Reply-To: <20260413122836.4848-1-chunfeng.yun@mediatek.com>
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


--zOeBsFTfE7j7c4kz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 08:28:35PM +0800, Chunfeng Yun wrote:
> Add a property to tune usb2 phy's disconnect threshold.
> And add a compatible for mt8196.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: change property name
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml b/=
Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> index 0bed847bb4ad..9017a9c93eb9 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
> @@ -50,6 +50,7 @@ properties:
>            - mediatek,mt3611-xsphy
>            - mediatek,mt3612-xsphy
>            - mediatek,mt7988-xsphy
> +          - mediatek,mt8196-xsphy
>        - const: mediatek,xsphy
> =20
>    reg:
> @@ -130,6 +131,13 @@ patternProperties:
>          minimum: 1
>          maximum: 7
> =20
> +      mediatek,disconnect-threshold:
> +        description:
> +          The selection of disconnect threshold (U2 phy)

Why is this unitless? What does the threshold represent? Time? Voltage?
Something else?

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 15
> +
>        mediatek,efuse-intr:
>          description:
>            The selection of Internal Resistor (U2/U3 phy)
> --=20
> 2.45.2
>=20

--zOeBsFTfE7j7c4kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad0OWwAKCRB4tDGHoIJi
0iK6AP4y8shTRP4IN/Atsh6JGHHKZgJ2BIXF2x//7klI+p459QD+PzeOECp3Gcpt
89sWMn/MpBwodYWGyX6lMwuCOCM6MQ8=
=kOMk
-----END PGP SIGNATURE-----

--zOeBsFTfE7j7c4kz--

