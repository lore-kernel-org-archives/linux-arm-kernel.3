Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7513ECCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/qu+1nboXXgRmovuxE9nnlbwXrJITNUPGViGdzyeYY=; b=xTKvvVSPfJKCL4AuTXL0L1XJ1r
	UP3Ah4r6+OYihzamu9iphtTrYhntPxunLWTac5itC78gSyLHY+7bJaXW9UfGxQCJmr97geOaSvET4
	gUbhZaf9PL4eJW9ayoPRZX4E7+DU2bLAcH1U8onhQck0uvESGwFR1JNn49jjtrDKSWAtl1N3EzwHn
	DY8w/FR50U9cNHNhA9vlKkohE00RR6PfrHm0Z3B1qMpfcI+GkGchHdfDsJ4dbr9HtNWXSHY//y4xR
	RtRkU3LPr3ayMQcdJYNmmBvqrS5cmT173hI9b5vCMgikOmSX9CwmO6iEgWb58k2oTMnufALyYdFv/
	tk3Dc8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQDQ-000000019th-3zb9;
	Thu, 15 Oct 2026 18:30:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQDP-000000019tF-0X59
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40CC4605F0;
	Thu, 15 Oct 2026 18:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 481B81F000C4;
	Thu, 15 Oct 2026 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792089006;
	bh=u/qu+1nboXXgRmovuxE9nnlbwXrJITNUPGViGdzyeYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bJE9FUP4W3cVPp/S/HGuqa4YptCXCKdrrAR68zXqHHilHZfC7p8sTLqWNeodrCH+P
	 wovUbdBrOhKvcanhDyQVg6WhUyNQJoSInIxSvK1anE1WgHyGq0VoYAcF+Yqjd2hynr
	 imCaz54SbgqdJ3rSTph4YjZY95XTIzyhvp/ZqTbsPM8g/D4TNQNYOcDagEmluflOSc
	 eW4GoM6oLgCag5hCY4PtGRMtWJEhPTd2nGgnTeUAK29PWZ8cWXoYatiSwUwjKrKMqd
	 JmrJMDsixyLmgGgUWbrbr7iRYenHOfz++f1jlj4byzPhC+C7VTl2g6ZOOgCmMyJWbx
	 aZWSkHmQGan0g==
Date: Thu, 15 Oct 2026 19:29:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: signal: copy each test binary only once
Message-ID: <793b97aa-6980-4cdf-8426-34b4f9bd0615@sirena.org.uk>
References: <20261014200140.1364282-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hV3+bZ8AmAs2jgop"
Content-Disposition: inline
In-Reply-To: <20261014200140.1364282-1-sashal@kernel.org>
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


--hV3+bZ8AmAs2jgop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2026 at 04:01:40PM -0400, Sasha Levin wrote:
> The signal tests are built in testcases/ and then copied to the output
> directory. The copy rule lists every generated program as a target and
> copies all of them in each recipe:

The build stuff for the signal testcases is a menance, it's being far
too cute.

> -$(TEST_GEN_PROGS): $(PROGS)
> -	cp $(PROGS) $(OUTPUT)/
> +$(TEST_GEN_PROGS): $(OUTPUT)/%: testcases/%
> +	cp $< $@

You'd have thought that'd be clearer with two separate rules but the
obvious doesn't work and we're already being so clever I think this is
fine:

Reviewed-by: Mark Brown <broonie@kernel.org>

--hV3+bZ8AmAs2jgop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrRG6YACgkQJNaLcl1U
h9AWzQf+OU6dIs888s5E7lDGgDCaqEwbWzdiPRypghBp84fZqmPXX7D88/4HscEh
UxccmRKO5ixBfP1JLzOumblG96lYNNAMkkiq/xhEqNZMgIkwdNl46EaIDpWP8moY
6QgDldJOItjV4gs8eUS+kSsB/UkvsMc61oZNYuTeVwwVRe/nX+1Orj9V0p7e/Mgt
AzHVsGpDyoGp8tVlX78gXkk2vwC9iPvqjHwYbJHteGNoGah/P1L1GbqAjBD7TB5t
9zbqDxRalqbIJOjhvIxtIh+1ZiqN9F6uipi43TncHvVtpgz2J0cqTInZhMOSspM/
3tGbP7GJRwZec18k1oWegqYKZ4E89Q==
=Ar76
-----END PGP SIGNATURE-----

--hV3+bZ8AmAs2jgop--

