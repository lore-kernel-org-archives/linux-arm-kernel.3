Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC79C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daaP9ivLRlaVJRR0FdV2E485+B1tFasfnuTeDeoCx64=; b=nZvubCLjNrOM0DFH0Ujtx2s/jJ
	e7FTmzP9EPaMp/x+Iy9W4q3ZlicuSoSQsh4xNhYbLucTTdN6D+7ra3kxPfiey3Sy3rvVoUI4EKxVU
	gvSfzN4jv/zdt/Di0OVAG/Cti2tNQlniCtyOqa2oYCadyABHLQI1fUNV+zM1KQ6x3QVTpYiebTHgo
	15P9OqgoFD6QvMrfU8y9AmgHtbq/ClL23vx2rtQVVkepUem7rIXQXSjwrlhoVyvRkDAMGRNNBWpX7
	LkBqDE/19BmJmhjeY/HGfF+Ylxt6EGP69s6Ecqdd9s9+O9pBcqlR7olOwwxu7XMGsXNDbBiOjb4Y5
	09RF07zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuWG-00000004m3g-2k2b;
	Tue, 11 Feb 2025 17:58:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thuTq-00000004lU1-1ksg;
	Tue, 11 Feb 2025 17:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 369845C4FF8;
	Tue, 11 Feb 2025 17:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326A4C4CEDD;
	Tue, 11 Feb 2025 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739296529;
	bh=daaP9ivLRlaVJRR0FdV2E485+B1tFasfnuTeDeoCx64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/2T/84zni+MLaiIA8zuppiehPyj+/6syQyqqYQt6yDIaWcIY2EUj5XeZHHWCN2Ut
	 RNYQRqPtLpTI/48KzD7a4cb0Q0fLC/E4zHn1lQBmbwqFLzaP72OTCSYivyFipbO4qx
	 pQ+zVc+OPZWgrOQFaE9NLkyk7RfgFVBXzWotAuGPegOeAgSkK8EP4cjH61VkxxAjr4
	 L2TqQ/LgvuWKaIAQm8p7laE70v+teKaO019cnd8otCZ82HFuIFsfzUtbzGvy8zJkOF
	 KNuyQpp9/IOCfZSO8Zg1jjrFQS4yD/diEBCh+dvIa45s2JlNfkLQYAjgn/n0vNBO+r
	 0xWH7GD0T92nQ==
Date: Tue, 11 Feb 2025 17:55:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: srinivas.kandagatla@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH RESEND v2 4/6] dt-bindings: nvmem: rockchip,otp: Add
 compatible for RK3576
Message-ID: <20250211-anthology-probation-e63c66321590@spud>
References: <20250210224510.1194963-1-heiko@sntech.de>
 <20250210224510.1194963-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uIhrL8S7RmlAJj9x"
Content-Disposition: inline
In-Reply-To: <20250210224510.1194963-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_095530_510100_B090FC53 
X-CRM114-Status: GOOD (  10.06  )
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


--uIhrL8S7RmlAJj9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 11:45:08PM +0100, Heiko Stuebner wrote:
> Document the OTP memory found on Rockchip RK3576 SoC.
>=20
> The RK3576 uses the same set of clocks as the px30/rk3308
> but has one reset more, so adapt the binding to handle this
> variant as well.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uIhrL8S7RmlAJj9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uPDQAKCRB4tDGHoIJi
0qBsAPwNq2KSXu5wBkYu8Q2FSXgq9YAlDU7EwwkvEplZu7B+bwD+LItI+FTgqJU5
O0CQoda+tF+w4nCK2f5B6zkcQ/rx1gE=
=5yrV
-----END PGP SIGNATURE-----

--uIhrL8S7RmlAJj9x--

