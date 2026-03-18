Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BBB10775F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yDnin5PIEgWDcaVrR5ixb+9wo6/QmHyvet070Cnr5go=; b=LbbWWwvulhJ5II8KGHSc7q7ZWN
	PtYz4jaiwC2j/EnNqP3zDmIXFjiyO7EmfXVnZh2/VsenrhuEStDcQApo8yKc8PE6XU8WepWUlLjR7
	czF1ukVrnyRbeSbwLYzRY0wYJ4MnFmxxMNipcZCRZ0Ug7b1v/hLZf7AO2gEPgS6Nv18gI1puibYlN
	g+49wk0UEunzbWO/QXcyEQEiGKHR3ESn6i7B/SYE+3TZOUPdYVbxiI8TM6emhkZG1oCaY465J/k/d
	4F5zKE3no0dOcvCnrn2qTAHCKUDWJsw0EQUZtK882YkosFunfvc66/4f3+9c1b9J9LIIiZWj9IUZZ
	m2bmU/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uu3-000000096PQ-2VYs;
	Wed, 18 Mar 2026 17:41:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uu1-000000096PH-3dY2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DC4060054;
	Wed, 18 Mar 2026 17:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAEFC19421;
	Wed, 18 Mar 2026 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855712;
	bh=yDnin5PIEgWDcaVrR5ixb+9wo6/QmHyvet070Cnr5go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rshza5X9hG75xKjS0ZAVmMNw9G83zG8xePF2WrsshrIF0xfBMiEhjYY12yyXO01Zc
	 Rw6uBfTrA13I8iLqZ+a44i70SCWmldHrY32Nkzx9GtffDcjaCwJSNL53Y5UKbTWX6/
	 0Pq8XYbWSx4Zj0EBCR4eqMFLB2wIK9CK3G1zyj/n3qzrDp2OldOTzaHoSpAS8C656t
	 YqcDUNVOrqmn9Gq6BoE3vswe/xPmqQffhfaSpHQGq6tY/LSOUFGzQ08PerpwiOxWp3
	 BuXaj13WsqK+7pwnDW5rce2US0m8yP6Ykw6W3ohZVKDxwsQ2fehgdYUwKyTz/K3f6D
	 EFD251j0ykjxA==
Date: Wed, 18 Mar 2026 17:41:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
Message-ID: <20260318-blaspheme-wipe-8719c19007b7@spud>
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWcgIj8qfCugOwjO"
Content-Disposition: inline
In-Reply-To: <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
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


--wWcgIj8qfCugOwjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wWcgIj8qfCugOwjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrj2wAKCRB4tDGHoIJi
0sfzAQDnqZpou/DIpG1dQJ4XdSKe9/QnNu6UIKgK9PLQKeXgeQD+IX/0OMpx3M9y
1w/wCI3p1EALDrK62Gu+VHONpjkVJwI=
=AIgG
-----END PGP SIGNATURE-----

--wWcgIj8qfCugOwjO--

