Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DF5C5518B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSLZw7squ8/c7r61RFQ55B8T97e/sn8qUfaAb/2moe0=; b=i7jx8jbXGUBe55Noru8X6AXJm6
	qSG7IVCrLikpSBAm1RKHPzd/isGAuMRWelDolp+S54yr6TTRs3J99DSRAVYdqM+wm78jramFI0CB9
	x1FIvno/lIG2UogEPyFjQi5aLJdLsjGTF/D/OSdFToF8mfmAI0yH2BewWhkfXe5iowYZmlymnKrFx
	wnBpQXxFshtbaOejavVCHr3hAaXh/QXOCXdss32uwCVf31lS+OVwKubRpR8cm77/yod8kJziYa189
	TuLKNmqw2dYikwZ0EqQhsT8OkXm98PE6B3HY//3uPAzlKfqZwzKDV+mZs21lNWzsq6Cc2iy6TkrUN
	fGCgHbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTBl-0000000FEDr-0hU2;
	Fri, 20 Feb 2026 16:17:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTBi-0000000FED6-40bo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 16:17:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E91B445AC;
	Fri, 20 Feb 2026 16:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A56C19424;
	Fri, 20 Feb 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771604226;
	bh=pSLZw7squ8/c7r61RFQ55B8T97e/sn8qUfaAb/2moe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNcTzwSMlFpdT9eW7tcPUvnI8S5wy9SJRLynnAk19609Ajan6FWxJxXKadGifIGym
	 thgwEQK9MqpP0v6q2hc0CKNuLNJZFPdiKrijSNNi6LwAheGbzAt+sCXv6CPhWzGZfp
	 AyUETOCq8PLCVB6KjDIz583mV70wxPGO3VeSQdrSpFrCguyvtul9ziAjrghQKwp8MC
	 HmQjwBtCY9q7f0fcBODOk0j1VnZLiXkr/fPX/MqZ8C2slLwkCPTcNXw2piMqp4WSHi
	 BYbYVc8XqrVEBZO262g1yl+TcTVZJuGaNcG3jjICVhuvKc5RfpHsdD8EL3Nq5ORs5I
	 P3wEUe2bLyRqQ==
Date: Fri, 20 Feb 2026 16:17:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] arm64: gcs: Do not map the guarded control stack as
 THP
Message-ID: <c6eaada8-d881-4538-96fd-068f84fc8aca@sirena.org.uk>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-4-catalin.marinas@arm.com>
 <18352353-8760-404b-a981-b0a5ac067b6c@sirena.org.uk>
 <aZh6LzXGY1MfASlo@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WXFzuhy/4bDJGRya"
Content-Disposition: inline
In-Reply-To: <aZh6LzXGY1MfASlo@arm.com>
X-Cookie: Booths for two or more.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_081707_014265_272FA829 
X-CRM114-Status: GOOD (  14.71  )
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


--WXFzuhy/4bDJGRya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 03:13:51PM +0000, Catalin Marinas wrote:
> On Fri, Feb 20, 2026 at 02:34:08PM +0000, Mark Brown wrote:

> > I agree that this is sensible however I'm fairly sure this will also
> > apply to the other shadow stack implementations so I think it would be
> > better to either do it cross architecture (ideally factoring this out of
> > the arch code entirely) or put a note in the commit log that it's likel=
y=20

> Something like below (not tested yet and not addressing riscv, waiting
> for -rc1):

LGTM.

--WXFzuhy/4bDJGRya
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmYiP0ACgkQJNaLcl1U
h9CxSgf+PMHwnGoSlYVZH78+v5fsZak+UI6GwEfSW0xHQ66Y12m5a0FW9vVk3lV/
x3yxi39I9KEgKO2O32wl7sBBXWreKz8LZr84HK+6b2o3WmdD1ik3hxCoEzPLcSnu
sdbivvRnHRdw776cPopebczCFdysgX0+K7L8MjrbU4qjHI25bQv8VZNKv8LvuAny
japbz1GrnbPgU3QCl+mVFQs+29m6mGbD2ee2Dslx9NygHZJDAcIlodwh1RHq1HjU
0QjXciL9vjOtgw16vcd5XGEO2hVbh+TVcO3GCyUzrD2L2lEWvV01vwKCaZZ1wl7e
iQNBGtEQpRy5TvElf/5i8qD3d5k0RA==
=9ulN
-----END PGP SIGNATURE-----

--WXFzuhy/4bDJGRya--

