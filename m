Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FD8CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rk6LmjIbCHsYPNdyORQTlWLED3QFUIZxJF66Poqak0U=; b=VHK2kp5oLd8YWk+pRpxiV4ioum
	fP1KIwrpq/UOqVcP82MO4htJyYjpCJs9unkJXSJFCgWFCe6SllnhZ28LWIgDNpgI+Wni4D6Vr5NeA
	qxANU4AC8f6FGRWOwivuQQcpo3tjM5OPEdqqSb9JpG6Q/Jl1lITYu9mtNzWW64h+kMwGw3kimUfWB
	5dwGOcIQ6fz3zw7qL+FEJimTuerSTccShWYjWbrTIZE1pKydZMyQtNCZDDmZhiifmrI7fBvDX/6u/
	BuP5T5UF5suDPTXhiZHW1L33mWyY71c2ESOni4bE5rQki5Z3druFhKXnTogGpirD7FGY+I2+toSyK
	CwRD4q+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCu5-00000001Mwb-2McU;
	Thu, 18 Jun 2026 13:35:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCu3-00000001MwK-39P3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:35:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 45ABA40594;
	Thu, 18 Jun 2026 13:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1D81F000E9;
	Thu, 18 Jun 2026 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789731;
	bh=Rk6LmjIbCHsYPNdyORQTlWLED3QFUIZxJF66Poqak0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BLS8wM+7lNGipicaKQI08fr6BvpoZb8eQFBGEtcAz6VB81AbZ8KRuoXZm/Aq6wj6g
	 xYRyXinasz+XrelPwmme8HY0hJ0ltYqS7UnTdHA7izE6XGuxihVc1nWVx+fKC1kmql
	 GXJK3FKZnkS6zs2PST4qZc8YbPG8DmkHqC3xOi6R3Wz3pH9kxCBrsegUncuDz7o5ck
	 StCGUVzgPGABGUhAiUQlubgvBqSbcV7T1IBtE9Mb+0+1jKP2o33viI4bIXnP2NWDEX
	 qOD5DMWfmOGGGmSnmwPlRl8aptuhu4ojY5/eMHNHNAs7LYYDoADnvEBTngkwFmCdZ3
	 Qx/OQO3CyEb6Q==
Message-ID: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Date: Thu, 18 Jun 2026 22:35:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RrLQl9DO89jp5rWKR4YTMpyy"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RrLQl9DO89jp5rWKR4YTMpyy
Content-Type: multipart/mixed; boundary="------------y0w8N2KinVP4PMHfeQRfXe6b";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
Message-ID: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>

--------------y0w8N2KinVP4PMHfeQRfXe6b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hi Dev,

On 6/12/26 1:44 PM, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. =
This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.

I think most of overhead when enabling MTE comes from loading and
validing tags for every memory access (either in SYNC or ASYNC mode),
rather than from storing tags.

> Now, when a memory object will be freed, it will retain the random tag =
it
> had at allocation time. This compromises on catching UAF bugs, till the=

> time the object is not reallocated, at which point it will have a new
> random tag.
>=20
> Hence, not catching "use-after-free-before-reallocation" and not catchi=
ng
> "double-free" will be the compromise for reduced KASAN overhead.

I doubt users who care about security enough to enable HW_TAGS KASAN
are willing to compromise on security just to save a few instructions
to store tags in the free path.

To me, it looks like too much of a compromise on security for little
performance gain.

> This is an RFC because we are not clear about the performance benefit.
>
> Android folks, please help with testing!
>=20
> ---
> Applies on Linus master (9716c086c8e8).
>=20
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
>=20
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--=

>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
>=20

--=20
Cheers,
Harry / Hyeonggon

--------------y0w8N2KinVP4PMHfeQRfXe6b--

--------------RrLQl9DO89jp5rWKR4YTMpyy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajP0EwAKCRCGXBN6rc5S
1jNWAQDzVUDBUPeyt5upXL1mOoO9vGDvDLtilfxpmlxg7GO2qAD/YQLyoBRsQlGb
zVC6FeFHHk+biv6lxpZCj6qBEzmyqwY=
=XQEH
-----END PGP SIGNATURE-----

--------------RrLQl9DO89jp5rWKR4YTMpyy--

