Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5FBCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=; b=dzONhvBpRtgyOT3w1GCI9WCdzI
	ADOo0gAyzy/ptxz8zKW14xhxnOqAoEbkWaosuAAUJ2mgRudmJPEnu5Qt79rAKCh12R02+IGAyS8D9
	YTOWZmS/FFsbb7qP7OpGfgOSsoZrme8TSam4B1mWLV+YDYf3RH3ulfjnikXBGnMSL8z9gYeSL82Jm
	ZAAMm67nnyx22Ank4mIGVYhtyLkc0oCQ2WUGGUly8qt+loTiMg62r+NhZnIHE5TrVnNvFxuuoLSLh
	WGfomOrAE6xZ/sNglECt/7kkgOunTH+8d8B3xTIx6t3UKt+9HlMvOCXRNfgUwO7vYjcQtfopr+3lJ
	hucve/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfWs-00000001Zn7-0uB2;
	Wed, 06 May 2026 16:55:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfWq-00000001ZmX-1lhw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 16:55:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1209C40C30;
	Wed,  6 May 2026 16:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A299BC2BCB0;
	Wed,  6 May 2026 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086519;
	bh=+q6eX8yap3aX95o5D736mBa/UQIp49KQ5RRhNt+INSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SI63Tth8CtQhXThTfaW+P+Icg3d7+aW7B1qKP8POWXAc5liWzky+u/nckHFsoqJXO
	 LuCosHuBpETK1hNzPDzXv8vAlLXhU5Xt6+rdTZBtUYA09MANu80TTtEiytwKl/0HJ1
	 WRIuDqYY5GYjiJgO/cwz99fBRIdM3N36VbBjKN+wp77DDwpOdICGRHwT78tgAEFwHI
	 215hESx2BlqJnswP+xphk0YlVxt/EabtkMIHgVNSy7HZzTzmjOLMd15KdoHSDOb6+N
	 3EzLYi8XBRAwa2w7jgp+f3nCjKsDx2ycb2u9o0DUHnW8/9wMgp+oOccVa4NtUaniDt
	 gEqMqh02qzeJQ==
Date: Wed, 6 May 2026 17:55:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260506-throwback-cheer-a4fe420281cb@spud>
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
 <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VTJgj70HPTOBEk8v"
Content-Disposition: inline
In-Reply-To: <20260506-upstream_pinctrl-v9-1-0636e22343ad@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_095520_478915_D204ECF6 
X-CRM114-Status: GOOD (  10.46  )
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


--VTJgj70HPTOBEk8v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 04:06:18PM +0800, Billy Tsai wrote:
> Add a device tree binding for the pin controller found in the
> ASPEED AST2700 SoC0.
>=20
> The controller manages various peripheral functions such as eMMC, USB,
> VGA DDC, JTAG, and PCIe root complex signals.
>=20
> Describe the AST2700 SoC0 pin controller using standard pin multiplexing
> and configuration properties.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--VTJgj70HPTOBEk8v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftycgAKCRB4tDGHoIJi
0pvzAQDCNCKCmxnYX47+b38C6ft8fB0xKq3WT2RY8vc+AsD4lAEA+acP/gpGYmZT
W8BeLJDQjk2yIgetqkKZ1Cfz+UYsSQc=
=1DWF
-----END PGP SIGNATURE-----

--VTJgj70HPTOBEk8v--

