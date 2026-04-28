Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4BCFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ce8yegDTQCcYna4OAm+dwTzq7DZZHprboHNCxAsJ5g=; b=IsSMlydvMMw6z786rC/LKEALtp
	4/FLprQtfRaVNdGpOPQ2z2L/aLFRt2dtb7YZoWzPk2JIm9xZPeiOrmIx806zQg1tIJFrd8fCzvSNT
	CFmd1bX2m1Y5qVFLezHnqAMjqtEnVUYPf/Qo8k5L3jO1CFp11Jw9XnxFBRB6v5surCes6ZxlNZ42W
	/AtLCnIjrBtD3P5YJxEUuNX46PJvqud+M2Cq8u4wnq6+mJaKL1KMKyh9E3Z41ACb6cNz616tY7C1j
	lZbb5Wm1xXyMMcftsgkSNjuQQWY90gSdF8PXkmJf/Yt5TSMbZl1+rqauD6aptQedaOtk4MDBbT9yq
	bxu38/KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoBa-00000002A7u-3vzB;
	Tue, 28 Apr 2026 19:33:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoBY-00000002A6f-3Asx;
	Tue, 28 Apr 2026 19:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777404810;
	bh=2LdnTY48/H/yha0KYzVqcMjcIVLdxMiWb7hNSxtHY+M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qUykUPwcCCIPuq7Wqrt85Z/b3AfB+1ST11wPC5r0cdUZ2p31oOZLb2hKK77Mb9x5r
	 V/s6YGZD8qFdlJwoQaoolKEaypjd0Rn7Zsxe42Ma+H8hsET+CSHOasKYdgker9mir1
	 mBDFJvt67LN5/nBXxI9pJidYyftREqKVxymMqkCj/9tDwDMhtkEbFm+0MUqcZGkzcR
	 jujeJdcz55p908BnTLYVyvGVuYaI41R99BoyzYggU+02ClYVLscdN1QSn7PhYqH2lZ
	 A3btaL6ZokckYSowJraz0b/EvgPOK/5yl8l5xcE3Xk96SEC//4PF4mvralVImlZ+2Z
	 1d9j6kANOv3dg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F05617E0ED6;
	Tue, 28 Apr 2026 21:33:27 +0200 (CEST)
Message-ID: <0acd45d0b10ba0f8f8c31ab3d59bb5591be41e96.camel@collabora.com>
Subject: Re: [PATCH 05/11] media: Add missing types to v4l2_ctrl_ptr
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel	
 <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Rostedt	 <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, Yunke Cao <yunkec@google.com>, Sakari Ailus	
 <sakari.ailus@linux.intel.com>, Pavan Bobba <opensource206@gmail.com>,
 James Cowgill <james.cowgill@blaize.com>, Ma Ke <make24@iscas.ac.cn>,
 Jacopo Mondi	 <jacopo.mondi@ideasonboard.com>, Daniel Scally
 <dan.scally@ideasonboard.com>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, 	kernel@collabora.com
Date: Tue, 28 Apr 2026 15:33:26 -0400
In-Reply-To: <20260212162328.192217-6-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-6-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-BWVk2ZDdh0XDsilTNcWN"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_123332_973630_619EADC2 
X-CRM114-Status: GOOD (  13.57  )
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


--=-BWVk2ZDdh0XDsilTNcWN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> The v4l2_ctrl_ptr union contains pointers for all control types, but
> v4l2_ctrl_hevc_decode_params and v4l2_ctrl_hevc_scaling_matrix are missin=
g.
>=20
> Add them.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0include/media/v4l2-ctrls.h | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index 327976b14d50..a2b4c96a9a6f 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -49,6 +49,8 @@ struct video_device;
> =C2=A0 * @p_hevc_sps:			Pointer to an HEVC sequence parameter
> set structure.
> =C2=A0 * @p_hevc_pps:			Pointer to an HEVC picture parameter
> set structure.
> =C2=A0 * @p_hevc_slice_params:	Pointer to an HEVC slice parameters
> structure.
> + * @p_hevc_decode_params:	Pointer to an HEVC decode parameters
> structure.
> + * @p_hevc_scaling_matrix	Pointer to an HEVC scaling matrix structure.
> =C2=A0 * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level
> structure.
> =C2=A0 * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display
> structure.
> =C2=A0 * @p_area:			Pointer to an area.
> @@ -81,6 +83,8 @@ union v4l2_ctrl_ptr {
> =C2=A0	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
> =C2=A0	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
> =C2=A0	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
> +	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
> +	struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
> =C2=A0	struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
> =C2=A0	struct v4l2_ctrl_vp9_frame *p_vp9_frame;
> =C2=A0	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;

--=-BWVk2ZDdh0XDsilTNcWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafELhgAKCRDZQZRRKWBy
9Jw1AQCtkGFJo+V/dxiDLgp25Afo2/2Srsfj8WlBLY8Sax0oBAD/VPHQzDb4Kngc
cfQ5FyVVoCgUFbHWqCpU1pyk4dtJBww=
=dk1T
-----END PGP SIGNATURE-----

--=-BWVk2ZDdh0XDsilTNcWN--

