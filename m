Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD19C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzq9cjij4GIzRVYAuct2Aa41rIPeUjx9wIWVvoCUrEA=; b=AeQkXAEGqqWe9pYqm5lTuURPKD
	WtFYMbY8ad0msZBO3FzHEJ1mI5F4WoRW71iBzF+lK51dMS0ldBPIi8UXrrKyQABmtmpuF3P8azpUu
	q8NBTB2fWmQguqtEMzdO38GVsVClEJZJGx6nOxpw2MNiIU9PisM5Ci+VJ6V/01CG86mHC/5zLvvGX
	s8T7D7q58YHBgLKvX1F1gxzpAJBycgUhnlYu4QxP/vl6eUmjenkZ7S8tIbIV6rhuEBm8Nuuc+02A9
	wAqJ9QqGluJIUJcmtKnlJkgsUvRIwVmQvQqFS0+SW8+6HSMzx0qYpFim0a9iyWLw0PIwyHG9ByBVT
	S+qEkD8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N9g-00000008PsQ-46Tr;
	Wed, 23 Sep 2026 13:37:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N9f-00000008Ps1-0tvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F3DA40113;
	Wed, 23 Sep 2026 13:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2802D1F000FF;
	Wed, 23 Sep 2026 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170618;
	bh=rzq9cjij4GIzRVYAuct2Aa41rIPeUjx9wIWVvoCUrEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PqRyZBdjcX7hsiRuqmx4dSci++UIUGlnUTyow5F6WM7Xiz3xDICVvoNbcYVRhxuEb
	 mUgooIE8+7e6Ih6fl4XwIsvrV5Dbqv07xqce+C6fp9H+zKJJTYzupyZBoH4rEsERlC
	 7nOO5tSJ0CSPioiqxnt12Cgck7Qyji5wYKJcVK4EbQaf9HMxN7CIUoFxX6Xc6wwuQI
	 smW7o1cP18L39e57pXWgRBeQmOdJChp6Y4toGATzRTfonn5iESRmrbFZRl7wjtbNyH
	 Wts5aKQmZU8BzQ55ZBtN1naWcrcZ/Ebd+aciRsPp5yKXQZimNKcuBbuHzmEcVtHRt7
	 R95z080cvreyA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 637081AC573B; Wed, 23 Sep 2026 14:36:54 +0100 (BST)
Date: Wed, 23 Sep 2026 15:36:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Ginger Li <ginger.jzllee@gmail.com>
Cc: claudiu.beznea@tuxon.dev, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix a deadlock with the interrupt
 handler
Message-ID: <arPV9kcq3hEv4F1v@sirena.co.uk>
References: <20260923084401.65336-1-ginger.jzllee@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TQ33EsQTOZpAHTLV"
Content-Disposition: inline
In-Reply-To: <20260923084401.65336-1-ginger.jzllee@gmail.com>
X-Cookie: I've been there.
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


--TQ33EsQTOZpAHTLV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2026 at 04:44:01PM +0800, Ginger Li wrote:
> mchp_spdiftx_interrupt() is a hardirq handler and takes ctrl->lock to
> serialize the user data and channel status updates, while
> mchp_spdiftx_trigger() takes the same lock with spin_lock() from process
> context.

> Interrupts stay enabled while the lock is held in mchp_spdiftx_trigger(), so
> if an SPDIFTX interrupt is delivered on the CPU that is inside that critical
> section, the hardirq handler spins on a lock that the interrupted code is
> holding and can never release.

Are you sure, interrupts should be disabled during trigger...

--TQ33EsQTOZpAHTLV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqz1fUACgkQJNaLcl1U
h9Av5Qf/d4/IgiSTC8fzKCpBHCrMVsnphB2Jc5rorm7lGmaRkL0dT6coUrbH9fH+
C/l4BEe9W7cyaqq8Pwtvs0O9XaJAo3UW1vkJvYSylzBIMD+fxKbf6F2GzecOmpIA
lh/auaVxy1KaMLlTc1bVEaQrCzVVV8jC49Y86i0YiEjuSI97QBjyMxahBYdpL8v6
nf8yfg+PpjQGBsiM4AEJbRoHbTvEBlTmd/1JCHSvRg83eZpmBZqYvNeGvsSyvPdn
111L1TSK0wGIz1REHu546Ngb7fKQajWRZbEn1i/D6djMt8caO04knmQgNQbjbBPq
RtT95qdKdbuFCndQfeG8gLwdeYzheg==
=Owna
-----END PGP SIGNATURE-----

--TQ33EsQTOZpAHTLV--

