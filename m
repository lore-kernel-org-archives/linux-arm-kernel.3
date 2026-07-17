Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C78CC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3q6Bs9DpMXvs1gF+DVcAOn4KatvsHwZbqhDUz12DHs=; b=1ciy+ne5jb5dBZJBWCbisYYHp0
	yOifjbBBQM4QfCaJexgT0SYN8ux8teCjbF5/gJbiK54MgFaAQDj3eyAxCiu9X4/tCbASS9fk9+u9R
	5f0iXXwNP635d0jFORzMJoZIDrVZtiltavQ/7FOFA5yL5empCb9fJC26160u/qT3pJ0w4JyTBZ4f7
	57/UJvfebRdxwfD2sjpjPiMQ2xKW/qj0d1cSVUSugwSdONCFlnLJMkOclQOCR1nvASaFPstc+W6rS
	oxP7m0G6dbK+Qq1UmjYqzyygWcFFjFGbdJ3qqx04OE54MKJ1nlDSy2wCTiBfK5LHK3lY0aSk2PbSK
	OxVKCHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdqg-00000001cZN-03lB;
	Fri, 17 Jul 2026 08:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdqf-00000001cZ2-1UDP;
	Fri, 17 Jul 2026 08:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A95360A63;
	Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F9C1F000E9;
	Fri, 17 Jul 2026 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276588;
	bh=L3q6Bs9DpMXvs1gF+DVcAOn4KatvsHwZbqhDUz12DHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nP7fqNS2qhdOU9S60jIgFGJvoVxsPKaDtrvVxzTE7vlxhfE9KUh9VwwObmEdoNfF6
	 CsPkdv5dRIEhfHWjZ3VZMwZyJd59O77Oe8Kzdtz54s85wGLmAQv2W06d85ajaxz3xp
	 Q47Yu+FwR3qTlHQkqBIrcB9qB517Q70oko8h9QSu0Jtq/O+WI0HpdXL+uwMmvw94wS
	 zNTgi9xlzY9bK3wfa9PCgASMXkjiy9n/BSfsJrZpQ9ikyu+EtMwQdpbS8a3O/AwsaY
	 2HDZ/A5iGpeyK8M2zr/nWjraSqqw+HAuWggNNznHaRChXaAmI4rzYbeabQOv9dR2t0
	 K0EmR1r6jogkQ==
Date: Fri, 17 Jul 2026 10:23:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 04/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Message-ID: <20260717-brawny-hyrax-of-essence-e5eed5@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>
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

On Fri, Jul 17, 2026 at 12:35:40AM +0300, Stefan D=C3=B6singer wrote:
> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are however a few more registers that are
> likely extra dividers for TDM and I2S devices
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


