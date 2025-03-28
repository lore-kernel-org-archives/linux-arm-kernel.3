Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E8DC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 23:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STZ5FqUicffkrJ/L4Iet8L5svtmsV0SOVrQ2kmJ0+Bs=; b=XMNeRnXSId4MYgxBoPZdwTlGCG
	aVP9bKX+VqwuO1xq5vDWpslSZ8MGHl6n2y3KE44hmTqqxJ9ywggQqYH6ZbatsBkdw+3AA0hD7sbi2
	Q3LtDsg+gZBx9Vj/YW6cIFUcD6w8H1K1sfnlsVn6Rvm1tZo20XoLPz0GLtId+R3PgcRqOZ7POM7sB
	yMWmUGPEec2zH7VLDFEJeE7OpQio/fksq38zecV79PajrcnEsEmz+G7uLXYV+YLjZ8ip2O0s0U5Ka
	Ubv//kZDiCsmSenXTwXBCxrE6/kTv+IFrVVR9HI5EWNjh9JmgG0dfKYTeZsHm+a1a7cvdDA/mXPfX
	3b0Iplew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIrx-0000000ES4Y-1Yy0;
	Fri, 28 Mar 2025 23:12:09 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIqB-0000000ERra-1y9h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 23:10:22 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1743203414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=STZ5FqUicffkrJ/L4Iet8L5svtmsV0SOVrQ2kmJ0+Bs=;
	b=peZbvp+uX7RO7KoL4c5LkiMV9GUERmSid94u0cMFjbQaGFwSN2DSW1OpH1skNxvhkURo1A
	jkRtr5yBcOCnJmSgWrw9Co3B0VdJ6u8y2RHP1+vpYoxZFStx1ZFVVelXjAe3Ngy7GVdL8c
	sU5xd+qeBvnfJUH68MmOS8Qlx/oHez74A2izAtEDSVJfTD4Jj3VsTM3KLmrdP59ofcc/ig
	MvkIz9QP/dgniHvjNifvgwaikCR1ZLkpxMPaQxn/bFsSgSO1BW6cvNDU7bDm3zPyTS5rcq
	2m7l6bOb01EHQ4Jr7Bk80AsAO/1IfMSt2m9MUCzpb1As6R477TQ1Rsiq21gCmA==
Content-Type: multipart/signed;
 boundary=7c928e379149c708ec657bfbf13635c86dc30623af4f2b5a98f0c352d1dd;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Sat, 29 Mar 2025 00:09:37 +0100
Message-Id: <D8SA0W2ZEAQ3.3BO4NMONFJCRC@cknow.org>
Cc: "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Hans Verkuil" <hverkuil@xs4all.nl>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, "Andrzej Pietrasiewicz"
 <andrzej.p@collabora.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>, "Niklas Cassel"
 <cassel@kernel.org>, "Alexey Charkov" <alchark@gmail.com>, "Dragan Simic"
 <dsimic@manjaro.org>, "Jianfeng Liu" <liujianfeng1994@gmail.com>, "Jacopo
 Mondi" <jacopo.mondi@ideasonboard.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Kieran Bingham"
 <kieran.bingham@ideasonboard.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain"
 <umang.jain@ideasonboard.com>, "Naushir Patuck" <naush@raspberrypi.com>,
 "Jean-Michel Hautbois" <jeanmichel.hautbois@ideasonboard.com>, "Dmitry
 Perchanov" <dmitry.perchanov@intel.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <kernel@collabora.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/6] media: v4l2: Add NV15 and NV20 pixel formats
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-2-detlev.casanova@collabora.com>
In-Reply-To: <20250325213303.826925-2-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_161020_268108_F4CBC176 
X-CRM114-Status: GOOD (  18.09  )
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

--7c928e379149c708ec657bfbf13635c86dc30623af4f2b5a98f0c352d1dd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Detlev,

On Tue Mar 25, 2025 at 10:22 PM CET, Detlev Casanova wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
>
> Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
> 10-bit buffers.
>
> NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
> NV12 and NV16, using 10-bit components with no padding between each
> component. Instead, a group of 4 luminance/chrominance samples are
> stored over 5 bytes in little endian order:
>
> YYYY =3D UVUV =3D 4 * 10 bits =3D 40 bits =3D 5 bytes
>
> The '15' and '20' suffix refers to the optimum effective bits per pixel
> which is achieved when the total number of luminance samples is a
> multiple of 8 for NV15 and 4 for NV20.
>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
>  .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-common.c         |   2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  include/uapi/linux/videodev2.h                |   2 +
>  4 files changed, 134 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index b788f69338554..22cad8c9726bf 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -79,6 +79,13 @@ All components are stored with the same number of bits=
 per component.
>        - Cr, Cb
>        - Yes
>        - Linear
> +    * - V4L2_PIX_FMT_NV15
> +      - 'NV15'
> +      - 10
> +      - 4:2:0
> +      - Cb, Cr
> +      - Yes
> +      - Linear

In your cover letter you mentioned:
Imported improvements from [1]
[1]: https://lore.kernel.org/linux-media/20250225-rkvdec_h264_high10_and_42=
2_support-v7-2-7992a68a4910@collabora.com/

The changelog of "media: rkvdec: Add H.264 High 10 and 4:2:2 profile
support" v7 had this:
- Move V4L2_PIX_FMT_NV15/V4L2_PIX_FMT_NV20 documentation as suggested

Following a comment on v6 of that series.

But it seems these blocks are now placed at the location as it was in
the v6 series, thus NOT importing its improvements?

>      * - V4L2_PIX_FMT_NV12M
>        - 'NM12'
>        - 8
> @@ -172,6 +179,13 @@ All components are stored with the same number of bi=
ts per component.
>        - Cr, Cb
>        - Yes
>        - Linear
> +    * - V4L2_PIX_FMT_NV20
> +      - 'NV20'
> +      - 10
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
>      * - V4L2_PIX_FMT_NV16M
>        - 'NM16'
>        - 8

The same thing seemed to have happened here?

Cheers,
  Diederik

> @@ -302,6 +316,57 @@ of the luma plane.
>        - Cr\ :sub:`11`
> =20
> =20
> +.. _V4L2-PIX-FMT-NV15:
> +
> +NV15
> +----
> +
> +Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit compon=
ents
> +with no padding between each component. A group of 4 components are stor=
ed over
> +5 bytes in little endian order.
> +
> +.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
> +    :header-rows:  0
> +    :stub-columns: 0

--7c928e379149c708ec657bfbf13635c86dc30623af4f2b5a98f0c352d1dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ+csSwAKCRDXblvOeH7b
bnEaAQDRs0XJAsCh5SV9NORF9yiBN4xK9/ksqMZ7dptPRBqK+wEA6MAvdIFDX8KV
IsH2OmXqqcmhBEjMEtZRNbYrv/vtFQM=
=JnIi
-----END PGP SIGNATURE-----

--7c928e379149c708ec657bfbf13635c86dc30623af4f2b5a98f0c352d1dd--

