Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98CECD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQbuftW1Dswfh8UjRtvt8jMWgNKtgGpobxc7mm/y8M8=; b=0d9Xdta1aUV1acg5hkvrgqdUfl
	yAEDjIY4HsasjdddUwVoaSrbuM+1vhnKr0z/NIxjbDCpZb749g6SmZEN0QbcPjc4MJWM2egNucKEL
	uHfBMJJ455QrRELcnAClUXoQUDf10/OLEUZE9ZOVnI8XPs63lZATb0epZ2qgq0014xZfXFfYnLaZo
	7sMvXByvcWILaN/iI6jkrHZjycn8fDEDcRegtvRjZccd4MisoFBl0DADnUWfoE8foYkzCSePdL+FG
	0iZRXDAUzjZxOCFgbrc3ANiWzNEoXRBotJIfDp2eVhzhSeuPQelyrCkVZ74BedUKg619vtePNwQ/v
	DaOXmoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi91-00000004rjl-3LnY;
	Wed, 20 May 2026 14:43:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi8z-00000004rhp-2kIc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 14:43:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EF0F40DCC;
	Wed, 20 May 2026 14:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DE61F00893;
	Wed, 20 May 2026 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288212;
	bh=dQbuftW1Dswfh8UjRtvt8jMWgNKtgGpobxc7mm/y8M8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MEYFAo/sifgemFgE3i2c/qG0t36EfY4Vm8VA6haQyEKuAPOKWhwYAvREwF30EcIJ+
	 idMTk38KIuZ7UmRhX+7E4W94DWidnrTjobRmZVjvFtR739eHNPepO0YSa3z7LTCIEs
	 EYg5JEAqiduiOsJ//BLw58uKmr7rOk8ELb4QbsnM3nYDfcdEdnORaid5pl2iBg9uVV
	 vFp1JA07vMb2hpQgqfHIUjpq3C3CZrKTF1zPE0sHjuyaTi9fDOZ/cKT6Aj1lVk37OR
	 Rs8BoDIFlxaSenFjEnsmQcofS8cRMab87wKT/ix8M5OmV/RX4u8tLOeDk/okJc+6C4
	 xuRPeJx8L88/g==
Date: Wed, 20 May 2026 15:43:26 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260520144326.GE2767592@google.com>
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com>
 <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
 <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_074333_717206_03C75A02 
X-CRM114-Status: GOOD (  14.17  )
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

On Mon, 11 May 2026, Linus Walleij wrote:

> On Wed, May 6, 2026 at 10:07 AM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
> 
> > AST2700 consists of two interconnected SoC instances, each with its own
> > System Control Unit (SCU). The SCU0 provides pin control, interrupt
> > controllers, clocks, resets, and address-space mappings for the
> > Secondary and Tertiary Service Processors (SSP and TSP).
> >
> > Describe the SSP/TSP address mappings using the standard
> > memory-region and memory-region-names properties.
> >
> > Disallow legacy child nodes that are not present on AST2700, including
> > p2a-control and smp-memram. The latter is unnecessary as software can
> > access the scratch registers via the SCU syscon.
> >
> > Also allow the AST2700 SoC0 pin controller to be described as a child
> > node of the SCU0, and add an example illustrating the SCU0 layout,
> > including reserved-memory, interrupt controllers, and pinctrl.
> >
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> 
> This is an MFD patch in the middle of a pinctrl series, I think Lee
> should apply this.
> FWIW:
> Acked-by: Linus Walleij <linusw@kernel.org>

Already applied v8.

-- 
Lee Jones

