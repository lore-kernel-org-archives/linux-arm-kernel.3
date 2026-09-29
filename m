Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DD3CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hy0Z7g0k5BdEZ5Ocq6wEdB+TmRlfMsQeWatc+/oqaY4=; b=puUX1Rl9oZ75hNfY21n3PUP3Pa
	qyZ2C7vlbWGUm21Rnq+WAyvyWI0htIH7ulyh+VkbKu3EIN/qf8vaiTCmr0LMjsqh0rp11cZ0wd92/
	B1+/N2LeYS8LwpZOVI2Ny3g0yZvS23AGx0Flzik4wBIQ0GSNTd7YLve4u/05aS8QtfIZYD90qPijZ
	dLFNlQ8D6XgcrHGp2kyS8Q8FzKsrXxGI20we72ZkkGKIurGIQMrhnnY9ut9H2LWaJjxuJXWY7nhl0
	kbjDx/lrrimMcwAyXvRm5B5MNQgm2AoRgypMAnzlTpzDjfJt6NBaNjPrrvN1tAusmObHqY5nHIYPY
	T4nD+gBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBePx-00000004UP2-1wMf;
	Tue, 29 Sep 2026 20:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBePv-00000004UOn-3Hta;
	Tue, 29 Sep 2026 20:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hy0Z7g0k5BdEZ5Ocq6wEdB+TmRlfMsQeWatc+/oqaY4=; b=AD4PCwm0abtMGY5boOIzYFrSPH
	X6UB5WTtBE7uz4cWwggTwBwbHmpl/llOxDb37TzFAgd5mWTl0vNS2uBI4Qn6r0G0dYH+36F0goi4P
	KMchYzs8asAV5PcxgeJ2NwTh3FOhpvuNwqkNglixhbfAECy2s74HFl38EKMlHw6KcHwpmtGSDAKMI
	tLfmUg1fyWSBUEdCacP9PHK+gA09mYrnnkV9zuZZis4oBXzuWkcc5NmRMCwJqB9G9VA0ZdXabxjAz
	cjVZiEZ9dF/n6v/acUdokTEGCg1B/wZJfvmDVEPV1FmgwZx0VVvkTMO5oVXFIKniesRhNo7vk54/F
	pm+CZ6HA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBePp-000000033uI-03AG;
	Tue, 29 Sep 2026 20:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790713618;
	bh=DkHl216R8HsWOjEtGTLQqdSyQom/zGA2tKkvsdwDZYU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TvFU9C9Pbg/JzO7ElZRPimssQgIEjJ2O+y47e02mjN7B5re1GnOWJ2BbvYWhNNp17
	 T1Akjncag7PuCiEoPPfIgVDUzYd3K36JyRBSSy1aiIU5w/msMQugPDcHBt8mH7x1oP
	 GDfogMllekTuriiWr+Eo8jW4OC4m44QDMWYdGspci/W+OJ7Gdxt1i4mfXicmrZYp37
	 tcMnhLzHJNNzkkt78qjieaQWD6O7YSwK7vp5kVpiTY+enHh8SPxuR/5uobMpxfg9+2
	 Y1qT8xbzt77mkxXoZzgqqLW+x64NaHWHoVz8PYVlRYS1Z3VNk+bmFswyYVKDQOFwdL
	 nR3ngVmlMXtOg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4D56F17E0B21;
	Tue, 29 Sep 2026 22:26:56 +0200 (CEST)
Message-ID: <90a604622a614a2de95820bdc73372a3e1d7fb41.camel@collabora.com>
Subject: Re: [PATCH] media: mediatek: vcodec: fix decoder child device leaks
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Guangshuo Li <lgs201920130244@gmail.com>, Tiffany Lin	
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Hans
 Verkuil	 <hverkuil+cisco@kernel.org>, Kees Cook <kees@kernel.org>, Tomasz
 Figa	 <tfiga@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, Steve Cho	
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Tue, 29 Sep 2026 16:26:54 -0400
In-Reply-To: <20260921090808.336112-1-lgs201920130244@gmail.com>
References: <20260921090808.336112-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-rV4yfsU2n0WfwiE+CTHf"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_212705_391723_C538C0BE 
X-CRM114-Status: GOOD (  22.64  )
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


--=-rV4yfsU2n0WfwiE+CTHf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 21 septembre 2026 =C3=A0 17:08 +0800, Guangshuo Li a =C3=A9crit=C2=
=A0:
> mtk_vcodec_probe() populates decoder hardware child platform devices on
> platforms that support decoder subdevices. These children must be
> removed with of_platform_depopulate() when they are no longer needed.
>=20
> If initialization fails after the children have been populated, the
> probe error path releases the parent decoder resources without
> depopulating the child devices. This leaves the child platform devices
> registered.
>=20
> The remove path has the same issue and leaves the child devices
> registered when the parent decoder driver is unbound.
>=20
> Depopulate the child devices in the probe error path and in the remove
> path before tearing down the remaining parent resources.
>=20
> The issue was identified by a static analysis tool I developed and
> confirmed by manual review.
>=20
> Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware de=
code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index e936ed8dffba..592685ad522c 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -517,6 +517,8 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
>  err_dec_mem_init:
>  	video_unregister_device(vfd_dec);
>  err_reg_cont:
> +	if (dev->vdec_pdata->is_subdev_supported)
> +		of_platform_depopulate(&pdev->dev);
>  	if (dev->vdec_pdata->uses_stateless_api)
>  		media_device_cleanup(&dev->mdev_dec);
>  	destroy_workqueue(dev->decode_workqueue);
> @@ -569,6 +571,9 @@ static void mtk_vcodec_dec_remove(struct platform_dev=
ice *pdev)
>  {
>  	struct mtk_vcodec_dec_dev *dev =3D platform_get_drvdata(pdev);
> =20
> +	if (dev->vdec_pdata->is_subdev_supported)
> +		of_platform_depopulate(&pdev->dev);
> +
>  	destroy_workqueue(dev->decode_workqueue);

This was first for a reason, please keep first.

Nicolas

> =20
>  	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {

--=-rV4yfsU2n0WfwiE+CTHf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwfDgAKCRDZQZRRKWBy
9FakAP4vcR8SMhV7pVZIdxreL/3W6hen9hQOFj6cC3ZEarcA2wD+LAwK/qdsJ85/
pSIKX2XUmKWpyl2obUYqdo/NDZ69UQU=
=Asfv
-----END PGP SIGNATURE-----

--=-rV4yfsU2n0WfwiE+CTHf--

