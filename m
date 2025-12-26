Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838EDE8FDA2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 12:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/QWZMgTcROcYFJ0cFP0webMTrmmuMu3SFDdjIFr7Xg=; b=RkoFUgdDgnTs0Ov5Wk6UBbRczM
	EyzwUuYjmogM7FYiLlXjMd6w4lWwBSD3qnJbgQ3cRM51pE9EdE33y9++ol/GpbhPQmicX+vTRLQ9I
	nb9Y6CI69MHCSZCEAamHruNpQhZzQIYlM/wYpgmLVFVtLSnnrn0DjGzJfdGGDJJFUdqFz1nBzWoK8
	B06YQ/Rrtj+Oz0hdC3Ex89cnR2vhYu3/Pqx5yQitCa/nnnbftXVmbLdaM24ZAWMmbSRmoYiDUjrhn
	tz6wleaTiWV+Zg5W9aqYmQpHkXKjJLsCsIXx68DxJNnU2dThnKfwxHlrMYyVQYiPgaLiXURO9FpAD
	GzLj3KkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6sr-00000001Av9-1iYD;
	Fri, 26 Dec 2025 12:25:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6so-00000001AuL-0dk9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 12:25:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso64454315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 04:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766751924; x=1767356724; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/QWZMgTcROcYFJ0cFP0webMTrmmuMu3SFDdjIFr7Xg=;
        b=SfSxpPHIEKgzAQDl/WAVY8Qyy/Zj+Fs/6T2BXb3HDaBEE+UieXtAtMhjrupiVXi4X6
         YNCAafWGwZboZGL1faTkA5ejR00VaxMqjcisK0hGfqWfJB3jzfqfhvSfKv6grrrOVibn
         YJ9V/UPauMxfCdOhQzJ+FSGx6lGPxfcXo3Ji5SHVi8/DxPvNMduSjEb5tu0MyBaHzJtK
         psS2WnbO6ecFBNF/yfwujLouBDbn4gB1m21CINkH+RBsrLkos1Qz00tWozrBuwe3XWk1
         De6Sf6awe3SmTPoku+Pemv9HoUAEtHAr7kLuo+znrJXo42PThIZVpHGDxDvQ4N6PZMo3
         TZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766751924; x=1767356724;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/QWZMgTcROcYFJ0cFP0webMTrmmuMu3SFDdjIFr7Xg=;
        b=O0KNZistskcDkZzfJUhj1x5a+ELriKAjv6IRLzP6NFJU3/Koj9i3pOM9zdcEV7kTs2
         qyRXE/1cV8DQjmpscifSUMmKg8JB7enHOBWkatXkltAle/6I6wugqYBXTQiAn6EzndMG
         G3bHoKyfepke+l2xlY52N/iD/wWVFC3FhIWCz6tu3IcXnULNGj4i3ZV+arh/Znwye5TQ
         DTx1S+EtThi0S7WjXMNXoq2lcO3nTl/TYH7FdcIbvoEaCaNhsnvIHFm0ubgHOp3/jMw2
         nBEY8R803LRFL76WitHunRyBrZ6BSfVyvThkuVr/TiP6juaXE5iIYnQloetevpwrfoyg
         ZdMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHnl3Ql4IDLsH5emW6K9DSdVum7tWcH5C7u+5jI52PcoDboG6DxdNLN40bVLQ9WOcEVaL2boyqBwOo8DR/Qpm4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+zB/Zcnp5QBdWO1V5FAjr5NiXKlxizkQR1IenYgeBHmmRWM9J
	xjKLAjKOk45Gu9FlEw/Xx5nrEjxCSqm0rEXrwU3CmRkwtjFh58jK4SH5
X-Gm-Gg: AY/fxX5+SiuCT3aiAr+7HhImbyuAf4o7LaJZIegnkY0DSqX3D4o+iIU4YrkKuMXAO+F
	37R4rHKIqOqJ3WImiLnK8Cj7FY1eLL6qJiCzenHgS7Cdxxgf1myyDpDJdM7D6a3RdIxzG3/qhZU
	2pLzZhIbZFVN9l6bNodHMUgpzcjgjwwNKGaU6FswGYKO5dKO17Y7m8y/mT90aaRP7y81uavyOX2
	QEaJe3r1cRYzgSuqvvH9RERi2QTt6fzxnB+DvFZobczMCY72EuIkRPoACx3tn2LOWxXuVHCgFDN
	L/GBTmyHtvdERkTT0QslJ8acIyR5C7LAtJ6ViONlW2D33IEBgHO7Q9vkGkXSSnIkkK4ACOC+q6+
	Z1cLthvyrSn3YOMCC7jIBG5bxl1b9CXn7f18LRhW+MlZW7tPQyCSNIz39YBXiPjddoML9tlqcp5
	t+VxWhfJRab6a3IbuYCyYchcq2qRGCws5qBCUgTYMb3VXieHyoj03OCTEmdP4ZIG5/ZbZRWmRjQ
	HhOj8B47A==
X-Google-Smtp-Source: AGHT+IGc8Z2MAoLbOks33fyQFWGK5GI9Gp1WejsRvglw//425ZHkxFEhT7LmB7wnFeheTO44I6eLuA==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr295125695e9.16.1766751924042;
        Fri, 26 Dec 2025 04:25:24 -0800 (PST)
