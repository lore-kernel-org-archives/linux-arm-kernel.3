Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8413CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83Po9+/CiM11x4W/dMgcMJxTeSkCZEAkP9gOnl7y1z8=; b=c9a1dE0xDBUkkYuT2nfLMTPcQL
	B6lbeovILnKcmVfxMlufUcaLAFv9FgW9zCv3Xm3rUGLxicNuwP2yw8WrRiOs8XZO3ixGQnCkVMlJj
	BL340BkPGou+eR3msLZfnRYxLMCYa/oD+5xGyqPBJSbBqjQu3V0FHBr7t2btOdOsKOx1bfMLu8QiE
	O2IVcajKYt00Y+B/qewIEEVuUZgxuF/XhjKSsMpJh7dzhevLo1NZnqUbIgNfRIB2wP89QQJ3Y0DqK
	nMDvlET13hh6yIg4A694E7teKymtbLHbQVsRmtaV5ETXrHTb2C5f96s6fjXMRpLQfPJPmh+8fHRCs
	poyb9yRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonxp-0000000EimO-44l1;
	Wed, 20 Aug 2025 18:55:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokhF-0000000EFbq-00wr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E42D44CB4;
	Wed, 20 Aug 2025 15:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2EFC4CEE7;
	Wed, 20 Aug 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755703552;
	bh=P4Yet0T9nXdDf0TzNjDPSNwIP8HqdY1hreVkpB5uhwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3Z2VO6wmW//9zhhtUXtoi55A2/d+Bo/ZKRDlRbz2cEkQ/dL0t2w/ErA5ehi4jZwS
	 6kACZ2+ZW2lii9qfgDZoo5hJhCtdhAK7VkdW5WYr1V9HJ/SVKPWQlgYI+JsL//l6En
	 xChUjX7is6N1KUjZC9BA3KW5d52XDA1UJMFw7xRotrNTM2i/VYqdyNN1Vv97uosL/u
	 aON+Fmkdpq+z+bmLM+R2nAi3swworY2XJlP57A9TUv7CnMMCZ4mg4DWuw86KlzepU1
	 Jtpq6j2ecy5AR+LTg8n+Su28bOsXAgVhvgJWJwwxjelg87FOm1cbGln71C2kY9fItM
	 TW4C/44bDSTTg==
Date: Wed, 20 Aug 2025 16:25:45 +0100
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
Subject: Re: [PATCH v6 2/7] arm64: uaccess: Move existing GCS accessors
 definitions to gcs.h
Message-ID: <a1a7631a-066e-48e5-b8c8-d90b9cf4455d@sirena.org.uk>
References: <20250818213452.50439-1-jeremy.linton@arm.com>
 <20250818213452.50439-3-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UokGFqJlJ5Wl2ADc"
Content-Disposition: inline
In-Reply-To: <20250818213452.50439-3-jeremy.linton@arm.com>
X-Cookie: Semper Fi, dude.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_082553_059314_0690CA64 
X-CRM114-Status: GOOD (  10.93  )
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


--UokGFqJlJ5Wl2ADc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 18, 2025 at 04:34:47PM -0500, Jeremy Linton wrote:

> We are going to add some additional GCS access helpers to gcs.h in
> order to avoid some forward reference problems with uaccess.

> +	/* GCSSTTR x1, x0 */

Should really be [x0], but not super important since it's clear.
Otherwise

Reviewed-by: Mark Brown <broonie@kernel.org>

--UokGFqJlJ5Wl2ADc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmil6PgACgkQJNaLcl1U
h9Cs1wf/euB1pOQe9ocxRSjAjirM7narDyKReS0sLCltciEqP2/zyi7/GsIAJoAy
wdlwoBGhMOJ4KcLCNo8AYzddvotkuApfsrNI3aqPD8fMWIW4kWJOH3csggWeyXw3
aXQzwU0NqiX5NyeBiBApZDHFzbRy5qN9uUsfroKxKbmtCd41GSbhQvXqZKfSMlZ8
rpdR9cPqQLz8o2EZcYGLurOq9144T9/jFOqANYePa/J8Wr4TrpNP5fQIKDlxQefQ
/wQB0DyMg/tV9LYDN4fvVRsdmX2TsQ7/gsLKAkM+2ZcTfI1cplnkBX7Jl/NFpnyO
J80JCwW8IFpm6Bx33Z5i9z33n2ZW0Q==
=58Ws
-----END PGP SIGNATURE-----

--UokGFqJlJ5Wl2ADc--

