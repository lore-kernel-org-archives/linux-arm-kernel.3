Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71546D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11i6VlN7HylQO++3sIFz26IbyBQeR3Nl91h3mggNvlw=; b=iexqk/hX6c05J67LVoZdvnrR/1
	2ovvaIS+TQWiIMiO9Jk92B4mB70Ae3Ch5eIgRXoDflnr7kvDAg67tjuqDJSNDUANFP1lAn+z3DZVe
	mhtRH15qoFtBaH2J+/NUGPBpXZhtf6WZVpkpQ5aMnl1p0nyOauPEL4oFP7ZzWovMMGHkBUkyVBxO9
	16W+wzfZeUvLPqjZk2mXuWH3nntmrt5r3rx4i15ElkMn4vKefK83JmnGyfpdB9GayLXmGtn5wNZhI
	tZUrLS3Awe73yFR9Dc4iSIoh73Hb912fTR7bFymZOyIqOpyuUXHlB4ZVHvQelsEcgNRZpJBl7L+5l
	sBMN2+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexHt-00000004KEg-0r2r;
	Sun, 11 Jan 2026 15:23:29 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexHp-00000004KDn-2SuJ;
	Sun, 11 Jan 2026 15:23:27 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768145000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11i6VlN7HylQO++3sIFz26IbyBQeR3Nl91h3mggNvlw=;
	b=cw2RU9lvewv58JmC7j1rMDYI6q33u+PzgXYbxl3JOW1bAteXxHdqMI5Fq9xWqp02JGAwJ0
	Bsuqpy8gNDQDBRYXFlkMKpxicsbSmVy9kC+v0YSAEYpohFCz+cxcpftoSnmr4qijPT9Tay
	3sjyBub2EUllbaArfbbXQZvZ31SxZq2EXi2vEJUny8zKwDqgaou5XevmURGMKdbEKa7rLO
	evDlJQr0Qp4Vr4AhY9j/097rrwu5qn1Mdm7TNV+rJTEzD6+2DS3BC33nWKg7PDhIYMoRAH
	0cxag3xJe9/GD3KwzKe5HtngpNdEu58rq6x6Isi4S0z6u8JFclkaoGQMHWujvg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Jan 2026 16:23:16 +0100
Message-Id: <DFLV39M9KHTD.PAJZU86PXJGN@cknow-tech.com>
Cc: "Detlev Casanova" <detlev.casanova@collabora.com>,
 =?utf-8?q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Nicolas Dufresne"
 <nicolas.dufresne@collabora.com>, "Dang Huynh" <dang.huynh@mainlining.org>
Subject: Re: [PATCH v3 2/3] media: rkvdec: Add support for the VDPU346
 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Christian Hewitt" <christianshewitt@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
 <20260110053727.2295260-3-christianshewitt@gmail.com>
 <DFL5TY0QQNMN.1RS04UM9D1V8S@cknow-tech.com>
 <E21F5FD9-AEBA-490F-A9DF-8E9BEF161763@gmail.com>
In-Reply-To: <E21F5FD9-AEBA-490F-A9DF-8E9BEF161763@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_072326_183995_9C0C2B7B 
X-CRM114-Status: GOOD (  15.19  )
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

