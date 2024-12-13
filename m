Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E2E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1CBI9iM32xKCy8ZaNmbMJAWl4NScr2qiKu+vjeM9sw=; b=WH/EYYr3SZCy7/vVoEOHH1MPWv
	giUwPdSjfRwwu6u+Jc44MI9KCuhyHMBbDgbEIRD0/NixmL+Gs/BLRf2YDaeszlIlCQ9l8rHBhPTaG
	JGmtaO11v9cucjCo/kocmwE/2xvOXi8wwswBU45jik55EISEOz/ez/kei1TbqGD1G7TyE+TWD7sUE
	1IN4Ye6GfsxbsVQFIRf/zzGbpadu1iaw9fdClU/HZN/FztDLvPylQqAezpf116BieaIIj4iliXELq
	rsCK5ld0qkHpFQ1rbnZGQLRzPKbyLkisfapdmGR44GX9NTebJ75QpFruJ7ATMSiVvQBIMGUYYadmC
	x0vravaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8nx-00000004S9Y-3rY0;
	Fri, 13 Dec 2024 16:46:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ms-00000004Rql-3BbT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E52075C68E3;
	Fri, 13 Dec 2024 16:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB36C4CEDE;
	Fri, 13 Dec 2024 16:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734108310;
	bh=/VD5zNTaEBX+lKylddyxwJmb289UPss9JRnT94+IhTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sVsrAqmZDOmvkun5l6ZiW3gWn0Zmmxyc0Ovkuz2Ebbwdl0wCsZlEjMBL+QORRQ+Ab
	 VUBnwVtgwGXewzXRrVqzP5WWBtnc91wSVJE2I1hX+BG0qiP0fcq36mLjIlEh+RHVsn
	 3CP2wcBszhUT3Co2gBgmmYB35/iomiIocwwnlrjG5YCbW3XXqBBkjQUXtkrWI6gP30
	 b8Luk/o5tJ7OV0I3ItNZSP1hS6p0967HrsiI7VzViOj868MV0OnauS8R0sZdvxEtU2
	 3jrlIyJzjoF/26ctzkzTgQjimxuid5jhSOXdu9fNMJbcSs3DdpECvhU5tyeyYGYaNH
	 NcMp6oqmbFSHw==
Date: Fri, 13 Dec 2024 16:45:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] arm64/signal: Silence sparse warning storing GCSPR_EL0
Message-ID: <418e279e-0628-473f-bd3c-4aa5e2d4dbcc@sirena.org.uk>
References: <20241211-arm64-gcs-signal-sparse-v2-1-c22f37216135@kernel.org>
 <Z1xgQGNZzR6h0Uly@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xOb+W1Cr2FbPnjyx"
Content-Disposition: inline
In-Reply-To: <Z1xgQGNZzR6h0Uly@arm.com>
X-Cookie: Not for human consumption.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084510_842248_4D03270F 
X-CRM114-Status: GOOD (  17.99  )
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


--xOb+W1Cr2FbPnjyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2024 at 04:26:40PM +0000, Catalin Marinas wrote:
> On Wed, Dec 11, 2024 at 01:00:35AM +0000, Mark Brown wrote:

> > -static bool gcs_signal_cap_valid(u64 addr, u64 val)
> > +static bool gcs_signal_cap_valid(unsigned long __user *addr, u64 val)
> >  {
> >  	return val == GCS_SIGNAL_CAP(addr);
> >  }

> Another personal preference - addresses should be (unsigned long),
> pointer to be accessed (... __user *). But we could even scrap this
> function, there's a single caller to a one-line function.

I'm not sure I follow what you're saying here - the pointer here is an
unsigned long __user *?  The value in val is not a pointer or address,
it's a cap value derived from a pointer.  But yeah, we could inline and
render it moot.

> > -	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
> > +	write_sysreg_s((__force u64)(gcspr_el0 + 1), SYS_GCSPR_EL0);

> Looking through the code, do we have a similar problem in
> gcs_signal_entry()? Or do we rely on sparse ignoring (unsigned long)
> casts?

> Whichever way we go, I think we should have consistency between these
> two functions.

It's not coming up since there's a cast to unsigned long in there which
sparse likes, I can adjust that to a cast to __force u64 in there since
people didn't seem to like the cast to unsigned long.

--xOb+W1Cr2FbPnjyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdcZI8ACgkQJNaLcl1U
h9BnXgf9EssxRdLuAawqp39M6YvJ0vp5X5GHdEHBkTgo1jVeUnGmvTL9ppyfHa8G
KXz35/59ISi9u0oi8KEMVnj7AiTSSblwqXTHiw64jkuJYOjUcnNQ8+5HiDt/chDD
KJtaxPmOuHPqm8/iPmGImnBfIz27AD6MKtMpBbwJAz0HSyeVoxTK10F/KpB4Kozy
PB+JaJmDGTDhTy1e1xnX+8nfxqh5cpqw/SygSTBTp9LSFyv4fUdMZpmhOu6XrIfU
znJW590c3fg0sbeka+xJ2phM/QnsyI8e7N4Z16CZ8nRfiugNOJF5zFABmA77YYCI
zkQms/0LzFMjYZzmAvDcpajAhvgNBA==
=7XxV
-----END PGP SIGNATURE-----

--xOb+W1Cr2FbPnjyx--

