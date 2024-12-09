Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4CDE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BolGjbF7CVPUu8ed7exhP/Y03dq52iFNpD4Azzkbk70=; b=AEtNk5/y4R3yu8H3jY2MznHX55
	FR5xYfuWR67cEqiekpxMDymVGNxCH+KdikQ32rWMHtUpeJTNxiOYkWJEcjuKDkkCKBmTBA0A+DzN6
	YB3UTfz76pQJRKql/h5spm7WhKSsIe3zrEzziyruYnhI4oorpDfsSWbNY8ggcKFrdwhjPRDti8jSL
	nJcBAIxQLFEoFS79TlKWZODzjYe3aDd7kQo+3gsCOnSQJoAnpaFaNPeZfCeujEyuTjYYjVsrk5Ygk
	nbcBB9TQUL8geywrtuBQ0eoN9/tCOH1oTrhpNq3qRKV/tiwcRc+WgBkAVYbkmF1AgrMykRmkqtq95
	rw00EYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdia-00000007xHi-0XqX;
	Mon, 09 Dec 2024 13:22:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdQD-00000007qwQ-2UdN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:03:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4CD84A413EF;
	Mon,  9 Dec 2024 13:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A552C4CED1;
	Mon,  9 Dec 2024 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749412;
	bh=GOus2+hZs7XtN9YP0qY5o/FcJXf4t5wbIasocZMxuaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjihT74rmbNEnbG0iPBC1XNWour06JbfXDWnWY9OZ49miIg6eDFqTI6b0AUqz4ToW
	 hhnpMHbOVEMCSwT2uOEfVkfaQkKBm+XWBJZ6xnYF73IwCYkeSQi4+ocbQ6lOtY0und
	 uIQNH313bQRpAN2yMAShNx8VFkBlQckJUuzbWOgGVhHVULjdT7exDW00BE69m+ii41
	 I4YotO7viSF0NVb7FwWMSYSafD4V/MFB16+7Zdz6xHuLMW9tofd7ND5XhxiQ2lYVSZ
	 vt0qqdjJYR0dtkxvYbvKgg46356tnL+hYqO6NwLBHTEeAP3a/Th31GEdFuq+UMPBmW
	 qTHtbylFOMSyQ==
Date: Mon, 9 Dec 2024 13:03:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: michal.simek@amd.com, linus.walleij@linaro.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] spi: zynq-qspi: Add check for clk_enable()
Message-ID: <8332ff0f-5727-4a6c-b40b-f6da7fd1c0f6@sirena.org.uk>
References: <20241207014727.3674388-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gb01w0EsSRULSS0k"
Content-Disposition: inline
In-Reply-To: <20241207014727.3674388-1-zmw12306@gmail.com>
X-Cookie: Lensmen eat Jedi for breakfast.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_050333_695908_9E15F408 
X-CRM114-Status: GOOD (  10.22  )
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


--gb01w0EsSRULSS0k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 06, 2024 at 08:47:27PM -0500, Mingwei Zheng wrote:

> -	clk_enable(qspi->refclk);
> -	clk_enable(qspi->pclk);
> +	ret = clk_enable(qspi->refclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_enable(qspi->pclk);
> +	if (ret)
> +		return ret;

This second check leaks the first enable that was done.

--gb01w0EsSRULSS0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdW6p8ACgkQJNaLcl1U
h9CVTQf+ILoXRvv95joxTJinGaz8opCOy0BMXfL5lSrk1SIDsmArV0bwjDw+TQc4
BpjRhgwuu8QrUHUQuHc7UEq8AjFeuUvzTee6RIFoy89LPvYXBbat3rWkSzRvx+3V
DXt1SEjxRcyvY/KMgvqtJEqw11vEbaPYLlMdqVjTjairhDOXK/oXjyuce1UaOZcD
O1KOB9UXE2+TZp6892afhbkmnwvH0ylskpopHPeK+0dqfvYV+cPnVajIEZyH4y88
amEYaG9hOfecLDUIDg6dZwgj1rE4HaNKYeGiLp/KHeT1oRZz+KuVkMSp9aj5ET0t
/qazrC6B/OjvRMfF3+JiVgk0+8/7hw==
=V+Hb
-----END PGP SIGNATURE-----

--gb01w0EsSRULSS0k--

