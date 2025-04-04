Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFF9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3unz1n6v1ySx2SPB5ZwjflB136Ff9L8A8XeYAoiuJF0=; b=0/h0mnKxC4dR6RSpHcwkPQZ6Se
	dTaET5jTOtW1v16MAJdi23XMUvKARvibxuWtdaNqKeXdzdnTcCwHKWrZgl9vvYCU/pJ1/FfTuDO9P
	5lURh74/H54Z4wOo9pxDmTgn3Ssjw+LFJhZ/AK6plL+RnH0V8CxzMjxdY+NJBhcvp6nHcfV6kgZVB
	3vZXnEKn9TTywEBKYLLxoe77zbHY6oe/xJrNGCBwRM6HriKJ42yzUbrGQy9XbiMqSfa+GBLx3HyjK
	31OtKwBvxRP4/DQG6Rwb/y8XiMAJChSsBFAiGzeaBR6+wp1kZVN7QGyfzprmxKDL7Qn4kzPMyIUiG
	rLdgxyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mmr-0000000Cdfs-242W;
	Fri, 04 Apr 2025 19:33:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mhK-0000000CcwT-0vtH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 19:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 047C061139;
	Fri,  4 Apr 2025 19:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB01C4CEE4;
	Fri,  4 Apr 2025 19:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743794845;
	bh=rx05JGPhDUK99CkV5feIPAFmFcVlqkrqUD6m8duTP9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvQWnwZMOR5Pi978dQI38MNFH7xIdQT4O4Lo/QB+5YHpABMm8EHOG0c2UvAGJ3jfC
	 33C/TSaKIjwIquqNtAKxceCx0ur+r1xC9h3ckfSLxviyUIXVJil43PLMEMndoxZGxG
	 CR7OIyWglmlSf58jtrDtSLJubijlRiwwuinbnL/fTVULPaRw1Uch+b1mV6tvjjDhR5
	 Y++7GQ9Muu9uc8EsCibJDeXqHnetlyAti9eUMnekZ8z9s/k/ypP+QCaSwMt/CBH9dg
	 QKW/RF5NLtzOy4gzeijnGRcmMrudEV8PerBc3Wa1b2TkmiTnaD0im0BAVuQtJho1rR
	 qlZacetdLRtjA==
Date: Fri, 4 Apr 2025 20:27:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 03/14] arm64/fpsimd: Remove redundant clearing of TIF_SVE
Message-ID: <4b256092-ccee-45c8-aeb0-8af85cd43171@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-4-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5QesnELLL0tQ2wb9"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-4-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
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


--5QesnELLL0tQ2wb9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:24PM +0100, Mark Rutland wrote:

> TIF_SVE implies that sve_state has been allocated. Barring specific
> transient periods (e.g. during changes to SVE/SME vector lengths), it is
> not valid for a task to have TIF_SVE set while sve_state is NULL.

> This was not taken into account in commit:

>   7559b7d7d651d397 ("arm64/sve: Better handle failure to allocate SVE register storage")

> As of that commit, sve_set_common() and restore_sve_fpsimd_context()
> clear TIF_SVE if sve_alloc() fails to allocate memory. In these cases
> TIF_SVE cannot legitimately have been set to begin with, and clearing
> TIF_SVE only serves to complicate the code. No other code paths clear
> TIF_SVE if sve_alloc() fails to allocate memory.

The OOM handling is all rather unfortunate, it's inconsistent and
there's definite issues.

In the case of sve_set_common() we might be changing the vector length,
in which case vec_set_vector_length() will have attempted to reallocate
the SVE state buffer.  It does not check that the buffer was allocated
so won't return an error, and the sve_alloc() we do in sve_set_common()
to flush the prior state would then actually try to do an allocation
rather than flushing and so could potentially fail.  We should handle
this in vec_set_vector_length() and/or sve_alloc() itself though which
would mean that this change would be fine.

In the case of restore_sve_fpsimd_context() we don't support vector
length changes via sigreturn so there's no issue, if the user is
enabling SVE for the first time we won't set TIF_SVE until later.

> Remove the unnecessary and confusing clearing of TIF_SVE, and remove the
> similarly unnecessary and confusing update of the saved fp_type.

The update to the saved fp_type should go into the called functions too,
if we ended up in a situation where we don't have a SVE state buffer we
should ensure we don't try to load from it.

--5QesnELLL0tQ2wb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwMpgACgkQJNaLcl1U
h9DtZwf/aS2CD/NYO52J53hj6ZDeLj5xndorCgD/ebyrwnryuf7HEF3ZMUjid7xg
2b+Ar+8tCigJuGWZP3/DARTXCzJtqM5ZbEmYvLWlmOfMLs5nnCnTSDB1drcFaLvA
1rLuRBQ5PiD5phlDh4dI1K4FExm42VP7cWnWliMVgXDL1eKfjWhVZqeu4394OLSM
H6Wcp90og8b/8PgINFROiB7ZXr9HXniWKUpFO8s2jspGlQ8TKSiVnRRCQTlrYZXG
iS4py6K7e8V0FUi+djj9qLKVthMfX/5X5nIa0ueXeIxg2pg75KYjj8y6riyfJSAd
8FWx6/VPTJzf9UzMrkpGfFuiiWeqQg==
=Q/Zi
-----END PGP SIGNATURE-----

--5QesnELLL0tQ2wb9--

