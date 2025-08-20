Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FB9CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rrs7nZ2HdS1rITm98oUG35bECgGtt4ki18QFH5cAi2w=; b=HzaFBGEX32KVaaWaQONWgVm8Iq
	8KNvDqF44Wq6JaLBDM4qBgyVUrYn7WOWbmmVnzLy7S94hRbxpX5LYkgjY+6P+Np7stnE1mhUDkUDg
	3JQhG7tQNikR9CGc5Eilfs76dpyLnaX45mdTlpnEvaVL5FB3pS+uEbgR2FW0OBzhDgmhifrcsb+Tw
	zzEN34UIXkcPtKyuucBQ4tfYIjGHpxBYb/8iiLmvjTPtM9qln4nPSC8geC6vg3wF77uG/DWJ/PzhE
	HvzkeT5oTubK6AwDPt5FUGKjDjGn6BSIDVAW+WdT5mJ3xo43+gk9HtN4KXxazRLvvc2fc68ydzsQ9
	xqpsskCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoqs7-0000000F33w-1RzG;
	Wed, 20 Aug 2025 22:01:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomY5-0000000EX9C-0uA0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 17:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BB31601D7;
	Wed, 20 Aug 2025 17:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CE3C4CEE7;
	Wed, 20 Aug 2025 17:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755710671;
	bh=zK2/t7pB5uRi95w0k0HULqrZQXZoKb6HKfmiVR24b+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dt7gdEqTTlWr9uPsmbh5dC5JHyQ4ajY1BeBLVEaA84XW568wCEGwP59iZSsYbHZIa
	 Fg2vygO7X8vp2m0Cm8YNFm4BhJ0cPlOHCvQXCj08/3tNm8Sxc4iKm6wZCiDOLd0f+Q
	 1mUo6JG+1d3EvgEjhlPdbZq2YQeh51uVV/NZel0Mz4AGEFZ9gSJf71pS09llaBr1tY
	 ErI0mCisKCney0RRErNlxuIam2AH6ODhP72wMuuXXpqF4K2jA3yjtOQ+NBoc/Vodlh
	 Q7h/cj0WBupi6f8SVmwzot9Vv7r6LhQ6Jk/BHLy4+BjC4dpexOyvP8xLGC9M1B1MRY
	 J5/PE82VmYVaA==
Date: Wed, 20 Aug 2025 18:24:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/7] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <7bc27e3d-7667-4366-89bc-93a084808ace@sirena.org.uk>
References: <20250818213452.50439-1-jeremy.linton@arm.com>
 <20250818213452.50439-4-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CxxZay3cgRaUrHlW"
Content-Disposition: inline
In-Reply-To: <20250818213452.50439-4-jeremy.linton@arm.com>
X-Cookie: Whoever dies with the most toys wins.
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


--CxxZay3cgRaUrHlW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2025 at 04:34:48PM -0500, Jeremy Linton wrote:

> Its important to note that GCS pages can be read by normal
> instructions, but the hardware validates that pages used by GCS
> specific operations, have a GCS privilege set. We aren't validating this
> in load_user_gcs because it requires stabilizing the VMA over the read
> which may fault.

I think in the context of uprobes this is reasonable.  We can always go
back later and tighten things up.

Reviewed-by: Mark Brown <broonie@kernel.org>

> +/*
> + * Unlike put/push_user_gcs() above, get/pop_user_gsc() doesn't
> + * validate the GCS permission is set on the page being read.  This
> + * differs from how the hardware works when it consumes data stored at
> + * GCSPR. Callers should assure this is acceptable.

s/assure/ensure/

--CxxZay3cgRaUrHlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmimBMcACgkQJNaLcl1U
h9DStgf6A0dCzGu8uuMoynkApBSWEG4f5HAlmVPAHWXzCcGU2w83eDn+Q9HoQHoV
JY8tRaql2Xt08gBFi2xdoJIsgVGy5vSpAqXC0gA62YDv9sjsyKAsklb8D0bv+9kw
2Omq5CiJDjBCH0eREe52xvExTcCazZeiXpI18GXPU9/D5t8cWNwIqCaQojQoEqFV
pJN+543otg+v8NN9fFgwkGlQ1vfdnIHa8ERKEYykCdx1oQ98dXonsbWnwhH1WYyw
Om6XvXeDLfnRajhgFM7gSSp1jK900upFFXeOQRPwaNgRnCcwQOeVCC+1zfIp6P1v
IfNStDtyZvXvoMdlMY7QrIB/yBbLVg==
=igX0
-----END PGP SIGNATURE-----

--CxxZay3cgRaUrHlW--

