Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A40D1BDF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwqcewzHupwjnvzMtZCoU8nz1w4yj2a+d4NluLVZaRk=; b=lJYUI3SJmDKqWPyQEN/3upKBlf
	yiK20UqXWWKJS6McxnIKW7pPXf1OqkEobhZVqimtR84dL1unqwu6JSy/OM0ZnSDQIEoiZ26LlNgEz
	cpoX1Lwn8HBAOpex7G7z5eBKwgfQXq/i+AYmcT/vsVxegVH0rnxGmwFyankCKGwU974lrkuqX4InS
	wrEmlhwTtacJKfNblbmJPhTW1eMozcljBbWIW2Xq/yRgNZeC5FG2TMlZdcgUUIpLI9Wu9A3eHiq6V
	Z8niaBJuTAR1jIpFuXPkSz2Vlg3vEmje4oF67ayA5crP77ld9pHY8VXPyKrFoclP+z5BOSpuFTfAB
	JBL+rwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84Dr-0000000F54Y-45Ji;
	Mon, 04 Nov 2024 21:02:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84C4-0000000F4fB-2NY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 21:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D5095C5574;
	Mon,  4 Nov 2024 21:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC61C4CECE;
	Mon,  4 Nov 2024 21:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730754059;
	bh=ZwqcewzHupwjnvzMtZCoU8nz1w4yj2a+d4NluLVZaRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojUt+swGQC2u860PKg99GnFJSis8f9vsn705qfEAUUUFJRNTMuaANEmYJ28+1w7qk
	 FNv/mIO/SuXCCjtUWopqbhNAb+S4pC0MIJSct3mFS+Dfz+PKoTxOKAaeFSTTYiN6+A
	 fFwJRGmO69mJBbMjNxE5fiYTWifgdGra5OWC38ugD3AKIOp40EBDJZa4XmaDqUszcq
	 IDfVUjGomhm0EQ5AuIuJ1OaP7UO1dJnpd+l4mJgsPoAH89rFBKVSy7PPGSDhjb5Vx+
	 VRT2AqluSoS0b1ZAfbfzMKh+dIb2+hFKEdomSubq/RvsIPj4VxbugGz1USkIHGfR01
	 5AHsA/foYCeaQ==
Date: Mon, 4 Nov 2024 21:00:55 +0000
From: Mark Brown <broonie@kernel.org>
To: kernelci-results@groups.io, denys.f@collabora.com
Cc: will@kernel.org, "kernelci.org bot" <bot@kernelci.org>,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	kernel-build-reports@lists.linaro.org
Subject: Re: arm64/for-kernelci baseline: 14 runs, 4 regressions
 (v6.12-rc5-158-g5283dc78f4da)
Message-ID: <9a899281-dea2-44b7-b4f3-1a0b1e10f1b3@sirena.org.uk>
References: <67254346.170a0220.36a303.e8c0@mx.google.com>
 <20241104105548.GA11039@willie-the-truck>
 <a7e8a07cafbb1bcd215a7e9cc30351f6e028ee38.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+13vMPRzfz8U7SaH"
Content-Disposition: inline
In-Reply-To: <a7e8a07cafbb1bcd215a7e9cc30351f6e028ee38.camel@collabora.com>
X-Cookie: The meek are contesting the will.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_130100_669850_CEEB19B3 
X-CRM114-Status: GOOD (  13.28  )
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


--+13vMPRzfz8U7SaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 04, 2024 at 09:31:22PM +0200, Denys Fedoryshchenko wrote:
> On Mon, 2024-11-04 at 10:55 +0000, Will Deacon via groups.io wrote:

> > Any chance of getting "lab-broonie" onto a version of QEMU containing
> > [1]?

> Yes, i opened issue
> https://github.com/kernelci/kernelci-core/issues/2733
> We will try to add devices this week, and if they get tested ok, i will
> push to production next week monday.

Just to clarify for Will this is a KernelCI side thing - the qemu used
for the jobs comes from a container specified by the KernelCI jobs.

--+13vMPRzfz8U7SaH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcpNgYACgkQJNaLcl1U
h9B/DAf+Pxa3r5V7f2RgIashVaplAMn+5PKH9L76mEggr51GHmUSua+ytd7yUvA4
HmKvT5l6W/udprxQY2lTUixeGgY5+yOg5vi/4MTXK2iiaGVQJ+R5gCCMrAR7eOf5
0kASKqFlNs+TPQdDUmVZsNYjoG1bjs4EP8Kci+x/GuJDtMTKtlTz/bSsYwTGZIfR
aOJ6kbFR5ZLGtsllcfsfzk7Q66EVBsTzt5pZX4vq0tVKepDr7LuxRWpdmGUBPir7
ZVlNNHSy4lPUW0IYMhQstQqsUtrl8qvWF2V4VYFP3iQFRZWWZS8ixD5znUYqIpxR
/iCEe2mwCL5i0JuhT75ioQIjY9HqVA==
=NE4F
-----END PGP SIGNATURE-----

--+13vMPRzfz8U7SaH--

