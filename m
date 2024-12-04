Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE342E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrFMLc/jdh5p8JybRnIahA1b8Q2rxGK6wJh2KFAKrwU=; b=w4uYDxoDv4GRuoKMyRSEdiE1a+
	NCmCLCox/l0orRvfJnbdwhB+ZlaiduDc4feRMmkS9zSQd9weQ3bDU7rIWSTCBif+dnHP81wYBPPSk
	tBuQhyt4PC9EDc4IGv9crc+RceQKDVCDt8yrYl8fQZfYgRWxJ2ZgofLIzoXqOvOqISO4Gdy7GTEG+
	95EKd38P7YajmYXZN6UZizOYt+QcurXSY5w8HoAV6FrqX6ivK8cGsp9GIykXPyv0vxjXKFl0BvXZO
	1RVO4w/vnL2IAbZEyswekYqk0Do5pYhLV7Ton9Q6IJDcixleqgZfbU5hajv9gTvZMPneHKftiDzAW
	r25RGuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq5v-0000000Cmd7-2KPI;
	Wed, 04 Dec 2024 14:11:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq4t-0000000CmM5-0BHO;
	Wed, 04 Dec 2024 14:10:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385deda28b3so3443244f8f.0;
        Wed, 04 Dec 2024 06:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733321405; x=1733926205; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrFMLc/jdh5p8JybRnIahA1b8Q2rxGK6wJh2KFAKrwU=;
        b=WnoybWOB7fGKkuzXM4XNEh+/W1qfUz3WGi2xowrYSqQqyj1dsU5nqSxcmjoJMYFaRe
         WQx92RMuUI8+Porglu1M4rcc6/iRzOic1NQZPfoS/KPBT9/LOCCdRXjKt4vgmf0edLpt
         6TIwrtwBOtu6rw8vaecTt18f/v6he37jSaFgnvWszHvOjDBNVolOFfJnqVqX6wm9YXGN
         GFBBCzuwlPcoZ1rteNZln8uLkLdCBQQ9wW0XJ5SLu6o10oUWMfVLDXfOh28XkbqSl5ew
         ZLWdpvHULiV23Vo87jGUfckJinAoZmmbuMCkDPAU5J9rykB0Ux3D6gPSh9Qm00ob5ho5
         Ox4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321405; x=1733926205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrFMLc/jdh5p8JybRnIahA1b8Q2rxGK6wJh2KFAKrwU=;
        b=PXuwelwUyeMNgdOVXYQgRwC8w8Rntoa1x/Zor811kd76YHrze9rYHivvzO04Q0epRp
         Wg6HTrRymBR7TKSGiCDkaHIWcOMzERD2ORpNyPAELk2FVP6XjdODJ/UJ2l+EPFmyASFQ
         wOKKbimLjl5w/ogZvCOVJHC0MR9PblfWCHM8PIHlnTvzWuRkuWBW7eDrYTN6DIbR9vBg
         95LwFzNpNcxoVGKIyGQypKjL4/BU8Jui1Ok9d4hnkzgputXpBDbgHZ4c28g9ijL/SckX
         741oYUh9uszS825bbcnWeTItaXXRVV2RnbC8riqPFKU25OhuHPS9kBwaJVftHHQFbDhK
         ZovQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5kJ7DF/9O66lX82L2uSL8bT98/AQVgRct2rw/PAtUgXC5YLSmB88y98Sw1XvwraTMeBNIf8sENorvFGUDy+v@lists.infradead.org, AJvYcCXJTVenr4msr3OI/pd1qn1ko8qB/pBY3SPxaTqeSXpRDnFm/Lma1yXky+MUK24Bcn7GXxgMtF6vq3vqKTfc8aA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5b0DwojzTBZQSJdxAdIyEpvL90ct/2j2OeUdfWcPSbfI2NKqQ
	3pZngS3Ey/gVSnTJ5aCIeDmSvI4e7GvI3v9NtYa1reUnZGWnX4AE
X-Gm-Gg: ASbGncvY0bnjBCXWYlZy4iBbX19DE0qsHlDzPnAbIWfx8a1ge9mS6HrvUJsXPLekiQG
	+O/IrUUG5TrKupmLdn068OEHPO+0kCZA2narRcsY6rM7fGdf1WTj2sd8e/QCV/v2cu3kQCE5vkl
	rhZHEaMJ0nqIpyCtHaDCdbNIrk0xfTsD8gtlnDy2lY92Tk3DLM8d1E3adGee75GQtzmtLs5iIPd
	41XPimZ9K0PfcRaLsKbTIo/XfWZIKJBIPqR1hbERa1eA+VYUh2zrbHFXZGyl0driku/vlfSuDFR
	QIvgu4xThxpCOmtZOmHQRurnLyzrgMnjfmHr
