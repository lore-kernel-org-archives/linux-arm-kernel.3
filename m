Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48997C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 21:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxH5m2WNz2dpkYixNg5ei0sQwYFigKm6FWuebIMrsww=; b=GM0nzf1QwHP4PPwKGh9l9qRc15
	BP8yOR8zaLK04SadHYr3eETidygQXFwgx2Hi19npH9zlWU91q0EBqcXaupCj80yz7zMM73pb3czyA
	tInmYlItzCX/VhN53niIs8VYnZwTpAZG4QrjO/Yeho8ELBKZ++ps//DdUZntEemXz/bwKI8FIUIRB
	EoJmI2V3JvF7J1D2GCJWL4IZQAmxjVMnmnIw8a5IweYzLNGDmZwHXk0fsjhx+eWpA7y+BTmUP5HxH
	qcugGrxgKPsXqvkC96dbb2O0EGh3XxxBnV6SZUAxHOxWheOrvkUK9XbyoTRHOHst3zQktPg1g+bJk
	RXGJ0tVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnJS-00000004fbM-0G7O;
	Wed, 05 Feb 2025 21:52:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnI5-00000004fX6-2Z5T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 21:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF2575C5B49;
	Wed,  5 Feb 2025 21:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F77C4CED1;
	Wed,  5 Feb 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738792236;
	bh=ya/fBoSYVVIdgK88dQ9518oSzqK7Eic5Fomq5f/2f/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKP836gGBxwnbSube4hNPNDiesXHon+kI/BC/VYc2CvG5L3aoqZSetkfIkEcbIsPF
	 3PTuLtMED9HyHr86BJ6LC5ZfnC0r50gHWrpE8d8WEmLRUbUv9QHL6tdxSIuxqt/NV4
	 IRQmF8XfTOr2cdLE6fOTbccHFOqi2ePhd0F+tOiwosWHYVZ+8EXwwlmJt5czRUkwIH
	 KVCAw4eZk0fkDHGht8VyMRuplPEeBoMHHsnbqWgSz2wHO0VXIknfqiP+ZnxAJRrgmA
	 +e10JnrOHTgWgPUkc7XfFwxnrXACk9bPfzh1uOW3pcPjmi5bSidfLPxhde26ORiPeb
	 o5sCu6PZdRPfw==
Date: Wed, 5 Feb 2025 21:50:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	eauger@redhat.com, fweimer@redhat.com, jeremy.linton@arm.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
	stable@vger.kernel.org, tabba@google.com, wilco.dijkstra@arm.com,
	will@kernel.org
Subject: Re: [PATCH 7/8] KVM: arm64: Mark some header functions as inline
Message-ID: <b76803b7-c1b3-426b-a375-0c01b98142c9@sirena.org.uk>
References: <20250204152100.705610-1-mark.rutland@arm.com>
 <20250204152100.705610-8-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FmYGv0xfUtEYpWvS"
Content-Disposition: inline
In-Reply-To: <20250204152100.705610-8-mark.rutland@arm.com>
X-Cookie: Earth is a beta site.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_135037_691397_F78151E0 
X-CRM114-Status: GOOD (  12.24  )
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


--FmYGv0xfUtEYpWvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 04, 2025 at 03:20:59PM +0000, Mark Rutland wrote:
> The shared hyp swtich header has a number of static functions which
> might not be used by all files that include the header, and when unused
> they will provoke compiler warnings, e.g.

With at least LLVM 18 we still have some issues with unused statics
arising from the aliased function definitions:

In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
./arch/arm64/kvm/hyp/include/hyp/switch.h:699:13: warning: unused function 'kvm_hyp_handle_iabt_low' [-Wunused-function]
  699 | static bool kvm_hyp_handle_iabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
      |             ^~~~~~~~~~~~~~~~~~~~~~~
./arch/arm64/kvm/hyp/include/hyp/switch.h:701:13: warning: unused function 'kvm_hyp_handle_watchpt_low' [-Wunused-function]
  701 | static bool kvm_hyp_handle_watchpt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~

The simplest thing would be to expand the alises into simple wrapper
functions but that doesn't feel amazing, I don't know what people's
taste is there?

--FmYGv0xfUtEYpWvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmej3SUACgkQJNaLcl1U
h9D8jAf+OsR7N7gv1mtd/NUw3staLjxx4em5B3XybTHjif1nB4OWEjvZoOxJIn4M
Vct+xOc16qwqpSBqpNZ5J7vnqF4g0TAmHkNTQBpSg6rMFoivkllESV4ET1GfKYXS
+K+qlRXgZLfIyk7rEvb674aEyWBhEfjDiSorQOZ+4xFP9QU+FVmycLl7gwLtQaig
Zj5OZaGC+K2gotK5VDhMzEj7CrsIMM5wlylchlOyGdQHM1gAOOL4/ca6qcnjbqpl
+dnJuXJnBW98ssuchtaWDIGkFup6orSyfddsfHrRZOnqDCb94NQWvbDV7TapiOnz
PIWeEgcDvS4x1xHHAVbzmPKqx15/iw==
=cnFK
-----END PGP SIGNATURE-----

--FmYGv0xfUtEYpWvS--

