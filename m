Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38596C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puBf023P8WVgEypU/hph2K8P+fCv6S17KYbYjmpQwxQ=; b=TSTn1rZPIyrR7erkkPZmFerga9
	X884gZUbiqJjnm/4Hv0rX3x9YBmE2q0I+K6G2GlnyZVn1Hnn/FI1vobJR5djtmLX9oD25MLCixq/E
	oVi1ZJNmm0pObHAJXq2BE0LRXU50jTRL8hOw0jJEO70rTZbj63SAf80kqsA2yHWZFEuA0rnO1Uaa2
	8uGSSH4QyS+m7FWwz0666dlilWP4tkOtJqcr9TGfij0jtRsdPhwORoSqMaL7op8R8rmsUYzz0+dGV
	zlsWRM1xEQ4dk2uSe+qm4a7DyPkvPpL4PztNm55LhWa+vzfXAMnLx9IoPa4eUwx+L+PoAlPtuj/Te
	TduOIGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSos-0000000CNnI-38eQ;
	Mon, 10 Aug 2026 16:25:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSor-0000000CNmp-1t7l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:25:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1AEE0406DD;
	Mon, 10 Aug 2026 16:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A771E1F000E9;
	Mon, 10 Aug 2026 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786379145;
	bh=puBf023P8WVgEypU/hph2K8P+fCv6S17KYbYjmpQwxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M49pubjnLA0rHT6FWPVJ4HZhQCNpICjrdptC1Wld14EziZlXYWnCHNVLVAqE5/SMs
	 3tJ8oGbP506c1sPHNoWsPP+HcrFT59RJMPNS+X3hEUWG0f5QlQ98nihi3OsMfCYatl
	 VvugBLa1bcSU1nwOOt3W7Sal8pMIozzGWMojt8776gmkPnJ2Mw4YWHHHPXHuleuNes
	 eaqAH6gm9xnJTjRaaI6tg6PbLXUsrI9OYnalrbiJpboNh0pmp9CGW8l9wXrZjXu/We
	 CtrvfQ7YE5B6mC/tf99BwsxbISFwcYvi0utZYOJGS+d0mPlM1wxSfMhbkDo36lmZ8b
	 +21FfypVVn3aQ==
Date: Mon, 10 Aug 2026 17:25:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <da06bbd3-d04b-4d0f-b331-f5b91bc373a5@sirena.org.uk>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
 <anmobvJXiBQqWn6S@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OrzuF7qUiD0sqMOd"
Content-Disposition: inline
In-Reply-To: <anmobvJXiBQqWn6S@willie-the-truck>
X-Cookie: -- Owen Meredith
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


--OrzuF7qUiD0sqMOd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 10, 2026 at 11:31:10AM +0100, Will Deacon wrote:
> On Fri, Aug 07, 2026 at 02:46:11PM -0700, Josh Poimboeuf wrote:

> > The following BTI exception was seen when loading a livepatch module:

> >   Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
> >   pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
> >   pc : kill_orphaned_pgrp+0x0/0x150
> >   lr : do_exit+0x498/0xaf0 [livepatch_combined]

> > This was found by testing with klp-build and Clang 21, but the issue is
> > not specific to klp-build.  It's inherent to any livepatch module use of
> > klp relocations.

> > Previous tests with Clang 20 did not show this problem, as older Clang
> > unconditionally emits "bti c" for every C function.

> Is there an option to restore that behaviour if CONFIG_LIVEPATCH=y?
> Otherwise, I think I'd be more inclined to add yet-another dependency
> to CONFIG_ARM64_BTI_KERNEL so it's disabled if LIVEPATCH is selected.

This won't even be livepatch specific I think - I expect the same issue
can be triggered for module loading by using annotations to place
functions from the same translation unit in different sections if the
sections get placed far enough apart.  That was what was impacting GCC.

--OrzuF7qUiD0sqMOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp5+4MACgkQJNaLcl1U
h9DWCwf/Xti+nVWpJHcUhn6hWKTHMFbXPU/xtxs0DQDxretJilC2YDU3AkLOsCz+
Rh/Fd8sq539JCsMpATZOU8Od41skWS33mhDmcJy2agCj4ObNs7e1V8mEF9hp9Ait
32wCO5WCOSJo4ZXGoTTxDkcU6cMn5eDYvnzOfe6FeoqyU0RIH7b4/S4joYpU88kj
vUX/Nsi98auZZ6ddIj2hWlg2nAAMxC9oFWwVTj5A8z93JZSshimwQkcOWB9OqKS5
bS/7J0KYX5wS4EJplq7pHNweCmT2tJPKG67eqhYHkolXEzu6ptzqbC9GALsm5uFE
P053/E6HJtLxJ1UYa5a9nODlmhXKEA==
=Z6Dc
-----END PGP SIGNATURE-----

--OrzuF7qUiD0sqMOd--

