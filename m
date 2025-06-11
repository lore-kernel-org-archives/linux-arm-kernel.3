Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD1AC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JArH6qpyQZkPXVoBck3vUWj2nlSzDc6KvjLLRsWL0GU=; b=Dtpw3IheNCwoG30eRzqhGnDqdD
	X7a2rqekGGzgWwhtt7ZXfWaGq7grHLXZovKcy9r4YJJjedvPlm4sm6yKxdPUundJu+hLX86V5bW+0
	H25hLnQsP6akbm5ja4BPnXkZzB6Xli8NsOTfnhed5Qr8G07kzbW94ZXViV8W4E9T1GDfi0B1GGaSL
	7SV6M3KAlZHL3EvxP5/Yd2Gz3NoxuK/FYuzEqcj/137IrV4B/LtglCGKEq1Pa4L3A6OOnNkWj3pn2
	1UOeHz+0SXk6OtESPtNKUqE08NL9WzD/GPVp4fm8qEB1dKf8gyD1ttlN05dYMBBIv8SVsO2Olt5DR
	wOvRSZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNeL-0000000ARiQ-3SRu;
	Wed, 11 Jun 2025 15:46:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKYG-00000009qTC-3DdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01D686154E;
	Wed, 11 Jun 2025 12:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFEBC4CEEE;
	Wed, 11 Jun 2025 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749644851;
	bh=VarOxXQv873WZeOePrBSFiWHWwREU4KYRKEOJZm2ft8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnzEgD9wYy94tuU52DTucvNNzWEatNaRBB7xmDtwPxMnxZgwU22zmzRcih/2WPBKq
	 Dgy43YBwmQHBRVokY5DFBkZeG0DvaPu1VBJ8IwkBFRoLurDkiEsHX8qI8pi1KaXpZp
	 1lV9SgR0+N9dcE2BOpxYQ1soef4YG8JJX/7DCPll86aSBMvLhdI/SCKvnXal9egw+f
	 Qf288vg86BnTQNHzWQ2KCPhKEENu3+YrDXnU1SwshaxcU+PyPDl9SW3e2GjwiZr48M
	 0j+z9pN7+u1BARMhReH+EMUgTzryPbdGXRf0UZOIySClxZIjAQAISOhW1jyNQn1klS
	 XctqA9VFIarEw==
Date: Wed, 11 Jun 2025 13:27:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 8/9] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <0eda8416-b8b8-41e2-8d08-6dab1c1c3561@sirena.org.uk>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
 <20250611094107.928457-9-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xoS+YBzfcBx+g2dq"
Content-Disposition: inline
In-Reply-To: <20250611094107.928457-9-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
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


--xoS+YBzfcBx+g2dq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:41:06AM +0100, Yeoreum Yun wrote:
> Before add mtefar testcase on check_mmap_option.c,
> refactor check_mmap_option:
>   - make testcase suite array with test options (mem_type, mte_sync type =
and etc)
>     to use general testcase pattern
>=20
>   - generate each test case name acoording to test options.

I didn't specifically check that all the tests are the same but assuming
they are:

Reviewed-by: Mark Brown <broonie@kernel.org>

--xoS+YBzfcBx+g2dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJdi0ACgkQJNaLcl1U
h9DPxAf8CnBE6O1+B8YUArr53BhKE6sjRiy4cbtq4RUmuffXxC2JZbKPOEl/e6lV
sbcz2vavI6MsUS9bULJ8Gk4SNQJhsuqhzdYaVdjpfCtoOcUQ94B2xXkPmrKyBoEM
UIqbVr0b+oD9dCQirR2L7U6KbE4xwG2+7+1jNxGkzhtykBNqkvH3o25ZqeTwXgci
nbDhB6NT13EVnlJHsYsyv2fNtdLpnBfjw3eD3lGBGN6q5BCcQiKtxKGeGDw0J/aC
ILqkJgNo33mvMo7U+6wF0oAWV/HZpcOL7OPrtEQATkoPgu92FvPL1LhT39gE3XQW
wLjATcW7vwncih6h6oxbuW28Pu0BCw==
=SK6+
-----END PGP SIGNATURE-----

--xoS+YBzfcBx+g2dq--

