Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5BD2B944
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lzS+z+PKKsRoAWU8YZd2WpPyrsLfQqka5sWgVphen8=; b=RuEVDiKO0TZlpvmZ4Q938fJ+9d
	bmxcDyY0ZBELNrTEQrZ5YogpVm+WbkxDTzWE2FLK80vkTI2p03SimRGlQLKOqH1Mr/YTPSt8Zntwc
	nT17oKJjJLJhTYjHsMSK49fHYs3gk0OyvJyujDq3jj+tqEb0i/ZPRGCUwaJHhJ9vPuUsfokEuIExC
	wshDlTB8pGp/d6G1JCNuqLTk+MDvesaxHaey4vu2izEUU8L1bwhgemwtlQlAzEuur4xunTXh1hnh1
	OSzgmEm/EwnHyZ7il+gH3NmeJQyxz9DlZx2qVTL4FcS6UGkX80aHQZGULjNDBhzLO1AD9Ri7zv3ee
	uUuNkpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8LwU-0000000HWba-2dtz;
	Tue, 05 Nov 2024 15:58:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Ltm-0000000HW6j-2XMx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E02FA43502;
	Tue,  5 Nov 2024 15:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57E7C4CECF;
	Tue,  5 Nov 2024 15:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730822117;
	bh=geNXIOmFhjUV44xeJJLj1CXb6YjQiBsxZnVw4EaQ3a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u3ium1tQ4OrYGX9cs8sebcV86pFTUpuEmi/xq06tAxwG44Wf4fBqNl/2ZXimzpeTl
	 E5hzBuZTXpgsXtnnXbZKQQZDd/7D+ICbBiB/Q7gYRY6BbGWub0pAgIgxPIem/7QIPF
	 L8BvpGd11hjGXcfZsIryiQsmQkgDp2FaogxZ7aLLrVBFzLNJRvko+tlmgmnmidW+8s
	 qDZISKEGjxk9P7qF+2z/rY7Rg3RKbGytVKH+wrAv/7m8Jiu5U84V/n4W4a/1wVtecc
	 6rm25ErH7hceThPKadvYvo/Hap/GfVLAUoHFZOuIgXSVCb/gclVS01MzCVfpwct17H
	 OlQ8zlYbkD/bw==
Date: Tue, 5 Nov 2024 15:55:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64/signal: Avoid corruption of SME state when
 entering signal handler
Message-ID: <709b6a9a-dcf1-46b9-ac81-e5093a9740f2@sirena.org.uk>
References: <20241030-arm64-fp-sme-sigentry-v2-1-43ce805d1b20@kernel.org>
 <Zyo3QU8aBGmtbTRo@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Y56n/3XFNEIyBPu"
Content-Disposition: inline
In-Reply-To: <Zyo3QU8aBGmtbTRo@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: Don't get mad, get interest.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_075518_802121_9CA5AF94 
X-CRM114-Status: GOOD (  19.74  )
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


--/Y56n/3XFNEIyBPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:18:33PM +0000, Mark Rutland wrote:

> I don't think that the foreign / non-foreign cases are equivalent. In
> the foreign case we clear the entire fpsimd_state structure, i.e. all
> of:

You're right, they're not - thanks for spotting this.

> AFAICT either:

> (a) Our intended ABI is that signal handlers are entered as-if an SMSTOP
>     is executed to exit streaming mode and disable ZA storage.
>=20
>     In this case we'll need a more elaborate sequence here to simulate
>     that effect.

That's the intention, so we do need to just clear the vregs instead of
the whole user_fpsimd_state and add clearing of FPMR.

> ... the description of FPMR (which is not in the latest ARM ARM) says:

> | On entry to or exit from Streaming SVE mode, FPMR is set to 0.

> ... so we'd need code to clobber that.

Right, that was missed with the addition of FPMR support.  We'll have
the same thing in ptrace streaming mode enter/exits, FPCR and FPSR
should be better there as in most cases register state is provided when
changing mode.

> Our documentation in Documentation/arch/arm64/sme.rst says:

> | Signal handlers are invoked with streaming mode and ZA disabled.

> ... and doesn't mention FPCR/FPMR/FPSR, so we could go either way,
> though I suspect we intended case (a) ?

Yes.  The the intended goal is literally just that, but if we accomplish
it by issuing a SMSTOP in the live registers case (which is the only
reasonable implementation) then we should obviously behave the same in
the live memory case.  I'll add a patch which makes this explicit in the
documentation.

--/Y56n/3XFNEIyBPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcqP+AACgkQJNaLcl1U
h9AqDgf+PqN4Wj9YWUYWWu0trOvH3yqf++dzHWOidz87KPWWpOIWvLF3uL4rSYow
fKMgrPnIVlv/pHdP4MiNSkWHmiUeodUcuaSTq4V7OqO2p8KXeTKvpb6AfnfB1IkI
XQaeeclkboOBKyH4pP7SIpkB6PvsLU3cRxYHV5/ZbQesUZqIRgmzSBDRAxp9rKDV
PcY5uFeqhFW8eXr7SS79bLYUiN2nfiTabXhPGBXapzoUsTctEVpzoD9C2GSuRmbv
uoBgsv3bbABjRfA3tuA5HbUEARNNUw0Anq5KOyl75Rcb8RVE4rkF5GCy9sTtHsnT
S/S2hG3y7xqCOFZleI5hBmrRtHu3OA==
=ITo3
-----END PGP SIGNATURE-----

--/Y56n/3XFNEIyBPu--

