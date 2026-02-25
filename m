Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606AFFD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG6lGKiO/AQSqFZF8zcYKPFnP3iI8eQTbAgyFLNKPn4=; b=S4VT5M/8w+KGYlfqqBK42dAbof
	fbN+bQOmJK1Z/jgN8pHw4kcBaKO1RBV3iNiAIAouus9xpsiwgUzuhjGfHvRfH6isWjn+BbnrqsSnO
	AZ+IdvAdWcTAmSQ3eha8Z0wXiQUDYEnlJfDKGC5bStga5HoIfpLhY3FaWrfDW2TJN2Ky/DOmFh7yi
	M4en9abiHn22PebfsuBkeOcOEYdS1MIIjaHzyTunvph358eFk2geplw98x7lOM7KJ/BhCBPyKPa4g
	hvkc43Xw72p6UqBCldlSWn6AuY9SzdLSyJWLqKXrRADB3QCPmTkfAEdNbwThsxYmZYdaUXH2Gj1Gr
	+2gNAUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEXO-000000042X1-2VZh;
	Wed, 25 Feb 2026 13:02:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEXM-000000042Wd-2G55;
	Wed, 25 Feb 2026 13:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7A514330B;
	Wed, 25 Feb 2026 13:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C0AC19421;
	Wed, 25 Feb 2026 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772024562;
	bh=bG6lGKiO/AQSqFZF8zcYKPFnP3iI8eQTbAgyFLNKPn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SE8sVtK83K2QC+fszgE6mdJqlWX4NOw4VxSEr/x/zobnV9TuTZGvyfRCcnl4q5/la
	 PQiRd/1FLIOKG4HsfPqTGTflSF3IKNNMLvc+v2sUjGs2+k1XXsVIs6QQN8dqqNtSgo
	 x9WV4Ez6VyRXwBjAgRbc6iJkdG7d4ZSrMpcXR6UV+pJkBMeCqNBf2L7nHVtqPi/QnK
	 ZBiQiDprzbU4Ca2VbsVg9FOKpraWdix34QjN4zwYwSyQup0xNv4MuWDk+MaqG2lLoa
	 uUMeVvk9qCmHaFMWS/FUKzmpaa2ZfalKOUKr4ROzTdpaN7qhbz59/wsT0w46uuCa4R
	 uNxJbFgKgMAnw==
Date: Wed, 25 Feb 2026 13:02:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 5/5] mm: Do not map the shadow stack as THP
Message-ID: <5570c06d-fbc1-42c9-9b27-26211e8b033c@sirena.org.uk>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
 <20260224175800.2500729-6-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXmct3hgznYcvsc+"
Content-Disposition: inline
In-Reply-To: <20260224175800.2500729-6-catalin.marinas@arm.com>
X-Cookie: From concentrate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_050244_618835_C013CDAF 
X-CRM114-Status: GOOD (  14.42  )
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


--cXmct3hgznYcvsc+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2026 at 05:57:57PM +0000, Catalin Marinas wrote:
> The default shadow stack size allocated on first prctl() for the main
> thread or subsequently on clone() is either half of RLIMIT_STACK or half
> of a thread's stack size (for arm64). Both of these are likely to be
> suitable for a THP allocation and the kernel is more aggressive in
> creating such mappings. However, it does not make much sense to use a
> huge page. It didn't make sense for the normal stacks either, see commit
> c4608d1bf7c6 ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE").

Reviewed-by: Mark Brown <broonie@kernel.org>

The create THP and immediately splitting it pattern is very clear when
checking the mm behaviour on new GCSs, this should help performance.

--cXmct3hgznYcvsc+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme8usACgkQJNaLcl1U
h9CDqwf6An6emWNltb5SR1AZIjifc5oF4Kkplg3VEBjz2qejH6O1DHtpUEPr90d1
/Np0MHYou2I8q7SWp4mdaNs1ovD2UT5Gr1SMFxZZBviJ0r9/Eob3BrpxVrC3QT9J
qybG0P8RYytpWk5rc2TJllnyTlY7gcVhjDT7BqCec6wWQOmLFeLinB845irNXV16
fFjtAtMZw+1Gye+rZY1EeEKfdRZLlnkMneBaoKF0KSr4h5n8PvtcGAHHvzCral8n
LS1poo8sjbOv0XtR6ZqTSEN0R7jQQ9w2QlZhaatEcZczugZRFs4jZDe7Q7HAZK1E
yiaDOtnMo5LnFk3zQouQJMNjqU37lg==
=SFPj
-----END PGP SIGNATURE-----

--cXmct3hgznYcvsc+--

