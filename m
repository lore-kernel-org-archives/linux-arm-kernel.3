Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39935CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B95eVH4gIcSqc/WQ/YtpqJQxu1TLbgEzFDA9oDcpFHY=; b=sUdUQZG4JWsGZCsO469ZcmIoSs
	yoBulxBymzlWEhEL8A6l3GDm4z+EFu48X+vzBpAOykQyLqNe/6gLciZQb9VK4OolT5VCFJvTYjWoO
	zZCrJoPzzfd+X9tc6Dv6S3n7YtybedfOAfZF0WDGJArbeYi17nTkbdfDQoCm23V72KEP0K2th8k1t
	4JGSZ6zK6DVw8Rsra4p7JGHNLcqjz7X8UzUYZrBK9qY12EXBdIFFXKN6gGo1ZDQKDnAfAUSu7TtuT
	7O8H9IEqdc/SAAgQ7cEBX6Ue2NsyDOu2uxw5qsSd4odynddFiok2F6ryhbnmirY+EKjkPlY0mvK2M
	m/Gmd2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdTX-0000000DlAl-0Pel;
	Wed, 05 Nov 2025 13:22:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdTV-0000000DlAd-2fTn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:22:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9C4C60205;
	Wed,  5 Nov 2025 13:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B2C4CEF8;
	Wed,  5 Nov 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762348976;
	bh=B95eVH4gIcSqc/WQ/YtpqJQxu1TLbgEzFDA9oDcpFHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHM5sXvFq3Mrtro4l2Ena35Nqj5NrO95Y9KqOhQvHQMg40NvBil4Ahe1sG4vNEbJp
	 QlFHUpOMm7tPm77MqQKlSX3qCD09BqqwxntL0tS/xZ2fwv9dgonUI5mdv2qUGvej50
	 v+wKjKVAa3tj0PTF0lEEc8edino/1ixZce8FFv6WUAAAQRG+iMOnDEMDcLkOvWVzce
	 o62QMfkONd4O2F9he7d0E26hjJGnu2Tefsw8gWGp+5NZi5/7RKKs+kHQSVfZ88Iy1t
	 YHnjz0xmz9fGhr8L2Odpgt5mCbCL8rUi7RdRwui7UPxNfwwuk7c6sOh/Vu2cWChsQc
	 Fa+YR4JEEUc9Q==
Date: Wed, 5 Nov 2025 13:22:53 +0000
From: Mark Brown <broonie@kernel.org>
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-spi@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: imx: keep dma request disabled before dma transfer
 setup
Message-ID: <aQtPrS6_spVEzKSu@finisterre.sirena.org.uk>
References: <20251024055320.408482-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zw4qTt7we2Pp5ch+"
Content-Disposition: inline
In-Reply-To: <20251024055320.408482-1-carlos.song@nxp.com>
X-Cookie: If in doubt, mumble.
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


--zw4qTt7we2Pp5ch+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 24, 2025 at 01:53:20PM +0800, carlos.song@nxp.com wrote:

> From: Robin Gong <yibin.gong@nxp.com>

...

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

If you're sending a patch your signoff should go last in the chain, here
it looks like you're forwarding something Robin wrote so his signoff
should be first then you add yours after that.

--zw4qTt7we2Pp5ch+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkLT6wACgkQJNaLcl1U
h9ARBwf/ZKAAS4rKRLsk0T/vrm4mhVcNoHt8+qTOhmw6TJ1mFFM1eVJE7j4ugOg0
+pmTj5wFiv3+g9MEegx35jOweJ0X2mYKsjzShLksgVQERU/va5xd2pG7rdzd8UyJ
KzQnAwnEdPCRuAX/pLoe7HTjcizpaYqg9yNJO9e/pFmBOKS9JqfRWjKurWUIj6XB
pMIVkFxWE0aPKANXEZm1u5aeOtgHp8/GEWYC66vpQagTWaXzXaaUm1kPuP6G3Uwa
culMCwQviacBrXO4gBSGRAHV4V1XaeIfJ7qc0i8ht2BeO3afCme+DeodlrKwrx+h
0XZ0VjHDO0keZWqudi99I1h4TtAI4w==
=Y+p6
-----END PGP SIGNATURE-----

--zw4qTt7we2Pp5ch+--

