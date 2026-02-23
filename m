Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144E6EC1104
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjlJTGlsJO1Ix7UMDzBnbBF88dmXRCCbMLYgEcN0bTs=; b=mm4CvmFP95uPdBjSrOFbT4uWIo
	x+SWC+hiMf1YjHm666VrK8VdKwAyNTEbYjM3APrGSyQGbxcbDnSTJYxa3ziAFDijL94T7dr/qlJaw
	U7hDaqNvUliIJ7vMBFvqplv3DYh9WqcApn48OjyYHZr04n4HlYefBeg1P8zGHRf+UOIpwq6y+BY+S
	fxnVq9KyXmlKzhU/GPVW87MzYk27wX2ALpm6Zn0peXpZ0wn+7650afAvnuWXhpEQ21yWTSP0GeM9Y
	/zfVkJqI1UN9RakMNKnIiV6+CglHjjerhlhj9iucmledyP/hXIQXydF7AIF49yeDOvHN0um5UwcX+
	/vM+F3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlN-00000000fib-3gjU;
	Mon, 23 Feb 2026 16:26:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYlL-00000000fhq-05WA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94BB743991;
	Mon, 23 Feb 2026 16:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7935AC116C6;
	Mon, 23 Feb 2026 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771863981;
	bh=pjlJTGlsJO1Ix7UMDzBnbBF88dmXRCCbMLYgEcN0bTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQ742djLUOR9uCTuDgFv1BHjkvtZ0go9om6TRtYF4O5rXsHef1n0FK/FUPv825fTD
	 AcHpiIJODjOE1wQvN3iA8fkXJThLnxw4ZFOmBufYZ0bskYcZtJIo171bLu2Hvg7iIZ
	 WqjFdfg4r1694+1lEGzhLW+8OO++fQAcUo0xK9GyQ8XZTVasr3GDl4l/aSRSiDJk4Q
	 kTxhFCv6HT7na7mf6A9zMUl1jUB9PqT4kS2DberS4v4NiGxOQ8isDK4Ltd/gCgXl64
	 pxztz5B8IA84M5DY6GY7aK3AJpCZ6qh7IH8ATgJ13v2J3aPBB6d+2OEcd9Gz3pz1kK
	 kZSox4p/JcmTw==
Date: Mon, 23 Feb 2026 16:26:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: pKVM breakage in mainline on n1sdp
Message-ID: <ba75b3b1-ee6f-4e97-a9ee-8eb848a69807@sirena.org.uk>
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk>
 <87bjhie67o.wl-maz@kernel.org>
 <CA+EHjTwzjjNuZSQExZUsGAXWdaH=Uf=z4ks2XQAXqaU4DcmD9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aqb+ut7wXhB5soxA"
Content-Disposition: inline
In-Reply-To: <CA+EHjTwzjjNuZSQExZUsGAXWdaH=Uf=z4ks2XQAXqaU4DcmD9w@mail.gmail.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_082623_101150_578045D3 
X-CRM114-Status: GOOD (  11.47  )
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


--aqb+ut7wXhB5soxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 22, 2026 at 08:34:57AM +0000, Fuad Tabba wrote:
> On Sat, 21 Feb 2026 at 10:33, Marc Zyngier <maz@kernel.org> wrote:

> > [+ Fuad for the protected mode stuff]

> I'm unable to reproduce it, but I think the following might be the fix:
> https://lore.kernel.org/all/20260222083352.89503-1-tabba@google.com/

Followed up there, that looks to be it - thanks again!

--aqb+ut7wXhB5soxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcf6gACgkQJNaLcl1U
h9D/bgf/ST5dxO+Lyvga154SvVeGOj/YvBqIN3TmsOOB92SbGvjASumzq26G04nR
9pKbxjRgbAWolw9uU42DBPA5osGkhkAvqRUczhujTUFe01PNwuxoQ4tVrHSVysr/
4dnN8fGwaQPgMOsV9wShjwV3V8z6Q20UZX6x20iVstA+g6S0dizUqUnperEohvTy
zhYmy7e9nZOmhCj24OsE/hKj9WBqSQuQ1j8kV40cMfKQ7HJVeBu/jhC2SDk4JDWE
AO/80iavSUHlKha67qByAVEB2jo9uRhk8KjewYGIt9Bg1Rd896dL1GtO5xGWYM6o
wJ5Iqf6jSwfhQF6VQgDbVLVeEXIMyw==
=Ui5B
-----END PGP SIGNATURE-----

--aqb+ut7wXhB5soxA--

