Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6202CCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8At9mcqiSA3YB7vC4gJ1n8aCsTInT0BEBjk4XLEqlN8=; b=Kujv3Bv2BO6iVxQOsLN8t1wvd/
	AydHY5r3SwnyVaVnO3DR1u8SHcox1QNWyr8OXef29Jt5DMnDXjdBiB9aGmepPy2sGsTDX27AamOZA
	aVtIEjnBB51IiW7/Xdp5VTVy1OskstvUo4spbUv06E/o6RhrZGinCuu6k5EJILKQu3bxBpDSHu3KP
	eOeIlCwB1fA/89QMMi9oVvMrGVHJb6D6VxQ63pXF4Q26pnn3eJ8ggEtYqDFJ3qHINfc/qYPDI+AA8
	4Vt5BGiq5AHipsHLnjnOD85EjqrqJxJIRoS9zAmIKjFbI3llPSUpcz/7Ab+Xj1KXOEg2R5L8gIeXS
	ZVETjIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtfo-0000000EUPo-10hv;
	Mon, 20 Oct 2025 17:27:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtfm-0000000EUPK-01e6;
	Mon, 20 Oct 2025 17:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB636487E7;
	Mon, 20 Oct 2025 17:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16131C4CEFE;
	Mon, 20 Oct 2025 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981270;
	bh=5BENNYug8XWdW1sRlDCxLFbkXQ3SRgxDfRFcZP68nU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZWlQqnhOTnejHM2lDjdNx9bZdkaSKeBvuSUWmPDoO75NqyF+zGtpp5J/jCZdFn+V
	 l+qIkc7RYKOHvTP+mG+ckUNd6YwtYMk3hzLl2xkJKrdJ5Wpk2W1fLupLwuFzcwlogH
	 fGCy3mMHMsu2StnL1PMyyVSANO94DUPlppuLCm3BhOQoF/3y/Yu9QSoL9VqudEKhjD
	 ALXMoHKmyAyNrJbqicL3BRsLye9p4bPcIL+kHuDE5PgRe5tztq4yNlettuBpPgZN+Z
	 P89Ndt56vztGV4lgnWD0qqfhgeb8lzYjnK/JKzLm2gJInlI8B3XZuaSSdgGQy5d4Q/
	 25nS6P7VSc/yA==
Date: Mon, 20 Oct 2025 18:27:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com
Subject: Re: [PATCH v3 2/5] dt-bindings: clock, reset: Add support for rv1126b
Message-ID: <20251020-glorify-stalling-784a52342283@spud>
References: <20251020023724.2723372-1-zhangqing@rock-chips.com>
 <20251020023724.2723372-3-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8jPfVFF+LsEAbTxS"
Content-Disposition: inline
In-Reply-To: <20251020023724.2723372-3-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_102754_083767_FEB3FA60 
X-CRM114-Status: GOOD (  16.73  )
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


--8jPfVFF+LsEAbTxS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 10:37:21AM +0800, Elaine Zhang wrote:
> Add clock and reset ID defines for rv1126b.
> Also add documentation for the rv1126b CRU core.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rv1126b-cru.yaml  |  52 +++
>  .../dt-bindings/clock/rockchip,rv1126b-cru.h  | 392 +++++++++++++++++
>  .../dt-bindings/reset/rockchip,rv1126b-cru.h  | 405 ++++++++++++++++++
>  3 files changed, 849 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv11=
26b-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru=
=2Eyaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
> new file mode 100644
> index 000000000000..61bfcde9b16a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rv1126b-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RV1126B Clock and Reset Unit
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The rv1126b clock controller generates the clock and also implements a
> +  reset controller for SoC peripherals.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rv1126b-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: xin24m
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    cru: clock-controller@20000000 {

Drop this label, and then
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

Cheers,
Conor.

--8jPfVFF+LsEAbTxS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPZxEQAKCRB4tDGHoIJi
0kK8APsGDaDaPrNBh1llytFgMG6Li16PklHNduqnpWuyb+OT+AD9HLQrJ1te/veD
OlXvk1cf/bainZQeYTHLjwAfv3PzoQI=
=VlJd
-----END PGP SIGNATURE-----

--8jPfVFF+LsEAbTxS--

