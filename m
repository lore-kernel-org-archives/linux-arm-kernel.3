Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7AC606D802
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DES11/OR;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGfRrjyD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FFpmPVuuYr5OY+WPB+hE25pYug3GLunmJUfruqboQtA=; b=DES11/OR4+QN+HYMrckJXxkwIO
	k/YRivQ80IiaOSiA6L5hUwPfWsXZpwmihHKJyAMV8lTN94se1orJFPlwKH5b8+ydyAZQMpBDUSWQZ
	bVzyJk6MOFedtTEgqCeYFSpfwSWuxS5Segn135TkU/VGhgmpLTw2tUy54p0UQ5fi9zL+Qw5a5DQUx
	IHop0zzQE5WH3Pb98040lEpytPsUPiKD5YcSipNsjs+0QLY4qKAbduLPGZGwd4mlIAj72BAJCqm5G
	xYK7F9XKePAOG3ig7xRX2Bv/uxmNIAY4QUuWPpc2FRWA34Efh6j2M0hZGzrGlVxab4zRqKH4RvZvD
	ro9HIBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHdv-0000000C4EE-2WGI;
	Fri, 06 Nov 2026 10:57:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHdt-0000000C4Dy-3YeB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:57:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BAB560224;
	Fri,  6 Nov 2026 10:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023C71F0089F;
	Fri,  6 Nov 2026 10:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962677;
	bh=FFpmPVuuYr5OY+WPB+hE25pYug3GLunmJUfruqboQtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGfRrjyDZiNal+NLyiMYsXj/0YfYKX1XORe4GYP0DOASaNA659T+Ku6IN/L9p153f
	 v0uTNv46ZuVOd5g5ZgvYbvzEuysr6IcJL+OpuZs61kejA+c0op19bG2q5xM+49pDZN
	 znCd2wd4FQU9Mii7ASxLxnre7QxG1IvDgfm6JfNz8dtn38FOBFT2VmA3oQRvJVEmaZ
	 MJDDHzUCydieg/oVmsA4ElsizRUiIsMCWwd2amnJdixxPD2rD8ZpWJ9q5k9hv0ZFJo
	 65+mDIsU4GhFd6j7VRyL6J7WgkSS99WMgCcPcCXDKevfkpgSmJ+XQv8I/Zau1oCBrC
	 e0OtR9rj2o8cg==
Date: Fri, 6 Nov 2026 11:57:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105110715.2486432-3-ada@thorsis.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:06:38PM +0100, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v4:
>     - "re-added" some definitions present in hardware but not used in dt
>     - reword header comment (at91 -> Microchip) for newer SoCs
>     - PMC_UTMI was renamed where appropriate according to datasheets
>     
>     v3:
>     - full splitup for all at91 family SoCs instead of just a few
>     
>     v2:
>     - new patch, not present in v1
> 
>  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>  .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
>  .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
>  include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
>  include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
>  include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
>  .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++

I miss the "split" part. You only added defines, shouldn't you remove
them from other binding?

Best regards,
Krzysztof


