Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB09C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgWmOF0xJqXdPM8o3ez3GknSeDctD1bDD+zW1QI+Skw=; b=OHaHO1vRGYkZvmSEDdGZzrJL1j
	YlHlZMqnjLxlF0FOg3EdjUoPrN9bsrC/xApIQ4qeGQ5dSB+T6XQxWGMrnPwa2jswoV6P7zMW/hYaR
	JXIYvqz1M2laf0jZaab7X4mWiaIAcRtsNwbKSG+/7os4Pcd+NomIZVL7oaws1ZMkrZuxmv1ve0zMp
	9G/sRvyfElAZFeiZ7UyjV45mpNl39WLkDMq906hS0xfDvJz0ttRm1I0ANCDCT8RUc5h+bitpa5uii
	u7lW5UjDCEvrty/tjw6M2CWUPsTy55VnLXb9EhcdGFNG+CgLtfE7WFYlmVT/wza3yOOtAIZYClo9z
	VKIVogDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nsr-0000000BsOi-0bQm;
	Thu, 24 Sep 2026 18:09:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nsq-0000000BsOc-2iaY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 18:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RgWmOF0xJqXdPM8o3ez3GknSeDctD1bDD+zW1QI+Skw=; b=H/s8VvjqpQ3rPxpzsDWb2DOCvj
	EXRraz1p4/q3yCJdN56IUECHoRaFL15QuqfUSxBmq/5ICOIE65grmSTwjK99DUfa+CoV2X63ei7nQ
	GM5SBaGFqtavk763/8rsn/SoaJXkENlTEbQzBUg1ZU36GTWmgrWfas9rWthtvSHxwdbUn7IKT41Ul
	BDAiM2J5zGSC3N4vfEq7AKtGCyBKpA+H2E/gtxHv2O8C5EfnsqS2yMC1ys4MTcBtVmreG45URRfHj
	6Hpe12DIUTcMuEltSoSpWpmoYRpGXvt2vIoiFWndfe2R5XKabtboqTt/uxQ+f5GMs2TH9ycVOefA/
	y2Yq9eog==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nsn-0000000GHtA-2Ge9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 18:09:23 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5DB083700ED8
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 18:09:11 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A6415B64BD2; Thu, 24 Sep 2026 18:09:09 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 6C623B64BC9;
	Thu, 24 Sep 2026 18:09:08 +0000 (UTC)
Date: Thu, 24 Sep 2026 20:09:06 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	devicetree <devicetree@vger.kernel.org>,
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-media <linux-media@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E
 support
Message-ID: <arVnQmik-CveaAkY@collins>
References: <20260522101653.2565125-1-paulk@sys-base.io>
 <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins>
 <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CZn6uW8WXhqK4f0/"
Content-Disposition: inline
In-Reply-To: <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_190921_745137_05E7332B 
X-CRM114-Status: GOOD (  19.36  )
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

--CZn6uW8WXhqK4f0/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Le Thu 24 Sep 26, 07:30, Michael Nazzareno Trimarchi a =C3=A9crit :
> I have added your patch to gstreamer
>=20
> v4l2codecs: add the stateless H.264 and VP8 encoder elements
>=20
> Backport of the encoder work from the branch v4l2codecs/h264enc of
> https://github.com/paulkocialkowski/gstreamer (commit f59de5779ef1, based
> on release 1.26.0) onto the gstreamer1.0-plugins-bad 1.28.5 this build
> uses.

Yes this is the right gstreamer branch to use here.