On Sun Jan 11, 2026 at 2:30 PM CET, Christian Hewitt wrote:
>> On 10 Jan 2026, at 11:35=E2=80=AFpm, Diederik de Haas <diederik@cknow-te=
ch.com> wrote:
>> On Sat Jan 10, 2026 at 6:37 AM CET, Christian Hewitt wrote:
>>> VDPU346 is similar to VDPU381 but with a single core and limited
>>> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
>>> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>>>=20
>>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Tested-by: Dang Huynh <dang.huynh@mainlining.org> # Pinetab2
>>> ---
>>> .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>>> 1 file changed, 103 insertions(+)
>>>=20
>>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/=
media/platform/rockchip/rkvdec/rkvdec.c
>>> index a5cf6f3240f8..6e49b129d11f 100644
>>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>>> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls=
 =3D {
>>> .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>>> };
>>>=20
>>> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
>>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>>> + .cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>>> + .cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>>> + .cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
>>> + .cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>>> + .cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>>> + .cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> + .cfg.menu_skip_mask =3D
>>> + BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>>> + .cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>>> + .cfg.dims =3D { 65 },
>>> + },
>>> + {
>>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>>> + .cfg.dims =3D { 65 },
>>> + },
>>> +};
>>> +
>>> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
>>> + .ctrls =3D vdpu346_hevc_ctrl_descs,
>>> + .num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
>>> +};
>>> +
>>> static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>>> {
>>> .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>>> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288_c=
oded_fmts[] =3D {
>>> }
>>> };
>>>=20
>>> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
>>> + {
>>> + .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>>> + .frmsize =3D {
>>> + .min_width =3D 64,
>>> + .max_width =3D 4096,
>>> + .step_width =3D 64,
>>> + .min_height =3D 64,
>>> + .max_height =3D 2304,
>>> + .step_height =3D 16,
>>> + },
>>> + .ctrls =3D &vdpu346_hevc_ctrls,
>>> + .ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
>>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>>> + .decoded_fmts =3D rkvdec_hevc_decoded_fmts,
>>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>> + },
>>> + {
>>> + .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>>> + .frmsize =3D {
>>> + .min_width =3D 64,
>>> + .max_width =3D  4096,
>>> + .step_width =3D 64,
>>> + .min_height =3D 64,
>>> + .max_height =3D  2304,
>>> + .step_height =3D 16,
>>> + },
>>> + .ctrls =3D &rkvdec_h264_ctrls,
>>> + .ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>>> + .decoded_fmts =3D rkvdec_h264_decoded_fmts,
>>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>>> + },
>>> +};
>>> +
>>> static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>>> {
>>> .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>>> @@ -1657,6 +1748,14 @@ static const struct rkvdec_variant_ops vdpu381_v=
ariant_ops =3D {
>>> .flatten_matrices =3D transpose_and_flatten_matrices,
>>> };
>>>=20
>>> +static const struct rkvdec_variant vdpu346_variant =3D {
>>> + .coded_fmts =3D vdpu346_coded_fmts,
>>> + .num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
>>> + .rcb_sizes =3D vdpu381_rcb_sizes,
>>=20
>> AFAICT this is not correct, the rcb_sizes are different for vdpu346 vs
>> vdpu381. While for vdpu381 the sizes are the same across codecs, they
>> vary for vdpu346. And vdpu346 does not have 'STRMD Row', 'Transd Row'
>> and 'Transd col'.
>>=20
>> For RK3588/vdpu381 it is defined in RK3588 TRM V1.0 Part1 in
>> paragraph 5.4.4.3 in 'Table 5-13 Row or Col buffer size required' on
>> page 381.
>>=20
>> For RK3568/vdpu346 is is defines in RK3568 TRM V1.1 Part2 in
>> paragraph 10.4.8 in 'Table 10-9 Row or Col buffer size required' on page
>> 474 and 475.
>
> This is what I=E2=80=99m hinting/referring to in the cover-letter. How
> to correctly handle the differences in code is currently beyond
> my n00b level comprehension of c and coding skills. I=E2=80=99ll need to
> ask the audience for some assistance and coaching :)

Sorry, I should've been (more) clear that this remark was meant as a
'research note', to further improve support for RK3568.

And I forgot to mention that with Detlev's v8 series and your patch set,
all my test videos, except 4K, now play without any (visual) artifacts.
\o/

I still want to do more/further tests and wait till Detlev's series get
accepted, before giving my Tested-by tag.

Cheers,
  Diederik

> Christian
>
>>> + .num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
>>> + .ops =3D &vdpu381_variant_ops,
>>> +};
>>> +
>>> static const struct rkvdec_variant vdpu381_variant =3D {
>>> .coded_fmts =3D vdpu381_coded_fmts,
>>> .num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
>>> @@ -1705,6 +1804,10 @@ static const struct of_device_id of_rkvdec_match=
[] =3D {
>>> .compatible =3D "rockchip,rk3399-vdec",
>>> .data =3D &rk3399_rkvdec_variant,
>>> },
>>> + {
>>> + .compatible =3D "rockchip,rk3568-vdec",
>>> + .data =3D &vdpu346_variant,
>>> + },
>>> {
>>> .compatible =3D "rockchip,rk3588-vdec",
>>> .data =3D &vdpu381_variant,


