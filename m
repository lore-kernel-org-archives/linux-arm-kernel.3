Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD014CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhtlqOXDupzkzc3nSNJvUxuVlPWJGH7dBhTIBsrkvzc=; b=HSmatMJ5fM8+ziJ2IfmQf0dEyv
	1UU6TxVjfhR7O6iOfIFIyUknkmEfxOuii3UPAOnv5GXQ2JpoPhsT14vVo9GfewjrS/HILPdAF8sfb
	KMhRibQJQv6E56LqVnBheg4Wdj4BQDB4y9yt9aUzuEnANIvcPVPETBKg+aIw8+itsWWESXtTV6jxJ
	Ejv7h6tC5riVmwiMdhvTbiZDrQwIBKn8EFQnoaiCXiTyXTiDplq2OKxClsRSsRYV5+Wbh6Qz4Ulpz
	xA/YR6CyORzQabUW2EFNHCWEO5qZq4otP7Uypinhg1rqBgiEk9Asgvlg1GmKxZW+zZuaG9xAiM1zh
	9mH30Vfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDRB-00000005M0W-3Gkt;
	Mon, 15 Sep 2025 17:56:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyDR8-00000005Lyx-42wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 17:56:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A85E441893;
	Mon, 15 Sep 2025 17:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41507C4CEF1;
	Mon, 15 Sep 2025 17:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757958982;
	bh=UhtlqOXDupzkzc3nSNJvUxuVlPWJGH7dBhTIBsrkvzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dXZwy6kz1KMTOyFhhyW7IqtB4tCr5+pVG7dXmvQi93dWtvlJbpq3cdaE4FbQUqy1f
	 ej4cPuGHYksVOmiPIVi1r67OsVLXYCgvH8HDwFT21fe9YaNLd9T25nnmjFdeHBVnuL
	 pwz1ZLeC6SgWAmiWyOxUXNSSLEUOEi5v6T90J8nxiNk/27Hl/uA91diEZobWhu3YtJ
	 nTjD1NtjWFr5WLN9ZISaS8v4BmOn9PDgF0BmQVHe8uhRrGuipLDWFib1wYIbar1Ehm
	 F4Bi6WC4EVCyv/H8/tdZ8Dp1jiupnLJCu1+aEUz/JfIrzOE91LwqLaAazeewz47bvP
	 rPsLWYQUpT2Mg==
Date: Mon, 15 Sep 2025 18:56:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v6 1/6] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <20250915-golf-antsy-9e71d5398324@spud>
References: <20250913101349.3932677-1-wens@kernel.org>
 <20250913101349.3932677-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PtuhxQmA1Ve8bM5+"
Content-Disposition: inline
In-Reply-To: <20250913101349.3932677-2-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_105623_020739_90B6936D 
X-CRM114-Status: UNSURE (   7.26  )
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


--PtuhxQmA1Ve8bM5+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PtuhxQmA1Ve8bM5+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhTQQAKCRB4tDGHoIJi
0ua/AQDDYt/Sy0eQGk4ojQ0b/BXXDaihykUMqx+YkoTxwrYBSQD9Hk7iZgJFQbQi
/RNfwxM6H3OrFi9YeWXkX4kS9q4zCQ8=
=C54e
-----END PGP SIGNATURE-----

--PtuhxQmA1Ve8bM5+--

