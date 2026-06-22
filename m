Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E2CCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sBB9HIOJyh0+Q0tdVfj5BPTOtaz69ZBxp/hs1U8uyTg=; b=N9PukhZdhI8oMy7aKfsMJvhDdP
	3M2B5/hoWnW8jD+T4HLzf9oAvJaACSnX9BWYYpm6/OUhjVE/8T5aI41BUYHNtUaPIxi0H9ltWVCQO
	NcxhG2vkjOtWJIpDm8NNl8KnpWm/XLG9WGLtMI7xnevwDN6suon2p5uyJ2O3vlEo68v0d2tOrtUP1
	J6JyBPW4yw/9gJ+2QU6K+QGPWC3+GhtxZcMqp2Se2fBAIyY0gX+i7XfsoLXJRz6CN3FyVRoPUf/gC
	uNXMQWsWn7htrW/zhtZH5K21YmwWbcHTXasKRkhBi0jzPvb50BseooS+g8/5pgqkGoF2lL9IhpWsb
	8XODWjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdz1-00000004yKL-1tyn;
	Mon, 22 Jun 2026 12:42:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdz0-00000004yKF-0Ndt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 12:42:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A4C96008A;
	Mon, 22 Jun 2026 12:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA621F00A3A;
	Mon, 22 Jun 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132153;
	bh=sBB9HIOJyh0+Q0tdVfj5BPTOtaz69ZBxp/hs1U8uyTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KiUQC1bI/NhfyctJLPMotIQzxW83XndStg/PtDhr/qg5jbTQLrqw2JqVnJBpjLAYh
	 Eela41QyhwlZebJRBHeTf1rc0/F76YSzr2jWcDtiK2vpuUZqJyOh9d1kh1cuN6xBR+
	 dc/6MlJL9RYmhezFY20KznZRo/RqADe2wR+wxCdoqA3w76THZZXJBlYHRBj5eNwEL8
	 rjyLcShGMbmu3AjyHYavIQA2rk7oFcwlbwrahiS6dDeSr5/eT2VqC4vrbcOqinm5FE
	 +Yu2Llh8Tm6gfVg/3xoRPl4lWkTKrzlUKYw3REicBtT/iT5QaiRNXHqePtqljF92q3
	 NsFFXorFVrqvw==
Message-ID: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Date: Mon, 22 Jun 2026 21:42:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org> <ajVByfkLbetzA8bB@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <ajVByfkLbetzA8bB@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PC6AVe6DTCIpK9DJB7Cd0h9E"
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
--------------PC6AVe6DTCIpK9DJB7Cd0h9E
Content-Type: multipart/mixed; boundary="------------DucNVyWowjWn2Qipbe0sleBO";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
Message-ID: <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org> <ajVByfkLbetzA8bB@arm.com>
In-Reply-To: <ajVByfkLbetzA8bB@arm.com>

--------------DucNVyWowjWn2Qipbe0sleBO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Catalin,

On 6/19/26 10:19 PM, Catalin Marinas wrote:
> On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>> Introduce a boot option to tag only at allocation time of the objects=
=2E This
>>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>>> catching bugs.
>>
>> I think most of overhead when enabling MTE comes from loading and
>> validing tags for every memory access (either in SYNC or ASYNC mode),
>> rather than from storing tags.
>=20
> I guess it depends on the workload. Lots of allocations for short-lived=

> buffers (e.g. network traffic) may notice the additional tagging more
> than the actual tag checking.

Agreed. Likely depends on lifetime and size of objects.

> Of course, it would be nice to get some numbers from those who have
> access to MTE capable hardware.

Agreed! (I don't have one, unfortunately. It's pretty new hardware
feature)

>>> Now, when a memory object will be freed, it will retain the random ta=
g it
>>> had at allocation time. This compromises on catching UAF bugs, till t=
he
>>> time the object is not reallocated, at which point it will have a new=

>>> random tag.
>>>
>>> Hence, not catching "use-after-free-before-reallocation" and not catc=
hing
>>> "double-free" will be the compromise for reduced KASAN overhead.
>>
>> I doubt users who care about security enough to enable HW_TAGS KASAN
>> are willing to compromise on security just to save a few instructions
>> to store tags in the free path.
>>
>> To me, it looks like too much of a compromise on security for little
>> performance gain.
>=20
> I don't think there's much compromise on security for use-after-free.

I think it depends... OH, WAIT! I see what you mean.

You mean use-after-free before reallocation does not lead to much
compromise on security because objects are initialized after allocation?

You're probably right.

Hmm, but stores to e.g.) free pointer, fields initialized by
constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
will be undiscovered if they happen before reallocation.

Not sure what are security implications of that,
but sounds worth discussing.

> The buffer will be re-tagged later so use-after-realloc should be
> caught, especially if we ensure that a different tag will be used (I
> don't think Dev's patches do this).

Agreed that it'll be nice to ensure that.

--=20
Cheers,
Harry / Hyeonggon

--------------DucNVyWowjWn2Qipbe0sleBO--

--------------PC6AVe6DTCIpK9DJB7Cd0h9E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajktogAKCRCGXBN6rc5S
1mwdAQCV/v9TESQBXaNvWWnvoxqvNG1qbVtP+p+94ya719IJXQD/fT2zvm7NaU5r
ozgxj903g6vHgfHpqx9u07IM7QQCrwQ=
=GrWq
-----END PGP SIGNATURE-----

--------------PC6AVe6DTCIpK9DJB7Cd0h9E--

