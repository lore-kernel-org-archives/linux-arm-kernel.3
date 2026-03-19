Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851D41091902
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfLACTZUZWtVGAw3TjaZzObr0eKRQqmLVP7qyYyiYwU=; b=lIRUEPlgPIAGfmqGOG4SZcFuN0
	nn1Ta2oLJ7gFJn91fxrrz0VwDWNvzspNBgvVRFV6MqRaxiaEQkRVG5BId95L02mzN8wWAnf0T7ll0
	2gk32mykec0pfHDut3hIfg9Z+0zSKAS5/ucaWnL2lmZ2BxrZ3Gh453ahw5rAfYZZcMP1jSt8Iq3Tu
	NeovyjQnrFAzezCLng7IsP30r05+qItkY0g+mXVyDG3w7y5mA9T7uvLLy6i6U6q6jdLp3F514rQp+
	upPP/UDIBa401hmjk4zg4VaBWYBqr71TDhVMcS+FOhy3QWJ5527dS9tjCTBmf/M3NEHN/K5SZ+SB/
	zFS43Zhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HWl-0000000BF01-2W6W;
	Thu, 19 Mar 2026 17:51:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HWi-0000000BEzD-2mPd;
	Thu, 19 Mar 2026 17:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773942676;
	bh=IfLACTZUZWtVGAw3TjaZzObr0eKRQqmLVP7qyYyiYwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SNTVM6snbqholmWyT1SBVx/Zvo1taAER2T46QBpKkzHOcA1DXEVX4+rV2shBaarrS
	 6Bkx0EqZjgkBLPPy8MezWstmUN84yp14b+WQO+uv0DI/knOpeJSxSXi6V41bM2cKCg
	 sVyYxcQJncvrHc3Vo3eEWKud0LWLMkTJhcEH2fkVky4UhMbLl86WL+Mq7JOYdByGxO
	 UunprJ7LYUp/2kSTeLWM3YVBWtUPOjNOUgvRdF1R/snfFNV3qx0+IPIVI+Cg05/oOp
	 VYu3Gus0sKjswrK6AthXUVnWyTtwv7fB3g55wHXNpfhC7IyausNkTdT2VlHtRCoyzs
	 c6vt4d29S1Iyg==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D529617E01B1;
	Thu, 19 Mar 2026 18:51:13 +0100 (CET)
Message-ID: <bfdb6cf4a4e201404deaf42e34fac731748d9aae.camel@collabora.com>
Subject: Re: [PATCH v7 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 19 Mar 2026 13:51:12 -0400
In-Reply-To: <20260127024248.18406-2-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-AkToS706KozDmvsPAY7X"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_105120_874041_84B44768 
X-CRM114-Status: GOOD (  15.68  )
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


--=-AkToS706KozDmvsPAY7X
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It used only one clock. At the same time, the decoder

used -> uses

I will edit while applying if no new version is needed.

> supports the vp9 decoding protocol for the first time in single IC.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>


Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../bindings/media/mediatek,vcodec-subdev-decoder.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subd=
ev-
> decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-su=
bdev-
> decoder.yaml
> index 74e1d88d3056..ee2bbbdb2d50 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
> decoder.yaml
> @@ -75,6 +75,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8192-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8186-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8188-vcodec-dec
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8189-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-vcodec-dec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8196-vcodec-dec
> =C2=A0
> @@ -132,11 +133,11 @@ patternProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Refer to bin=
dings/iommu/mediatek,iommu.yaml.
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clock-names:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 5
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 assigned-clocks:

--=-AkToS706KozDmvsPAY7X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw3kAAKCRDZQZRRKWBy
9FOpAP98EeRzL7Xi7yjEibfNaBW5yZ2xRquWc/OBvRk/DEHAVAD9FTu7r6Dks46M
/jxHcyeiE+SqfcGILdh/gknhFteu/Qo=
=GmZQ
-----END PGP SIGNATURE-----

--=-AkToS706KozDmvsPAY7X--

