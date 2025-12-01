Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F56D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH+36+gwTX7K7RZ1ONd7wWkNQq5H1t9rLEXNKeDiZvc=; b=Pnz7r9NS1+TKiDcC/b441r6LuH
	ADjoYNLupMRgU8kSa1DrsNaGVPBcYDs1xJ81HgZTGaJlbsnYbslS8tGC427TofQZmiJn/zoA6A9SC
	bZBpzrnqyqMsb08hyW3H+IlUyhAiGcltxZoHzg9nfbYfwzSMCZ5MbOeelxrQkDl+YhBYKggFqgYoN
	CR3CsRdhLxM7qZ1dO1FgjnvhEJ6jWrE4o6h3aQvBeEj38IJvgF4I2a0ztB0QtAn8agWikQLvYO60F
	v/QSz96Uh8qm9SHvPjvDzAdvvjFvTk7DoqpnyGwnQlXS723aSRr6YPmg4j0ODEj3GGkIUD9dLUbv8
	5UnD3zqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ40s-00000003ylg-1QL3;
	Mon, 01 Dec 2025 13:32:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3cF-00000003g0b-1jr5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 13:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 46BFC4184C;
	Mon,  1 Dec 2025 13:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51F8C116D0;
	Mon,  1 Dec 2025 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764594414;
	bh=1+5RnnNN7CvGAZVMoxwh5pYU45Fm/I253wz8XwsbOtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRFBCtcqh1cjkNQYZHNPwVop7Aj8C/KbYyOBNkNWRJh4HC/PDi1ylyfuWgN1+lPlA
	 LFX5dQzZ9URVl8nCFVIAQzeUR29qeK6AiIttrno7nlceR5sSD6vSXbAfz5aowFEbw5
	 ZeVYtjEx6DR4oY/z3zeOgWBz4dNJalcCMJGD/iO4vEdI+uTyGzrDNzkunbpqxBJ750
	 RGOhVe7jY/PArcSRmzQtqJAbj/N1a4vdgnxv45PrjynZH0YqZ4VBlP87fx5Dd4Hmub
	 vtQewJWPpw9HUdyipgUU2ksv2IGASAUob3dy7IHm5eq/JJTNm2Hiphnx3CTDpWMVEs
	 s57vwhctODVng==
Date: Mon, 1 Dec 2025 13:06:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, a-dutta@ti.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH] spi: cadence-quadspi: Fix cqspi_probe() error handling
 for runtime pm
Message-ID: <e7ccef20-a490-45cf-9e55-16c9b2e01f44@sirena.org.uk>
References: <20251119152545.2591651-1-s-vadapalli@ti.com>
 <20251201072844.GA6785@francesco-nb>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XLS+8YH9SW5fPxZ/"
Content-Disposition: inline
In-Reply-To: <20251201072844.GA6785@francesco-nb>
X-Cookie: Mene, mene, tekel, upharsen.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050655_474738_6FD56E69 
X-CRM114-Status: GOOD (  12.48  )
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


--XLS+8YH9SW5fPxZ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 01, 2025 at 08:28:44AM +0100, Francesco Dolcini wrote:
> On Wed, Nov 19, 2025 at 08:53:53PM +0530, Siddharth Vadapalli wrote:

> > Commit f1eb4e792bb1 ("spi: spi-cadence-quadspi: Enable pm runtime earlier
> > to avoid imbalance") relocated code but missed updating the error handling
> > path associated with it.

> Our CI just hit this WARNING with 6.18 kernel, on verdin-am62. To me it's a
> regression from v6.18, specifically from spi-fix-v6.18-rc7, we did not
> had any such WARNING with the master build we did run last Friday.

Does this fix the issues you're seeing:

    https://lore.kernel.org/r/20251130091251.12120-1-alitariq45892@gmail.com

--XLS+8YH9SW5fPxZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmktkugACgkQJNaLcl1U
h9AiQQgAg/iMo3RtO0PDTE/HmwfQLuFLjH344aHIKJApkDXpOLkev3NcjJ4X3C1k
+WS4NdzwKH3sY6/ufWwavk0PFbzIWowuKaAh4LGUKJaV8JZdpeFnd2JegHdvqfsi
I1V2IoTVEwW9oJ/dEjhm3ewt2mCKKz0xWQ9w8rOeF1LItdlnWMENeGXyhqjK8N0u
pLK6o2aHhMaRe/W9HGZjEMETifpVpXg3wEdLVSUfO1JGwUbDAywHFK+kg00ASyaj
0PdmqjAARd+mRAioLbWFEKNboDPgRtU5ZaBEr9fKrzWgQgffPTKZV6FkLvGXa0ch
dOW+epKCXo4vF+1INSgvNm4Rwh6log==
=ls81
-----END PGP SIGNATURE-----

--XLS+8YH9SW5fPxZ/--

