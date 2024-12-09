Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57296E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35zRPo8wvB1jXDMdfKXJN8d0tVQPxPanWqAqQMfctxE=; b=Jq1/uLteOtBdbml0gh9a8/lsTn
	p3UIoESTH1MnlcDupOwX2UtMaGp8OtNPmFwmtsUL7z650siZOpux84DcsyjqeBEWYGPvWYMJR6/7T
	gRsGvwfibirs+OM34I8fJphw+lzBFTwIkuLoGfFHaH/RwglcvmGgfi2zjTqvWerjq3axM6qz9sLVJ
	B8F6hE3IqcZlPOXc8RTd+dT4iJ7XiNCcH1uFZ48yq/G4eM7y+IEQzRc0D/Xanwbo+PFAMmK0scYFY
	5t+TWBfyU+G8ZwwEz176U9v13oBpL9DSrcZKkjWfdfQcGP8GdflVOAbgTWj6ORZpKgI/NA3+U/Is1
	s6oBuZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeIE-000000087GH-2yWG;
	Mon, 09 Dec 2024 13:59:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeAk-000000085Fl-0DA8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:51:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C00B5A41659;
	Mon,  9 Dec 2024 13:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D961C4CED1;
	Mon,  9 Dec 2024 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733752297;
	bh=X3svPo3PpGuuyArPt3jHEZ/HCf7p6Yd4FykOR/w20Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FSJpfRnobFlxzeagt1jrPg57O0oMacIjiOoJbphK6I39uvRqPDjIlLRb7/3uelZ/t
	 scAONs0ffD/5/ZTh5PPLX53K+PP5VzmFvK0HLx9341GM0LWZGendIyLptwgGUP2NzT
	 RkIJyPwhT6lRzzNeB2uWXHwIujb+C9I8aR4t0Ab92bJ8aXE74mRhPGVbA0t2/QPhRW
	 J8S8FRUWlm6qQVN1puKS+HZMh6KNKYW8Tgi7i7YD3I/Ayc++Ka/WEXEmTBF08lun3T
	 NCCfKnej5D7Vk47EJfSEvVdb8kdP1GxGNsKxLDMHNkv9sIG633k8/gqiIcM275kYPa
	 yO+M75OUV66ug==
Date: Mon, 9 Dec 2024 13:51:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Weizhao Ouyang <o451686892@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: abi: fix SVCR detection
Message-ID: <678a223f-c4c7-4752-84b0-609acaa33ad6@sirena.org.uk>
References: <20241209105237.10498-1-o451686892@gmail.com>
 <3279e669-1ee2-4792-9e10-8b40928de6b4@sirena.org.uk>
 <CAHk0Hov5k37=MtTBLWTj+Dwm4EXE0xGJS1Uc8xgyLtJxusqsww@mail.gmail.com>
 <c05f6ad8-2dc1-4ddb-b9c1-b2cddfe78819@sirena.org.uk>
 <CAHk0HotQ-=s+-FHh8pAOg10ivcRwqChG735qgDvuQd=4B1QQNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+2R3Ti4du1eZLiNS"
Content-Disposition: inline
In-Reply-To: <CAHk0HotQ-=s+-FHh8pAOg10ivcRwqChG735qgDvuQd=4B1QQNA@mail.gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055138_147892_C5049CB8 
X-CRM114-Status: GOOD (  16.17  )
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


--+2R3Ti4du1eZLiNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 09, 2024 at 09:26:01PM +0800, Weizhao Ouyang wrote:

> > If we don't have SME we should be skipping over all the SME code and
> > never even looking at the value of SVCR.  Looking at the current version
> > of the code it does that, it branches to check_sve_in if SME is not
> > enabled.

> Yes we should skip it, this is just a minor tweak based on the
> current implementation, after all, we manually passed its value by
> svcr_in.

It's a fairly trivial tweak to make...  in any case, it looks like we
also need the same change in the save path.

> Which latest code version are you referring to? I think check_sve_in
> is in fp testcase, not in the abi testcase. (checked the -next tree)

Ah, yes sorry.

--+2R3Ti4du1eZLiNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW9eQACgkQJNaLcl1U
h9A3IAf/cV9gnrGSIC8uivSf+Or4FfHtm06crsjoH7q45K+rUanywHTmDXUgpSv9
/qWNkZ+Yb/ZZzmwDfAx1HIQnyuIN/Gr/mmHC3u2C9B3Rhh/O1icbZU7PRnYKu2N0
Q1YiDTbgMDVJYPXu6fGiTMy6HVBhz1MSZ5g5ZqthMuvuB+La5m+7Z4rQnSK/f8bE
VQ1Ka/VR7QbMnoLrVUoFjwaBGUCUMr0aRJpyGiG8ug1EFnESJRf4SNSx/5QI5+Nf
eDCMAiPq11Rf5sFsJMSIM1zufNRESwdSOhvVaUzCaZV3zQs1UbDsvW54MUbzamqk
PQYNe5Q7g+1uddbve9jfAdPeX/TDyA==
=dt8z
-----END PGP SIGNATURE-----

--+2R3Ti4du1eZLiNS--

