Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59849D32D9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KafC/eDyNVTJU1iCMTzvQ3jnAeQjpNxDlQKHWT2S0V8=; b=Czghi44sepZvSPvKtU3CDwd0Xd
	gE+AgcNup5z/FDvgiRbengOUlY6kNSdYslwjBcfmgX5SEvJpcY+7BHSRoZZWyYQJyuzDwz1krv4z3
	TL3eK6qxgGJMA4tO9LZjEoJcqNKOkQrKswl9Ew4M/wibzWHjIckV1RBu8+a67Hqtg5BwbX45KFcNj
	D8OA24h6dIfsT2tc/KRJJ3S1ZoPDE3nGKKUrnHlctN3yAAgMJOUvBRiYCxH/r0kMY+xIwLbFqf6fK
	gncI5WtuIWNBxRQoXw+wDkIZVdfZVHPoRSteuU/OX/ZcF2uvZZYYRV4AU2/OyJNh/yAzNSVI3IAP+
	GrN99Yjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXLw-00000009cov-2PXP;
	Fri, 05 Dec 2025 15:04:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXLu-00000009coa-1hGF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 15:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABCDD444B6;
	Fri,  5 Dec 2025 15:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2394EC16AAE;
	Fri,  5 Dec 2025 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764947049;
	bh=fWc8yd+0bDzCw3qQ5ygXRxbKCfMlTU1HktkdP0IaG3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyjA9VzuPNg3rClJ43uxFcvXJh26Dujge/ihCyQA1zwNphKcpff7bqSLelH1EEjUv
	 3zlq3QrL1y7Wn/obZsDzR6S50GJ54N+BqFL82ruzjq7Iv/XkQNQMUGS1iISzK6FSLv
	 qxarYcrhx+snd8r101zVrXWYohoANbdxOBBgLdiruzTFOpDXp23WpNLa32Uunt95mc
	 SAWwrauV1m0jvZZ80kHKmH2VmLVDNmKhH+T6JMBKTJFKHRHI6eSbyV0hiZQQ8pQaQi
	 N7wXrzfAG5E6VwdsnkCNThKL6aT0rqEhPoC3WvcZJLlCoHU/XbQd62c9uBQMHHzixe
	 CguBMWGrY42Tw==
Date: Fri, 5 Dec 2025 15:04:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] spi: stm32-ospi: Optimize FIFO accesses using u16 or
 u32
Message-ID: <3c621482-ba56-4136-aabb-f7614568ecab@sirena.org.uk>
References: <20251205-upstream_qspi_ospi_updates-v1-0-7e6c8b9f5141@foss.st.com>
 <20251205-upstream_qspi_ospi_updates-v1-2-7e6c8b9f5141@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7csFwg/9ZLrMWD7v"
Content-Disposition: inline
In-Reply-To: <20251205-upstream_qspi_ospi_updates-v1-2-7e6c8b9f5141@foss.st.com>
X-Cookie: My EARS are GONE!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_070410_485173_F7FFE3F5 
X-CRM114-Status: UNSURE (   8.24  )
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


--7csFwg/9ZLrMWD7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 05, 2025 at 10:04:52AM +0100, Patrice Chotard wrote:

>            before        after   gain
> Read :  5693 KiB/s  21139 KiB/s   371%
> Write:   765 KiB/s    910 KiB/s    19%

Nice!

--7csFwg/9ZLrMWD7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmky9GQACgkQJNaLcl1U
h9CS8Af/T+OIuHNNRgwiBToaS3fETPsSl9l1OaArD+o69QCQXSl2pkKOjHkQH4dx
bjtZv6/8//pr0OA0iy6ByRrQFs0x2wFernGEbHHTlrvaexOdYDXeurN+SEcC+wvj
WVYVhSireSHS0yOxmBzpkAQhAH8dSKnVc7/uXwXXNJoYtlT/7PM1vn6P+qaW4AXJ
jTsIwRNU6qXFfV7kePUnZ2bybXN9DnfvcOJRTIqsH+cOEGC049z+7aqEtfb4lOW/
W5yOFBv66JXdnsydbCNAJoGDeTCaEPCtnhf7P5yzYWJN5vBYqehzfWuqVZ57p9j1
lVgq/I2sNCFqD1CyzIsyXNZ4SiOLAw==
=HYqh
-----END PGP SIGNATURE-----

--7csFwg/9ZLrMWD7v--

