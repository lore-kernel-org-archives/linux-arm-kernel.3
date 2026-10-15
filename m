Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA4CCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Wpd8ZaDIqKTRZJeEXKKKlTMACDQQ6OKalAajIFnFWE=; b=ylYXxekYmub2qLPT+P4phzJZWT
	L2dVuEblvBqo+Su35gVQ4mZf26+W5MZ0f7cpo5O1dm+nX454uApFBbioRUGLrUciUWXA+RCk2YW01
	3ex/YIXV+BQe8zL4cilUd/IrKwJ3zZbHOpmaAvM0tJyNqXDRK9d1eP2foddqGgYIW39RUsyULVGrs
	ICgfLsZz7LDCmM2GOigTobpI07UyZotgwbNoS1mqDCfacChYpvlur5m97oaPekVR03DK4kgMExWzH
	q/iHQtQLY5pvs1+yh+WCESVyVNAWzG1qtmfUJ42NTwp0LbJDaDabCurikCNeReU/Jm+i/DUo+Oi8b
	25JP6/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ0q-000000017uw-2ase;
	Thu, 15 Oct 2026 18:17:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQ0m-000000017tf-0zNq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:17:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56138601EF;
	Thu, 15 Oct 2026 18:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FA21F000C4;
	Thu, 15 Oct 2026 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792088223;
	bh=4Wpd8ZaDIqKTRZJeEXKKKlTMACDQQ6OKalAajIFnFWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LpsdpARhGYr41eV1EMUdnUedxaFou091rS8T/+A9xI9vvMiuDo7Q7bm5AZ3zfwa4/
	 /Nia4CIz5t5Pqq5sRM42kJz2JQ464mDT5N/7nt/a6WtfZVhAJThnsZuUgcGIC94Ea8
	 lIiZJlIBRjd3GjqzzOuvmNji2D2WSHaPfBCdVFTjDe6Y9kPFY/KINkpzGW+hw0+Y9Y
	 wBmonE1Q0sJBBQermpHDmPOmASiofJENOWA4KnMvCVREzqZ6VbUotRZgcaKFm//YPM
	 6f+eajbxaQ6L2kaXprbfwzrzp6sdDlkhcJU+bYQrsJ4aTaurHlMSCygxFqHY3DK8we
	 QRwe954fzEauw==
Date: Thu, 15 Oct 2026 19:16:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after
 a subdirectory fails
Message-ID: <5527ee60-e0bd-46d5-b63e-8a39fbdf2ad7@sirena.org.uk>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-5-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NYWNnkWlSL6zYjFJ"
Content-Disposition: inline
In-Reply-To: <20261014200115.1363363-5-sashal@kernel.org>
X-Cookie: Tax and title extra.
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


--NYWNnkWlSL6zYjFJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 04:01:12PM -0400, Sasha Levin wrote:
> The arm64 suite builds and installs its subdirectories in shell loops
> whose status is that of the last subdirectory. A failure in an earlier
> subdirectory is therefore lost unless FORCE_TARGETS is set, while a
> failure in the last one fails "make all" and, through "install: all",
> drops the installation of every other arm64 test as well.

> Make each loop fail only when no subdirectory succeeds, which matches
> how the top-level selftests Makefile treats its targets, and keep
> stopping at the first failure when FORCE_TARGETS is set. When a build
> report is requested, record each subdirectory as arm64/<subdir> so that
> a partially built suite is visible even though make succeeds.

Reviewed-by: Mark Brown <broonie@kernel.org>

I can't help but think it might be less annoying to convert these into
separate TARGETS but that disrupts everyone's results which isn't ideal.

--NYWNnkWlSL6zYjFJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRGJkACgkQJNaLcl1U
h9DQFQf+LiGBnxMlC8Nft/57njPqtSr4IrbEOYXfDtnVtE8C/qIDTms81g1IsDl9
ZsD5vzOSkVbGBsoFyWpurQfTf8ryWE0FlSxsSXC7S++ewunXZ+RLG5s7cVDHdqEt
45DtK73sods62xPWOohEwTf3GWlxEupQs3GuRmbFbC4qsuUSRrygBDa74bGUMOdD
v5LdfkpZmVnR71bi9zkcLkUPPhd7G6PfktHl9l9u4eN1U8c52tCYrgaqvkkoY+8f
oWzMotzmNe2M7/GZ/yV9WNtAYwsWk11/3XLzpg0AdrvNzaqUrivQqKN1Wb1IRfaB
amVPv/R1ZMmYwXbDArYC+mEi+syHtQ==
=SPc5
-----END PGP SIGNATURE-----

--NYWNnkWlSL6zYjFJ--

