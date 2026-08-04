Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36CEC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVV9ANkNdZSlIxQxx6G0UrPV7UdyTkbaOPTjRrwl8xo=; b=ybyL3nfk72HEN6wj2qfnTofl0G
	jRC+WALbdUw9G6vVGoPv0JcemVZlh9VHVmDNhOyoIt4UsVnUWpNWJYkfooPpGh6O3lFzGq3MDQTIX
	NUFtIOrBDMAB2mkhY3R5yfKO3Fwr6SC48QkYtlJCQKOPCZ8UflcgxGH4HZ8jVBm3UpZ32NePJ6QCD
	l/uGNBJe/N4pfm3Z1L8Bi3bQPLLGdfRths2t7CDd1Otq5ZQYAIyrgv/CWAh/t4x2QG+OMOK/NyVAF
	tJ9nCUj2VkW+99OFTsODBhgEUusxu139E1ogGFyWCUc4ICudVH+tIrw99Qfn/Nn9P8AbjPAwfl2pJ
	PlOloj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8mk-000000018EB-1MBR;
	Tue, 04 Aug 2026 06:37:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8mj-000000018Dm-0kyf;
	Tue, 04 Aug 2026 06:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34FE060A59;
	Tue,  4 Aug 2026 06:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E77811F000E9;
	Tue,  4 Aug 2026 06:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785825475;
	bh=sVV9ANkNdZSlIxQxx6G0UrPV7UdyTkbaOPTjRrwl8xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jaMly5HTZ3fqszrH4+9Avu8iT9Iu4USutKzAtFZXji71cQ/MKlmxt3iNMousKck4p
	 0St6s/+igXJGmG6faNAYUPY2KnHGQNaTNxvaFz/nsL/yNENZCNy6pH7KrXDNkwPmRr
	 qDfoC9OjF5pZE9wMZrpqXpk6ZHOMhFQplfeL4f3AX3WcJzdX41CxFDp+BCJFydpPpG
	 7o+mt/Rb9Y1kROTR+MJ0oy1e9kAjGKOCWY7Qbk0Om+6ZdlJF6djsB5j9RFbw5R+et8
	 hmQNo4y9OoTRY6/hLF7yux1HlWKKPvtB0ifjGju0YGkdr05SSK7YFCZF/f5ZN4gcgE
	 eNa1VxO8oR8Hw==
Date: Tue, 4 Aug 2026 08:37:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Message-ID: <20260804-tough-reindeer-of-zoology-6ccd59@quoll>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260802-zx29clk-v9-1-d05530d85d28@gmail.com>
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

On Sun, Aug 02, 2026 at 11:33:33PM +0300, Stefan D=C3=B6singer wrote:
> These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
> Clocks go from oscillator -> top -> matrix -> LSP, with a register in
> top controlling most clocks that get passed to matrix and a register in
> matrix controlling all the clocks that get passed to LSP.
>=20
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted). PCLK and WCLK are
> controlled by individual gates. Some devices have a mux and/or a
> divider for their work clock. Some devices, like the GPIO controller,
> only have reset bits and no clocks.
>=20
> The top clock controller is fed by a 26 MHz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel mostly relies on the
> boot ROM to set up PLLs, but one LTE-related PLL is not configured
> on some boards. Therefore my driver contains code to program PLLs. It
> produces identical settings as the boot ROM for the pre-programmed
> frequencies.
>=20
> Not all clocks will have an explicit user in the end. I am defining a
> lot of them simply to shut them off. The boot loader sets up a few of
> the proprietary timers, which will send regular IRQs (although the
> kernel of course doesn't need to listen to them). I don't plan to add a
> driver for the proprietary timer as I see no use for them - the ARM arch
> timer works just fine. I will add a driver for the very similar
> proprietary watchdog though.
>=20
> The clock list in this patch is pretty complete but not exhaustive.
> There are other bits that are enabled, but I couldn't deduce what they
> are controlling by trial and error. Some of them seem to do nothing.
> Others cause an instant hang of the board when disabled. It is quite
> likely that a handful more clocks will be added in the future, but not a
> large number.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> Changes v8->v9:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


