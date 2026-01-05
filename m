Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2775C79F86
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPn739x+7AU+AZhIq89aYPPlBiPdTctxDvHzmkZIcjs=; b=Mvk5ceTVpIr/MYnljf+S0a0Kog
	55fN1VOHRsqjOBwIlGCBjXARVZHQIQ8Bam6c8lDWmZJo0KSzw0rSJf4iYNH2Vw4UU3uUlyCAJN3go
	oWeDrkUGUOOLUsbeKackpubczsb64JDhSiWhu/zc9zfF/uxvj3a3zokG3Zgfmfl8xt4k1YL0PW7hA
	2Bq23XiUzt8B93UNOW9+jjzuD+qMf3eOv0APEBlJ9oxkVel18qUHGgjXM6cuT1IHLMg3+4TXE7Wzb
	CamXL+71Gz4ae2Uru5RztZ7XoWLXxZU4TtNrpYVNMlOEoERezC2BIh+oiSWsSg6/vEXFd6CYtC4iH
	DIeFBrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjUf-0000000BGOl-2H8D;
	Mon, 05 Jan 2026 12:15:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjUe-0000000BGOO-3wJr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3B7A6011E;
	Mon,  5 Jan 2026 12:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C1DC116D0;
	Mon,  5 Jan 2026 12:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767615327;
	bh=g7riX2VqIGy0ZpqnkS1w4HiY4vb+qABQS3L7IQZHGDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoiCfFp/wSyuhaeas9riVl/kkZRVQlQo3wXXez3u1chk5kYSGHx3E9eHqm3gR6THG
	 hCMtU9LSDWhYB6/qVn99rx5gh5QMPIfK2CO7LayXgpbxTtOHRv17o8uiyZ7mED2F2Y
	 Q1+gtk/oTdSZiAa3ZPbAtP9egWoBJiqA+F2Ga0lSrSZSlEDnfuEkTWWVlgGOcEiznQ
	 n9D56FOxJP4oC/a596C1rKKD0xvP9QipYzPT8/c7NdcdFjRsSZVxhWCW6MwST14ByT
	 dAcDgdLqdrmhAXk2u5fdHFxuGY9KO0Fh15Y+leLFBQd/RYLnDI6NmQzCAkgydnE59j
	 rG9WuuQkWHk6Q==
Date: Mon, 5 Jan 2026 12:15:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] KVM: selftests: arm64: Make set_id_regs bitfield
 validatity checks non-fatal
Message-ID: <0056f0ca-7f9a-4eb4-a16b-b1ba3eb21832@sirena.org.uk>
References: <20251219-kvm-arm64-set-id-regs-aarch64-v3-0-bfa474ec3218@kernel.org>
 <20251219-kvm-arm64-set-id-regs-aarch64-v3-3-bfa474ec3218@kernel.org>
 <89fd9661-731c-4335-bee8-575a7c221390@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BIDSB1JZrnBn413u"
Content-Disposition: inline
In-Reply-To: <89fd9661-731c-4335-bee8-575a7c221390@arm.com>
X-Cookie: So many women
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


--BIDSB1JZrnBn413u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 02, 2026 at 02:45:04PM +0000, Ben Horgan wrote:
> On 12/19/25 19:28, Mark Brown wrote:
> > Currently when set_id_regs encounters a problem checking validation of
> > writes to feature registers it uses an immediately fatal assert to report
> > the problem. This is not idiomatic for kselftest, and it is also not great

> This one also looks good to me. I'm not aware of why the asserts have
> been favoured previously though.

The older KVM selftests and the KVM specific selftest framework don't
work with the kselftest framework inside the test programs and instead
just run a single test within each test program and die immediately if
there's some issue.  This is fine so long as each test only does one
thing but falls apart when you've got multiple tests in a single program
like this one, there the kselftest framework helps a lot.  It looks like
the program is mixing the two idioms.

--BIDSB1JZrnBn413u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlbq1kACgkQJNaLcl1U
h9CXRAf+NbYdUS/FF1ZammJpdArzKQFlNAuZaEcgy42dYSaeojFbLNsK2xVPCyab
M8zhG1bcCF49wHDCiSMgW5HX7fL7uc6HTwlj1EQIi2QUFor+7s6LCeMv1C7sKNUF
LlB/2sNtkI2Z1cRTbR73JvDg6MnNTrDakb6C4FV2J/Wc/7yB34GOHjoDY9GXWnS4
93F6bRFd4QDUTuOR0t812tWsTzHOkOq3M6OiwcYHUUi8aFliUcPhzXvXV51LPEi9
+htiID3s/XHU7QamnYRmq1dgIXssqtXaqm6v5iaw3gDNfQtM6MDHIhB1R9H3vTBM
VXLb/mySruiIfLCoWSe0ccqhEUWKlQ==
=OyR8
-----END PGP SIGNATURE-----

--BIDSB1JZrnBn413u--

