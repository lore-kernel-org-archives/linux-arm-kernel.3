Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C14C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 13:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYUSYH450JNTp4taEb7ZjWa0fzkJkCPtIuuhHHkHa0M=; b=rbigAsdx+m+LXOto1/EkhMU3aa
	MAWIGffZr/xfQCQDsZ0jOSKmKLS9WnmwEWoB4Gfl8om97aqDAEVnAwyZ+mwzVDk6miuDpiQbHPerN
	xCMMM2sgrA+on/hJRu1UTGcTVohpe2GfTX+xUw5yZL7fkbhz8WOC7PaScBzbiHItrzJMQHF1+muvy
	CrkseTUk5vPlY5wRNiEDUOPIs1jpIM+G+gQVAJ+qWKFjX5xA8/uW9tN7qhiZOszVUt32tbGQ9UBRG
	31bSBKL0KrpT+iK37SIcNsWGjcXK0xa4qYKIrWTJikbm4V21UEbWruKwhoT7Qr/iisXvE9SgaNJIR
	OgXLLqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXlb-0000000EKaI-2HMI;
	Fri, 07 Mar 2025 13:29:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXgP-0000000EJhe-2RbP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 13:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BEA85C57E3;
	Fri,  7 Mar 2025 13:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340D7C4CED1;
	Fri,  7 Mar 2025 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741353848;
	bh=9OCou/LxbyRarhdBQeea7UlQ71nAsQw9C80k68D611o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfuiCWPm2uKw/bA0VZBhF8DvMN4wC3kmsCCSkVg3wQWJ5U7R+GXJRPSD1cOCy5zQu
	 F0tv3C5Or9FtqrXicOro/2LlUsst/NGLfQlses9yin2wxMXfg61LWcx+L1tVWyZg+F
	 KYTF+LiktZxrE2nYFfE/aPFyxVbGp9V7K/wHEyUOZCNoJXRZZ4hxQHICr1fLowvAFR
	 arY7ZGqbHCcAS8i8srEL3Uvn1n+q7pnB4ItpQ+5S9baEFZfC1vzO01fosU9R5WZT94
	 KC/ePncWmhWoe2bcsomh0P5zxsMOYFhpaRKRFHHJDZs+lUTJtp7PCJX8vGRS/njkvT
	 Q77DT+ikKhvzw==
Date: Fri, 7 Mar 2025 13:24:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Cc: Charles Han <hanchunchao@inspur.com>, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: stm32: Fix a NULL vs IS_ERR() bug
Message-ID: <Z8rzc8suhKPr5SHV@finisterre.sirena.org.uk>
References: <20250307032530.116837-1-hanchunchao@inspur.com>
 <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKhienEiuUGd3VD1"
Content-Disposition: inline
In-Reply-To: <dfd831ec-e004-4132-94f0-3bdc755907cd@foss.st.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_052409_662045_C6424A2F 
X-CRM114-Status: GOOD (  12.21  )
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


--fKhienEiuUGd3VD1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 09:59:42AM +0100, Patrice CHOTARD wrote:
> On 3/7/25 04:25, Charles Han wrote:

> > The devm_ioremap() function doesn't return error pointers, it may
> > returns NULL.  Update the error checking to match.

> No need to copy/paste other contributor's patch by just swapping some=20
> words in title/commit message.

> This fix has already sent By Dan Carpenter and merged.

No idea if it applies here or not but since a lot of Dan's work is based
on static checker results it's quite common to see duplicates of his
patches when someone else runs the same or similar checkers - I think
all the people running these checkers are aware this happens but often
figure it's easier to send the duplicates than to check -next.

--fKhienEiuUGd3VD1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfK83AACgkQJNaLcl1U
h9C6DAf/SppwraYcs3hm+tA8JgynoM6XNXFnzcupDCDn8T1COBVOwH2vXjv1IxaL
NtNktXiNdmlS4s1gVJK/xhlNTf24sa+SCj4AiRZd7gVhM/3ajKo/ONnUzTnBsmhi
QdzADx/vYjhHj1kLjG9srDIs5nDtP1lCfcUimCxhu57dZHzEiT4yDSnrQfYZNKva
lvKvTckBdBrDfDmzSAOV9BHmHOZdeeGsmbjpHXXaao2Q5VhpdYO+HG6lds7TzPWw
KJJROXJwjT8hsdstk/n7PyT5C183z/8l9D9Mj0qPqF4Dzd0LfdMig3eTJz/E2Lvd
Okl9rsg7Lkrf0YNo52PA0NMbLNgFKg==
=YO1O
-----END PGP SIGNATURE-----

--fKhienEiuUGd3VD1--

