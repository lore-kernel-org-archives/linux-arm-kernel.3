Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76AFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIeoSKyADr4Wu0dNxCKwUj5mO/2tRBSB8gSM4qMI6+A=; b=Xm68xQczj1tmK3CAMbGrjT7xyM
	PPeE5LpQBhGosuBf75baze4pMyT/UwFpmEtG7wu3Qo9n+o6lbq8jlXgdTPqjKaPNzxOb2zMMGJgvN
	8ZxQJfpXAKr7jM8BlKxPDzlbI2tXPvzxuuv85vKi250jEODJ8zRPbShoREaB2CHTKrfrcVfXMatdE
	E8LIAs4PjsefmiaybNZGgF53ZHCynuxnu4LvphhgNn7p2bk4lp6BtdqEaXuhyZ3+lwBa3f22K5fO3
	Ycv+LmkM4aaJjCpBNqCkL1QK5cGzKt8vXr9p1xbZJX88V24BJGriLSCqrWQ1MCeafbeVMnShrxxG+
	gNo1MTZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaVE-00000006HNu-0rE1;
	Thu, 14 May 2026 18:09:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaVB-00000006HN8-3Cyt;
	Thu, 14 May 2026 18:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 661EE43EF7;
	Thu, 14 May 2026 18:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0692BC2BCB3;
	Thu, 14 May 2026 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782181;
	bh=qIeoSKyADr4Wu0dNxCKwUj5mO/2tRBSB8gSM4qMI6+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFQubSlRM5X6zEXMEWCbNbJimRnRT7sqJbJ35k0XGtz8zEmn9XaadtOdDiKlcvn68
	 HJhWWx/uTMPz6ztbtfoLDoAWvKqA1sXr1DqogHUO7cLsTI4uWWyeOwJMsBc121zWc2
	 +vxV3fyQJEr3VvIRC568lySaLq/fyUwZc6IrgpGaFODyHfoJMiDG5B64uom7dGwR3+
	 aTYuujDOHOFR3HodV3GS1IZdXdFa31MgU8t71suCrN0QRD1w31UqcwQVxTYnyq/lMF
	 btbAwwT7Og8EWPPLgjyINlHHNeXzdpp4IpY/hZi89QFZ3qKJDz6nGuKXPI3ovgDQaU
	 V+WTDCn9vhHvA==
Date: Thu, 14 May 2026 19:09:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: airoha: Add an7583 entry
Message-ID: <20260514-throbbing-doorframe-25c289ab0b71@spud>
References: <20260513-airoha-7583-v2-0-ee0d82b37ce7@kernel.org>
 <20260513-airoha-7583-v2-1-ee0d82b37ce7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OsViCA6T3TKoo08k"
Content-Disposition: inline
In-Reply-To: <20260513-airoha-7583-v2-1-ee0d82b37ce7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_110941_820715_3EE8A654 
X-CRM114-Status: UNSURE (   6.69  )
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


--OsViCA6T3TKoo08k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--OsViCA6T3TKoo08k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYP4AAKCRB4tDGHoIJi
0otaAP9ciIZ3isHJRWPYjZZYBPnIzFu2RLtFlNV+1P/ZjFFC6QD/fZs0VecbfXkP
6XvIhQzrBcqPD5u1MNqPO5JSqKNoqwU=
=y/u2
-----END PGP SIGNATURE-----

--OsViCA6T3TKoo08k--

