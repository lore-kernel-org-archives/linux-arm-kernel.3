Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10FACA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 14:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=subN9fXal1rbbDmCoh2wFon5oJy0bFXUYgWzXB4tIwo=; b=pCyoJh812IzLtW2Wqe3yD5cveS
	7CDN3lgdi7EWhVUcPns6XtCWQ8y9q53bdCShmWG9ZBOLohvBoyluAwIzs43v2f+EMRY2oZJ6o4MHA
	IqYzIASlG8Gqbhb6U98BGUG/lTY+b8phki6PXLCQAerAy3IwwBSx2H7MAVmaw9L7d4xTT5/C+3O7w
	LkQWD2UUpKg0QQSN8MAQI7NuOrjR/iZXX45F28XPTetxgYBU1izd7qfU0grLJpvzlLago8o5fovQ1
	RJmZGcDuHtvYyj+45eJgV7oLk5/0nsPR0OJzUpmLn5Ndl8NAj6g//RsUKPLv+Mg5ODwgWNV7hJMAM
	A8fsXU4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJ4-00000002aJU-3HiE;
	Wed, 07 Oct 2026 14:07:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESJ2-00000002aIo-2Npr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 14:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E937060219;
	Wed,  7 Oct 2026 14:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB9A1F0089C;
	Wed,  7 Oct 2026 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791382059;
	bh=subN9fXal1rbbDmCoh2wFon5oJy0bFXUYgWzXB4tIwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blYtoeyNV3/0KC1wurnpUt2DCoYu3fxIn9aMCH+z9nKODfOpQRjOix7iZaOGfvYIq
	 TJOJZQJ/H06Irbjva+P5UEz0e66sLmHqJAQuuuPd6/hhflaDk9UCDtYXxsBuumpUoU
	 h/S54ogAvU1G3LwFn1y3/KHFY14s82dvB4kOX9vxE7t+eyeQUcOOHlRZ9JQgjcmmks
	 eFbvWkYXfg6xvRuiwLDpjKd99YoIR8orx6cki3sD5prRXHyguYOpWUuGQlyWGQL4Ro
	 X7qYtgq/zmtzg4ibEwJT54EgoyaqbFfHTz7Z4jtdwJwOf++V8eWm8/O7WfN3IRKAan
	 lUnNCUNHbBenw==
Date: Wed, 7 Oct 2026 15:07:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch
Subject: Re: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Message-ID: <20261007-f8618331a33d736d9343c7cb@squawk>
References: <20261005173308.710986-1-2254650260@qq.com>
 <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BJUr87kyRYlZiMEn"
Content-Disposition: inline
In-Reply-To: <tencent_7F0804BD55E49660DCDB095C80B5330DC50A@qq.com>
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

--BJUr87kyRYlZiMEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2026 at 01:33:07AM +0800, Pufan Jin wrote:
> Document the ALINX EdgeBoard FZ3A compatible.
>=20
> Signed-off-by: Pufan Jin <2254650260@qq.com>

Modulo the prefix being acceptable,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> ---
>  Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/D=
ocumentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> index c9f99e0df..ad7c71f9b 100644
> --- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> +++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
> @@ -46,6 +46,7 @@ properties:
> =20
>        - items:
>            - enum:
> +              - alinx,edgeboard-fz3a
>                - xlnx,zynqmp-zc1751
>            - const: xlnx,zynqmp
> =20
> --=20
> 2.55.0
>=20

--BJUr87kyRYlZiMEn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZSJgAKCRB4tDGHoIJi
0iRYAQCwrSeFH3fkrrAHzKa+WPeGX9Iu7b19J5us6aluCRhOrwD/fMeQwAnSnjOW
7RxEefWTd+r0Ra6ku1RJUFIMFNAmbQo=
=9TV2
-----END PGP SIGNATURE-----

--BJUr87kyRYlZiMEn--

