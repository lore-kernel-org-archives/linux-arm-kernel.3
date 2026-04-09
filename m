Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ACE98FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqA9EVEREIPr2gUXqR2//AVsMWSuoQD0D6nQOgTz0Ww=; b=NLU+o0slT0TQjB42zJTkNgfzF5
	+odLClj6M2x0381wMB9TzFjDvrcj3beCj0ZZkqFEXIgjVniqlTDJy5rtCI5HE52xI0NENUDBQVHZ9
	QflLvDSqwzgsPl8204tsZSJbTKWR8EoqR6gAsgD9zmRg1HWau595HKT8s5wV8umPDzmF/SmCgZy18
	sBy1rY4WlKjEqohlOnco8bOJ/MGNkr2AbD9chHlXIPJQu73c+hjMYl6yMFwKV74+ABoGoq6PNrToQ
	L1m+pvUZjLyff7VHE1vKGNvg5rvpKKRvjqRaK2VWATYTY+ZTPgO0vABeUssLSPSdSlUJTezxFnut4
	gghVMJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVa-0000000AWdJ-0d3u;
	Thu, 09 Apr 2026 13:33:22 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApVX-0000000AWcO-3IbB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:33:21 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 277691F8005C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 13:33:12 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2A3EAB401AC; Thu,  9 Apr 2026 13:33:10 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E0762B401A5;
	Thu,  9 Apr 2026 13:33:08 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:33:06 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mripard@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Message-ID: <adeqkmA9VhaPkSAk@shepard>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcME/vMivydd7zm5"
Content-Disposition: inline
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_063320_251669_01D07F66 
X-CRM114-Status: GOOD (  23.98  )
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


--qcME/vMivydd7zm5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 24 Mar 26, 16:08, Pengpeng Hou wrote:
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.

Could you explain why it is legitimate that userspace would pass indices th=
at
are not in the dpb list? As far as I remember from the H.264 spec, the L0/L1
lists are constructed from active references only and the number of items t=
here
should be given by num_ref_idx_l0_active_minus1/num_ref_idx_l1_active_minus=
1.
We can tolerate invalid data beyond these indices, but certainly not as part
of the indices that should be valid.

However I agree that cedrus_try_ctrl is maybe not the right place to check =
it
since I'm not sure we are guaranteed that the slice params control will be
checked before the new DPB (from the same request) is applied, so we might =
end
up checking against the dpb from the previous decode request.

But I think we should error out and not just skip the invalid reference.

All the best,

Paul

>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/s=
taging/media/sunxi/cedrus/cedrus_h264.c
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -210,6 +210,9 @@ static void _cedrus_write_ref_list(struct cedrus_ctx =
*ctx,
>  		u8 dpb_idx;
> =20
>  		dpb_idx =3D ref_list[i].index;
> +		if (dpb_idx >=3D V4L2_H264_NUM_DPB_ENTRIES)
> +			continue;
> +
>  		dpb =3D &decode->dpb[dpb_idx];
> =20
>  		if (!(dpb->flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
> --=20
> 2.50.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qcME/vMivydd7zm5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXqpIACgkQhP3B6o/u
lQzEug/+L0i5WTWsYIfonjrs2jQjpLwvRKyR7+XhxwJUfL+txU8E2UXge7nNq3ja
ArsUnJXyjCzhaj1Tot8ptBKjfcSYOjbsFYHeiUIHvHNIm56Q0G1k+801TVEWRcXQ
LwKfkyBAl9HMf4FtR++yMoZ4f90tSJzpQJqjp04pTxQKErxB2S8V3HeW85m7qs/y
tORRrEawCMgs8J/Wn23IAl5j7mJKE9BK4WMasgmTqOG1qmTpw7FzyOR4peCD/pUx
L+QonrV1TRVGR3HW2ICL4Gmmu7utCzdgy7Sy/JN1wMgM1mLIEhIz+YuMmMjUVR+o
/yae3q+Ht3a2L/+nm4fhpElg2AVi/Eo0YpIrdE7TqqmHMxtY5sXllJBZGUHwdr/L
wF2XxBcP7bNx4IfBwkT62iAVxGaag4fzRsYGr3uG3En8i9Oo96p4rD8cDRS1/l8N
3WSYF8oVIG7hkaiqX4drUkqXGkt14HLB8+iNPz8a5cE9WW9CYeYwVJ2IC9F0DEgW
PbAvNDNpaCLdJjNxV0eFdggl0Ipq94xALhjOSFobhOlJjreOqNjLrsKpynsnD5K6
FWAw+Pj/fPDMhZvj8lfW3RW4T6pZ/KTFHzZ9wWjEgCiTbFNtjOxWc2V2CY9Q2YNI
3fDtG+tv1cKs0uLyMdwLLYcyo8BdtoCuTQas99LdqZv4TTKafxU=
=1orP
-----END PGP SIGNATURE-----

--qcME/vMivydd7zm5--

