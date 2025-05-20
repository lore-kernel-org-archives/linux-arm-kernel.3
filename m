Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CCCC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZwMAMHXJadVhVw8rt/Vxp0DnIWTSyCOm/9s7Dh/5ic=; b=SYzRa4Rgv9zQc6xGPw1HlxyVXH
	5w+YL4WKOiR3my5NfCqO6jNnKGGLFU5nHcaiIk0k7ioe+XJX5e7fxRv0DqmtYQQvoaHONj0/Z7JmB
	WPJVi4BiZNHLKJwO/Rd5A/yX5QN99zJzoKj4NYbjDuLjy3bnwNNQNlp1ql0I/c+55BhUg+h/0EHtQ
	ptmeBemWCWZIxBitbzw6lhFJe2Vv8ACR0/qQQmT9GqiK/r7VM5oBgxLW/UPq/uiMnmjgMj+SpYuv3
	ntCa5AjZopJZ0nKTmD7s//Z38zabEjaVp5OqprWk0xRMMX6zLLTP5+JUrUrZU+AOnZQ5U1D3Pkua9
	z+S5/Q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPvM-0000000DYfA-1OYh;
	Tue, 20 May 2025 16:34:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHP9f-0000000DOae-3c0q;
	Tue, 20 May 2025 15:45:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0175D4ADA1;
	Tue, 20 May 2025 15:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE88C4CEE9;
	Tue, 20 May 2025 15:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755922;
	bh=QZwMAMHXJadVhVw8rt/Vxp0DnIWTSyCOm/9s7Dh/5ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Elr5GmgNc0bnO/D8dP3JhuMcFuYUtNJYb/rzzI2WfYx5tqf7SA2MAdFN7YMAYXGxP
	 pivBuyfPYAXFhdZqx8M3E3KyBR2MHQ9x1FR9VvYw8xnYvB10+J1b+diHcW7jglP8sF
	 HQcwJOv4KQwaZaNem9JD1R9TqoA9/0J/YqMNZnMQU9LjHLKKa1Lb3tciG26m2czvmr
	 MBoV/Kod0NSu8cHBvot15yRaGPwdhgExvpqfZ02uWndqhWOZabXHdZkqAZBf3I+XNl
	 2I/CrV4RPe4gJW7Cf+pFKuYNM8QV/Oc+GaqaX3eHLqIJNWsuVd8O9GcCZ40det8nj6
	 XkghhF4IXfz3Q==
Date: Tue, 20 May 2025 16:45:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/2] spi: dt-bindings: Add rk3528-spi compatible
Message-ID: <20250520-safely-taekwondo-c9daf6ee76c2@spud>
References: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
 <20250520100102.1226725-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g+s0XxxpsHPxzUUk"
Content-Disposition: inline
In-Reply-To: <20250520100102.1226725-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_084523_917301_C4E4B50C 
X-CRM114-Status: UNSURE (   9.61  )
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


--g+s0XxxpsHPxzUUk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 06:01:01PM +0800, Chukun Pan wrote:
> This adds a compatible string for the SPI controller on RK3528.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--g+s0XxxpsHPxzUUk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCyjjQAKCRB4tDGHoIJi
0ndWAP40ZWHqwSwJvdKd3NHs8XCjLGX9F2LFsU7/nG3hlT8jKQEAhR+Ap19CEIou
UEYSvVw8j3bzPZ+4rhf6pNr0X3HJ6QQ=
=xOeR
-----END PGP SIGNATURE-----

--g+s0XxxpsHPxzUUk--

