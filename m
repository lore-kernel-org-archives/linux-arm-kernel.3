Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D011D43343
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qw2IhZlfosDTtQhR76WxRRqVpcH8s+9QhHY7zmTxpk=; b=AXDN4bVZzIcFQ5AHph434g1yKh
	rx6vJ4pgIr8BdS58PWkO/yXucfYeuumNKQYk+PzFNoV3GWKDLXwTLnxj161vApdQztKe3ayGfWgcg
	TXJq2+TgkGItIKgHS9nuimLisVGlcFw+Bv8rCOGCYf5F8SQv/Pjj5uRe0Zvg0LJrSsRC20/9rYUhi
	cLm6UlDTBS5LA4l8vq6Y4bbKgyqW6OLEmTi7cbqFwcqlu7+/yRs/n+UsRRqdDLU0m0cGlMFrSULfm
	5LrnUZWI5hN3GkFxj+NM/dtB1mXv1VtfW1AdilRNs30fGyegjRLPP/+Ok9fAPwDaAZQgqJiWy8J3o
	fxKA1H1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnLn-0000000HEpz-20f8;
	Thu, 11 Dec 2025 20:33:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnLk-0000000HEpJ-0X5X;
	Thu, 11 Dec 2025 20:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765485198;
	bh=EvpYuyMSWW3rPM+EGfSJa8//Qidk0b3Vfk2GRGHLY/8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qSgy7wK8Med80K3RHWdGGbsNc01bbVk8oyulgtDCqZ18UKke5cVBpfamdj+eL/px9
	 232jaEUiSodL5/lityZjQPvTCUAyfASW+rB9OwCYExIaptoH8hSK1RFeZ1PGBdU4Nf
	 QK+oMPWdEy1WiEsL3fph3YGPg6yngR1878YyBcyiv/eVf6RaImytPZwbTtifC7iMdJ
	 xUN86NF67aCktfxkAwa3xiHwuYSS9eHRbrEd3t3gMZNjzLVPSVXhHb/ntdthXMUlx8
	 AHnzFppiC+WsZQ35X0gwQ+eYrG7IP1QTJv3L/CKhEQC79Gakr35s2xEkL+FMHDD1mJ
	 EIto9JjnR+Dtg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81F9217E00A8;
	Thu, 11 Dec 2025 21:33:15 +0100 (CET)
Message-ID: <66cb982fd78c85a33006647e0d2f1fe4b0c10a86.camel@collabora.com>
Subject: Re: [PATCH v6 08/10] media: mediatek: vcodec: Fix media device node
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
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:33:14 -0500
In-Reply-To: <20251202074038.3173-9-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-9-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-aFzqfli/yHis0bwpWqQX"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_123320_325423_E75ADD8D 
X-CRM114-Status: GOOD (  14.81  )
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


--=-aFzqfli/yHis0bwpWqQX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> change media register device node number to a correct value.
> The vfd minor is used to record the number of registered
> video device nodes. The mdev_dec.devnode minor counter is
> used to record the number of registered media device nodes.
>=20
> Fixes: 41f03c673cb7b ("media: mediatek: vcodec: replace pr_* with dev_* f=
or v4l2 debug message")
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 2d1a545e727c..bf6e792283a1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -493,7 +493,8 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0			goto err_media_reg;
> =C2=A0		}
> =C2=A0
> -		dev_dbg(&pdev->dev, "media registered as /dev/media%d", vfd_dec->minor=
);
> +		dev_dbg(&pdev->dev, "media registered as /dev/media%d",
> +			dev->mdev_dec.devnode->minor);
> =C2=A0	}
> =C2=A0
> =C2=A0	mtk_vcodec_dbgfs_init(dev, false);

--=-aFzqfli/yHis0bwpWqQX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsqigAKCRDZQZRRKWBy
9BiiAQChjhkDmde9orwBZUQR53EQisAKugo3JziXe89mHCSXogEA3BhPJG3ZcoKW
icu7bE/fmHm9hzaHSWtMw21RcYsPtQY=
=cn28
-----END PGP SIGNATURE-----

--=-aFzqfli/yHis0bwpWqQX--

