Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01E4F4383A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0EBIyq8KZ0in/NVtFdRwCTzpJ4fzIas0PvQK7JCygc=; b=WvBp04Nvm8x5gpXrAeDNnCDLjf
	/dsfE+EIszZm0R6UGDpTjakOlWnd7K23SFK+6bEAH0tjbLGJE5lG3nZcvhmz/6S/E2JPB8ZoEOGP9
	vY1Wyvnyn0HAGtA6lp3z0M0Jn2BHyyv4a2LI/daeBcRLMJ7w5BfaDWnDeADZukFT/UnsNX0+OJCPQ
	z16FALpBsXN/6nk8W2moduz17dPBSYjKAu/HxKbJi+X5kJRqWOOtFSrhqaT40KKQ7qi7uDk1aEZrC
	gu7vYou98xRlYIf6z48z9CEW4O8348ar+W5FIKGPZvHO+Bov1X+gq9X9OvEXIofl4hcDJyP7gN1x6
	7MV6XCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1kC-00000001H2G-3seT;
	Wed, 15 Apr 2026 15:01:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1kA-00000001H1n-1ibZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:01:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3A5240B35;
	Wed, 15 Apr 2026 15:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BD3C19424;
	Wed, 15 Apr 2026 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265289;
	bh=Y0EBIyq8KZ0in/NVtFdRwCTzpJ4fzIas0PvQK7JCygc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBIEjdqANubEn3fvCpvqk+Tb+ctxXjKRCZnL2m1mr0sNyihL0aiVocFdQXNvkSMeA
	 kNjiWrSrPZYxxF3Dgr78nlZLrWNPf6RiXiWlZB0+Hpk0MHpLADLdtW3EhScvYk4dFR
	 I+JEG65eKJsUWa57Z8yqrMdq7JVkagk0yiqSZ6KyvukojiiSJftevLH0F5bBkr2l02
	 jKDjR+4CQt+mRsGPoiEKAKKlrpeKrAjp63Iq70cFlOVPnFQT4MRDyS0+QbChFhWIkp
	 Wmu9jT39G7F0cjyZpEEdK+nnwJcOBCazxTqabD7OizRiO2JmetjOG8fHnq39r+vZ9w
	 5beBEWTcQxecg==
Date: Wed, 15 Apr 2026 16:01:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: zynq: Sort compatible strings
 alphabetically
Message-ID: <20260415-anvil-gizzard-dba463f90ecb@spud>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-2-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jiuRekTIxogybpqZ"
Content-Disposition: inline
In-Reply-To: <20260415105628.957689-2-shubhrajyoti.datta@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_080130_471870_47A51F2D 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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


--jiuRekTIxogybpqZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:26:26PM +0530, Shubhrajyoti Datta wrote:
> Sort the compatible string alphabetically.
>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jiuRekTIxogybpqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+oRAAKCRB4tDGHoIJi
0gRwAP9DDg9WIcR8ZGsVURYLX8+C53TE2wr8No9N89VLgmt19QD/dPA8/neBHQjd
hm749mFqshArmrmMdLMlwqJvYWOFogs=
=MGMW
-----END PGP SIGNATURE-----

--jiuRekTIxogybpqZ--

