Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7AB1091912
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXgUNM1WqEBSYH5OPYMq15YhS42Y7xl69pcLMba5WGA=; b=D4O/n/8uE+8eFaHKh69Mdslo1i
	DETHvSUboW/ZGJ0bZebJsDiCXUXMAeDwC3glzutelMZJQAZvOtLZ9/87aKPg7x0flMVAqKcUr49lz
	3pel6hX/nwZYUbCOQJpi9w/3n3pklGm3cWofLDm1isyew3dE1BQNDj928Th037kW5VaICL6uffYR8
	DVDOAlzzEwwTt83gnWFANxVN6LDpEouEc/SnW9A1AjZzMPUKJUkrdqHIlZAybm92dsiTB5BklTLSW
	CxcvNKnrMWjGl0pdHX2v/BZHJxz+swQOjSFLhYGKt46jVtXLbrX7+5Phs/iCIsiZxDV0U5QXz/TcX
	LeehPxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jtf-0000000BWg0-3z8C;
	Thu, 19 Mar 2026 20:23:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Jtd-0000000BWfX-2atY;
	Thu, 19 Mar 2026 20:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773951786;
	bh=lXgUNM1WqEBSYH5OPYMq15YhS42Y7xl69pcLMba5WGA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pNcVqhTR1pAtk+qbMl4ay6KjAzaHftLZF5YUQxD9omsBpHQ9a4M/uDFWQfg3F9rpn
	 pr+jBtHZLvESYB/2JiTtMM1UXGAMOugnZkT1GFnrMPqGojl+G6k0WzIUa6YBUelmlo
	 9sdTyvUifG5xwkoprK7nX3PezKmcU2KoCPv0sLRGGdN7DugxgPxVMVTscPt3XvsoAT
	 R639Hc53QY2QyBMhptm/ecaBYqgdnJAY5901IoYzioW18ielWKTPjqy5wMQg8w4yBg
	 Bij3TqoZfuwf4D/MYUWmkSmnh1oijwC7H4K+JxslBQoaAS5SKDElIe6D6HuZoiFCXs
	 ylP+rOAyYdI0g==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7689D17E0D91;
	Thu, 19 Mar 2026 21:23:04 +0100 (CET)
Message-ID: <8416ef57d9a8f40fabe3f759d5a25ed6aa9787fc.camel@collabora.com>
Subject: Re: [PATCH v5 0/6] Add support for MT8196 video encoder
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
Date: Thu, 19 Mar 2026 16:23:02 -0400
In-Reply-To: <20260302035244.8994-1-irui.wang@mediatek.com>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-QrVUnf/onkkIhx/f124c"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_132310_049421_16167885 
X-CRM114-Status: GOOD (  18.47  )
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


--=-QrVUnf/onkkIhx/f124c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 02 mars 2026 =C3=A0 11:52 +0800, Irui Wang a =C3=A9crit=C2=A0:
> This patch series add support for MT8196 video encoder.
> patch 1~3: Add a new encoder driver interface for new VCP firmware.
> patch 4: Add new encoder driver platform data.
> patch 5: Add dt-bindings.
> patch 6: Add compatible data.
>=20
> About adding new driver support, the v4l2-compliance report shows:
> "Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: =
1, Warnings: 0"
> The 1 Failed case is not caused by current patch set:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fail: v4l2-test-controls.cpp(1171): node->codec_mask & S=
TATEFUL_ENCODER
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_(UN)SUBSCRIBE_EVEN=
T/DQEVENT: FAIL
>=20
> This patch set depends on "media: mediatek: vcodec: support video decoder=
 in mt8196"[1]
>=20
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=3D2171=
8

This set obviously does not apply as it has this dependency. The dependency=
 had
issues, and I just asked it to be rebased on the MT8189 series, which inclu=
de
the refactoring needed and common to both. Please coordinate, the faster I =
get
an update for MT8189, the faster these two MT8196 will be picked.

regards,
Nicolas

>=20
> Change in v5:
> =C2=A0- Rewrite patch5 commit subject.
> =C2=A0- Add else statement in patch5.
> =C2=A0- Link to v4: https://patchwork.linuxtv.org/project/linux-media/lis=
t/?series=3D21757
>=20
> Change in v4:
> =C2=A0- Rework patch3 commit message.
> =C2=A0- Rework patch5 commit with more details.
> =C2=A0- Rebase patch onto decoder's patch set.
> =C2=A0- Link to v3: https://patchwork.linuxtv.org/project/linux-media/cov=
er/20250814085642.17343-1-kyrie.wu@mediatek.com/
>=20
> Change in v3:
> =C2=A0- Add venc rc buffer alloc failure error handling.
> =C2=A0- Add mediatek,vcp property definition in dt-bindning.
>=20
> Change in v2:
> =C2=A0- Add support for VCP encode process.
> =C2=A0- Add MT8196 encoder driver platform data.
> =C2=A0- Rebase encoder patch onto decoder's patch set.
> =C2=A0- Fix some review comments in v1.
>=20
> Irui Wang (6):
> =C2=A0 media: mediatek: encoder: Add a new encoder driver interface
> =C2=A0 media: mediatek: encoder: Add support for common firmware interfac=
e
> =C2=A0 media: mediatek: encoder: Add support for VCP encode process
> =C2=A0 media: mediatek: encoder: Add a new platform data member
> =C2=A0 media: dt-bindings: mediatek,vcodec-encoder: Add MT8196
> =C2=A0 media: mediatek: encoder: Add MT8196 encoder compatible data
>=20
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 22 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 19 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0.../platform/mediatek/vcodec/encoder/Makefile |=C2=A0=C2=A0 1 +
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0 36 +-
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 28 +
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 15 +-
> =C2=A0.../vcodec/encoder/venc/venc_common_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 683 ++++++++++++++++++
> =C2=A0.../vcodec/encoder/venc/venc_h264_if.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_drv_if.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A0.../mediatek/vcodec/encoder/venc_ipi_msg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 26 +
> =C2=A0.../mediatek/vcodec/encoder/venc_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 47 +-
> =C2=A015 files changed, 856 insertions(+), 52 deletions(-)
> =C2=A0create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/v=
enc/venc_common_if.c

--=-QrVUnf/onkkIhx/f124c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxbJgAKCRDZQZRRKWBy
9Ny3AP9I6hsSCVJlO+bf6OrzhNKjtfmLALku9xJh86MoZuZB7AEAr+WUUxTKphNL
55+dMT8YC5gt6+wvoLENw7tP7DpAWgQ=
=vWOZ
-----END PGP SIGNATURE-----

--=-QrVUnf/onkkIhx/f124c--

