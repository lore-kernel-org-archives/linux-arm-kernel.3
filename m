Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6226C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hs7kf43kgJgGhkPDb3YEryLJjl7hpWdhZ2J0A5gnOaY=; b=UoZVk9TRUtQ0vaNnPHBmSO1qPF
	p8tdVciGYh4pQ7sJPYO1i5WBZTg6vGgSlHppJMmzDQSguivbYoSnKiiij5PECRU6C7RW5S4QZ18nk
	OkZaE60Cf1zjdtxRpfG1BdX9Yi9OqYhqtnnekjq9mpbOD0I6T6wIgKkjnfMn2eExFPxcDsjz6ikdG
	SV5WuAVGeK0iCiqrzEGU3onCdb8KLIbHsCin/IMLy+8JuKOVJ66kmjTApraJFUZGufLqWgQbsSH5w
	Ialw8FrN8a2QaDE6FH0VvDOSDjtVwTSnuQdrY4Z4VN+1EEQHd16UPSO3txSsknugV84S54lLo4hI3
	fzflp+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2oA-000000012oP-3MbS;
	Thu, 08 May 2025 15:05:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2AR-00000000uJ8-1m6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:24:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BCF8E629F2;
	Thu,  8 May 2025 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB5FC4CEED;
	Thu,  8 May 2025 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746714246;
	bh=hs7kf43kgJgGhkPDb3YEryLJjl7hpWdhZ2J0A5gnOaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swGD1fVrjIOA88oPXwaBBDwCwyezYItH+173qKxwxQN7PYeC1Bo85BIJILt+XZ5iI
	 4vF2ZyyxaYbo9ccHLYQUzEUc0NhVCVIKGl0hm2X2HBxNCHddagIFTUPCwvPx1RZ4nH
	 Sayc58uHTc8X60Aj2ikJZoCzEbKH34rGf0xYQui6C/g74RakbwA7D63xrk2NgMX9Lw
	 9ZbJc8fOW/pPGKb4jIFsnoqaL2exByWNxjsWWsWdlFDaqB6cuA0G87g1wia27Crcoi
	 gSM+pvZJ04WJj8m5sTCnwLAvJdgEZ2Te1CSdn06aptn24kBi0q3zvqlqqFxzwHjWKK
	 7503fPkZZ7ohw==
Date: Thu, 8 May 2025 23:24:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, thiago.bauermann@linaro.org,
	jackmanb@google.com
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Message-ID: <aBy-gy_fK8ohNUKx@finisterre.sirena.org.uk>
References: <20250506095224.176085-1-revest@chromium.org>
 <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
 <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3G+aMXgLa2YFDWGN"
Content-Disposition: inline
In-Reply-To: <CABRcYmKqCVn7NbrXocyzmYif_ihkeOCvPHZ+jxMi3OPWs6EiTg@mail.gmail.com>
X-Cookie: Well begun is half done.
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


--3G+aMXgLa2YFDWGN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 07, 2025 at 03:09:50PM +0200, Florent Revest wrote:

> I just want to make sure I fully understand the point you're making
> here, it seems that you are suggesting that 7677f7fd8be7
> ("userfaultfd: add minor fault registration mode") and ae80e1629aea
> ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS") came in
> from two different trees and independently chose to use the same bit
> around the ~same time, is that right ? And that a conflict would have
> appeared when they'd eventually get merged into a shared tree ?

> I don't think that's what happened in this specific case though. As
> far as I can tell, the former was merged in 2021 and the latter was
> merged in late 2024. Also, since the hunks got added in very different

Yes, indeed - I wrote that initial reply before I saw the actual change.
I wasn't expecting a conflict but rather that what'd happened was that
the bit was allocated independently in two different trees and then due
to the way the allocations are scattered everywhere no conflict had
flagged the issue.

> parts of include/linux/mm.h, I don't think they caused a noticeable
> merge conflict. But I agree it would probably be preferable if these
> cases would cause some sort of noticeable merge conflict in the future

Putting all the flags somewhere in the vicinity of each other would make
the whole thing much more robust, or having some build assert for
uniqueness.

> I'll quickly respin this series to address my typos on patch 4 (sigh)
> and add your Reviewed-by tag but just to be clear, my refactorings in
> patches 2/3/4 currently focus on using VM_HIGH_ARCH macros
> consistently, to make it a bit more obvious to a reader if two
> features choose the same bit. But maybe what we would really need
> instead is a more obvious way for these bits to be mutually exclusive
> and to cause merge conflicts if they get added through independent
> trees ? For example, my colleague Brendan Jackman suggested using an
> enum for VMA flags bit offsets but I'm not sure what the sentiment is
> around that.

I think we need something here, although it wasn't what actually
happened here the potential for the scenario I mentioned above to occur
remains.

--3G+aMXgLa2YFDWGN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgcvoAACgkQJNaLcl1U
h9BY0gf/dFflr/U3vGpugb7MR90AC1d+1+r2r6ToKtp08WD7Q+Dqe0+tiWFwAwXm
5CbrPisJAZxEGWoKrTS2QI/q4fwBcKKaMZj897g7XqB3703bieY69nkScl1ibZkj
TxffPqbETz3wMdIxmhwAoryJqUFza4Vr/DjqG7gHbHRRgOb/rZebckwXnym6xR8A
8hP4fzSkF9Soti1v1djWf0Ni/R+B4JhNalBPWdoF3gbagH+Ev82IF/RVhL6SCeLe
s2HhMNN1iYXvDsCXpkL7Gu95jFhFtcKSVfxqzBRXLG1HOT9o64xna4mze3AitMIl
+XsRPhevIWCvICeM0z8SnfscVzgb9A==
=+kmo
-----END PGP SIGNATURE-----

--3G+aMXgLa2YFDWGN--

