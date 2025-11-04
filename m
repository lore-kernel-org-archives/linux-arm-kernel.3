Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13849CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRFcoekJo9swlwkGnkT39c5X8EhfPaN05ZquRKXWymc=; b=tkxgXPMJm9KJbM+ALezLjZaPlT
	bOZjcO1eMdoIODgjcZBbpGBivGZsxZE1BnonW1AeYP/cbO/ousM6+2fUVCAPjyaT4SVXMFxVdrHmG
	svTme7K8u4jSPgbQUoA1jS09fn0+lSYXXYs+pE+QU2yrwuTlwMX+8AmaJBt/zIAZZXb26XatYuhDl
	bqAt4/JSeIiOmdKsQ5CTC0oIv6sJ6pNbhzHDhS9qnI7yrPrkBnBL0scLNghLxAGzpoW/NCFabADWr
	o/hdLIBNPMCI9QiSGOPSc6uwFI86yu72IkTu4eL8mor2T/igH2JkxWRalttEE/UGJYem8LqFDvrb7
	WLhFdX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKm6-0000000CGgU-03om;
	Tue, 04 Nov 2025 17:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKm2-0000000CGfo-2nvh;
	Tue, 04 Nov 2025 17:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4495D44528;
	Tue,  4 Nov 2025 17:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A87C116B1;
	Tue,  4 Nov 2025 17:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277090;
	bh=+TLOnLbCL5l5MRbrs9lE6WIYNLgYsCpPv21pat0QuSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StnnIrCpIfexi/XSVYxGF69H/0GE6GfX4k0z09VgVzz6spCyoC63cdDjQxX2Et2sC
	 DK12ugrCfT7NjtLoeCgPr68r2E/Ou8XvbluyT+GgSHgZHPAN/5LlEpM6sLarbwJGzA
	 9xFLcoxud8n3NyihCoucL/+JZj+y4ZxeUmVza7LlWQiubpBPS8Jkq7SQMjM4ikKprZ
	 e3Sybkc/3kEd9qnVjnzWcxiBRm6uU4ZgqZL8ds/aeQjp0pueUZtsGhiHPCxvdFLfZX
	 MNfuCVvRVwsHIsJ1u66oicV3hGIAcfRa3XxNCVFfboDEsywLYraCBz2PA02AHmYAWZ
	 PF+Un6+lVAXzA==
Date: Tue, 4 Nov 2025 17:24:45 +0000
From: Conor Dooley <conor@kernel.org>
To: zhangqing <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com, finley.xiao@rock-chips.com
Subject: Re: [PATCH v5 6/7] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251104-nutty-lunchroom-36a5879db0b9@spud>
References: <20251027084147.4148739-1-zhangqing@rock-chips.com>
 <20251027084147.4148739-7-zhangqing@rock-chips.com>
 <20251027-await-wound-0aee2d20e0a3@spud>
 <6ff7370e-0e57-487d-a6d9-05958ab21e98@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GbKegIoFUbmOWI8i"
Content-Disposition: inline
In-Reply-To: <6ff7370e-0e57-487d-a6d9-05958ab21e98@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_092450_747061_ED3D27BB 
X-CRM114-Status: GOOD (  22.98  )
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


--GbKegIoFUbmOWI8i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:48:56AM +0800, zhangqing wrote:
>=20
> =E5=9C=A8 2025/10/28 0:47, Conor Dooley =E5=86=99=E9=81=93:
> > On Mon, Oct 27, 2025 at 04:41:46PM +0800, Elaine Zhang wrote:
> > > From: Finley Xiao<finley.xiao@rock-chips.com>
> > >=20
> > > Add device tree bindings for clock and reset unit on RK3506 SoC.
> > > Add clock and reset IDs for RK3506 SoC.
> > >=20
> > > Signed-off-by: Finley Xiao<finley.xiao@rock-chips.com>
> > > ---
> > >   .../bindings/clock/rockchip,rk3506-cru.yaml   |  51 ++++
> > >   .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 +++++++++++++++=
+++
> > >   .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
> > >   3 files changed, 547 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/clock/rockchip=
,rk3506-cru.yaml
> > >   create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
> > >   create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-=
cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> > > new file mode 100644
> > > index 000000000000..ecb5fa497747
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> > > @@ -0,0 +1,51 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id:http://devicetree.org/schemas/clock/rockchip,rk3506-cru.yaml#
> > > +$schema:http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Rockchip RK3506 Clock and Reset Unit (CRU)
> > > +
> > > +maintainers:
> > > +  - Finley Xiao<finley.xiao@rock-chips.com>
> > > +  - Heiko Stuebner<heiko@sntech.de>
> > > +
> > > +description: |
> > > +  The RK3506 CRU generates the clock and also implements reset for S=
oC
> > > +  peripherals.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: rockchip,rk3506-cru
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#clock-cells":
> > > +    const: 1
> > > +
> > > +  "#reset-cells":
> > > +    const: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > Can you explain somewhere why the input clock is not required?
> > Feels like it really should be required, if it is what the output clocks
> > are generated from, but I can also see why it might be optional either.
> > pw-bot: changes-requested
>=20
> Our default hardware input clock is 24M.
>=20
> =C2=A0Some Socs and hardware input clocks support 24M=E3=80=8124.576M=E3=
=80=8126M. For

Other SoCs get other compatibles, so that is not relevant.

> different input frequencies, there is a need to configure clocks.

That seems like it should be required, because there's always one being
provided.

--GbKegIoFUbmOWI8i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo23QAKCRB4tDGHoIJi
0s2JAQDVZlJVC+3VPu0Seil/rz3PFRN98sMD7cctohGiuYB3fgEAoRehJnbC+mUT
NA+BG6kXfU+6fIkftGl4HWzd5sYovQg=
=3/I5
-----END PGP SIGNATURE-----

--GbKegIoFUbmOWI8i--

