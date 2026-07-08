Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6C9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDggZD+QJqlEA2zRqaI2SGJsu6BDMXf4CbvxFZeGk4o=; b=ULj7DaErwmnE9M5wRhVM6hykta
	2fi8MfeVzxP841Se7Z5+Tu1yNCRWpvBKQJHqJkg9AMWQvWfbjclEth8ZHH0TbAEtGmJO9TmUaSPMx
	DIviP1g/Slz3geBJX1HO8Ncmo0rew8KjWVwhOkeTqnsViZBfE1Q2c/XtKx2H5OIRnWyfCD/s9qZtE
	vJlCvAUP1ZvDKQQskLG1UqplItznxEyZzap2+TzduBbBZU7R2bAfcRBC82gRm6bv213PlaIYKj3Va
	Acnzrzrm8rISLBAAxP74ASQxfGVlajYMOKvw15wCKU9aifUH0FdYVxeS1Z1DR7OEWTddC9xWGKwLT
	glMuN3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVCf-0000000Hb4g-11nN;
	Wed, 08 Jul 2026 16:32:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVCe-0000000Hb4X-1f7p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:32:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D33CA6001A;
	Wed,  8 Jul 2026 16:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B411F000E9;
	Wed,  8 Jul 2026 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783528371;
	bh=mDggZD+QJqlEA2zRqaI2SGJsu6BDMXf4CbvxFZeGk4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWBUVJVZn2RpPmIcNCiUj29WhFoz0zJiRDBkfpHwALAC5AMAA+a1dA+fqt9VsgdYN
	 tsoe/6XGzIIVm0P1For4mrZkz1TNTHI81ILetovOyCEy1x8LfAJPGEUV4kLBF0Hh6C
	 ZU4ZwAGnjeD5KeNEKq7zHwd50RB/5US3BUf1lD38Vgyv/LAJ5WYheF+2E7/Yiq50mX
	 pJTn1Zrjd2WQvsvYrk4RUjHcewf7ZWj400z/vGjD2ZX5EsQzM+uVYFklwKz143DdDE
	 EsVtkutYxc95WgF90qb3IaAtaUzV6gxdfFu4cPUMTbw9qUCbzqTCU5IG5smSEN1q5t
	 7RWD+vKUGrgMA==
Date: Wed, 8 Jul 2026 17:32:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Document Renesas R-Car X5H
 Clock Pulse Generator
Message-ID: <20260708-valley-lazy-5c330630485a@spud>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <f0f2e810b249a60ff7c27d508366d66be061fed2.1783505142.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+js/rSO4/JLZe+iv"
Content-Disposition: inline
In-Reply-To: <f0f2e810b249a60ff7c27d508366d66be061fed2.1783505142.git.geert+renesas@glider.be>
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

--+js/rSO4/JLZe+iv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--+js/rSO4/JLZe+iv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak57rgAKCRB4tDGHoIJi
0suDAP0Y7kKxguK/KmeWU+H6eYs6+NPHihHz7U8UE2vznOiVFAD/QFYF6YnnLV6J
OVFcr+QJR9wTl3FiI/QmhyUL3Gk76Ao=
=aiCV
-----END PGP SIGNATURE-----

--+js/rSO4/JLZe+iv--

