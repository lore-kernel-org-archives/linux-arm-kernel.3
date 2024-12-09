Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ4zH+lfbGAB8DP10waKLR4jgKGfr04K83x7kcsi+KE=; b=X78wOiH6Bwk//DjEHhSXaCpch7
	khKqIuK0J3Ua/stlYNlXNvkQEmqUDrRHYFb0GUDzT/EnedQEm2TX71BjSC9I3lIMBqg59xmTxaK5g
	M2yorqRKEl4iQcA7/exQlbw5irIwgYPTvg9xgcjd/+pUO+JLU3ei8H4huHZR4pfddyz+VD77cq5OK
	DaBlIafKVnannqNNwqVHxe7s66cbuZSKp0QWXIb19Soo3jOpr8fOWdG9UpNJwYYw3H6rPAYkgV0/K
	Bh0KEwjIArLaqMJ8V6uSRl/qBdNSFKMNBUmsdEnnTBbmnaQ0Lo0ogLAibJYPfHgSrRUTBxonLgjc9
	OJ+ToBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdja-00000007xbT-3UXJ;
	Mon, 09 Dec 2024 13:23:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdQc-00000007r5Y-3Axn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:03:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 708A1A4152F;
	Mon,  9 Dec 2024 13:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B12C4CEDE;
	Mon,  9 Dec 2024 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749437;
	bh=m8g6oPwlnWjX3Qgb8hSOrPq/q1rrb2RT/SnscVgYYHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8i6vWzzgB2kDFHLJZNYdBBsA+6R+iOWZ8ZmF8bO7Q5lAJZ6Pwzwd52yJLkM+7ruv
	 KH7wvoIW+FTDkSRfuRuuqmr4iZp9cdbWIk77u1FymBXuCMtHgRd47xKP8poID4Kb4E
	 199+PjV9puroMSqntp4zed1cqAKsmkP1BCNS7f/0OVLm9v+82KgTc+jb9CO0xcBkIm
	 3qir6CO71O/SOOv0pW3c5EDfHpX20ygFER4jCPr6BEB6giCAeG5+JCG6C4StVAr1z9
	 9BIuRET6PcWXYi3jeEMDBIkkg1b/ggWHfrZx9jYbeIrkdU6TwgrnpzjduJHKCXrRGC
	 7HnMta2bkMPuQ==
Date: Mon, 9 Dec 2024 13:03:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: michal.simek@amd.com, linus.walleij@linaro.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] spi: zynq-qspi: Add check for clk_enable()
Message-ID: <9de6025d-2173-4b50-aa55-65a6a89d995b@sirena.org.uk>
References: <20241207013258.3615645-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1pEAN7gwTXLPOjp4"
Content-Disposition: inline
In-Reply-To: <20241207013258.3615645-1-zmw12306@gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_050358_866472_905C111E 
X-CRM114-Status: GOOD (  10.47  )
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


--1pEAN7gwTXLPOjp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2024 at 08:32:58PM -0500, Mingwei Zheng wrote:

> -	clk_enable(qspi->refclk);
> -	clk_enable(qspi->pclk);
> +	ret = clk_enable(qspi->refclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable(qspi->pclk);
> +	if (ret)
> +		return ret;

The second check leaks the first enable.

--1pEAN7gwTXLPOjp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW6rgACgkQJNaLcl1U
h9A7Zwf9El8nVQB+8Knp7drMGS6apQGQA2eINQS1cHSx0oI03DWoPCPc2uR2MgQ5
xCcgGaOvdAWu3e1fwIaTx7AF/NrCXcgudVMIm7vLowaWk8Yu62aUSMfSWSE2yyqc
nWaSgoJR66BXbwxXPuV6epSXr7Ie847GnoRj8TiHtaXASZNHBD6hm7fqXd93RRe/
aMMRASYMgnHrQJ3Sxqv2B9pDCApVDGR3nOUJaim80VImz5YXu+SJ/hoLQpueBISz
nBm4FNc4hcz3t9kSsQtrUc6eFEkFshaiE2nTtTnO6qKjcgZxA7bF8SJ2MzKk6Ltz
Y1yQlIOyYs9/zYmzahE2bZTQhEQ9Ug==
=vgFH
-----END PGP SIGNATURE-----

--1pEAN7gwTXLPOjp4--

