Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC28D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 20:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZOh+4UqKyKnOB97MrAtHE3mdPsdwdRktAkTOxlTxtk=; b=U12TNvelyxgziqjmWYuIXTyItV
	2io684K7TiyuaS0/WAKtq9oJ7BiBfetqe7lyTIFH7m28VL6TobuMPdy1oFZvvf/rS3Fzzsz+nQuN2
	g9WOXj34SoBjNeqcoYE/C/FtsN8L66pXu+GTypdF4Xg7dqGD+VCVYsneLIcYDZxsDWk7wN09jUmlf
	6a2jkXk4fESnZ4okreEmGlHPuIL8d1m9I8l+qU+PHaEn2HJi2ARyQ95pKqHkCl/+shweMdMMda8kt
	067GrrOlbPRHgxvvsiRT4aIQZ7pcptUGoiSDjv6cT2SFslTIW1BvOCwf8I7Rq76IsfhcFT8A5WmvW
	OAaVf/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4vz-00000000szx-2lsx;
	Fri, 28 Nov 2025 20:19:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4vx-00000000szX-0OUr;
	Fri, 28 Nov 2025 20:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764361150;
	bh=wpo2+weHSX8oj/L1limDB+C3po/kuYoFVXYlro8pkpg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lhv3WV5n5GKpI1BLZpfSnftVa6NvXLAmTiLWgi8doGNIuQFleJ2dfPawGo1t71WUR
	 erblbFz7jCNpkbqOk9JesmVlJtPnRSe3QGMP442yQ5eLiHkqVc+wCG6r7eCSFVQ649
	 EFNKBXZcGQt+14zSr0VWSYjt73OiJelTknrIBEr2MQQaDDYA+QNmkeWLD1YkVy/2mv
	 yQd5sKqcPRhKQ59AQi6llP/FZUvFqii9VuiVgkAius/Oxz4hmSZYRBtwSVmefkwJsW
	 FSfpNt8wp2XKx4wVaAO3gCmKbbxoUP/RJFoZDlxVB8cYNynsTQDQkaXZf9JjHmmNUj
	 AmhJjmn+tGNMg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D871A17E013C;
	Fri, 28 Nov 2025 21:19:08 +0100 (CET)
Message-ID: <b294ac666dd770177feb4cfdb977ca0a47095c8d.camel@collabora.com>
Subject: Re: [PATCH v2 10/14] media: mediatek: vcodec: clean xpc status
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:19:07 -0500
In-Reply-To: <20250815085232.30240-11-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-11-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-PVkjMw6hmer87v5cx4ux"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_121913_297944_06D1632E 
X-CRM114-Status: GOOD (  18.93  )
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