Received: from smtpclient.apple (static.253.36.98.91.clients.your-server.de. [91.98.36.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm45346320f8f.24.2025.12.26.04.25.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Dec 2025 04:25:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.3\))
Subject: Re: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346 variant
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
Date: Fri, 26 Dec 2025 16:25:09 +0400
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas.collabora@collabora.com>,
 =?utf-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71EA9FB8-83DB-4785-86C1-2E6BA9C739D9@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
 <20251226113140.573759-3-christianshewitt@gmail.com>
 <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
To: Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: Apple Mail (2.3826.700.81.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_042526_320488_450D4F11 
X-CRM114-Status: GOOD (  24.45  )
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

> On 26 Dec 2025, at 4:00=E2=80=AFpm, Diederik de Haas =
<diederik@cknow-tech.com> wrote:
>=20
> Hi Christian,
>=20
> On Fri Dec 26, 2025 at 12:31 PM CET, Christian Hewitt wrote:
>> VDPU346 is similar to VDPU381 but with a single core and limited
>> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
>> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>>=20
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
>> ---
>> .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 =
++++++++++++++++++
>> 1 file changed, 103 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c =
b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index e547057dc75f..6b39e99d8a8b 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls =
rkvdec_hevc_ctrls =3D {
>> .num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>> };
>>=20
>> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
>> + .cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + .cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>> + .cfg.menu_skip_mask =3D
>> + BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
>> + .cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>> + .cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>> + .cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> + {
>> + .cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
>> + .cfg.ops =3D &rkvdec_ctrl_ops,
>> + .cfg.dims =3D { 65 },
>> + },
>> +};
>> +
>> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
>> + .ctrls =3D vdpu346_hevc_ctrl_descs,
>> + .num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
>> +};
>> +
>> static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>> {
>> .cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
>> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc =
rk3288_coded_fmts[] =3D {
>> }
>> };
>>=20
>> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D 65472,
>=20
> This should be 4096 according to page 469 of RK3568 TRM Part 2 ...
>=20
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D 65472,
>=20
> ... and this 2304.
>=20
>> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &vdpu346_hevc_ctrls,
>> + .ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_hevc_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>> + {
>> + .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>> + .frmsize =3D {
>> + .min_width =3D 64,
>> + .max_width =3D  65520,
>=20
> This too should be 4096 according to page 469 of RK3568 TRM Part 2 ...
>=20
>> + .step_width =3D 64,
>> + .min_height =3D 64,
>> + .max_height =3D  65520,
>=20
> ... and this 2304.
>=20
> I guess this also explains the 'green images' Nicolas noticed.

Quite probably. I=E2=80=99ve picked the above changes into my working =
tree
(for those following it) and will send a v3 series in response to
the next revision of Detlev=E2=80=99s patches.

> + .step_height =3D 16,
>> + },
>> + .ctrls =3D &rkvdec_h264_ctrls,
>> + .ops =3D &rkvdec_vdpu381_h264_fmt_ops,
>> + .num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>> + .decoded_fmts =3D rkvdec_h264_decoded_fmts,
>> + .subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> + },
>=20
> I see you've reversed the order of the blocks so that HEVC now comes
> before the H264 block. While that makes it consistent with what Detlev
> has in their v7 and with the existing code in the driver ... I =
actually
> prefer having H264 before HEVC as the alphabetical sorting order is
> H264 before HEVC.
> In the existing code the VP9 'stuff' is listed below H264 and HEVC.
>=20
> But then Detlev should do that too in their patch set ... and =
'ideally'
> the order of the existing code be updated to be alphabetically too.
>=20
> OTOH, a consistent order works for me too.

I believe the reorder was requested by Nic (offline from the list) so
there=E2=80=99s probably a reason behind it. I=E2=80=99ll keep things =
aligned to the
order in Detlev=E2=80=99s series (whatever that is).

Christian


> Cheers,
>  Diederik
>=20
>> +};
>> +
>> static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>> {
>> .fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
>> @@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops =
vdpu381_variant_ops =3D {
>> .flatten_matrices =3D transpose_and_flatten_matrices,
>> };
>>=20
>> +static const struct rkvdec_variant vdpu346_variant =3D {
>> + .coded_fmts =3D vdpu346_coded_fmts,
>> + .num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
>> + .rcb_sizes =3D vdpu381_rcb_sizes,
>> + .num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
>> + .ops =3D &vdpu381_variant_ops,
>> +};
>> +
>> static const struct rkvdec_variant vdpu381_variant =3D {
>> .coded_fmts =3D vdpu381_coded_fmts,
>> .num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
>> @@ -1691,6 +1790,10 @@ static const struct of_device_id =
of_rkvdec_match[] =3D {
>> .compatible =3D "rockchip,rk3399-vdec",
>> .data =3D &rk3399_rkvdec_variant,
>> },
>> + {
>> + .compatible =3D "rockchip,rk3568-vdec",
>> + .data =3D &vdpu346_variant,
>> + },
>> {
>> .compatible =3D "rockchip,rk3588-vdec",
>> .data =3D &vdpu381_variant,



