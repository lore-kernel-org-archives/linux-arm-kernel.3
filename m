Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D02D2AB3B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oz5OCzkZXQC+rHxhytPMECDTe+7K0m2PqLGlcDUmM4=; b=l8qeHoF8Voo1bL8XmvEUJ+EV4G
	Rh+NV5kUKkT+m3kv7A9eS364Hzkr1WFYZAKl8XM+WRaH1gv7DFA0YQ3h/49eKvn016IrNXqRlu+3s
	R3ZX05JKk1+9fr9PBQOhCrP+nifJgFHTi5Zpgl3B72+gDwElyRHZepbRhejFN5K9xTvW7brnFx7s6
	SCMkb3eMXoOHPgkN1pvEDmSrvUotneNKMbJYHSjyKBS78IUkFKudDT9NxV7rbwzfTFuUGA+coqvIp
	qBpxvIMdulU18zYss4J6sfL6ZFXZn+AgNFjbb+eShMJC8ue3fV3znaTXMxwodEZtnrNtdyoDrekEN
	kzxrpCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lxB-0000000EWc9-1q57;
	Tue, 29 Oct 2024 13:08:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lPV-0000000EPmI-1bYX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2F4F3A42D6B;
	Tue, 29 Oct 2024 12:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFC6C4CECD;
	Tue, 29 Oct 2024 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730205199;
	bh=3oz5OCzkZXQC+rHxhytPMECDTe+7K0m2PqLGlcDUmM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0XX2WtU/ewSgT3aG9pTCgLn1bK2naVRGOXUb693RM18Kb7jctHhyUlvBnyB2nnHt
	 CTt3ZJq25U3qXw1GaLP6EDei2p75AXW2w8yVNkhfKLOewbUXPHcO3R7CGVH6OJgeO8
	 /2RC4LYcJHjIE3IA8RC6lvrwsorrQZFIAYJ561d8iavr9YpagDZvZRHVu1fGKbW7+c
	 K61XRF9dakPBbBM4zKIdK6J+JO/sRjupd5/S2KBsBi2iN12ZhBm8Utxr5v9E03e38B
	 BV4ZXyX872RuAkn907OrS5jfHek8XkOMf867Nfo75U/m+j0gCBDgy5f7E/SDg/Ch8h
	 ghk3yU46ByPlQ==
Date: Tue, 29 Oct 2024 12:33:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <0d3237d7-cb70-4979-b262-29ffe7d7a608@sirena.org.uk>
References: <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+c7bJTQfcONVyaEN"
Content-Disposition: inline
In-Reply-To: <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
X-Cookie: May be too intense for some viewers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_053321_518706_71FB162B 
X-CRM114-Status: GOOD (  13.59  )
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


--+c7bJTQfcONVyaEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 10:14:50PM +0000, Lorenzo Stoakes wrote:

> It doesn't make sense to have shmem explicitly check this one arch-specif=
ic
> case, it is arch-specific, so the arch should handle it. We know shmem is=
 a
> case in which we want to permit MTE, so simply check for this directly.
>=20
> This also fixes the issue with checking arch_validate_flags() early, which
> would otherwise break mmap_region().

The relevant tests all pass with this on today's pending-fixes.

Tested-by: Mark Brown <broonie@kernel.org>

--+c7bJTQfcONVyaEN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcg1ggACgkQJNaLcl1U
h9DLswf+MdDUA6uK1U8jVbIG476TdL1quD1o3LXC15bDaBLUC8cZL7UsJWh1t203
yMbqza4KA6GjA5Rbbcvy/07Y5fvtHMmkHkQ7gHt7zgAmY8jBFYeQUueJzMpy23Jx
MRYiKblk+Ezh6SRMBHJy09dB2yCorGmPJ/uXfUo4tZ5lvffqPd7CkULu4DWZGbcT
YHrLZQmXKOZbSTOxSQHxehCoOOFevRgW3qQgTjUiFXb7+Oi0ztZO1Z9Aptcrnfnb
0/kCRUZ0eRLwCkZao+cMo7rW5fTv8a4EcU0H4SzO84KD8ode1ZLnZkbpEbEt6eAe
9hLCdN4QURUV//NVaY6j/dvu2GzYyQ==
=OcfD
-----END PGP SIGNATURE-----

--+c7bJTQfcONVyaEN--

