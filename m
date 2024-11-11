Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F61D3ABF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7NetXetytmqC6nwjFs/F5R79+tUm017eWWuxMCvPt8=; b=ENST2DQJAvBZeWDnJICHB07pBP
	v7IskN3sGnKJ2sfOjIbvVgxwOskGPAmg6NuttzMVhCkcPSOcGVLuIUM7gBJdeggbXMxru8mnxaxqE
	u946g4pLm0XlAnxrTE8leEWIjgBBe5Xgy1sYyfXeZjrpJLrL7AAhnkQ9nniAcZAZA3l2U+ShlIS0N
	Fjge7ong/dMz9d/873llu/yZauPXt6DSzSCUUiuZUREVlB67ZroXw0PQtvU6u4idn9f7nShSn5wqe
	3ctPEtkvRLTO6pPzGYjXEoOiegaZsKnn5SYJXAXkTEjUvIKRuebF55uYiv570shlH7xM5nPdEoKmO
	EP8XvCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAahP-000000018us-3hn7;
	Mon, 11 Nov 2024 20:07:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAafc-000000018iG-38vr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 20:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB9F05C5C4B;
	Mon, 11 Nov 2024 20:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8801BC4CECF;
	Mon, 11 Nov 2024 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731355555;
	bh=P/A4t7isfDyVz8j9Sq/pwxO3TMGHlALcDuMM591w7Jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eS/OrRWR9GKahaWVeRdLCb11t5RZvRDcv+hXzvAuPly9D1KmeiU6LOGawK/SyOX/K
	 tPx/6inFFKY/gqUXdt1tmk99Cc4QdMVKM/89M/oaqPZgIpu0ymd6gruWN//ZrVuW9a
	 c5YmF75caj591q/9Xx2buxiNQqudDKyv9QhlDTGX+PjmsQCDiAa3gxNt+NokjjG+Xi
	 uPKmqCNGuvE9U9/r9/pHWZsIRlwdD5NcGC0q0RYq9O7whOilrSHfVZRuxLSzRsEkux
	 0CGBGcyekzyGL4qfyWr05qrlW5ljhBvLUf3PY/lNWQvmdu80ZExc/eYEUITgTpUC+c
	 U5w+zwxaYldsQ==
Date: Mon, 11 Nov 2024 20:05:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3
 SoCs
Message-ID: <20241111-guidance-theft-9d49ded4d9a0@spud>
References: <20241111135940.2534034-1-ciprianmarian.costea@oss.nxp.com>
 <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CD7jql/wzOKtL+uU"
Content-Disposition: inline
In-Reply-To: <20241111135940.2534034-2-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_120556_902594_80847D91 
X-CRM114-Status: GOOD (  24.22  )
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


--CD7jql/wzOKtL+uU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 03:59:37PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> RTC tracks clock time during system suspend and it is used as a wakeup
> source on S32G2/S32G3 architecture.
>=20
> RTC from S32G2/S32G3 is not battery-powered and it is not kept alive
> during system reset.
>=20
> Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Do=
cumentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> new file mode 100644
> index 000000000000..231811579e1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2/S32G3 Real Time Clock (RTC)
> +
> +maintainers:
> +  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> +  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> +
> +description:
> +  RTC hardware module present on S32G2/S32G3 SoCs is used as a wakeup
> +  source. It is not kept alive during system reset and it is not
> +  battery-powered.
> +
> +  RTC hardware module contains a hardware mux with 4 entries/inputs
> +  for clock source selection. On S32G2/S32G3 SoCs, this mux is used
> +  to select between a clock source for runtime which brings more
> +  precision but is not available during system standby, and a clock
> +  source for suspend state.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-rtc
> +      - items:
> +          - const: nxp,s32g3-rtc
> +          - const: nxp,s32g2-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: ipg clock drives the access to the
> +          RTC iomapped registers
> +      - description: Runtime clock source. It must be a clock
> +          source for the RTC module. It will be disabled by hardware
> +          during Standby/Suspend.
> +      - description: Standby/Suspend clock source. It is optional
> +          and can be used in case the RTC will continue ticking during
> +          platform/system suspend.
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 3

You actually have to provide the clock-names, otherwise you can't rely
on them

--CD7jql/wzOKtL+uU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzJjngAKCRB4tDGHoIJi
0ntPAQDEkJcfP5c7GFs4rZSWpwpDhFNDY9PU2IOjh8XBHbRouAD+IU+Y1reHC4sL
jGNjThmFUy9VssSwShKp5ZSobznsFww=
=dgLe
-----END PGP SIGNATURE-----

--CD7jql/wzOKtL+uU--

