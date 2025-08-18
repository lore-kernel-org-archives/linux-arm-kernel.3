Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75549CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Sm6rcZ1Tg7xHOZ+VqXutG9SOEvoL57FBIDaQVoFNrU=; b=TEzPX2uojc/4l/BOU7EvCFR0Vh
	ENgkxShhrrm5u104TfE41nxFQou4Ut9M6rPO6COyBdlpeflnfZ6LRVcTP/q6yxaLoM4/HYj310E/P
	hYzGBx0vlvdQ3JL/M8q60+vorzkiqdoSfpavCIXWgDtWHMR+5lftH2YAYoLSgYpgWUB/npmdSrclT
	hGzXs2uNYfj3w9R5lBUoid3vtPqriHqpu1SPfs5/0zgITH4ptyzcHrIW5QjnD/joZsxOi6s10+4QN
	8e2bztsMUmUN+J2TRj7uXE6w+XlcpWB0M2QdYQZvA+Bht+VztpIL/N7aTncYqMW+OsPzLOfrSQWz9
	JEtfZaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4uI-00000008Oo6-1GRj;
	Mon, 18 Aug 2025 18:48:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2iW-000000081aJ-2kQE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7861A5C6085;
	Mon, 18 Aug 2025 16:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15DEC4CEEB;
	Mon, 18 Aug 2025 16:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755534495;
	bh=jdVxZ6TrLpy072pF5Ft+Cc7fctme9nFpaI9IZhzRCzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYLiD+pPbxx1XKjzo5yT7qw13xobP3vvtIqo4IvyXUzuEc5DyqE6UGub6sdQS2vY5
	 HnFUaZV3SLmjn8JFSnjHPtBDgZuVVxplP0J13egeJcRappgU0YBI5w1bCtUcmqWJ9g
	 KOvZT7AgSOfZurHjWOn96Z5f726IUGjHykzBLTX5Lt9nE5BjSpNiqrXcqIT9qlQx0g
	 9/5/T0jB2VBdPKv+5uJn5R/yBx0eHGpDhix0rHBPKntXQkQdc1k12tSqoksWJM0zsw
	 49Elj3ohe8ySbJu8Yv1fnFhrJjVUDQcIPFP/Asl8UJ3zvq1KcCJ9UW4KPsElKfK7w/
	 ly3VPcF0FnfAQ==
Date: Mon, 18 Aug 2025 17:28:09 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5p2O6LGq5p2w?= <15074444048@163.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev,
	maz@kernel.org, joey.gouly@arm.com, james.morse@arm.com,
	miko.lenczewski@arm.com, yangyicong@hisilicon.com,
	robin.murphy@arm.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	lihaojie <lihaojie@kylinos.cn>
Subject: Re: [PATCH] arm64: cpufeature: Replace inline with __always_inline
 for GCS checks
Message-ID: <dd75b37b-1abb-4188-a26a-ca060add4c65@sirena.org.uk>
References: <20250815011905.1368058-1-15074444048@163.com>
 <4ac4f0d0-fa5e-4c47-bcdb-fc2a65450848@sirena.org.uk>
 <5bc224c7.18fa.198b1a3d8b4.Coremail.15074444048@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RWOunc09b4l0MTdG"
Content-Disposition: inline
In-Reply-To: <5bc224c7.18fa.198b1a3d8b4.Coremail.15074444048@163.com>
X-Cookie: No guts, no glory.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_092816_775117_0FD06029 
X-CRM114-Status: GOOD (  19.58  )
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


--RWOunc09b4l0MTdG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 02:49:21PM +0800, =E6=9D=8E=E8=B1=AA=E6=9D=B0 wrote:
> At 2025-08-15 23:38:11, "Mark Brown" <broonie@kernel.org> wrote:
> >On Fri, Aug 15, 2025 at 09:19:05AM +0800, 15074444048@163.com wrote:

> >> earlier during the compilation phase. If system_supports_gcs() returns
> >> false, then the line of code restore_gcs_context (&user) will not
> >> actually be generated, so the compiler will not report an error.

> >> -static inline bool system_supports_gcs(void)
> >> +static __always_inline bool system_supports_gcs(void)

> >If we're doing this for one of the system_supports_foo() functions we
> >should do it for all of them consistently, not just for one random one.

> The key point of this issue is that calling preserve_gcs_context and rest=
ore_gcs_context illegal,

It is, but it's also a deliberate choice we're making for this and all
the other feature specific context save/restore functions based on the
belief that the optimiser will do the right thing for us (see the
comments next to the stubs).

> +       if (system_supports_gcs() && err =3D=3D 0 && user->gcs_offset) {
> +               struct gcs_context __user *gcs_ctx =3D
> +                       apply_user_offset(user, user->gcs_offset);
> +               err |=3D preserve_gcs_context(gcs_ctx);
> +       }

> __always_inline just help optimize undefined func=EF=BC=8COf course, this=
 could also be circumvented=20
> by adding CONFIG_ARM64_GCS checks. I'don't think other system_support_foo=
() functions
>  should modify, they don't exhibit similar problems.

Two things here.  One is that this is pure good fortune, we're using
exactly the same pattern with other configurable features like SVE and
SME so there's no reason a compiler can't decide to make the same
unfortunate decision there.  The other is that this is that adding an
__always_inline to just one of the system_supports_() functions without
explanation makes that part of the code confusing, it's not obvious to
someone reading the code what the difference is.  Having a consistent
style for those functions is a lot clearer.

Perhaps we just shouldn't be trying to be clever like this in the signal
code...

--RWOunc09b4l0MTdG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmijVJkACgkQJNaLcl1U
h9BGnwf9F0wK/p2+MntvhEVlmz0Lk+LZNzg3Vkzdz4v5I3aQlvtGRwV7fwKkr6EE
/COTbQK+S6v82a6C4BDM0dhCcVoRDpKqtephqtQ5zvOiYvueBO4HLfoZg87wnsQZ
EBDywir1om3DWz2iKYmpSpEylB7vKM69/8vHR3YhoW61A8aGVSHuElkngDoBWElL
JDZjfEx2bm1L8GEr9Iwxifxi4hStIWOCLRKZL+lM92Kx2Wg8DAuewDTLMHuIxw1j
m4GFTmJ++7BeeQ13xi/Y03//mqUkXt+pIaTxpGxp3YkVDMb9i73GlDJI7dWT+yc9
TV970fDh4AoAkzolswA+kJLXRnSQRA==
=v9sq
-----END PGP SIGNATURE-----

--RWOunc09b4l0MTdG--

