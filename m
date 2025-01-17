Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FA6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSFd7Zpved/J9ARzkNxskvv0MDGbMGB15yiCNUdlcSs=; b=Vum6VDEaMzC7PJHjjlWlGs1e0h
	DTrMalXS8SKK53yaT8xoqPo6lyHVNViQjJYGMK8cQ/MoC+66IyJedDzRNlyGGEeeAag3rfLvOeqEj
	2RxTsoREaTtJ8YSmIInVb799S8/kY6xL8ML8u1q4uW/eVNrrWX4dSN0E+2tmJSwMZ0NqvoZSEKvrp
	oI+AbYNObP1NrzVwlTgiY48QZ+x+MyeOyvsT8yW7tV1dKSXefF9o1AE7yazDU5tEGhjmJMS0FcUj9
	yqNv+Pd1J+o0eoGQUOxoiAHz4ubBeT3dGF203W/ORWfv4Lg/2bkxBU8d/MdH5thDNmXelYGBCmvj9
	gyCu1lDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmJm-00000000LEl-1PqG;
	Fri, 17 Jan 2025 13:23:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYmIW-00000000L7M-1Xnk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 13:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A45F5C6234;
	Fri, 17 Jan 2025 13:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC1BC4CEDD;
	Fri, 17 Jan 2025 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737120123;
	bh=fSFd7Zpved/J9ARzkNxskvv0MDGbMGB15yiCNUdlcSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVAj7slWnimgq+K/qg63qK7az4/Vws1Vv8xbnNjPCVvcrp1GVjjJjYpUZaeC6cdbN
	 t0aTP+pi9UOlSGw0/1Uj9vBlAd9+vezH4C26sGtZmTvfj34KU6rKrMHypAah7uiJAo
	 ycHcRABpMoxkeMeKch7MRzDilZt08iWYzx6vqir0XKbot3F0eq3Gxkkd5ibemEW1rz
	 TZBe9m1pdpIHbPMi8Jlkc19JP5Y6glI+jNulChUh7IJmBrdj5hER39rGDFyIxUKV8l
	 lFnDh7Hn/d52+UhhRghZyxCHa4X7qBsUSRmD2Px5oy9EJSTmNz7nI6qr9/xgl4MHoW
	 tKkaQ3JNUsilg==
Date: Fri, 17 Jan 2025 13:21:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
Message-ID: <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9LaKOexVYp/mUJYS"
Content-Disposition: inline
In-Reply-To: <20250116225521.2688224-1-sean.anderson@linux.dev>
X-Cookie: Q:	Are we not men?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_052204_447812_627AC3BB 
X-CRM114-Status: GOOD (  11.43  )
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


--9LaKOexVYp/mUJYS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 16, 2025 at 05:55:16PM -0500, Sean Anderson wrote:
> This series adds support for resetting the QSPI controller if we have a
> timeout. I find this greatly improves the stability of the device, which
> would tend to break after any timeout.

If you're hitting a timeout that tends to indicate there's already a
serious stability problem...

--9LaKOexVYp/mUJYS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeKWXUACgkQJNaLcl1U
h9CpZAf/Wk3o1MAlJ9TGR6o+nwTpH4hHPLa3QLO78QLJo5xgPC8mTkGIg/FmONxC
lPPbIYeRT0sRBmIvct3xfbvWNjpsDa0elpSM4UzX578IEx2i7Hj+rWiLl7NUE/bM
reFUV23KdVcTYv/CfP0fmC5SpvoY788WnnP60xSbsf2M5H+IAoyWovHE+WvHEJSx
6Oyh+jLUWTdKkYJqADmTKytyZGHlJFujVq6IBUT4C0bEXYphv8BUmSaC1KvdxWfc
22h6JtGfKU7jYrALUaTABxweqaJle4lbbpd5WNYxdnD5xh2NlDfOswz5QF4DE4FW
HuF+P5Nkc9GMGbuJh5uWIwAagvlQ/g==
=Et2M
-----END PGP SIGNATURE-----

--9LaKOexVYp/mUJYS--

