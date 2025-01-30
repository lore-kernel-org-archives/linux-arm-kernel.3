Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7305EC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZJRq9k9X5Pu3nkmopql7LVi/y4tYssCQBqEevf/y7Y=; b=k7V+zvw3dahN4AyfKJlWczmi0/
	XEochB5nE7ZW2BqJX1xiFvLkUo/yK9nOtE+ljTuUXNq/NKZCxk+93QdysXMnscyT/F7dkbeUjha5J
	PD+G7DHl2tqe7C3m/Bnmd0iWYeApBCPGBKgvM6bDtjkBsFNA/kYer33GBtBmh2sqCTi5Y7Xr3APyn
	JvRxxdUT6eNGh+QFrA/rLJMnGzoY3OMVN9VkbJtlc316lCzrWaXy7+0tICjZXcG3vL2WwoamDWtAn
	LsXWojBk0O2ROiPiQfgWf7W0z0fZLvl9tTCuLiGkPTWdMWmarUo0SGYQzuTZ3cwMjBvCtY7R91FsK
	8NFMlqSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZb6-00000009QJj-0UZy;
	Thu, 30 Jan 2025 18:49:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdZZc-00000009Q0N-05rU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 18:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47FCC5C61F3;
	Thu, 30 Jan 2025 18:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B95C4CED2;
	Thu, 30 Jan 2025 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738262851;
	bh=mZJRq9k9X5Pu3nkmopql7LVi/y4tYssCQBqEevf/y7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8XhSYpVEgOVg7CPv7mdSBjxIe6IM3wMxmJpnF+fyePkW2XCp9406387nlnCAsT0a
	 rydEh1IhviEaaJd2XioVWIzivnsyLO0nOldlRSQJPjpyWPFeHwXaONkLtMKTKmPFNX
	 Q5DgkbSVUDEgN4pVDymRUV7WhO0MtsVSj5OxjKoL1Ec7ugVkxO41vWZSXF0o42J3N9
	 HVzZPCCX/PjWnZjirRKRbMM3PJ7DWGYOAzvc6IDqRcsZ679rHFBQCmCJTwzHx6g2WW
	 yPy2a53dNB6jMUdEqCVzJuO4ka2fvxm/wJRczp2yE+1wzo4vhWBJxzC+BmU0Sagqnf
	 o5lSFtaEbXEwQ==
Date: Thu, 30 Jan 2025 18:47:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: nvmem: imx-ocotp: Add i.MX8M Nano
 access controller definitions
Message-ID: <20250130-awkward-referee-3bec6c8cb1cd@spud>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
 <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4mU4vkAAU2Hn3gqn"
Content-Disposition: inline
In-Reply-To: <20250130130101.1040824-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_104732_112784_12BC3738 
X-CRM114-Status: UNSURE (   9.85  )
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


--4mU4vkAAU2Hn3gqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 02:00:58PM +0100, Alexander Stein wrote:
> These are the definition for the bindings of imx-ocotp for disabling
> fuses.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--4mU4vkAAU2Hn3gqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5vJPgAKCRB4tDGHoIJi
0u+EAQDYdX6jxw/RzEi8k4fHQSVdiqM7o4HubF0JSKkZjwwU2wD8CffUuSP6JtiJ
RfePnNXmBYGsnu0cSu/Ttx6O7v6IhQ4=
=loIX
-----END PGP SIGNATURE-----

--4mU4vkAAU2Hn3gqn--

