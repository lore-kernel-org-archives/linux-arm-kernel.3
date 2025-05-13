Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4548C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13mKWnaxT5MXOzb611tnGX4qcvA1eYL6YYsoXT+cCMg=; b=qWGV5Ow9CkBfhI7zqhSPepOEng
	89Hb0/Lf5hXgnkce5HVHarlhgdshI6oOm5TS22lPOTugtxWAxBfFMPpaQD1jcA03MAeodecG9x5FK
	OWOzgUa4zZR7XNBEY+4hL0jxgTa/cknEix8cXsp6q2cX1zKxsb+K+h0NX2zzJzl3nqrfOow16DUNz
	Wfjm4jt4o2fom8LRJwKxvSilwwsu6JuzNvwSrZU4ect2xQaclayyGTxMaQKeqQT9dMEU4cWk2+RD3
	fBwQeFe2eRPI0BOX6MS33cDA9wjIatPwMq2nmVvZpFjONWlS7b8H9UKxt2urjCpmE+QAPRKRr1ZPV
	7pCCmgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs9z-0000000CsXN-2jAF;
	Tue, 13 May 2025 16:07:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs6L-0000000Cs9A-07zJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D862AA4D9D2;
	Tue, 13 May 2025 16:03:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CE6C4CEE4;
	Tue, 13 May 2025 16:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747152207;
	bh=13mKWnaxT5MXOzb611tnGX4qcvA1eYL6YYsoXT+cCMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAt/MNrTxn0iThyD5AdDAea/tfvEikzi7gLLDWNg+JTnRnYZv9BL8rnTb4Rb+BXIg
	 hOD6S/ILAkSW+iVMOcn5vD+dr416w/erglIQ6cWTHBPIzFobTUM5iho+39yV+bxjn0
	 hE+gy92whnf4qQoYbsmXpCDJDzShjiyeNqlOu3rZqSVP84MHHjhUKmy7SfCfWbdH5k
	 dRXxRNIh8/D0VBDHDezRgX7z1k0JBiDPe6PURk9FNiYmADV3Qr3+68cPIPL4Cc7zLh
	 P3YWAJKG67QJfnHhZBpidVKLDh43rQURIx4J1iSn5R9ObjA8DgoscyEEwBGcPe1baU
	 pcPsSpGyYXXZg==
Date: Tue, 13 May 2025 18:03:21 +0200
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
Message-ID: <aCNtSVldu1yEO5rE@finisterre.sirena.org.uk>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
 <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
 <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F0dhLWNHSbTNzAtS"
Content-Disposition: inline
In-Reply-To: <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_090329_138457_D91FF694 
X-CRM114-Status: GOOD (  12.34  )
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


--F0dhLWNHSbTNzAtS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 13, 2025 at 11:47:16AM +0200, Patrice CHOTARD wrote:
> On 5/12/25 14:11, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> This patch has been submitted on top of reset tag reset-for-v6.16
> due to dependency with new reset API devm_reset_control_array_get_exclusive_released().

> How do you want to proceed ? Philipp can take it on its reset tree ?

There was no mention about the dependency in the patch, please resend
with information about this tag included.

--F0dhLWNHSbTNzAtS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgjbUYACgkQJNaLcl1U
h9Cw0Af9GroN6ci/01CzKHevwNZB5THla+r860LWr9mzjOxwBHeDUf3Juey+6Pny
iDYe0dNqRLZ1xyoUqEjs1z/4ATnwJuWPLwju6P77kc/OGmTCL9rV1Fr1W6vVixBl
Fxqd0hwYGI42GoMREKv4F7bkFn2zDKy0/MKkch5/ZHORnVduiT3RAjeKmMJSbNsN
37wzzu+RQ8Dhhabqi4RxMwZz8mwvP+WuzVhFKTcTJoN0zUOPs+DZLuVECQoTprzk
28lFBw+xOzUUKKHKB3nu0c9yogV4a10VyaLUAkjFUqikHYz4sqn/ZP/5j1xqpreI
DQKwo74c3UZRaWjJ0sCEX4f4eGIVcQ==
=D6uF
-----END PGP SIGNATURE-----

--F0dhLWNHSbTNzAtS--

