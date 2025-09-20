Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4801ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDZl0ANj7v5q6OpbuwpuZi8KB2n6Sh+sPSSDtZHj8Es=; b=sIIN2pLKiI+pfEhRCwCYrqQG+C
	kqrwrXxaVKWOmC7iYqNWHa0OBc0lIQwU4+r4m040HyE3cZWWmzOR9SC0330qMX4qBWj78gWtwOCT0
	t3p0sxdcg63ssYunSW+wQkWzc2ZnjRrNdbyWwzU2VTwpC648GRUCXsRS+j9uPq6OH4ksqGt4A400u
	jY6WVnsew2BlcDeJeVcY9cLj3URCI9s9NJvlzBym6bky8+9JRRXaoSOj2n3fUwgRe+MyKcLbBQ4aI
	Phm+iRZayX3xrp0NuZ6FSfYP4KufnN7/P8VpMsXeUG/vrgjWLBVGY+xnx4dHGtFhrgGx3fG0qZTjn
	dkXNos6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v01zR-00000005jNt-20yy;
	Sat, 20 Sep 2025 18:07:17 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v01zO-00000005jNP-19WO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 18:07:16 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758391630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EDZl0ANj7v5q6OpbuwpuZi8KB2n6Sh+sPSSDtZHj8Es=;
	b=FoywK2CetcfKqJWZoi8P9Omv+JEBR1tPPr8nt9qDZ1F6dKpfEZFqNoOZKYD2jHPV3aXgba
	H7C1Lf4RizzKZDwOYARbBVDgXBNID3i/TeeeTRzm/LndVdtdHK/E4iEjYvml37SR41gFIh
	ViD5f9lh4KGIlVVdU3cPgUCjn0fOvFgTIpnYd/8RYMYhsbOFBAikWsW3mc2oIFnntFRTbA
	a0KOoyp6qfUWy+cNmomqzNzry2VdeU7IMR5TfbffHnu5FkFZ5KWIvZtCu2cs73+FoQdtPR
	gNRwb+cQ4LG/mB7lG0+oGqArQlrmPCan/gtkdeNyttZ7sU2De0Xa45SS4/N31w==
Content-Type: multipart/signed;
 boundary=d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 20 Sep 2025 20:06:36 +0200
Message-Id: <DCXTSROW5FPM.1008CWKUXILAI@cknow.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the
 VDPU381 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Detlev Casanova"
 <detlev.casanova@collabora.com>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
 <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
 <ea0914d9-bd12-4bdc-b465-3ae82571118a@kwiboo.se>
In-Reply-To: <ea0914d9-bd12-4bdc-b465-3ae82571118a@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_110714_881395_DC89C4F3 
X-CRM114-Status: GOOD (  22.62  )
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

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas,

On Sat Sep 20, 2025 at 6:15 PM CEST, Jonas Karlman wrote:
> On 9/20/2025 5:00 PM, Diederik de Haas wrote:
>> Thanks a LOT for this patch set!
>> As already reported the results were quite impressive :-D
>>=20
>> To figure out how to make VDPU346 for rk3568 work, I had a close look at
>> the TRM and compared that to rk3588's TRM and compared it to your code.
>> I think I may have found a few potential issue, but I may also not
>> understand things correctly.
>>=20
>> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
>>> This decoder variant is found in Rockchip RK3588 SoC family.
>>>
>>> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
>>> output formats and level up to 5.1.
>>>
>>> The maximum width and height have been significantly increased
>>> supporting up to 65520 pixels for both.
>>>
>>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>>> ---
>>>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>>>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>>>  .../platform/rockchip/rkvdec/rkvdec-h264.c    |  36 --
>>>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>>>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>>>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 164 +++++-
>>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   6 +
>>>  7 files changed, 1067 insertions(+), 38 deletions(-)
>>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu3=
81-h264.c
>>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu3=
81-regs.h
>>>
>>> ...
>>>
>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
>>> index 0ccf1ba81958a..1b55fe4ff2baf 100644
>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>>
>>> ...
>>>
>>> @@ -287,6 +327,25 @@ static const struct rkvdec_coded_fmt_desc rkvdec_c=
oded_fmts[] =3D {
>>>  	}
>>>  };
>>> =20
>>> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>>> +	{
>>> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>>> +		.frmsize =3D {
>>> +			.min_width =3D 64,
>>> +			.max_width =3D  65520,
>>> +			.step_width =3D 64,
>>> +			.min_height =3D 16,
>>> +			.max_height =3D  65520,
>>> +			.step_height =3D 16,
>>> +		},
>>=20
>> Also in the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image si=
ze" :
>> 16x16 to 65520x65520; step size 16 pixels
>>=20
>> I interpret that that .min_width and .step_width should both be 16.
>> (.min_height and .step_height are correct at 16; if I read the TRM right=
)
>
> The frmsize used internally for rkvdec is only meant to restrict/align
> the frame buffer use while decoding, It does not reflect sizes the HW
> can decode.
>
> frmsize should typically be min 64x64 with step_height 16 and step_width
> 64 to ensure stride is 16 byte aligned for both 8-bit and 10-bit video.
>
> Only max_width and max_height is used from here to signal userspace what
> max res is supported, together with min/max res and step of 1.

Interesting, thanks for the explanation :-)

So if I understand correctly, only .min_height should be changed to '64'
here? And it should also be 64+64+64+16 for HEVC (patch 11)?
(and also for VP9 and AVS2?)

> Regards,
> Jonas

Cheers,
  Diederik

>>=20
>>> +		.ctrls =3D &rkvdec_h264_ctrls,
>>> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>>> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>>> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
>>> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>> +	},
>>> +};
>>> +
>>>  static const struct rkvdec_coded_fmt_desc *
>>>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>>>  {
>>> @@ -1125,6 +1184,35 @@ static irqreturn_t rk3399_irq_handler(struct rkv=
dec_ctx *ctx)

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaM7tLwAKCRDXblvOeH7b
bmaPAP42aR+Mi7lYj8rv/CnJ3+XArfhpCOXq8Cechr4YPjJB5QD8Cuv/WjyPD0bq
+qJ3+PrgRJ7oywdCszE4tHtnZPvAPwE=
=yrXy
-----END PGP SIGNATURE-----

--d095de69cd9d2d7c4717294b4ae0febc9cc3d86b9283f057e39e54933396--