> Generate the right element and encode stream:
>=20
> gst-launch-1.0 videotestsrc num-buffers=3D100 !
> video/x-raw,width=3D720,height=3D576 !  v4l2slh264enc ! h264parse !
> matroskamux ! filesink location=3D/tmp/t2.mkv
>=20
> And playback over Wayland.
>=20
> Solve some problem. I have implemented:
>=20
> const struct hantro_variant px30_vpu_variant =3D {
>         .enc_offset =3D 0x0,
>         .enc_fmts =3D rockchip_vpu_enc_fmts,
>         .num_enc_fmts =3D ARRAY_SIZE(rockchip_vpu_enc_fmts),
>         .dec_offset =3D 0x400,
>         .dec_fmts =3D rockchip_vdpu2_dec_fmts,
>         .num_dec_fmts =3D ARRAY_SIZE(rockchip_vdpu2_dec_fmts),
>         .codec =3D HANTRO_JPEG_ENCODER | HANTRO_H264_ENCODER |
>                  HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>                  HANTRO_H264_DECODER,
>         .codec_ops =3D px30_vpu_codec_ops,
>         .irqs =3D rockchip_vpu2_irqs,
>         .num_irqs =3D ARRAY_SIZE(rockchip_vpu2_irqs),
>         .init =3D rk3036_vpu_hw_init,
>         .clk_names =3D rockchip_vpu_clk_names,
>         .num_clocks =3D ARRAY_SIZE(rockchip_vpu_clk_names)
> };
>=20
> I have advertised the:
>=20
>        {
>                 .fourcc =3D V4L2_PIX_FMT_H264_SLICE,
>                 .codec_mode =3D HANTRO_MODE_H264_ENC,
>                 .max_depth =3D 2,
>                 .header_size =3D H264_ENC_HEADER_SIZE,
>                 .frmsize =3D {
>                         .min_width =3D FMT_MIN_WIDTH,
>                         .max_width =3D FMT_FHD_WIDTH,
>                         .step_width =3D MB_DIM,
>                         .min_height =3D FMT_MIN_HEIGHT,
>                         .max_height =3D FMT_FHD_HEIGHT,
>                         .step_height =3D MB_DIM,
>                 },
>         },
>=20
> Create the rockchip_vpu_hw_h264_enc.c. I need to test this on rk3399

Then I guess this is using register configuration from the earlier H.264
encoding work that I've done at Bootlin, adapted for the new stateless
encode helpers? That part is probably not quite trivial, which is why I
was a bit surprised.

> I have a small change only in the common part. Hope that it's a bit clear.

Yes in comparison to the register configuration code, the platform
changes are rather small indeed.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--CZn6uW8WXhqK4f0/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmq1Z0IACgkQhP3B6o/u
lQyEpQ/+IyLXFwk9YODr0WJI5I/wgdBuKj8S2gQmK7H45sYlvZfEDYQ+j4AV9wyl
cOncZklhJzTNhVkAUthAjhHyJTl0PDAwk/Smf/zc6dd72xWf77NAK0QlvBRFDQqS
kATP5MQfhKYXxnmPe5Aqbkb3xRSrxqjgnm8JbA7d/mh0R0ms8D07ekMxVHTSNJqe
Kad2GX8HvnJDM+ETEQYFm4wr4PUVMW/LMEB9yE6sFjw4wdvFw0AQaJn9GIOenIJL
S5OklJjNSg/FwO9qyLdYP+hoWn3DIxW3fHBotVZqlttgJSkCjG0SnCZbhKRhKyAu
mmRjQhQ1m1LjvPxcNsIdgP4kUoSgP6239nLbapUvYnnbl1lNh0jDQYNuWBIKs1FU
cn80fGsJxqYO3spl3pw1rCm5u+5mfAOz4rTquUfqVSWn44N5uSyjMMAHkddTUh1U
JisiR3msNZLvStkbK0syAbQnhGXpyQC8grMremDf+jGXuYYySRv3vkPK7i/S+HfT
zD3PCw3oriPh7b13A/d2CT1lW51sqkwKQacPEuKFqLm++hRJX4t65byE3OhhNpaI
NXggjvgwk1c9EZ31GVuK/fyGoQvnWk0eUuRVCMs04gVpPX0G54tEG/DQtqyjjD4Q
hCgzC339OPU4ma6H13w94ODFw4iNvUgBRZpffBAAOPyYpuzDujA=
=YnXV
-----END PGP SIGNATURE-----

--CZn6uW8WXhqK4f0/--

