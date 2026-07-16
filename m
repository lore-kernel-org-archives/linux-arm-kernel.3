Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86A6C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHZlXDwmnmhNAHsXyKmT3KK/eNJCIlM0UHu2j00CWlo=; b=Vb/fHyGI+Foli5EJLr2KBHMu/2
	iYbC4my/TJlzRLeo310Glo5KOjGnI1B+xzdehAjRJYznfllI7+bBttIwtOp8VvfFeUXhMiD0EXoxk
	qAG5hAKdALjmF8RfQJumtxhDaQy6NxGNfR9wwaGVCZ4SEnOExCl4aZ+jCQklB87sRia1rZbU9K7r5
	zIP78ROA1KKkO1WRoJLDvStf1LwNc26FWNT0Ffa6gogojsxTxCTSIYBewwM1VX51Jg9B018jhxEFi
	N8O03JxXosr7NPXOkXGzfIRfpxLJLCzXX9AI975QVAyE1Tx9WfSQx0WNHeAeXcZDL/LdpV2hgsy1R
	AdZDixSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwr-000000002Wo-25r3;
	Thu, 16 Jul 2026 15:24:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNwq-000000002Ve-0YHY;
	Thu, 16 Jul 2026 15:24:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9992E434F1;
	Thu, 16 Jul 2026 15:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3141F000E9;
	Thu, 16 Jul 2026 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784215467;
	bh=RHZlXDwmnmhNAHsXyKmT3KK/eNJCIlM0UHu2j00CWlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFGj1d40jZB6tW/rv23DOlwJ5g/uU/vVvaS1m2H0Zz2m854PSBpvTzTzUEsCLixjy
	 Gje41ODRwf+hr1UPkAill2j4M1f2GxHE34BrcWCnLgqIbK5ouoWBKRNphFgmZqxc3S
	 4SNTAT4rINmL4L6aBNTmMqJnFpUcQvpo9YLVOd3VqGilSpz83s++aPct0dEuTI9Bwq
	 phwYX+dTTO9tUv44z1SWA1eXsYnUrfh+lgSErFWtMj0fk/BxWpdIV59DRq7YhxR+9t
	 /Gn4CQqFAihfdLlw3ZGoXDUHL7WyhDH3j9bSa3SADRAlEmnF9szPbDxsYen/uQ7c5a
	 HVmKu8lK/qk+Q==
Date: Thu, 16 Jul 2026 16:24:20 +0100
From: Lee Jones <lee@kernel.org>
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
Message-ID: <20260716152420.GA1424265@google.com>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
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

On Thu, 02 Jul 2026, Ronald Claveau via B4 Relay wrote:

> The Khadas VIM4 board features a different MCU variant compared to
> previous VIM boards.
> While it shares the same I2C-based communication model,
> it differs in some ways:
> 
>   - A distinct register map with its own volatile/writeable register set
>   - A fan control with 0–100 levels instead of the 0–3 levels previously
>   - A fan power supply gated through a regulator
> 
> This series adds support for this new variant by:
> 
>   1. Refactoring the khadas-mcu MFD driver to use per-variant data
>      structures (regmap config, cells, fan platform data),
>      and adding the khadas,vim4-mcu compatible string.
> 
>   2. Extending the fan thermal driver to retrieve the fan register
>      and maximum level from platform_data,
>      and to optionally manage a power regulator for the fan supply.
> 
>   3. Adding the corresponding DTS node for the VIM4, wiring the MCU to
>      the I2C AO_A bus and exposing it as a thermal cooling device.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

The MFD parts look okay.

I think the Thermal driver has a dep on us, right?

If so, let me know when you have the Acks and I'll merge it.

-- 
Lee Jones

