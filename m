Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA4BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2guLfHLq8KkNOs3vBvq0qt1lbcRSBFALv2VaL1e50rk=; b=vpqzWaafV/5Eao+m3ElYqfVNef
	9BaMNWT4qdtuxCc/TO4qejnNm/7Nm++oLl9qqN3hpWl2q69uyR+3K0/vDpL8KiWllmHoxVUcZrtt5
	ki1jKpCxWAjRCcKpw3JsReGu/m4Or5KSKlxoJvi7v3OD4cCEVm0r8gQExNgK3Iy4w6F4nJhmY/m/x
	lmeuJTcEgh3xGHIT7K4bHBBsreldy9I2qeB9F1u4BRk+p45Rz1TF2MfIiC/9WUETGoBPTf/AWELjr
	kDl9XV3JER2NJxCbW/MHbVkJGzDVHlNr+ERKuswUtbwTVQGGruMwdKn0ccG4rwXTf8r1QXYTkVCEm
	7Krpahzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZ7-00000006kKc-2Rbf;
	Mon, 20 Jul 2026 12:57:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnZ5-00000006kK7-1s2L;
	Mon, 20 Jul 2026 12:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784552264;
	bh=XOI3UUYupPLCpWBSsQqfHAr1CvdI1f8l2o6lC3lZts8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GcsDs6pXd8s+gYeiCf1aPHpsTsHzPGRXDF8gFw2vnN1tpI2/CE5100GRmRE2F0STD
	 ub3LkI/Zl8ccKKkTxEX/RMTHc2HJ08vZk0ltMY2Hs9ZpCArkfyBn+QpGVwAIdN0ynP
	 XIXOIf+KaOCwTB7yyLriQC40VF3ze+sT3bfi06surBpjPZdZzgnLH1CdMF/6P1+RXq
	 VfaWKfamhcRA+RsgWqpoNBivuIOmGwD+BXslJPU4vUO+po42gLI9/7N/SC8ZBkoRdS
	 ut4iXdcu2wkYmLPcI/+BCAAAWZX2NnSI8o4SiLYg2McNTGnjkttZr1gI9aLPApQrH5
	 1cwdaaz7EkBtA==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 783B317E0CF1;
	Mon, 20 Jul 2026 14:57:41 +0200 (CEST)
Message-ID: <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil	
 <hverkuil+cisco@kernel.org>, Fei Shao <fshao@chromium.org>, Haoxiang Li	
 <haoxiang_li2024@163.com>, Chen-Yu Tsai <wenst@chromium.org>, Laurent
 Pinchart	 <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
 <tfiga@chromium.org>,  Sebastian Fricke <sebastian.fricke@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Qianfeng Rong <rongqianfeng@vivo.com>, 
 Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Fan Wu	 <fanwu01@zju.edu.cn>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 20 Jul 2026 08:57:39 -0400
In-Reply-To: <20260720012056.1026551-2-kyrie.wu@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-KtTi+1OEhpzib4UJmvnN"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_055747_642545_3094486A 
X-CRM114-Status: GOOD (  17.69  )
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


--=-KtTi+1OEhpzib4UJmvnN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 20 juillet 2026 =C3=A0 09:20 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Some platforms expose the video codec through the VCP coprocessor.
> Use the VCP architecture when the VCP coprocessor is found.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> =C2=A0drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=
 | 1 +
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A02 files changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 300363a40..c1642fb09 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -14,6 +14,7 @@ struct mtk_vcodec_enc_dev;
> =C2=A0enum mtk_vcodec_fw_type {
> =C2=A0	VPU,
> =C2=A0	SCP,
> +	VCP,
> =C2=A0};
> =C2=A0
> =C2=A0enum mtk_vcodec_fw_use {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8df..d220b645e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -379,6 +379,9 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,scp"=
,
> =C2=A0					 &rproc_phandle)) {
> =C2=A0		fw_type =3D SCP;
> +	} else if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vcp",
> +					 &rproc_phandle)) {
> +		fw_type =3D VCP;

I know I gave an rb a while ago, but then we reviewed the 8189 code, and we
underlined that this makes little sense, and that fw_type should simply be =
set
in the pdata. Same applies to mtk_vcodec_dec_get_chip_name(), the chip "nam=
e",
or integer form of, is clearly a 1 to 1 match for pdata.

Nicolas

> =C2=A0	} else {
> =C2=A0		dev_dbg(&pdev->dev, "Could not get vdec IPI device");
> =C2=A0		return -ENODEV;

--=-KtTi+1OEhpzib4UJmvnN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCal4bQwAKCRDZQZRRKWBy
9L56AP9HNuiSW6OKBf4FGIVzPFeY7CiBhatTIUOtX2+AES3SNAD+OZwDqsqo0HW1
/HGx/dzNoYGc/t27JkKvtPVz+/iVhgM=
=f1cM
-----END PGP SIGNATURE-----

--=-KtTi+1OEhpzib4UJmvnN--