X-Google-Smtp-Source: AGHT+IG17qKjHP7hajsb1NqDKGf26pPgtY+u2y2Irx0Mpfq+Bk5d1g+9CG/Zi2mBLwUCzK6vQKtkSA==
X-Received: by 2002:a5d:598c:0:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-385fd3e779bmr6188036f8f.13.1733321404995;
        Wed, 04 Dec 2024 06:10:04 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527257dsm26885385e9.1.2024.12.04.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:10:04 -0800 (PST)
Date: Wed, 4 Dec 2024 15:10:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Gax-c <zichenxie0106@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mperttunen@nvidia.com, 
	jonathanh@nvidia.com, kraxel@redhat.com, gurchetansingh@chromium.org, 
	olvaffe@gmail.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	mst@redhat.com, airlied@redhat.com, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm: cast calculation to __u64 to fix potential integer
 overflow
Message-ID: <xlmfl2rhjgczu6oycgogchqi2gc65w7s3qy33yxzsrf6mbri3q@7onulkroaa7z>
References: <20241203160159.8129-1-zichenxie0106@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="magv3qwbnz55o6h7"
Content-Disposition: inline
In-Reply-To: <20241203160159.8129-1-zichenxie0106@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_061007_083734_3314DFDA 
X-CRM114-Status: GOOD (  12.88  )
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


--magv3qwbnz55o6h7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: cast calculation to __u64 to fix potential integer
 overflow
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 10:02:00AM -0600, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
>=20
> Like commit b0b0d811eac6 ("drm/mediatek: Fix coverity issue with
> unintentional integer overflow"), directly multiply pitch and
> height may lead to integer overflow. Add a cast to avoid it.
>=20
> Fixes: 6d1782919dc9 ("drm/cma: Introduce drm_gem_cma_dumb_create_internal=
()")
> Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
> Fixes: dc6057ecb39e ("drm/tegra: gem: dumb: pitch and size are outputs")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c | 6 +++---
>  drivers/gpu/drm/tegra/gem.c          | 2 +-
>  drivers/gpu/drm/virtio/virtgpu_gem.c | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

I don't think this can ever happen. All of these functions should only
ever be called via drm_mode_create_dumb(), which already ensures that
these won't overflow.

Thierry

--magv3qwbnz55o6h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQYrcACgkQ3SOs138+
s6HXsxAAtQJlAEOMdgNNQBcnlKziuLGEV6eDn2I2ZMbyfdflAwfxU1IZem8HHolu
Uf8rl4/XAETFBzeMup8SZ+DvspOCUSQY6kf8Dh+25/5NDTEf50vjBA/TXcws/ced
6pRImbXzulFvz7kEm/fOaTXdk9w7mKnNDpFj86FUBcuz5kIQm1Qo4uhEYZRR9BSs
C5c6m77m/4N3Iw7mkJoKW1U0jDJpfgw/iCdUpZrNh2buoKaRhe3WasizYdpXcbIn
ImHPVPKV7MUgLrlYjdqOlxninIKhRMB9n5hcbvHD2YQcv9Y3pj1XA9YzXu3+4pir
Sq6HLJFoHy+vmeLdTJZsMEljM25tBtkXkIUVEiWUb4BTbjJHLikCT4IYvfm9wByx
OKCLKtdAiKyC1mh3aswnmeHb9tHBTt2Zj++nl2u/oUJyUncmBeboX7Wh+C9aCWF3
cjT8OzvzTFX0bTLWyO9n0hwM9n84di0kuVmN8Bm7erXZcFAQyJfQpVB8lqiXokYA
iw+IZX7DQQ8oKnxYpXy+V+gxSD19e4fed6jzgGpn7s+JYRuH1SiBSA4iaIQ8OCze
7FPuGM5WT1d92OgNUU+jC3gjM58QHwLiEFhJgV2Oj6/sOi5fs1JY9uGKlMbxynlF
PQm2NJU7k9lZXI2hxYRY6AmtikgF4NSYiz5zgglZvHpLoeLItpo=
=dkp1
-----END PGP SIGNATURE-----

--magv3qwbnz55o6h7--

