Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF7CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZXM85LzUN1S9RuETzRQRWeG480lhQN5Z2f49tA8IVw=; b=1p5oGa6UAc4WSIsu61OGkg3S7d
	NmiVkn1F1NQL/f3r7mBhjXSdKRuBbnWPZwG80/pM83yL4MO+vgVjOklRzh1X6DKhsslZWdZI6XXG4
	a+llbXwT4/aZVu7XdNLhQirH4ZXfaXkQpwdfr2AIlkrfsH5J7r6EB+FLj0olsFVCnFIsPE3H4VQwY
	u3gER4kLsr1W178tSAftycU+/Hy6rKcZPIfcq18R/U3xuZW4jwr73RnwwFv+eJJ5SZMgLcL4ELmfT
	ee7G88jH4WM6d63l84vdk4nLVZo0Pb9wkLtKlB2bVb9CF0ZD+FOpy9391fZ1QAoWJGS/0TFbYsyuS
	tNXbOBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1HU-0000000FjNA-0vHP;
	Thu, 06 Nov 2025 14:48:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1HR-0000000FjMi-3rWJ;
	Thu, 06 Nov 2025 14:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762440482;
	bh=NVoG3xWPvFWyuV2+Q1vbOfMzlKfY/nHbZuN7h+LhVCE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=P8Sv5o1Kb09LlCaWkB+QK7hoSOb16P0TO5TFjuDulBvhJRcJkGPowf8PaKnBxRJdG
	 V2YobvLU02bh8dJcu0Gf+dMocbbQOKJbRyczUiBFfL90h+f5yEVW7yqOTCXU/vVGGv
	 5adodBHM5VC44k3x8MBmzUTIuIr+YHZc4LjF1SkRrgzv4zOhQlclVxVrLxlLe4rOUL
	 8bS8LeSNZM64HoNojXzX2AlyOJ8PESU304M5KdQ8DnTiMKWA8wHAAKxZQNkP8YcEZK
	 Jr7FHovQBnYRLW7uNCLuJacBtpE99T2SR12WKzNvMqpAXs4GmGHTYXMTX6JMjPGD0I
	 FISUbrf33E2lw==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9746D17E0CA1;
	Thu,  6 Nov 2025 15:47:59 +0100 (CET)
Message-ID: <b5daa900a1af6f379d5fb9757d2712102ca0fc51.camel@collabora.com>
Subject: Re: [PATCH v5 6/8] media: mediatek: vcodec: fix media device node
 number
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
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 Yilong Zhou <yilong.zhou@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 06 Nov 2025 09:47:58 -0500
In-Reply-To: <20251106061323.2193-7-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-dw0k1cyaTR4cTZonInhf"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064806_129690_AE8B81E3 
X-CRM114-Status: GOOD (  14.69  )
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


--=-dw0k1cyaTR4cTZonInhf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

fix -> Fix

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> change media register device node number to a correct value

You already say that in the subject, the description should explain why vfd=
_dec-
>minor was wrong.

Nicolas
=09

>=20
> Fixes: 41f03c673cb7b ("media: mediatek: vcodec: replace pr_* with dev_* f=
or
> v4l2 debug message")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index fca60e81e3c7..f3e49597602a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -516,7 +516,8 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0			goto err_media_reg;
> =C2=A0		}
> =C2=A0
> -		dev_dbg(&pdev->dev, "media registered as /dev/media%d",
> vfd_dec->minor);
> +		dev_dbg(&pdev->dev, "media registered as /dev/media%d",
> +			dev->mdev_dec.devnode->minor);
> =C2=A0	}
> =C2=A0
> =C2=A0	mtk_vcodec_dbgfs_init(dev, false);

--=-dw0k1cyaTR4cTZonInhf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQy1HgAKCRDZQZRRKWBy
9BVgAQC+iAI0ZqnWQqu2KvJUTK7prLEhAUHzmKwd9pG9Nx+E7AEAo7bjfYGdm8u7
z40OWyl6fz38vMuFu2rqg/NIamcIKwQ=
=vTvd
-----END PGP SIGNATURE-----

--=-dw0k1cyaTR4cTZonInhf--

