Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D549C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6XGWGJuATalMapJ3ehd2QZWwZCyzu5iLtSo/UIb75o=; b=avkvKowukab1XbvC5b6Z4MhwZV
	HabNRTLu8/x553ZssETm4b4ZnCNWguEO1I6MBBf7KKdaSnkBNTL2gb2sjgeLWefk/NQ0oaSQuaz4V
	fvvQcUbp9Ga+FP4OyIE7y16n78uFqGIYS9TDntU8vaIXG30pRPmyr8efA3aSWQcU1Ui6Y9BUIRuE6
	kxAmZe2ju3EMfpOs2d7kwZEhoRaXM2zUef2ql7NrPF9K/z5npd6hhOFVHZdCsmucaMKoThBcQgoZm
	hp7P18RvK+eeceGBzL0NDsjaNt0UJlmcxHI67bV5/hr2rxG5L+PD3TbZ5mGzXGFIaKXTWREHkFjm9
	3k/JC0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuHE-00000003OXM-0b3z;
	Fri, 16 May 2025 12:35:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuDe-00000003Nn0-1ItX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A3CA629FA;
	Fri, 16 May 2025 12:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4B3C4CEE4;
	Fri, 16 May 2025 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398677;
	bh=P6XGWGJuATalMapJ3ehd2QZWwZCyzu5iLtSo/UIb75o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOFO6vsWjIVTN016AUqDm7zPSIHzt9FFUIw/H8Ec/lBLBGIHZ2WWpO0nHjPzfbuAQ
	 hE/JDMXKgQhJtvg5V5KGovTQAF8b+3gbKZse1BEXQObJVrmz/RvLaYiS6OcMgvaZBp
	 7nbwCKz9246cDnTHBPQQBwgZ/NdHAqHeLJHMDiBG1aNk3FCTuFpeShNc/Y+C1RG7D1
	 tqaTVjqXe9jnNC8L+ZOf6+TAmNNeYqXUm8EVzeq/TaUAt0ZiSufqlUggvc5mvq0jYf
	 hNJ82SZLbRn8pLrgVjDpnxK2m+kmH9Uu2ZLZLyp72oWm6sRPxjrioc6Qdn4BUBMmFC
	 bCvowjiID++uA==
Date: Fri, 16 May 2025 14:31:14 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v9 7/8] regulator: bcm590xx: Rename BCM59056-specific
 data as such
Message-ID: <aCcwEtpjpEv_FiKB@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-7-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efwBYL81B3k1M8EO"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-7-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.
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


--efwBYL81B3k1M8EO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:34PM +0200, Artur Weber wrote:
> Previously, the driver used the BCM590XX prefix for register data
> specific to the BCM59056. As we will be introducing other regulators
> to this driver as well, make the BCM59056-specific values use the
> BCM59056 prefix.

Reviewed-by: Mark Brown <broonie@kernel.org>

--efwBYL81B3k1M8EO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnMBEACgkQJNaLcl1U
h9DqmAf/bQ7IrBsLoIk0QlWpx9mGGsEhrT5JyqKADi/mNCt74Xk0lh/8GM2pOGGJ
T51tAPDKyrEkGIhBBKSv2vKvYR03KUuudSdkHgcBiLBkRCQAvwo20KTv5xSPaTwf
rORiRsSiyQlGQtVrRSHDlAAaQsfiQ7gFOf7vrCuKp5MIDfLsLWSng1L0MNkXDWho
cpz76EMmeBdvGk74HwU7aYw5GRPUrG6PR+cRVOBjK+50kHMljTI06Jh6zN3/FJLb
4oe2JC2uYjCroAc61SW8rmjle/9KWF1/BjuLpSN3GzeHo0C91OZnS1gVeVhGm6X2
tzeu8Zwe3YMPfwu3SEJf62XAkB4Vzw==
=6NbA
-----END PGP SIGNATURE-----

--efwBYL81B3k1M8EO--

