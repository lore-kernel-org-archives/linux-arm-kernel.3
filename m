Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B05CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WqDH+Ptb/z6NI8Zp6WcjeVisQWM4In7zspEI8GYWFY=; b=q/AXCgPKwe4ktlusm8XKgXnmod
	WCsyYs2z1iyQ/tl/QREb28v4bG271a7RHzpJiSnq9KadDXNH0xUoyg3ARNkMJk2qXWMwjqVq7RKx0
	2LjeEXqdb1XxsZ/4VZ1+u1NOE8ZA6XjZS9D6pcKKcAxLtX/Vff/ivjXfiXA6xxSs/LvoqIFSJbbLG
	1x50QPHpJb1vHp8nPYOku/TvCbaPRHhFNMWuHiTszE/tkcLAYSZrxnAAooDhqGnvt9vHYheoJk+D4
	HPKxt3I0LMWuOhGOKuTjAeSR2mBRpqpBbG0lH1YLZ2IqjVGJbk2cl0HE4NGc53HttDkH0IDY8whPo
	Xsn9TNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rax-0000000CICy-2hUv;
	Thu, 25 Sep 2025 19:25:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1rav-0000000CICo-3cDC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 19:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CB4261207;
	Thu, 25 Sep 2025 19:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83C3C4CEF7;
	Thu, 25 Sep 2025 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758828333;
	bh=0WqDH+Ptb/z6NI8Zp6WcjeVisQWM4In7zspEI8GYWFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVUmysBX9lAUhUCQny0ELnZuJpYoLibvlbm5y8DP3ru/efDs7/ia3/yyM65Z2p05k
	 8OGroFWhufzikOo0De3bTZ3EMNzyGtuOY0Mc3u3k3vUbFiadhkbCiaMNCV0sBNX3L9
	 jv6LLoyPiMzm3nTAM/qobpMjD3/3aBx5TQwK/2DDiWlbnBa30i2oFi5/SRcpKu0AaE
	 aed3twE7ldL+MfR1pEPoLHbvOih2jFwFEN0zKK5x7GdzlITrJ2wBpJjlA37Qc4WOv1
	 6e7JDi0mXgPLtrArOMHpQ0a9iUFfQ/GGlITg+kOULb07Xp1MHOARBVRqwt9I9IvbH9
	 ymrGcCiUkKctg==
Date: Thu, 25 Sep 2025 20:25:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	lars.povlsen@microchip.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, luka.perkov@sartura.hr,
	benjamin.ryzman@canonical.com
Subject: Re: [PATCH net] dt-bindings: net: sparx5: correct LAN969x register
 space windows
Message-ID: <20250925-outscore-paternity-69ff215963e8@spud>
References: <20250925132109.583984-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vLz2jGEcwewmv5kk"
Content-Disposition: inline
In-Reply-To: <20250925132109.583984-1-robert.marko@sartura.hr>
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


--vLz2jGEcwewmv5kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--vLz2jGEcwewmv5kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWXJwAKCRB4tDGHoIJi
0vnbAP91mV0T/4HeVsHGDqLadF3xVkxmrX7YYZ4na6tzg843qgEA/DjI3IHzSkCM
qZg5Ndw8iJ7RzgnX0pegaHvRfXwYQAs=
=vQNG
-----END PGP SIGNATURE-----

--vLz2jGEcwewmv5kk--

