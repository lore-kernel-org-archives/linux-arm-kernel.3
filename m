Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93066CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HT2hqwAZZG0UAbHiYEwWNljrR3mJBNDjqO64v62M4Fo=; b=x/NjWAFU8JpvNh8iR/PPOw7AHK
	0zWWNKQyvc76kIuuH9T9XNa/A2rS0M50e7Mz/iu6QVRJfxEuolKd20w90HKfkbhklGwKWpPLeHZ5m
	/eOGD/DabUDIQGqusYFDWCAngsOBgeDrvuNDE7z1lu4OH0zwxcs4eYshxYyQU6JL2PaH9cBEbd5kR
	pQsMy3/UTvicxqBdN/TMyV2YnKb1mUlH7EI9oiXk6Ak+kRLzxkWfkjHsyJoVCF0cCG3tnez4K+jom
	DE9m7k0e5e/ZfBJ2WOrznSrgS7l/2SIo6gdArIjPH/aXLHGap5geziU3Hm9cwGYBCyfqqinEIBn/6
	66UKTc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulryg-0000000BR8K-2ufR;
	Tue, 12 Aug 2025 16:35:58 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulozW-0000000AuUl-1ohX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 13:24:39 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755005066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT2hqwAZZG0UAbHiYEwWNljrR3mJBNDjqO64v62M4Fo=;
	b=fO1COuL7ORNxs3B9H3eGGgHU9jirAwVsKZdXfDYQgh+bWhrPOwnFtvbFpwFtmMrK8h7QSx
	G1R1zOR/S018416supYWIA/skr45GD15EDyxzwf5e02YMHZ3gWFQuWrV2108YVFoKmMHyc
	hbuoLiHAtfyt6ZgiYCo20JrHBiT6byXF+QYtTvctbCorhcpSW/GeEyUGP3zR/E0lWMdhHe
	BjWQezA7xH3eHnGuTxNraXzhvJ0fQLGcXrAI64bheWpRKS/FiWloe/KEsydGnJK9vU4bHC
	SXnUYbPFfsivpYnu++s2au44lOTAWHdj3xDLn+7hr1tUQUVkX9R1EGDKhsOHuw==
Content-Type: multipart/signed;
 boundary=72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 12 Aug 2025 15:23:55 +0200
Message-Id: <DC0HD39JC201.N1K8MVD1P7OI@cknow.org>
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Piotr Zalewski"
 <pZ010001011111@proton.me>
Cc: <hjc@rock-chips.com>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me>
 <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me> <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org> <4207630.fIoEIV5pvu@diego>
In-Reply-To: <4207630.fIoEIV5pvu@diego>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_062438_612642_91178453 
X-CRM114-Status: GOOD (  14.99  )
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

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Heiko,

On Sun Jul 6, 2025 at 12:46 PM CEST, Heiko St=C3=BCbner wrote:
> Am Sonntag, 6. Juli 2025, 12:37:40 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Diederik de Haas:
>> On Sun Jul 6, 2025 at 12:20 PM CEST, Piotr Zalewski wrote:
>> >> With a new version of a patch, you're supposed to add the tags you
>> >> received for previous versions, like my Tested-by tag [1].
>> >>=20
>> >> (unless the new version has changed so much you feel they should not =
be
>> >> carried over; you then need to explicitly describe that and why you
>> >> dropped them)
>> > =20
>> > Forgot... Should i send it as PATCH v2 RESEND?
>>=20
>> I don't think that's needed; the maintainer will let you know if that's
>> desirable or that they will add it (back) when committing.
>
> The problem is then remembering to manually collect the tags from a
> previous series.
>
> For my reference, it was
> Tested-by: Diederik de Haas <didi.debian@cknow.org>
>
> So hopefully I'll remember now :-) and there is no need for a resend
> at this time.

Is more needed to get this patch accepted? If so, can I help with that?

Cheers,
  Diederik

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaJtAgAAKCRDXblvOeH7b
blk/AP9qVD2EKzBtPo/59n2gdL4G9t/u9M80pLQJzj/tM0PwowEA/d9FYzxx/rFZ
lfZGkb8gpfOqw60ZYCxDwIfQQoqU7wQ=
=3G71
-----END PGP SIGNATURE-----

--72ec2ff28c27c182335a5ca95df6427b9de7efab639d68f403e5354ccd1f--