--=-PVkjMw6hmer87v5cx4ux
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The driver need to clean xpc status when receive decoder hardware
> interrupt for mt8196 platform.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 28 +++++++++++++++++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 13 +++++++--
> =C2=A02 files changed, 39 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index 881d5de41e05..e4e527fe54dc 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -61,6 +61,31 @@ static int mtk_vdec_hw_prob_done(struct mtk_vcodec_dec=
_dev *vdec_dev)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void mtk_vdec_hw_write_reg_mask(void __iomem *reg_base, u32 reg_o=
ffset, u32 val, u32 mask)
> +{
> +	void __iomem *reg_addr =3D reg_base + reg_offset;
> +	u32 reg_val;
> +
> +	reg_val =3D=C2=A0 readl(reg_addr);
> +	reg_val &=3D ~mask;
> +	reg_val |=3D (val & mask);
> +	writel(reg_val, reg_addr);
> +}
> +
> +static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_dev *dev)
> +{
> +	u32 val, mask, addr =3D VDEC_XPC_CLEAN_ADDR;
> +
> +	if (dev->main_dev->chip_name !=3D MTK_VDEC_MT8196)
> +		return;
> +
> +	val =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL : VDEC_XPC_=
CORE_VAL;
> +	mask =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_MASK : VDEC_XP=
C_CORE_MASK;

Avoid repeating conditions, less line does not make it more readable.

if (dev->hw_idx =3D=3D MTK_VDEC_LAT0) {
	val =3D VDEC_XPC_LAT_VAL;
	mask =3D VDEC_XPC_LAT_MASK;
} else {
	val =3D VDEC_XPC_CORE_VAL;
	mask =3D VDEC_XPC_CORE_MASK;
}

> +
> +	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, val, mask)=
;
> +	mtk_vdec_hw_write_reg_mask(dev->reg_base[VDEC_HW_XPC], addr, 0, mask);
> +}
> +
> =C2=A0static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
> =C2=A0{
> =C2=A0	struct mtk_vdec_hw_dev *dev =3D priv;
> @@ -88,6 +113,8 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, vo=
id *priv)
> =C2=A0	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
> =C2=A0	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
> =C2=A0
> +	mtk_vdec_hw_clean_xpc(dev);
> +
> =C2=A0	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
> =C2=A0
> =C2=A0	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=3D%x",
> @@ -166,6 +193,7 @@ static int mtk_vdec_hw_probe(struct platform_device *=
pdev)
> =C2=A0	subdev_dev->hw_idx =3D hw_idx;
> =C2=A0	subdev_dev->main_dev =3D main_dev;
> =C2=A0	subdev_dev->reg_base[VDEC_HW_SYS] =3D main_dev->reg_base[VDEC_HW_S=
YS];
> +	subdev_dev->reg_base[VDEC_HW_XPC] =3D main_dev->reg_base[VDEC_HW_MISC];
> =C2=A0	set_bit(subdev_dev->hw_idx, main_dev->subdev_bitmap);
> =C2=A0
> =C2=A0	if (IS_SUPPORT_VDEC_HW_IRQ(hw_idx)) {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_hw.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
> index 83fe8b9428e6..50ce6c1d25a2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.h
> @@ -18,17 +18,26 @@
> =C2=A0#define VDEC_IRQ_CLR 0x10
> =C2=A0#define VDEC_IRQ_CFG_REG 0xa4
> =C2=A0
> +#define VDEC_XPC_CLEAN_ADDR 0xc
> +#define VDEC_XPC_LAT_VAL BIT(0)
> +#define VDEC_XPC_LAT_MASK BIT(0)
> +
> +#define VDEC_XPC_CORE_VAL BIT(4)
> +#define VDEC_XPC_CORE_MASK BIT(4)
> +
> =C2=A0#define IS_SUPPORT_VDEC_HW_IRQ(hw_idx) ((hw_idx) !=3D MTK_VDEC_LAT_=
SOC)
> =C2=A0
> =C2=A0/**
> =C2=A0 * enum mtk_vdec_hw_reg_idx - subdev hardware register base index
> - * @VDEC_HW_SYS : vdec soc register index
> + * @VDEC_HW_SYS:=C2=A0 vdec soc register index
> =C2=A0 * @VDEC_HW_MISC: vdec misc register index
> - * @VDEC_HW_MAX : vdec supported max register index
> + * @VDEC_HW_XPC:=C2=A0 vdec xpc register index
> + * @VDEC_HW_MAX:=C2=A0 vdec supported max register index
> =C2=A0 */
> =C2=A0enum mtk_vdec_hw_reg_idx {
> =C2=A0	VDEC_HW_SYS,
> =C2=A0	VDEC_HW_MISC,
> +	VDEC_HW_XPC,
> =C2=A0	VDEC_HW_MAX
> =C2=A0};

But otherwise nothing important to report here.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-PVkjMw6hmer87v5cx4ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoDuwAKCRDZQZRRKWBy
9PNcAQC0xYJWSIbsCVtp9HWnYDS6Ucpbn+9ANCGVENm/9vI4GQD/YI4Zo/ZKU78s
MaHkFes9oVv0+AMFSOmy7QR50aJbBA4=
=sSoz
-----END PGP SIGNATURE-----

--=-PVkjMw6hmer87v5cx4ux--

