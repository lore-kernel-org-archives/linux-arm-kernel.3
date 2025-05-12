Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2067AC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TR5pQsLRL+KkB8e+AFq8L8FcaN+HbuPLVF/5xFaLMvE=; b=GbC6khrhFtBcqt2ypp6yyfGn0K
	unYkEreWprsvVfIzwjXB/N0iisrF/62Iv0VT4wY3AouQmCaiUFfneQSlb3Hwm45g+15XrXlVyCaLR
	q4YUs4FI9jCKJAOQvLo+HOzoQtkG8ODw9Aw13tXgkQ4oXMcpvmrZDWmo8yfHUVQs+677HvO93Gxrn
	FB9E92/KhIXZtZkapK6f/5vBKWAQ8u6VMYpkvHbDutRJ4UBE8t3tFhWMZX1tuYEybINsjNqxK8Zej
	K+1NlcWexzHGpC7MC6wjhHN5hi9UY9y5Fxh8QZTUjp5oE1prDDhTzrt1pHTOY5e3WYqZA9NEp3t8L
	mkthsXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWOx-0000000A7eZ-0B9u;
	Mon, 12 May 2025 16:53:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEW6a-0000000A3x6-1UaM;
	Mon, 12 May 2025 16:34:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE2E5C4A84;
	Mon, 12 May 2025 16:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE71C4CEE7;
	Mon, 12 May 2025 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747067655;
	bh=Lk35CP8LZmPslpsnxWnA0SM9IdKc0rO8t7ScWnmdFIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmcUDIuuOHPFo4k8FQ8G660Ixz6AEAHLKmXznOPhu0w0IXzB0oyIo5gjHB01vB9kf
	 ZchRsFHHKQpLt/VVANRBPVZYqXRTnWqWPU2zcKLHTDYvIFv+ul1xY9uXlOi+LLHf8y
	 xRxnBw/xgR9adwcF8zmQdxatg3PK6EFXJ2biKECNfwpjjj23ICfFDJN9koeofULoXz
	 XuC8I/qBi3Yfm/PMN14RdTUPyyU3m7vlaL0agLpC8441DvNvEHz6qoA1JqeSwdPxhs
	 54zCmta26CjV6GuGl2lZY0SkCTFwvn0gh9nwUYc65IV8w/jgTA5/JOjfAqwyjSQf2h
	 SbTXqSvYG8BIw==
Date: Mon, 12 May 2025 17:34:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 01/14] dt-bindings: media: mediatek: vcodec: add decoder
 dt-bindings for mt8196
Message-ID: <20250512-cilantro-aviation-4328d79e02b6@spud>
References: <20250510075357.11761-1-yunfei.dong@mediatek.com>
 <20250510075357.11761-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sMtwU4b+uIOkGgh2"
Content-Disposition: inline
In-Reply-To: <20250510075357.11761-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_093416_439251_9BE3FF47 
X-CRM114-Status: GOOD (  13.72  )
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


--sMtwU4b+uIOkGgh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 03:53:31PM +0800, Yunfei Dong wrote:
> Add compatible for video decoder on MT8196 platform, which is a
> lat + single core architecture.

Please mention what makes this different from the existing devices since
a fallback compatible is not permitted.

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-s=
ubdev-decoder.yaml
> index bf8082d87ac0..74e1d88d3056 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-deco=
der.yaml
> @@ -76,6 +76,7 @@ properties:
>        - mediatek,mt8186-vcodec-dec
>        - mediatek,mt8188-vcodec-dec
>        - mediatek,mt8195-vcodec-dec
> +      - mediatek,mt8196-vcodec-dec
> =20
>    reg:
>      minItems: 1
> --=20
> 2.46.0
>=20
>=20

--sMtwU4b+uIOkGgh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCIjAQAKCRB4tDGHoIJi
0k0QAQDsVpMhJhlm50bTaTI++/O1PIGlsmy6yib9ZYoDAbRqIgEA3qnCMVVPvuhw
eIG5A1Me4vqECJW3lsXvK002oVvo+gg=
=OPXB
-----END PGP SIGNATURE-----

--sMtwU4b+uIOkGgh2--

