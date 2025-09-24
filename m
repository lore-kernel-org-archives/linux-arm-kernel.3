Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4D0CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 19:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obJxnZekB4WIG8RL7kXppSHgA/amLMeM0pzMUd0i/CQ=; b=mVbv3fMgy0FmyDQ+IB+BvQsHRq
	fDF8VpfookL3bqkjhpbfohe3M/9OHySlJTnJ2JJ/15rK/QSN8eIp2VcMfPYHX3hEVEmnUgQETfo6L
	KRtsObm9aF2ug4dUlfEoDP9KHPc3UnL3pP4UVCkBS6nA+uvG2dPUWtV2UHJPCchY6vkaDppFTtex1
	hBNPynLRw9zxIGAqJeQP/uGOXgOnYehbeYWttuOABHUr3HwChKUYcMvJ4J7yvDoI5godqdhXyA0Tq
	FTDXGTW+oGPS+IJRTZZqsV8ZMj+AiEv5GFMFLruPph5MsUPFRk/KzcJ9s5JdlNTaBH2U8SpDdpP9n
	+HMHnIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Uw6-00000002xXP-1d63;
	Wed, 24 Sep 2025 19:13:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Uw4-00000002xVt-31AU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2065460139;
	Wed, 24 Sep 2025 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94B0C4CEE7;
	Wed, 24 Sep 2025 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758741231;
	bh=obJxnZekB4WIG8RL7kXppSHgA/amLMeM0pzMUd0i/CQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMWvT3dnPw4+xviu3m6H3ehDXSQusdziP04daUv+/Qsh3E4fEWSwp+zE8MT1rqiBP
	 ifwatbwbth3QnrQpSSobAc/K3yFQs32TDc4KhD5+p65ZXpa/i5Gr0G7P2vmV7W1pGh
	 YpTdMrsXrgpojrwJC0em4VViA9i5AyVyGJ90/3CzzOsDV0XWnq/GUHGLtD7/AxOdg7
	 rUL9dAVIsZLKHVptXAHKiZe/xmqH+BNvKuhgKmHfEnsqi3Qr+jhBhECiGONdDJm7sm
	 Eqag8hpae1WTMHOFO7oXdigp0TLGIOfYh8APsBWjFrz2+5nPOqGFyd53od+G4FGpUi
	 Prkl+iAW2+BZw==
Date: Wed, 24 Sep 2025 20:13:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Amithash Prasasd <amithash@meta.com>,
	Kevin Tung <Kevin.Tung@quantatw.com>,
	Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: add Meta Yosemite5 board
Message-ID: <20250924-flagman-thus-08b0cb14946e@spud>
References: <20250924-yv5_add_dts-v2-0-39a4a8e3c9e6@gmail.com>
 <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="98eyz47R0E2z5CLq"
Content-Disposition: inline
In-Reply-To: <20250924-yv5_add_dts-v2-1-39a4a8e3c9e6@gmail.com>
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


--98eyz47R0E2z5CLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--98eyz47R0E2z5CLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNRC6gAKCRB4tDGHoIJi
0qx2AP0cDNVhrKNfjJaL3YkhGqfWYI4zoBzMpZriprMQBVvMFwD/c/iVVQFN2NIl
eI23SXm/4HvbUEm9VtZBvfSuqmBKEA0=
=U+q/
-----END PGP SIGNATURE-----

--98eyz47R0E2z5CLq--

