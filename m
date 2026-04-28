Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82601FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9KgscOipxJoiVx+8/EZy4OrwtqLVNF8SX0UOM4qm/4=; b=XsQ++h2LCpVXhzhJ/0AjdbvMnq
	zwAZcXPwTu4Hj9M+mlgpnaoDl9fWU2om8rraxJdtq6iwM2hraIgWih/xb7hooW6FdRPblBq+1hb8u
	X4P7xgNjHszgzXSNtZizoqdfrBXzTQ5gRq9q5vUGRMv+Bgs33ZGAbtPMF+trQJXmZSX96eipNXPC9
	zD7+jg062b0a96FFQNZwwFm9Ll4hZfNpjoIdgDKUKCQ/ztP+i+YLhsH3gaqFb+yR/iinEGt0N9Hmk
	RtSrO7QdNWwPFuMSwG7zMQvvOe0djt/SQ3sYzC6YOk+99aHnXd3nI0usA4ik8uO+/BeM0fBOk1oV1
	mNduA9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoz3-00000002RkV-0Ez5;
	Tue, 28 Apr 2026 20:24:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoz0-00000002Rjy-14CB;
	Tue, 28 Apr 2026 20:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777407875;
	bh=/9KgscOipxJoiVx+8/EZy4OrwtqLVNF8SX0UOM4qm/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RZnUWdgWCfoVfCTHNwa4L/uZfRCvS25I0Zrt8wDjp0bow7sawYM2Vo0Kjp0POwuXb
	 mcE7FGp7OKFG34V0gCYshRv5IbJ8ZqVnXQ0TXhI7vB+xowtYlsoBM6JuGBcKNLrumD
	 bs8aiPcN5lbWfYwf1fFjaC8YLkH0D5TG5GXvvEYS6CX59L4iia0IxcBtkT32ASbCNv
	 xnq5OLg+GUlqbRpuAVSILKEniWv3Qez+KAkx34Am0g9141jFNJvcL7IQpDlv/aXAWS
	 KRpYtn//mr84WDv88h3LB1TTYGp+EyL016kaePNQ6x2J7GPTtJxG1EQxLMRF7EW7zm
	 oPw7eJWvTAnNQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF18C17E0C83;
	Tue, 28 Apr 2026 22:24:33 +0200 (CEST)
Message-ID: <4d8bd13e5f76827d5cec34e919f9d6bf9b7c5df3.camel@collabora.com>
Subject: Re: [PATCH v4 00/14] media: mediatek: vcodec: support video decoder
 in mt8196
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
Date: Tue, 28 Apr 2026 16:24:31 -0400
In-Reply-To: <20260328051630.7937-1-yunfei.dong@mediatek.com>
References: <20260328051630.7937-1-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-m53fK1x/ofRtBTBXaNMs"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_132438_487308_8AB17BE0 
X-CRM114-Status: GOOD (  20.47  )
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


--=-m53fK1x/ofRtBTBXaNMs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 28 mars 2026 =C3=A0 13:16 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> This patch set adds support for the video decoder on the MediaTek MT8196
> platform, leveraging the VCP microprocessor for enhanced performance. It
> introduces new firmware interfaces for kernel-side communication with VCP=
,
> adds MT8196 compatible, codec levels/profiles, and private data. Rewrites
> the AV1 driver to support extended VSI structures, then change irq table
> and cdf table size.
>=20
> This patch set depends on "Add VCP support for mt8196"[1]
>=20
> [1]
> https://patchwork.kernel.org/project/linux-remoteproc/patch/2025040209213=
4.12293-2-xiangzhi.tang@mediatek.com/

I see this had changes requested, will mark the series accordingly.

>=20
> Compliance Test Result:
> - v4l2-compliance: 48/49 tests passed, 1 failed (known issue)
> - fail: v4l2-test-controls.cpp(981): ret (got 13)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_G/S/TRY_EXT_CTRLS=
: FAIL
>=20
> Fluster Test Result:
> - H264:
> - Ran 95/135 tests successfully=C2=A0=C2=A0 in 73.540 secs
> - H265:
> - Ran 142/147 tests successfully=C2=A0 in 100.168 secs
> - VP9:
> - Ran 276/305 tests successfully=C2=A0 in 106.804 secs
> - AV1:
> - Ran 240/242 tests successfully=C2=A0 in 23.991 secs
> ---
> Changed in v4:
> - Rebase to latest codebase
> - Move dt-bindings and compatible to the after of vcp driver ready
> - MT8189 base on MT8196 patch set
>=20
> Changed in v3:
> - Depends on change no update
> - Add Compliance and Fluster test result
> - Re-write the commit message for patch 12
> - Change the patches according to review suggestion for patch: 3/4/5/6/14
>=20
> Changed in v2:
> - re-write the commit message for patch 1
> ---
> Yunfei Dong (14):
> =C2=A0 media: mediatek: vcodec: add driver to support vcp
> =C2=A0 media: mediatek: vcodec: add driver to support vcp encoder
> =C2=A0 media: mediatek: vcodec: get different firmware ipi id
> =C2=A0 media: mediatek: vcodec: get share memory address
> =C2=A0 media: mediatek: vcodec: define MT8196 vcodec levels.
> =C2=A0 media: mediatek: vcodec: support vcp architecture
> =C2=A0 media: mediatek: vcodec: support 36bit iova address
> =C2=A0 media: mediatek: vcodec: clean xpc status
> =C2=A0 media: mediatek: vcodec: add debug information
> =C2=A0 media: mediatek: vcodec: send share memory address to vcp
> =C2=A0 dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
> =C2=A0=C2=A0=C2=A0 mt8196
> =C2=A0 media: mediatek: vcodec: add decoder compatible to support mt8196
> =C2=A0 media: mediatek: decoder: fill av1 buffer size with picinfo
> =C2=A0 media: mediatek: decoder: support av1 extend vsi
>=20
> =C2=A0.../media/mediatek,vcodec-subdev-decoder.yaml |=C2=A0=C2=A0 1 +
> =C2=A0.../media/platform/mediatek/vcodec/Kconfig=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 4 +
> =C2=A0.../platform/mediatek/vcodec/common/Makefile=C2=A0 |=C2=A0=C2=A0 4 =
+
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |=C2=A0 21 +-
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 16 +
> =C2=A0.../mediatek/vcodec/common/mtk_vcodec_fw.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_priv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 561 ++++++++++++++++++
> =C2=A0.../vcodec/common/mtk_vcodec_fw_vcp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 153 +++++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 28 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 13 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c |=C2=A0=C2=A0 6 +
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 113 +++-
> =C2=A0.../decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 11 +-
> =C2=A0.../decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp8_req_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |=C2=A0 27 +-
> =C2=A0.../mediatek/vcodec/decoder/vdec_ipi_msg.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0.../mediatek/vcodec/decoder/vdec_vpu_if.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 12 +-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.c=C2=A0 |=C2=A0=C2=A0 1 =
-
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc.h=C2=A0 |=C2=A0=C2=A0 2 =
+
> =C2=A023 files changed, 985 insertions(+), 38 deletions(-)
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
> =C2=A0create mode 100644
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

--=-m53fK1x/ofRtBTBXaNMs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEXgAAKCRDZQZRRKWBy
9PcwAQC+wcp+XirWTkN5fpEsVjsROmyaJurCWJ4N+I6LunTqbgD+K/3fjn1/CZXM
ZRS+Xk+AxpMN4wEd2kZgalmATVGcOg0=
=0mXf
-----END PGP SIGNATURE-----

--=-m53fK1x/ofRtBTBXaNMs--

