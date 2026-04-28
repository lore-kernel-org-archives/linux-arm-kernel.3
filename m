Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FCFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71LCOMqFrz04IEtzeuJuChjfkwvGbSYQSDEYmebNs9A=; b=zxRIzb5x+tEz5F73qv7oOmVwMD
	2cAzcA9nIhpVaBH4MugxxSCcGPhagcRJeQWynLHX+l5MqIl3uFVS6/oGFd0PIUR3CHE/4kokWrcvJ
	H32CCF8unNhF1fb185vqzPhcjT4Qk+K7KUDqttdKBAywlars+IJd+UnvoJf7xFcjiwc07vNLzb/AV
	X1gwe1ZRkcpCGC8p4t5RF/DhekmfLAykZ59fKq4eMZ1Jmr5Uc1dFEwM22hb4ss2mXoNUkZPjoOczQ
	VTKldNN9jKb7i37XEY3ru5xvHZaDSbSr2kvYx6mbWu6HKMlClsSXWKq76HUvvahKrJ1M8qzNmy4V1
	bg/XKMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoIw-00000002ArD-2Kmq;
	Tue, 28 Apr 2026 19:41:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHoIu-00000002Aqk-3AZI;
	Tue, 28 Apr 2026 19:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777405265;
	bh=OLk9eY4xezvz9+DAPYOerAqqqeIZ4b5yBW/4U6YrOg8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=O2Jrx7eg+ftQqnxrsrTNhEJR47eXRhP/ArA+uPDT4ddmag/Wv19rFga4TyoqjJpyR
	 VY/GxjOWjBxDhZxGZckggl0B981VF6cteS6VsbSa7+all6ngTP5y5ekdVKcaCIGSPU
	 0I8uC/yTucPTeE/PddfV0QWMUc33Clmu+YWFDm2rS+WGIMb/5grU7QbPmIFahGOr/e
	 y4xqP9PzqR/q1VFaLwQ4GsnV563OsNL+T5YyYiV31Xr3Sw0SPyTK0zdl5dnOlWyDN3
	 BB45e1A6CHqo4L/2Da2u+zOt004uRfD9e4cZfieB8tpCu3ICifzzfj6fmc/1H/YSXj
	 +IktcUs+icVJw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 506E017E0615;
	Tue, 28 Apr 2026 21:41:03 +0200 (CEST)
Message-ID: <b5edc1a6931a3b9f63d53c8267ea2117fd690471.camel@collabora.com>
Subject: Re: [PATCH 11/11] media: hantro: Add fdinfo callback
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
Date: Tue, 28 Apr 2026 15:41:02 -0400
In-Reply-To: <20260212162328.192217-12-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
	 <20260212162328.192217-12-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-mPo9ivf2B9N/Jc9BUcpD"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_124108_943032_3B325D4E 
X-CRM114-Status: GOOD (  20.72  )
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


--=-mPo9ivf2B9N/Jc9BUcpD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 11:23 -0500, Detlev Casanova a =C3=A9c=
rit=C2=A0:
> The fdinfo shows the number of buffers in each queue and the total amount
> of video buffer memory.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

Notice that the FD info is not linked with all the ftrace work, and could h=
ave
been kept separate. I think overall that this fdinfo implementation is a bi=
t
limited, and lack helpers or introducing of common statistics that would be
opted in by other drivers. I would hold on that until we have a bigger and
robust plan.

Nicolas

> ---
> =C2=A0drivers/media/platform/verisilicon/hantro.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/media/platform/verisilicon/hantro_drv.c=C2=A0 | 15 ++++++++=
+++++++
> =C2=A0drivers/media/platform/verisilicon/hantro_v4l2.c | 10 +++++++++-
> =C2=A03 files changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro.h
> b/drivers/media/platform/verisilicon/hantro.h
> index d5cddc783688..9e9fc0658586 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
> @@ -268,6 +268,7 @@ struct hantro_ctx {
> =C2=A0	const struct hantro_codec_ops *codec_ops;
> =C2=A0	struct hantro_postproc_ctx postproc;
> =C2=A0	bool need_postproc;
> +	u64 stats_buf_memory;
> =C2=A0
> =C2=A0	/* Specific for particular codec modes. */
> =C2=A0	union {
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c
> b/drivers/media/platform/verisilicon/hantro_drv.c
> index 8dd26ca32459..86d316a8a3e8 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/pm.h>
> =C2=A0#include <linux/pm_runtime.h>
> +#include <linux/seq_file.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/workqueue.h>
> @@ -711,6 +712,19 @@ static int hantro_release(struct file *filp)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void hantro_show_fdinfo(struct seq_file *m, struct file *filp)
> +{
> +	struct hantro_ctx *ctx =3D
> +		container_of(filp->private_data, struct hantro_ctx, fh);
> +
> +	struct vb2_queue *src_q =3D v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
> +	struct vb2_queue *dst_q =3D v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
> +
> +	seq_printf(m, "src-queued-count: %04u\n", src_q->queued_count);
> +	seq_printf(m, "dst-queued-count: %04u\n", dst_q->queued_count);
> +	seq_printf(m, "buf-size: %llu\n", ctx->stats_buf_memory);
> +}
> +
> =C2=A0static const struct v4l2_file_operations hantro_fops =3D {
> =C2=A0	.owner =3D THIS_MODULE,
> =C2=A0	.open =3D hantro_open,
> @@ -718,6 +732,7 @@ static const struct v4l2_file_operations hantro_fops =
=3D {
> =C2=A0	.poll =3D v4l2_m2m_fop_poll,
> =C2=A0	.unlocked_ioctl =3D video_ioctl2,
> =C2=A0	.mmap =3D v4l2_m2m_fop_mmap,
> +	.show_fdinfo =3D hantro_show_fdinfo,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id of_hantro_match[] =3D {
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c
> b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index fcf3bd9bcda2..6d129613ea3d 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -820,18 +820,26 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned i=
nt
> *num_buffers,
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	ctx->stats_buf_memory =3D 0;
> +
> =C2=A0	if (*num_planes) {
> =C2=A0		if (*num_planes !=3D pixfmt->num_planes)
> =C2=A0			return -EINVAL;
> -		for (i =3D 0; i < pixfmt->num_planes; ++i)
> +		for (i =3D 0; i < pixfmt->num_planes; ++i) {
> =C2=A0			if (sizes[i] < pixfmt->plane_fmt[i].sizeimage)
> =C2=A0				return -EINVAL;
> +			ctx->stats_buf_memory +=3D pixfmt-
> >plane_fmt[i].sizeimage;
> +		}
> +
> +		ctx->stats_buf_memory *=3D *num_buffers;
> +
> =C2=A0		return 0;
> =C2=A0	}
> =C2=A0
> =C2=A0	*num_planes =3D pixfmt->num_planes;
> =C2=A0	for (i =3D 0; i < pixfmt->num_planes; ++i)
> =C2=A0		sizes[i] =3D pixfmt->plane_fmt[i].sizeimage;
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

--=-mPo9ivf2B9N/Jc9BUcpD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafENTgAKCRDZQZRRKWBy
9BsUAP9keTpZV1Y5F4NDekycFkwncQ+O5HeqmyFBR0miRmeESwD+MCMHlCAyPRsd
wcOQ8R0TcqNfmy46huIbDq7Nt3JFwA0=
=DWyo
-----END PGP SIGNATURE-----

--=-mPo9ivf2B9N/Jc9BUcpD--

