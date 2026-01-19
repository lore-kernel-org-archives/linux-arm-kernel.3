Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C97D29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wcdEX0hROVYaZsmr+hUblVUO+X+ufbXmfmBkAy00YI=; b=XYIzXybWPTd6sENa/+f7Qaxlj5
	LasW61PZmBTHjL3+WJ+1MnPpxIJiB3XJVwHteFGIqtqmj//DoSxDfQ10E4+L5J86T65KKb7A3PyMQ
	OQgyiRm1mO8utoOEUgGzTtMsXuF0Lsk0aEOsI/DQfHhq+BiVgOcnmIY7fLKKWp4Brw4C0t2FmeFhJ
	Axe9ECcAjmD47AwdsCorVAMw3Otm6hn6VAHyB49FyqELrVeJ+AtxYQF9HrktRHI+H0J72K0Pf1pz4
	7/vOkG2K/Mh5oG74jvr4b7L7IomldV3Gr/XCfoGsPQ+kh2bHtrDCVYL9RATVezxzleo7ZBhgFq3IG
	zQ+SIemw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhraF-00000002Op7-3gnH;
	Mon, 19 Jan 2026 15:54:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhraB-00000002Oog-3D8n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D68E437F3;
	Mon, 19 Jan 2026 15:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655C8C116C6;
	Mon, 19 Jan 2026 15:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838060;
	bh=b3tsm3te6FsJWcVLThMS0NFHiYhNgSMaAVtqHh4CPRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UheyHquRoxxb8CuygWAhYv3SnIYWpXLSdD8M+JRy0FXmfWSt7UZJfDH+d7rEU240F
	 ByB431CkgUjD+s4QOrlxDU4a0nkBqUYS1Ug6hhkFXo+18+C2JEbj0ijNKkcbWap5HY
	 vRjXWgQ3quHA2LswdPgBfTlB6VTIXcdvbzGY8NisbO9X7wrSuHI8a9cdfJX+zHyQXx
	 pqRfMKJzPBsFNK5t73XIBXiZMa0UxNiZc4t9b7FF0DsZiuPPumphq1EH42s+cq+cqM
	 JgCS/OEmg6tTO4HEUKF8K5Fwf7s9gJuoI8HCkXp4L5My0FB11EACpsbiCPYYEzXv/K
	 nb8SoftkF/lhg==
Date: Mon, 19 Jan 2026 15:54:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, miko.lenczewski@arm.com,
	kevin.brodsky@arm.com, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, yangyicong@hisilicon.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com,
	yuzenghui@huawei.com, pbonzini@redhat.com, shuah@kernel.org,
	mark.rutland@arm.com, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 4/9] arm64: Kconfig: Detect toolchain support
 for LSUI
Message-ID: <20a2e113-7d53-4857-9cbb-9e4ea910b7d0@sirena.org.uk>
References: <20251214112248.901769-1-yeoreum.yun@arm.com>
 <20251214112248.901769-5-yeoreum.yun@arm.com>
 <aW5S04xS4FT0zvXv@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yKoaamXJOGUSy7RZ"
Content-Disposition: inline
In-Reply-To: <aW5S04xS4FT0zvXv@willie-the-truck>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_075423_967875_E350D1DD 
X-CRM114-Status: GOOD (  12.29  )
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


--yKoaamXJOGUSy7RZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 03:50:43PM +0000, Will Deacon wrote:
> On Sun, Dec 14, 2025 at 11:22:43AM +0000, Yeoreum Yun wrote:

> > +config AS_HAS_LSUI
> > +	def_bool $(as-instr,.arch_extension lsui)
> > +	help
> > +	  Supported by LLVM 20+ and binutils 2.45+.

> This is an internal Kconfig variable so please drop the help text.

It would be useful to keep the information about supported compilers as
a comment though (as is done for some of the other toolchain feature
tests).

--yKoaamXJOGUSy7RZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluU6QACgkQJNaLcl1U
h9CFIQf/UI2bGgmgdtdZff9n4ejTZp0Sz6LHgh3UnwQu584BoImowV63sXNhHUQ9
C2FgTQzemLQUnUzfOsv6iQzvgb6abr/ey9VkxNuLRBrHpvgAnTQSUo821S9Wf0gJ
Hy24oLrppu8+Oif2bQaDKZRMAyFLttJ3TOyOl0R00LdpLbrmzGtAM0F4YNJ+zfxk
3JNFSP5vF6WuMKqZZuxSA3Ng1pqmQofEWJDbV8++du2aFvwgMvPfSo20UNqrXi7b
NHc5kSArlFH57hkBuoqcp5ALJrqPWA0KWPys9D/2R7VK/bRrZzNvEt5i7O4Uop8h
gbdC+izp2I9ubs39ZnQUmHEcQpD97w==
=l07T
-----END PGP SIGNATURE-----

--yKoaamXJOGUSy7RZ--

