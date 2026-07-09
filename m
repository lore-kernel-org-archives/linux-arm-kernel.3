Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FCCC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fMzGtFG8sajsnLHWl1lHh8gsBbPiUDwZ61eEP13vpu8=; b=YdWwRRTnsSdUQVKUHN+KzT3Fq8
	1zBY2s365ikZJ4d749jF/R6Mk/UKacVhIZToYnQbAOH8a53LrAst8B+REmUEPkw0cAuIF3qEKgpLU
	whkeodEfOtgrS+e2lPXoDgs8C7i6JMmY63vFUkMXIJl/pn3PU8ewKW/xamHSN7YzmFTMzwrLJ2kBZ
	bZpuk7Fq4rWP+auqUZM7FoZtJ0H2jOkasvQOif9DH/cV8Wj0sW36HqAAiVCHHUdH7HixMG7GUPZYj
	w570PIUvG0J62fVoYQqH2BSkLxeRY/RL9qRux9lUPRSbn4A1qZZFWTOsDbQO9Ob+dLsLUsnfWGclN
	HK2ARUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whst9-00000003A1A-0h8i;
	Thu, 09 Jul 2026 17:50:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whst8-00000003A0y-2Jxs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:50:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 042EE600C3;
	Thu,  9 Jul 2026 17:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF22A1F000E9;
	Thu,  9 Jul 2026 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619417;
	bh=fMzGtFG8sajsnLHWl1lHh8gsBbPiUDwZ61eEP13vpu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NB+wtT9JQ0SHManTBvYWYMb9t79Eo6NCEtla19MxdwR9FHjw+RetxZzOZxRpU5jqt
	 cueoK1QrH9M9tA1LsFAUMEQEzdce0COUZ2gXu5H9o+sYYD5HYWLo93QHDjKVL6TYxO
	 7STj84HaJdGsMUst61aNBpj8Hb8MnfNNhvuPEYbi8hwi8fdCwT9ME5GKHcQ7yAM8uX
	 dV50Iav5nkV4mLISbxojRk1CHxIyHf4YHj5OuZNUrsRV4KJMcB47O0qN3/bqeTyRa1
	 sBkzBQueNdypLRdkz5ysKziu0db8aFRCkQ/71YFPjxlU0lqviJGL4KweSee1aPRX0S
	 5VRsh7Bev2eSQ==
Date: Thu, 9 Jul 2026 18:50:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: arm: apple: Add M3 Pro/Max/Ultra
 devices (T603x)
Message-ID: <20260709-unflawed-humorist-918325879ab6@spud>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-1-55b305833123@jannau.net>
 <20260709-impeding-tingling-c5858eb0191d@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VXR0uJe6BRvVu9jb"
Content-Disposition: inline
In-Reply-To: <20260709-impeding-tingling-c5858eb0191d@spud>
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

--VXR0uJe6BRvVu9jb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 06:47:40PM +0100, Conor Dooley wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable


Actually, sashiko complaint looks valid here?

--VXR0uJe6BRvVu9jb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/fUwAKCRB4tDGHoIJi
0h6jAQCRkdoCjcZVRfdOhVVCPGjDz9q56/rC1wfgPdgTHwlLcgD9Fp64DGtobS1L
8mZoKmKNHw0fTD2YNcrtlBHM/Ag4wQ4=
=rCUn
-----END PGP SIGNATURE-----

--VXR0uJe6BRvVu9jb--

