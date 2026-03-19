Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40BE1091916
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJc82/8eM3kVxshNmxbCcuC7mGyl2ALhI0FOpd/mDSk=; b=2rrWayVZSG27s3Pt3MeMC+gPyj
	xZOv4i6ZLUfhKQUYGmHMDCkk+0VyhW3ZEkci/JcGZ+eJx+nwkD5FYL1xA8l49nNNY5MeoWO1cgvqQ
	SuBBCoMiLgLeEcx97lKmwCddVxkwmfA1ldHwVXQXR4ebiOHocXEnu017OGHjs31CrOLge4zYMK1LS
	HMy9rMLdHDM2P430ZRjk3tghf5FKD7AURbWsbga/6SK7yUJkJeVnYi3xeSml0MynkQx23KFLborTJ
	6YZE+ZnU8cQxCXvfZIUyQqgK+pVeQpE1VYBNt0gK5yV4kG/ZuWokHuUAHOyirlnB8goJ70nd8u4T7
	IsZWG2xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JoA-0000000BWBw-0Mbl;
	Thu, 19 Mar 2026 20:17:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jo7-0000000BW9K-0ECh;
	Thu, 19 Mar 2026 20:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773951444;
	bh=SJc82/8eM3kVxshNmxbCcuC7mGyl2ALhI0FOpd/mDSk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=XSn1UM0iMvGkIMuXoM2z3x7folqKQErwqtBMI9oBsak16upaIuzzNgOl6EzCBLAfH
	 mpoPqZ7DjyK/cCE7f8F3bWTuJKhSYJ54UyhJgZaIem4fGZr/skHi72K31lXuDUQRPU
	 BlOS+PeRcSfXDHRo+IIIZzuNSBf3zjRwJ9/bj2SeHFUtER+fIncBDlHJ6spw/6UmNY
	 g6HS5JNO6R1SsSxzZcweXNy007VW/dP/GnIV6sL7NyDGnMbHl7RW3nCrtjfhlQ22/c
	 0w9//wKoZYnDqJj4KnJJWmakHNSmLo4r6nHWtfnfmYm/RsberLWKd5VuTdMF0bIk5X
	 +3hfjF+G2XJ9w==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F7A517E0CF3;
	Thu, 19 Mar 2026 21:17:20 +0100 (CET)
Message-ID: <23f0c1f7a9656562d2be6c1ef3439f484ac76f92.camel@collabora.com>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mediatek,vcodec-encoder: Add
 MT8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	wenst@chromium.org, angelogioacchino.delregno@collabora.com, Tiffany Lin	
 <tiffany.lin@mediatek.com>, kyrie wu <kyrie.wu@mediatek.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Maoguang Meng	
 <maoguang.meng@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 19 Mar 2026 16:17:19 -0400
In-Reply-To: <20260302035244.8994-6-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
	 <20260302035244.8994-6-irui.wang@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-bBjSb7ezX0aFK1Nuxe2Z"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_131727_250268_96468B5D 
X-CRM114-Status: GOOD (  15.57  )
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


--=-bBjSb7ezX0aFK1Nuxe2Z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 mars 2026 =C3=A0 11:52 +0800, Irui Wang a =C3=A9crit=C2=A0:
> Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
> for firmware management. Unlike previous platforms that use SCP/VPU, MT81=
96
> requires VCP to load and execute the video encoding firmware, with the
> encoder communicating through VCP to perform encoding operations.
>=20
> Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
> the "mediatek,vcp" property to reference the VCP device, which is
> required for MT8196 encoder operation.
>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Please, keep the bindings early in your future patchset. I need read the bi=
nding
first to understand what is the code pulling from the DT. I'll move when
applying.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 22 +++++++++++++++++++
> =C2=A01 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> index ebc615584f92..72698456374a 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yam=
l
> @@ -24,6 +24,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8188-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8192-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-vcodec-enc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8196-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8186-vcodec-enc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-vcodec-enc
> @@ -58,6 +59,13 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0 description:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Describes point to scp.
> =C2=A0
> +=C2=A0 mediatek,vcp:
> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/phandle
> +=C2=A0=C2=A0=C2=A0 description:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reference to the VCP (Video Co-Processor)=
 device that loads and
> executes
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the video encoding firmware. The encoder =
communicates with the firmware
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through VCP to perform encoding operation=
s.
> +
> =C2=A0=C2=A0 power-domains:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> =C2=A0
> @@ -76,6 +84,20 @@ required:
> =C2=A0=C2=A0 - iommus
> =C2=A0
> =C2=A0allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8196-vcodec-enc
> +
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,vcp
> +=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mediatek,vcp: false
> +
> =C2=A0=C2=A0 - if:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:

--=-bBjSb7ezX0aFK1Nuxe2Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxZzwAKCRDZQZRRKWBy
9IqXAQDF76U2cvFTsz2ZaZxdPMcC9u+fE/gNu8I5yWnHNbtYIQD/WcXLJEafGTUM
XIIWRgQEBp85aiMUpBpYHVj4Ms6qdwE=
=NuJr
-----END PGP SIGNATURE-----

--=-bBjSb7ezX0aFK1Nuxe2Z--

