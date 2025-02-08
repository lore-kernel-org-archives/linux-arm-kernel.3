Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64309C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 00:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JoXQYn0sXcfF2sfRO7+eJ7enjKN+1e/1bl7TgGRYvs=; b=rgVoJF0rmCaO35+pCMEjpvskk6
	/zjTIJh6tHtOmNW1VDdWZt4youT/sWMODkg09wj8ZfNlbKUNzIbhjeDRd0MaFF8hImT4GyNjO8fC1
	wI/boEy3DxPUgRPEUhjSHbuCNsZPl4mVugH29SdtcDFU0CRfGHE/ksoJAqM3HKFMBHZhJP6QLfwMC
	0sUnlOmU/Bv5TcRoCCxwu8kX0ukKTx9csLDFwYXRhmL/AnnyMqp6SfwjIEbczRzEOPUUyh9PWJGRv
	hJAs7uM5C4/KGsYDwOk0nz3t7tP5sn2l65xUqADreB6HA2/TPNmN76Am8QVX6EPy/+fN6l6Cag6Jx
	mI5p6tNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYiX-0000000BduR-1qMr;
	Sat, 08 Feb 2025 00:29:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgYh8-0000000BdSL-2zsU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 00:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15647A43EA5;
	Sat,  8 Feb 2025 00:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DAFC4CED1;
	Sat,  8 Feb 2025 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738974457;
	bh=Pd6p828bSrgUBsLYHLO0l6fA2GCvXk45GZXKWpT9RT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QcgXwlcjSLAoTetHiGu3YHKqCGNe9hr7v7zg9qpCCjJEjyf8Pv3IiU+XkFGdOj+F/
	 gNX+zeDaTWK3Cs3jN+Qsscme6uVtXbKeZzBfNt7bzS0D8gR+tdVWViekpimeG91WF9
	 YUWLZ5BjcCxFmevyklNxObuUMzTe8uwViOFvxoFWAmNtNj0mzBADW0a1nsPCaoq2rL
	 imkHwdVy2UG7nAjkeS72zCPqa1ohKxAVCbaWGksPObtuSLIpJRqK//5cnpAnmph/NW
	 xbFZRRQDUPOgP7WpwT3Y5xtN0f+TpRHGfdVwYTD3CkHCiTrrqEc/KY6Bsz7xnryfOp
	 31rE8PbWbUG3g==
Date: Sat, 8 Feb 2025 00:27:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, eric.auger@redhat.com, fweimer@redhat.com,
	jeremy.linton@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	pbonzini@redhat.com, stable@vger.kernel.org, tabba@google.com,
	wilco.dijkstra@arm.com, will@kernel.org
Subject: Re: [PATCH v2 0/8] KVM: arm64: FPSIMD/SVE/SME fixes
Message-ID: <86bbd845-88ca-45b8-afab-ba9cdb5c4251@sirena.org.uk>
References: <20250206141102.954688-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vz9haEtBNxzRquF/"
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-1-mark.rutland@arm.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_162738_814821_9EBC6861 
X-CRM114-Status: GOOD (  11.94  )
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


--vz9haEtBNxzRquF/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 06, 2025 at 02:10:54PM +0000, Mark Rutland wrote:
> These patches fix some issues with the way KVM manages FPSIMD/SVE/SME
> state. The series supersedes my earlier attempt at fixing the host SVE
> state corruption issue:

...

> Patch 8 addresses some mismanagement of ZCR_EL{1,2} which can result in
> the host VMM unexpectedly receiving a SIGKILL. To fix this, we eagerly
> switch ZCR_EL{1,2} at guest<->host transitions, as discussed on another
> series:

>   https://lore.kernel.org/linux-arm-kernel/Z4pAMaEYvdLpmbg2@J2N7QTR9R3/
>   https://lore.kernel.org/linux-arm-kernel/86o6zzukwr.wl-maz@kernel.org/
>   https://lore.kernel.org/linux-arm-kernel/Z5Dc-WMu2azhTuMn@J2N7QTR9R3/

> The end result is that KVM loses ~100 lines of code, and becomes a bit
> simpler to reason about.

Quite a bit, and much more clearly too which makes the whole thing more
managable and discoverable.

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

although I'm not sure I was actually testing anything you weren't.

--vz9haEtBNxzRquF/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmempPMACgkQJNaLcl1U
h9DUhwf6A1DeWBTOC1O2eefDkj8XCv2tCHQrKzXs1jeJkv4IQkF+v4/yWxV6G+3y
ADDI126dh6Dd70D1eURA3BwGTe6l9Fdh6YI4IA0BVLuKYYE8eOuJtjgrey+GjVti
BXy6LIQMJ3X087tssrHifs0tfqPXZd4EI5mnfJMxEAvyoNCulJvygBXWN2OGQsQY
xfrBA+vBuRlaJqZGJThf1+bDFZ63MwbsF4pB5Q2Ohfa3nI0RMXSgXDN5vlqrjOKJ
ETfg4YJ5JAt7+yrDgdXNX5Yu2UiSOppNaa9O2KABQ/l/Q6cu/knzx6isGINn3XDq
OlUrX9z5c85lZonDi8bKt1BpIHRg9A==
=d+qy
-----END PGP SIGNATURE-----

--vz9haEtBNxzRquF/--

