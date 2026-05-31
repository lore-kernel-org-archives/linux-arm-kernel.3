Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE0ECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPJtg0Wcp4MUws70XPBV+NH7akiMREPUrdzBpYNX2Ng=; b=gsu6NXyY7N899QeRYb4Z6SMPmL
	z3LUCnz5h61eLAC6gYxhe4e/9FZveemhMyxEdZ2LpwmONYQdntmECFEC86T9TIwsoKa6tIsyGxPbP
	QDVIh4a2zJHa3nTwgx0Dri1bZfzRhAIH5llOdSHqkjCMw37S9stPGVJgWDDrk3eDXjYMB5hvluJzk
	+rGIA3KI13JQ6IDhk8TuQhyuLgs93docU0t9G88sfep1sTE1hjSqafFj+qA5eco8xezNftQMHvSp5
	2n5R52F8QEwvLfxLQUYW1yWyrsmiYDmWEeNxYN+FvbNYgpOkqDWhaDVXxTtt3GVVR2El5w8lFRJuS
	yNQy55pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfcz-00000009bYj-0K0u;
	Sun, 31 May 2026 12:50:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfcx-00000009bYP-23pI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 12:50:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E85F541872;
	Sun, 31 May 2026 12:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2D31F00893;
	Sun, 31 May 2026 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780231850;
	bh=pPJtg0Wcp4MUws70XPBV+NH7akiMREPUrdzBpYNX2Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wuk+tkTcZYyZ03R1HZ+mwBnVW0r4LzTUs0k5m1n/xZfcaNxykCczgyV/Kfq1OOstP
	 HW/ydjaxNpFY5Z9sNuZuIAB4QdjbyPJqm2rPbDIG/X7FbVgErad7treEKmI6hGZJyr
	 75lSlu34iugMqFA9V190tlZuCPOQ938W8QXi92Lm0TkjXKt41Mow18FusAkFlawGcn
	 7SXIBjNQmxk8M0NXseODwcMFHM5/L4Jr96jEBAcCP3udhTFFxdgOHXKXWqJN1E8wv3
	 ngfz4X7ZfrkmmEed5Edeu3i8hU6Wds+DIrVZ0QvqXBIJXjWIM4xvuhPrwAWDZZAL3V
	 rqsHvpxoe+ZiA==
Date: Sun, 31 May 2026 14:50:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: atmel_ac97c: Convert to DT
 schema
Message-ID: <20260531-uppish-poised-potoo-4fa89b@quoll>
References: <20260530052812.115994-1-manishbaing2789@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530052812.115994-1-manishbaing2789@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_055051_549901_0E306553 
X-CRM114-Status: GOOD (  10.82  )
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

On Sat, May 30, 2026 at 05:28:12AM +0000, Manish Baing wrote:
> +properties:
> +  compatible:
> +    const: atmel,at91sam9263-ac97c
> +
> +  reg:
> +    maxItems: 1
> +    description: Address and length of the register set for the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Should contain the AC97 interrupt.
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: ac97_clk
> +
> +  ac97-gpios:
> +    minItems: 3

This stays...

> +    maxItems: 4

this drop

> +    description: |
> +      AC97 link GPIOs- sync, sdata_out, reset, and optional sdata_in.
> +      The driver primarily uses the reset pin.a

and instead list the items with description.

> +
> +  pinctrl-0: true
> +
> +  pinctrl-names:
> +    const: default

Drop both pinctrl properties, not needed, already core schema provides
them. No need to mention that in commit msg.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


