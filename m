Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B849FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 22:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUOCVCwkDvAsvT4QFe/ve3int+0hAV1t081X52X2K4c=; b=XcXzEDOXmkxpm2Mve1qBh8Yy+I
	KxAcwtN3pKs9gVUhadflosxlkv4M/omp2R2grL2AYlQjL/ayYJUl0WOJyAr15B4X74HLRZ1b7685q
	eMivPfUhSwdKmTk8My9UaA2c4jRQm6UgNqixkOsdKYcz8Qf9QDg034fWj7zwNzWBNTqog8vnbZkdW
	IOLF6MWY1EERcJ2D0cYmO4qsAd82AsrdfCI880iwuoYBczGL3mUUjSxU2NsJEA7v6ictjUA+kcJ2y
	xd36Sx8XEbEZhQZDMOYjsulVQhAHlJyY/d3aUwacKb6Rjk5moiP4M4XWdQIUv6LRklYPDxnQBiuoG
	WJq2ldTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHUix-00000000Gsq-41O2;
	Mon, 27 Apr 2026 22:46:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHUiw-00000000Gsk-35bu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 22:46:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA9AF60052;
	Mon, 27 Apr 2026 22:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E033C19425;
	Mon, 27 Apr 2026 22:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777330001;
	bh=n5gFq9q37eYKpFEcXLpgRDH09jgbIoc4l89TWPtZg0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQu9oUYsYCA5E4F2chgkBhPx7BhwwQvWhe7SkkMd8nN9Jp2nQZYBy5Mp7TZL7su7l
	 QIhmn/x0nDaH+g8x9rzR2pXfNCE4+W/vkz5f5hqMz6eRoBAHNgQ9oLfpom1md0J1L2
	 7Z8UDRvHteltaywJQMHCXLQDkXUhVCOa1CId1e0lpF4rsaKO7fWYKC0ACqilL0Ru21
	 3clRUMWEFImj9oGoaz1pUK5o1/apmrBAOuuBJw7xkje/103APz4S4LBfkr9xbzdKTt
	 eLEMHQKQVyELeh8Q0t0Ph6ESjvnZ52sCNjhTzzW7sP75xVOQ6+Abvp0kIgaTw37UYp
	 krv+IGQJ5QFIg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 17CD21AC583E; Mon, 27 Apr 2026 23:46:39 +0100 (BST)
Date: Tue, 28 Apr 2026 07:46:39 +0900
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] selftests/mm: Fix resv_sz when parsing arm64
 signal frame
Message-ID: <ae_nTynMI26GV0PN@sirena.co.uk>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
 <20260427-poe_signal-v2-2-2bd9d6f16ab4@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WzzMpVDZUqWGuynT"
Content-Disposition: inline
In-Reply-To: <20260427-poe_signal-v2-2-2bd9d6f16ab4@arm.com>
X-Cookie: Victory uber allies!
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


--WzzMpVDZUqWGuynT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 01:03:34PM +0100, Kevin Brodsky wrote:
> get_header() wants the size of the reserved area in struct
> sigcontext, but instead we pass it the size of the entire struct.
> This could in theory result in an out-of-bounds read (if the signal
> frame is malformed).

> Fix this using one of the existing macros from
> tools/testing/selftests/arm64/signal/testcases/testcases.h.

Oh, good to know this is peering inside the arm64 selftests - it'd be
good to document that on the arm64 side to avoid unpleasant suprirses.

>  {
>  	struct _aarch64_ctx *ctx = GET_UC_RESV_HEAD(uctxt);
> +	size_t resv_size = GET_UCP_RESV_SIZE(uctxt);
>  	struct poe_context *poe_ctx =
>  		(struct poe_context *) get_header(ctx, POE_MAGIC,
> -						sizeof(uctxt->uc_mcontext), NULL);
> +						  resv_size, NULL);

Reviewed-by: Mark Brown <broonie@kernel.org>

--WzzMpVDZUqWGuynT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv504ACgkQJNaLcl1U
h9A1aQf+L6+uuz3D6N7BR58qAnQN3BS2/tl81soQVMBU56wRidU7GVgf/AtWw2jW
/LVlvMuB8Ap2uzlr5zjxrd3ZTM5XbOcB81WKJIxyhN7hGmivevjwwXvx2suhJhHV
qz196HjM076yvXa4/Rp6AhzjnAfVC6TpxRr6fZEemMOuX9sVnn4DB5dwXI0UQlgj
Rzg/gYKPM8IAAqeXxH+m4sICwgXYfC4WQSn8WsCJMb96EGM5ar84/c1PRqYFAryU
TWLt9PgfB7B0vWGgMWVkLbnx925WhvoD8T1fDz7jOUUURkn9nxrDKSRsHfJG/toR
HUA8Boacpswt9EXt56PfWIC5mySyhA==
=Khap
-----END PGP SIGNATURE-----

--WzzMpVDZUqWGuynT--

