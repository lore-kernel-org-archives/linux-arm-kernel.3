Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C0DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjbszIPs/n7b4p5KIBRoTwuiUU9LW0qDdu2zkchL+yc=; b=4nEbl7we7zTdovKx7lZ0xSDAVF
	FDG9hE84N2M4Hu/Rv7C+Jwt1ijTOxMhX6FI3oZpCHj8Cnwg4UhD4rsLBQVDSVqPnDFQHtDIU5w9+G
	CZqvqmV1pNXOAJNV49GFMraoyuiYAwYWwa+/dffh6H02gGtSqiNF32eYUQg/on+URG9M+zjWSTO97
	HdvTcDmETHCFp3DSXUH7dVlUmjppccvaB5pMNhLHDjHMWqCJfa6PO1dvk+CPLdocJBTlojo/R2NVH
	x25TDFhThkNPORouk9BOHXTrLXM/20nO2oL2RSfdaNXpaoDOxW1JV+LHmECZwzKdFj8+9lxuJBr5X
	MzyqwTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9Nj-00000004YLL-1kEm;
	Fri, 13 Dec 2024 17:23:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9MS-00000004Y90-0qlE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 17:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D072CA42C2F;
	Fri, 13 Dec 2024 17:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACFAC4CED0;
	Fri, 13 Dec 2024 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734110514;
	bh=XjbszIPs/n7b4p5KIBRoTwuiUU9LW0qDdu2zkchL+yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtdISbkyY80zUrkwLQ5rsJjuw9Xlq/oJ9Hh4oqs0R6dhPRTUJfBWAp4xlKWYXDJrW
	 pXePzLW4nSAPbv2tY2QgYgOpFjTB79aRcfD+QswvDeQO3t9D6EZ1rw+WpgyNTRRYjr
	 wEmDz5G0itB5ZCIS2hcpQ0M9ECFHWISDBWuKLt34D4wfsEEwY1ilI8y/Sr7V+CKrLX
	 7M/pTfzuFSWwCFB6INOJKGIYjJdp7En4F2w4oJCtTwbd9yr1Go5+ag4FEABPnULCSJ
	 4hjgpqXwPZK2aRa9RD3368T0yFNzCOzH0e7pJAy6YCeGkz2tKk+ckIO/kFIjpLtWUj
	 hwyOm9Y/Nhg2Q==
Date: Fri, 13 Dec 2024 17:21:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64/signal: Silence spurious sparse warning storing
 GCSPR_EL0
Message-ID: <e9259a94-652c-470b-8ad0-b6fd2dcdc0c8@sirena.org.uk>
References: <20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org>
 <Z1hU0Ii-Sm9NHnhj@J2N7QTR9R3>
 <20c12aac-193e-43ae-9418-39db1af4ede9@sirena.org.uk>
 <Z1ht7X2LRw34pMJK@J2N7QTR9R3>
 <6d839dfb-0a85-44c5-90cc-2b2426353a5f@sirena.org.uk>
 <Z1xeLCKoSWyn2sko@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pLtlhyeX8UkM8kV/"
Content-Disposition: inline
In-Reply-To: <Z1xeLCKoSWyn2sko@arm.com>
X-Cookie: Not for human consumption.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_092156_306204_784242BD 
X-CRM114-Status: GOOD (  12.67  )
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


--pLtlhyeX8UkM8kV/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2024 at 04:17:48PM +0000, Catalin Marinas wrote:
> On Tue, Dec 10, 2024 at 04:52:49PM +0000, Mark Brown wrote:

> > Yes, I had already removed the references to spurious and false positive
> > locally and changed the unsigned long cast to a __force u64 cast.

> I still have a slight preference for treating a sysreg value as an
> integer and cast it to pointer when needed rather than using __force.

I've now changed to that and will send it later - TBH I'm having a very
hard time seeing it as an improvement, especially with the update to
gcs_signal_entry() where we do two writes.

--pLtlhyeX8UkM8kV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdcbS0ACgkQJNaLcl1U
h9CWxQf9FYCi81Mft1lRJXVju7GTWF/hR4f7L8c37sR6fd7AOWUKUEeSDIIyQsKm
6u0/kyAWr0oFbLH1Kd1PyB7SmYTsk/O5jOYbT/W6s15OWaFEYUBoAI3a/Ql/1aqR
4hecDva2rqQcCf4TijoLt7N7U+f2gFd/J44uxPEfmgtLQ+HlqiguQujnk3n/G+6P
JjYp6GYbOYbVNosVDxke1YhbOM0BgiV2dIJ8ML2RfMBYShnpesEQCU26rpmfk9PV
mygXhdjjSDz9UxytvgC7MRN+7X6Rk3U3S0VR1mWSlUxNNm4d+jwsDfTR3U8sGYu+
ti9p9BaHpU5qPMkln/0dW9BcZdh9GA==
=Tu/G
-----END PGP SIGNATURE-----

--pLtlhyeX8UkM8kV/--

