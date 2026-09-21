Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C504C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfNFnkRxeRIfSVC8rvgsN9btpGP8I/3Z780moERFccM=; b=ACoX2Yz1WVZGtIxxo+YMk0y/mr
	DqxIK3zkoKfQch1m+7WYv9jL4xv5h1w06m2ez+9BjNHOPqEom6riKpIeJGUXB4Png5plh2iwOjAQn
	cZ3MT068p/J8qsN1KtEFCxBeBRlmtkMGF+8K2kcVGhU80pKjnnGHHj5nbbVuKqxRDgjxgY/+soH8U
	lgOu5BwaNyt505JOhtjSny4Y67jhOf6iyJJs2C9noSd+IBeWzHf/9Sv2xTPZ1cPX51ZfR4D//6B4G
	5tQ5zXe0HKkxfFj3RAoP8mzjttLTYN1xJMOhQjpCRlgHhNegf0/iPm1o6rNEKAvEsCeo4vrMIdrT4
	hP9veZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7P-00000002Pfe-1ELe;
	Mon, 21 Sep 2026 14:35:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f7O-00000002PfK-16Vp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C1A8A436FD;
	Mon, 21 Sep 2026 14:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 17B901F000FF;
	Mon, 21 Sep 2026 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790001341;
	bh=FfNFnkRxeRIfSVC8rvgsN9btpGP8I/3Z780moERFccM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=odFG9EuLtyr9lu2Ecfa7snIZhoyKG7wH7smFOyUudLLIw6C+fzlUa1gH/uJe0Izxa
	 Z1jUzBBiPGYH7eBzTDep0wQ608CWB5qWs44NQFnzcz8GsXqvtGl++oByaaVbURR9hr
	 cpDZqhouYE2YfxpzAefXzuB+eXi3vySVgIDy4MNPv2WBNvkBEIdkUYNpOdHwj6UJuT
	 Q/ylaMJmxDFZD+gV8zvrR0osskSM++G7ju+7c0lsJkI/RCq6h4FZuJ+A4c0e5N3Bz7
	 XIxig9QZmqEf5aHKvZ36DLQL+XMiPNtWtddQpX6gMwY3sBcqUwAU85JEqmw1+Wxgim
	 U7WnRLZkt+SeA==
Date: Mon, 21 Sep 2026 16:35:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
Message-ID: <arFAj7yU2x42-76G@monoceros>
References: <20260921-axiado-ax3000-pwm-v5-0-202aad28e129@axiado.com>
 <20260921-axiado-ax3000-pwm-v5-1-202aad28e129@axiado.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mkruqjy2cimrsduu"
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-v5-1-202aad28e129@axiado.com>
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


--mkruqjy2cimrsduu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 1/2] dt-bindings: pwm: add Axiado AX3000 PWM
MIME-Version: 1.0

Hello Petar,

On Mon, Sep 21, 2026 at 12:21:30AM -0700, Petar Stepanovic wrote:
> +  "#pwm-cells":
> +    const: 2

Can you please make this 3?

Best regards
Uwe

--mkruqjy2cimrsduu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqxQLcACgkQj4D7WH0S
/k5kdQf+OXV22WZQ9pfauGcLp09q+oshtLYpLawSeyzm/h7HCjYisBtBbLTVFvR1
5KDGUP2CYL2HDVgdj3NypW+GEGLFsF9IN+wAIedUWQY6hWItGfdGJt42Zy5kYYRp
LpOFredIHH0OVVkxnit1XyTYC3htW1Q+DwqcqlwFHrx4zuv/etW6vWiW5Dk9za4t
JOJRoUA3sUeCXRabkWUWAST++NqKBvvgrRNJA3ys85ocQ7eBL1GQkCcn6YfJ7Af2
IuGZXl+Ys9bcp7rgQIFJ1JYj8B6JXRFXVOgUMWiGG/kcbVdUgkZWAiuQ1io0yUo2
We7S9r/5xHDPkvsTxkp68luZYviu4g==
=od5S
-----END PGP SIGNATURE-----

--mkruqjy2cimrsduu--

