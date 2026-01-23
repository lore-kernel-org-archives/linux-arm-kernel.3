Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBB7D6CFDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 06:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnUiivgV1GJFcmOh4pDO9k/tTrjNiMK55wQcL+7/7RA=; b=Liu7tqmJlviu/Qzm09FEgCZlSZ
	JppBctMNnecK6IMU9de++LFNkgJfQtIO0IP8SVITilmaICD35WNyn8lCLJXqMQiQfwp5Bs6V44bf1
	ll+e4RdpiysqeWNkK/LOiCWUtG/L/RK7vf2TjaYgKfX3ReMi9eimGiyb8vL9g5APexxfBACd16R+S
	asjpwAkwmFmMKo0OSlVLdez+WnPDdB/f54EkvgZUpkZEiyojGvGph9RJ9CX8eWFEle+F8JH82QLPu
	482JG0eBcOpTprqKpWx0T4Cb/SD5BDTWpuJ2zdJ4SFj6eUF3bdXBZAIZuw+FBV0eN+FxczR45wB4M
	YTIh+lvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAk4-00000008IqH-3xDW;
	Fri, 23 Jan 2026 06:34:00 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAk1-00000008IoY-20wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 06:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1769150028;
	bh=hnUiivgV1GJFcmOh4pDO9k/tTrjNiMK55wQcL+7/7RA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W5vjeQeiU0ULdPQtUv9eAf70pYeEokLhFo21iZX0KDC3rHz4fGY+DMK2en6l6RbxT
	 ubNmsduQCSihVOdVHiTEzDdHb9QYkr88QX2j8Y0dsp5YmXJvKLQrl7WwnQw6bNn8fH
	 PrRjnuRiUpgy2WQhq7RlsVHnjb5Gj6ve3pEsB2sL0WEcSghQ9ardd/1JuYPoy0Uy6S
	 81exLyxBAYf1P9Cn3jDbAvZdUypm1nCqymrQniDwLrO25Aq1RzDdM/uDWuLsFnFk0G
	 P5eHOOXOhs8PCx8JHKccE5MSTsY4jKxFAN9y+R3P8g30Ll0zT6R2KNaIH1tCe8NzlQ
	 tGFau5QEV+LXg==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 66DCE7C8E7;
	Fri, 23 Jan 2026 14:33:44 +0800 (AWST)
Message-ID: <459f84c56a5010910ecbf8b445c092674f060691.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/3] Add compatible strings for AST2700 pinctrl to
 the SCU binding.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Linus Walleij
	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, bmc-sw@aspeedtech.com
Date: Fri, 23 Jan 2026 17:03:43 +1030
In-Reply-To: <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
References: <20260120-upstream_pinctrl-v3-0-868fbf8413b5@aspeedtech.com>
	 <20260120-upstream_pinctrl-v3-1-868fbf8413b5@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_223357_746041_56FD6515 
X-CRM114-Status: GOOD (  22.77  )
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

On Tue, 2026-01-20 at 19:43 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances. Each SoC has
> its own pinctrl register block, which needs to be described
> independently in the device tree.
>=20
> Introduce "aspeed,ast2700-soc0-pinctrl" for the SoC0 pinctrl, which
> follows the same usage model as the existing AST2600 pinctrl.
>=20
> The SoC1 pinctrl registers follow a regular and predictable layout,
> which allows describing them using an existing generic pinctrl
> binding without introducing a new SoC-specific compatible string.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
> =C2=A0Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yam=
l b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index da1887d7a8fe..ff6cf8f63cbc 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -87,6 +87,7 @@ patternProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2400-pinctrl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2500-pinctrl
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
- aspeed,ast2600-pinctrl
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - asp=
eed,ast2700-soc0-pinctrl
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 required:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - compatible

So, in addition to Krzysztof's concern about the patch subject, I think
it's worth mulling over some further concerns that we might address
with a clean break for the AST2700. Specifically, whether we can tidy
up historical baggage by exploiting auxiliary bus[0] instead continuing
to pretend the SCU is an simple-mfd.

[0]: https://docs.kernel.org/driver-api/auxiliary_bus.html

The original AST2400 SCU bindings were cooked up in darker times and
have been a regular source of regret (same for the LPC bindings - we
can consider them later). The use of simple-mfd unnecessarily invokes a
bunch of machinery in the driver core to avoid explicit iteration of
subnodes in the driver(s), and causes tension between the need to
specify regs and the typically haphazard register layout of the SCUs.

Related, this entry from "DOs and DON=E2=80=99Ts for designing and writing
Devicetree bindings"[1] stands out:

 * DON=E2=80=99T create nodes just for the sake of instantiating drivers.
   Multi-function devices only need child nodes when the child nodes
   have their own DT resources. A single node can be multiple providers
   (e.g. clocks and resets).

[1]: https://docs.kernel.org/devicetree/bindings/writing-bindings.html#over=
all-design

We have a collection of all sorts of odd-ball bits of functionality,
and all of it can largely be implied by the SCU compatible. Avoiding
specifying things that are implied is also touched on by[2]:

 * DON=E2=80=99T add properties to avoid a specific compatible. DON=E2=80=
=99T add
   properties if they are implied by (deducible from) the compatible.

[2]: https://docs.kernel.org/devicetree/bindings/writing-bindings.html#prop=
erties

So, can we use auxiliary bus instead, and avoid extending the regret in
the devicetree?

Well, the interesting news is that auxiliary bus is already on the way
by way of the AST2700 clock and reset drivers[3].

[3]: https://lore.kernel.org/all/20250917020539.3690324-1-ryan_chen@aspeedt=
ech.com/

A noteworthy observation is the auxiliary bus approach for pinctrl was
already used by (at least) the mobileye eyeq5 platform:

- Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
- arch/mips/boot/dts/mobileye/eyeq5.dtsi
- arch/mips/boot/dts/mobileye/eyeq5-pins.dtsi
- drivers/clk/clk-eyeq.c
- drivers/pinctrl/pinctrl-eyeq5.c

So, we're not inventing anything new here.

Going down this path for pinctrl to fix the SCU situation will require
some rework of what's already merged for the AST2700. However, we've
not yet merged either a DTS or DTSI using the compatibles (and by
extension, aren't using the AST2700 support from the drivers), so I
hope that allows us to do a course-correction without too much
collateral damage.

A possible path forward is to:

 * Move AST2700 definitions out of mfd/aspeed,ast2x00-scu.yaml into one
   of:
    - soc/aspeed/aspeed,ast2700-scu.yaml: Follow the example of
      mobileye,eyeq5-olb?
    - arm/aspeed/aspeed,ast2700-scu.yaml: We already have e.g. the secure
      boot controller documented under arm/aspeed
 * Retain compatible strings but require simple-mfd is not specified
 * Rework AST2700 support introduced in:
    - drivers/irqchip/irq-aspeed-scu-ic.c
    - drivers/soc/aspeed/aspeed-socinfo.c

This is my preference, at least for the moment. The change to make the
SoC0 pinctrl driver compatible with auxiliary bus shouldn't take much
overall. Unwinding the binding situation is a little more involved, but
not too much. I think it just needs consensus on the direction from the
devicetree maintainers.

Andrew

