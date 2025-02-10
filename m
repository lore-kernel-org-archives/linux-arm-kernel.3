Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F979C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13OMoplqVT23Prnyh/US2uLliG5QVjTKHC0WYHcISug=; b=eub/Wh+vATeL2FL7LkdgaCUcGJ
	Kc5D2sSQULTIDieSxfM+Z+Q/R1KOK2TKILl7O1tnLHmrDlnmFiXytLyhoCdBLbFCR3LYOpv+/r+Em
	+PW/e5aMMn25HRAjNnc/PlJqYrBZnVmhjEY25lb38U1/NXce0gzjXG3Xq1hMA35IjAGaKEQK5K6oU
	7/LPUDCO+40uvJcvQtO6DemYZZA6qnasc/w2I3RH8AdiuskCBCA5DFjlWbFL9X5CrTj3zYbpjimyU
	B5L8aOQ0DYS4DJZ+Q9IX/m6SW1l6Rpum1bgVq5HfYn1gWPOCWFQNZKN86BHCcrOq3vo9Iam7zx2pX
	KoW9Uiyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYw-000000017Wr-0USD;
	Mon, 10 Feb 2025 19:35:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thZFH-000000013cz-2oNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 19:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60E32A42066;
	Mon, 10 Feb 2025 19:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61490C4CED1;
	Mon, 10 Feb 2025 19:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739214902;
	bh=6DCRnBCL901/XVVau507X6b9q7VHuRUUYVnPkWTt7S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZuQEoJDCP5K0u0T2iPP5IpLhJEf7d6hpcn3ToGfFguQfQIoObJLphMqhllsTwpO/4
	 nupvcCk0IcPBkgRBkP/HlYHnLWNGfUQJlb+f8kDT8Efv4lW0qHBW0SYvEpsTQrks2V
	 Z1FF+bFCdHTDzI/aE6wUsMhdR5Uvex6BL1dfQZ8Co7CbqILl0Y8whtEqdFxOi0UQ5n
	 M30k/VMealufxYF6+zvPP+qSqZRzJyhJiJ+rkegOd8jj3rSOaAlfJO7d8nsxjU1muI
	 J7JPMwbUgu91CTlNPH2Oq85dug0PyJziAsW1nGCRKxso/gJL9h7G3Tjteo8WfsXVfZ
	 XFuTjpblJd61w==
Date: Mon, 10 Feb 2025 19:14:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2+LFPLCGeXCcrnFn"
Content-Disposition: inline
In-Reply-To: <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_111503_782061_DEAE35B8 
X-CRM114-Status: GOOD (  17.14  )
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


--2+LFPLCGeXCcrnFn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 06:41:09PM +0000, Mark Rutland wrote:
> On Mon, Feb 10, 2025 at 05:49:33PM +0000, Mark Brown wrote:
> > Commit 819935464cb2 ("arm64/hwcap: Describe 2024 dpISA extensions to
> > userspace") added definitions for HWCAP_F8MM8 and HWCAP_F8MM4 but did
> > not include the crucial registration in arm64_elf_hwcaps.  Add it.

> Looking again, it looks like KERNEL_HWCAP_FPRCVT also isn't wired up?

Indeed.  I'll add that separately.

> I did a quick check for suspects in that commit with:

> | [mark@lakrids:~/src/linux]% git show 819935464cb2 | grep '^+\s' | grep -o 'KERNEL_HWCAP_[A-Z0-9_]\+' | sort | uniq -c | sort -n

> Checking against a tree based on v6.14-rc1, it superficially looks like
> we're not missing any other KERNEL_HWCAP_* bits per a coarse search,
> which shows three missing entries in cpufeature.c:

> | [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpuinfo.c | sort | uniq | wc -l
> | 112
> | [mark@lakrids:~/src/linux]% git grep -oh 'KERNEL_HWCAP_[A-Z0-9_]\+' -- arch/arm64/kernel/cpufeature.c | sort | uniq | wc -l
> | 109

> ... but maybe that misses something, and I haven't checked
> COMPAT_HWCAP(*) or COMPAT_HWCAP2(*).

> Could you please go check if there's anything else missing more generally?

The other two (on top of FPRCVT) are CPUID and EVTSTRM.  Both of these
are set using cpu_set_named_feature() which doesn't use match your grep
for KERNEL_HWCAP_ in cpufeature.c but instead generates the constant
name via token pasting.

--2+LFPLCGeXCcrnFn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeqUDEACgkQJNaLcl1U
h9D1vAf/fgog2XudEHzm95uGgRT8Er/xgKvo2K85ZGRXpZE1ZTqaecc27E9f2+O2
wKdO9h/Ba+DMfOKUhHQHlyV8FHtw+LVgd8Wq2jrKcjxkd6k3xjt1K7udeDeX5x+0
xzP35gU31I4idBTDXM7KAjx/HCv9vuksAzfXH0QdPy5G9t/d7OUGP15sxIzAn8tG
vZrHj8O1IDlKcZtbwU1aOpK98KM/OOTVyCgRDzxzGtMgf/2kW3UP+ZgSo5oKJI5Y
yERJjKW6Mx0GL07aupnyCmCZoqAbuEGtmeSgX/4cuv6Xz45JblEBWv+Q+ZvBxYT4
BbzPGHs1p+ozWol+S6o8XrB5SOSldQ==
=LIhr
-----END PGP SIGNATURE-----

--2+LFPLCGeXCcrnFn--

