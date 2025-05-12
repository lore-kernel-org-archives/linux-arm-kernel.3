Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC1BC3ABCD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIzn1mPnTSPLZjpB6j7XRj/AFW6cs5zlnmrS1IKRsKI=; b=Z+nHFddA4cwmP6Vt/JxZw1mGt8
	033fNFWJ/5k6SKHiyMVVYOHIkEMaP231M7McYKsiHZJSpNlYlqOcaYhI1lFa1cPqA8whqNPVOhwf6
	PA5Hnqdxwbw+FqcZ44yjpyQx1ZWxAy12odk4+VvcDE2nJZ9TJNnOqxrd0PF/2cW0hox1sNKevPrXe
	Np0iuR4iu2z/pACCsM7QOVqngvItk1agTCTRjes64ZYo1sXJPkSi9w/TMVD3wC/l0WXyg/zTFvXqv
	V1SfsJS03P4UH+VcpXy3mgh297MQs/icwowkDhud6hA7vxVfcGNWBOy7luhSvuZhjT1MVi8ceVivG
	fqEf0uMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESZg-00000009QpY-10GQ;
	Mon, 12 May 2025 12:48:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uES0Y-00000009Luf-3Kza
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 12:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23F9F5C6424;
	Mon, 12 May 2025 12:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AADC4CEE7;
	Mon, 12 May 2025 12:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747051904;
	bh=OIzn1mPnTSPLZjpB6j7XRj/AFW6cs5zlnmrS1IKRsKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXQUd8a9pbhwP2kR2m3LdSR8Eo636ZyBTl977P0+jodT/APhlh++OfPy+q40Zr++q
	 A7HeU+/IxQuwBLqbj8uWkmNS5STfJoxMZy6Gt4P5yV9f/+4JSQSj7YAUyMGxyIpmOM
	 z+yb50PYdw1v7QJbwiAOM0urByyiZz0EOFAQLtHwVU9CIxWQTn/DED+7bg3WfY7Bqa
	 Q2usjiip4zWsnUrdnTKmwrOzpGtNcoWNNz9ghRBS8eFXsE9ZPF/YbUUV7UZuRJpx70
	 shZFJ3t/znt3ob3UFGdyu9MHLIBsQww892qr9CHVX/n9sHP2MhFslkJE1iS6cxs3eN
	 sMXp/ydGhdgPA==
Date: Mon, 12 May 2025 21:11:40 +0900
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
Message-ID: <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Up6TTTXwV3c9rzJk"
Content-Disposition: inline
In-Reply-To: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_051146_893892_D335860F 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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


--Up6TTTXwV3c9rzJk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 12, 2025 at 09:01:04AM +0200, Patrice Chotard wrote:
> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
> acquire/release mechanism which ensure exclusive reset usage.

This doesn't apply against current code, please check and resend.

--Up6TTTXwV3c9rzJk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgh5XsACgkQJNaLcl1U
h9CakQf+Lpn5673L+a+Kd8BDCJp+K0LSEk6Gm4jTSeW4OQokDsRA9bfIlOjLdgzV
ORMqH5XETEjmrOXd9mXLWBQKn0v6qd0oRNx4NS47Guka1G1cWRgZN07vPz6TtS/j
yIPNVBaSJdcbTt+vq8Hi39KyW1v6+Bfltd83BwLFfF6VZSlr1JG5wJ9QLOfYBYx3
eZ+/8Uq9O0ZKBmoLOT32s0VqfoT82snwGrh4GPKJ52cFJ4UT8PQ2ijxB82pQK6Ni
9W2yxwEqiIyRF7V5UT1SLGH3mTkQXxf+ehJY/s8wgdVv4FdxJ/qcTWFkXBmMm4DS
DZoG5cAUB75NzruPspH29ac7txNyXw==
=OXiw
-----END PGP SIGNATURE-----

--Up6TTTXwV3c9rzJk--

