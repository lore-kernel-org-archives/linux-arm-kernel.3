Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8497BC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZOKyNs4Db2MnERH7f8zaFtDju4I4ipaWRZu+43uIXo=; b=GzrTs22+57bYt9v+h6cCPdwUt+
	d20Jtg92IBW5zY9BLN+kJO8SeI6S1toIICYuOIgGG0Nb5R6Avi2yXWCaao1wwScnljXSJznRRV3kn
	3YQFB8Es2qbmGgtsuYOda2BKi3zvTct6HYQG6FHvS+pDYqTZBbvl1U7vF5DXNLw3FOd9g1GUn4CmW
	y6P2F99E0EJAUMJV9QtYPKBcvRzq7tjWEjRgnFmOQl7UsxxXmvOIml5H3v8Zj5Ezw1EH9qso5IVoF
	sBfqwogf6J8JUM7jroI7N6W0MnYBh9gGlQuY01s0FqRaa4evM1tOah3+A/ZdkprD8zH7rHwZAZUcp
	tbEahQRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXg8-00000004eIU-0qtu;
	Tue, 01 Jul 2025 09:53:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXJU-00000004bY1-0fns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BD8161127;
	Tue,  1 Jul 2025 09:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAB3C4CEEF;
	Tue,  1 Jul 2025 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751362203;
	bh=kZOKyNs4Db2MnERH7f8zaFtDju4I4ipaWRZu+43uIXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IebRQs2S4Zck295c+TBqK/iU11rhK4zM9iH6It/WDDjTnkzRJDFRMga9rMofy3OYK
	 W41pvCTEWF+AzUxh9eofQQnHdlHTwJg4iJA8ZKA0nN9/4jeP4TnRJIoMisw1r+ibuV
	 p/RqM8cqTIwciKsQL54FaElEidEarmMz4MI9EmDr/qqOnhPZldCjGCO6AZrImtIAng
	 e0tMkAozmrb6xpFrg9PHBXr+69xBZtAdSzlNLAWZD/41I9O+pEr0bO5e/LJ8QVkQmJ
	 QBizlS8OEB4eVW6CgnbR1yjIk1x2mjXNtuE+18MWZoBMFlPOOaJhPX3QwfqTDNgjIw
	 252/ta9q3QqvA==
Date: Tue, 1 Jul 2025 11:30:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml
 format
Message-ID: <3jtfwyrga5p6wucp6phzcizolnbgqexskelcolrapoepearqpd@3hws66swq2ya>
References: <20250625161909.2541315-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffz725mp2gxeplek"
Content-Disposition: inline
In-Reply-To: <20250625161909.2541315-1-Frank.Li@nxp.com>
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


--ffz725mp2gxeplek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] dt-bindings: pwm: convert lpc32xx-pwm.txt to yaml
 format
MIME-Version: 1.0

Hello Frank,

On Wed, Jun 25, 2025 at 12:19:08PM -0400, Frank Li wrote:
> Convert pc32xx-pwm.txt to yaml format.
>=20
> Additional changes:
> - add ref to pwm.yaml
> - add clocks
> - restrict #pwm-cells to 3
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - allow clocks, there are not clocks for nxp,lpc3220-motor-pwm, so not put
> into required.

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
with the R-b tags for Rob and Vladimir.

Thanks
Uwe

--ffz725mp2gxeplek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjqpUACgkQj4D7WH0S
/k7cZwgAjSlcgslaZQCd4n6XMk369t4QHQX44Dpo46C4+913tMXa3IOAm2bpUVVW
CXwEF8h0/i0Yyv6icPkv9SCdERBN/dz7xTHB7dhJvtUj2aWSUlS5lEcACWSuq8P1
DO9U3tDD33LGOVYYV+crDYqpfbUi+6Z3jhLPhYNWY+Zfq2Q+i/XuRtGhx0f7708g
loG8RYpKnT7Ux2rNhfD73lgNkzyFEbTT9E8HA7HEdXez4ENrVOxnPnAuvRxEnaRH
ZEhA8RLY4N+lfL5eE+7TPrgg2qNbRR/iSR11AqoFyWy2WbiXk2eopw23IAcAJtKb
rzZ8jbkiyf/7BqQ2G9DIUxT7pgkcmQ==
=/nBM
-----END PGP SIGNATURE-----

--ffz725mp2gxeplek--

