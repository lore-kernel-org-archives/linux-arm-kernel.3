Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D83DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2Ayx4P5zjI2w5WyC8v50u0/NhMxMp3eF/L8xkjynM4=; b=n3RvS9n/cW1RbOSyVIZvneim0s
	qVUsVuYxRsrotcQpCN0Ua96qmVwBebGBU6u6dQA/pX8VBi0cQmfStAj3ukAN8li/n0X2i5E7uyl4k
	/rW0YIxngU/fvucAo51+qWi1g5JrhyKur7n1nSoH+wSSjCuSDtliOgAx09Yl02BeXatvVLZv72s/n
	M3jqiQcxJj2GIMXXfAiNVwMBUM6bo7D1ly7i8tdMtusb4PKSRYzxih6LAew5SCoN0IysPyRL2IgF0
	5Jcf8RqjH4rr4XjR9lJGuakfojyeMmDzFFvg4Acp6kxC+NKAjWZJ1sM4KIN8nJyDbMyflgi4QS+Oe
	k6xryHSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2lr-000000012Dg-0UCX;
	Thu, 07 Aug 2025 15:43:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk2jL-000000011xh-2mCJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 15:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEFD0600B0;
	Thu,  7 Aug 2025 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B39CC4CEEB;
	Thu,  7 Aug 2025 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754581234;
	bh=oxkXLZvPp3BqQEgtA6OlLjO1pulHs/NQGwamKgBjikQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDdnwW0DKcf/KVyf/uUqQ8cftSD+Xa9fB2BIXHgOnz7NdndcxH2o+EPXPHUVwwAeb
	 CEPycnxuWPsTGUfG3cL65ht6RKlV99cwxjQUTRmqEbZ9uJ40mxPS6CKA8EKyXQ+6Cb
	 uJag1T1BbVniRqyZuK3rXvJpSWiR70+E3WkXllCLdHFZB0dsElwF37SsTNpf96w8Kz
	 NdolM9USSXP1YkV/ehKsWaHmVypfFMkXVQ/+1J+gTT4i6M0OzQ9KKSb1fEpMy7J1Ce
	 bvtImt3bohQcqn2mUV4blTq6Z/dw/PjdX/7qEfhs1wyO4nlfz8L+dNYEce1yOkSeqg
	 xhj1OqNdeEPqw==
Date: Thu, 7 Aug 2025 16:40:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 0/5] Marvell PXA1908 power domains
Message-ID: <20250807-avatar-comply-30aa8001aa82@spud>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61gm189z7gN5234q"
Content-Disposition: inline
In-Reply-To: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
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


--61gm189z7gN5234q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 07:33:19PM +0200, Duje Mihanovi=C4=87 wrote:
> Hello,
>=20
> This series implements support for the power domains found in Marvell's
> PXA1908 SoC. The domains control power for the graphics, video and image
> processors along with the DSI PHY.
>=20
> The series is based on master as the MAINTAINERS and device tree patches
> depend on the very recently merged initial Marvell PXA1908 support series.
> That series can be found at the following link:
> https://lore.kernel.org/all/20250708-pxa1908-lkml-v16-0-b4392c484180@duje=
mihanovic.xyz

It's not clear to me, nor mentioned anywhere I could see, why this is an
RFC. What are you actually soliciting feedback on?

>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
> Duje Mihanovi=C4=87 (5):
>       dt-bindings: clock: marvell,pxa1908: Add simple-mfd, syscon compati=
ble to apmu
>       dt-bindings: power: Add Marvell PXA1908 domains
>       pmdomain: marvell: Add PXA1908 power domains
>       MAINTAINERS: PXA1908: Add power domain controller
>       arm64: dts: marvell: pxa1908: Add power controller
>=20
>  .../devicetree/bindings/clock/marvell,pxa1908.yaml |  36 ++-
>  .../power/marvell,pxa1908-power-controller.yaml    | 105 +++++++
>  MAINTAINERS                                        |   5 +
>  .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts |   1 +
>  arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  36 ++-
>  drivers/pmdomain/Kconfig                           |   1 +
>  drivers/pmdomain/Makefile                          |   1 +
>  drivers/pmdomain/marvell/Kconfig                   |  16 +
>  drivers/pmdomain/marvell/Makefile                  |   3 +
>  .../pmdomain/marvell/pxa1908-power-controller.c    | 347 +++++++++++++++=
++++++
>  include/dt-bindings/power/marvell,pxa1908-power.h  |  17 +
>  11 files changed, 561 insertions(+), 7 deletions(-)
> ---
> base-commit: cca7a0aae8958c9b1cd14116cb8b2f22ace2205e
> change-id: 20250803-pxa1908-genpd-15918db5260c
>=20
> Best regards,
> --=20
> Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>=20

--61gm189z7gN5234q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJTI7AAKCRB4tDGHoIJi
0qRUAPsGIBNq7EJeNjCewk/s7WezXIszK4j07CCitkja8bCHUQD/QUq7puCrhLyP
vAJwA5dguhkavA4C1I5FPJDQbUdK5gM=
=rOfT
-----END PGP SIGNATURE-----

--61gm189z7gN5234q--

