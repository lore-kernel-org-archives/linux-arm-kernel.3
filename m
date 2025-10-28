Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F7DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QL8VsAg1at7SuW5tNZ8SM68KMxfARdF7RwLyGMZNOH0=; b=wYwPuM+LDTv4DReQ2cgDdy3Tax
	tvZ/FwcmTFbhdK0Qs6tpROZY4urKS/6bDqmG0wkAEQepUeHcgWgW6h5xqkJ/wmwYe5smV5pGdzaTt
	BZDXwqDhV2iMtGRe4SIYLqn9AKiuaUELJYfQl6sOcKJmEGEaWQFRRt1bfOXs0n7jBNRiYnBD0Kr06
	crFuMyFKbIVYQEeW3YSr2O/Cik0jE3+IM4seKB1QQEYkYW9jX1CRJyx+plujET9/Z7i6il7Umg48t
	l+AsdkdDljPPQOqHqiYS9MjVeQ0iAo+h6+HOv+eVWL79kndLm+wwlYzYwecWRHREvm0SRD1aNwcHv
	K7eEzGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeR1-0000000FTdV-2hjR;
	Tue, 28 Oct 2025 07:48:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeR0-0000000FTdO-1iqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 07:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E8046027E;
	Tue, 28 Oct 2025 07:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD480C113D0;
	Tue, 28 Oct 2025 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637681;
	bh=KClJh703ruviggVORWywOzunQO6HBuBT/e1jnVpnPXc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=JSp4dhCXz/ltiFCTPO0JZcMRQ0fsKve6CAnHmMlvgGjKIsE9cs2S5JvV5W2MW7nAn
	 82HXAZqM6GUp1+SVIebgExEctwbw5eR8rdTw73RBFVFYfA+vDmsp+U4HqdAgSoU5F/
	 /TKhjJf/vrUuHq96xsIZAhivbBsQ/tgYZuM83LA1aYES/wvftOKN+q0du0hlugp8Sz
	 fa01y6qXoBel8u57qib+5TEcobWqo/i4L+Cz73uiN0CdPftCQZDwWT1lXiIESFogAy
	 6OQvGLFdXKq9D1mZ7L2/12L7C9M+hmgdIEAFAJ83G+sJ30s0jnr9tUhLF61qe4Wa7r
	 a9BW8d4ARqz2g==
Date: Tue, 28 Oct 2025 08:47:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, bmc-sw@aspeedtech.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, jk@codeconstruct.com.au, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de, andriy.shevchenko@linux.intel.com, 
	naresh.solanki@9elements.com, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20251028-ingenious-dazzling-jackdaw-af487d@kuoka>
References: <20251027061240.3427875-1-ryan_chen@aspeedtech.com>
 <20251027061240.3427875-3-ryan_chen@aspeedtech.com>
 <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a2ff5f-2f8e-494b-9652-b93bc243c229@kernel.org>
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

On Mon, Oct 27, 2025 at 08:14:45PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2025 07:12, Ryan Chen wrote:
> > The AST2600 I2C controller supports three transfer modes: byte,
> > buffer, and DMA. To allow board designers and firmware to
> > explicitly select the preferred transfer mode for each controller
> > instance. "aspeed,transfer-mode" to allow device tree to specify
> > the desired transfer method used by each I2C controller instance.
> > 
> > And AST2600 i2c controller have two register mode, one is legacy
> > register layout which is mix controller/target register control
> > together, another is new mode which is separate controller/target
> > register control.
> > 
> 
> This implies your "reg" properties have now completely different meaning
> and this would be quite an ABI break. We discussed this probably 15
> revisions ago. Where did you document the resolution of that discussion?
> 
> >  
> >  unevaluatedProperties: false
> >  
> > @@ -57,10 +85,12 @@ examples:
> >        #address-cells = <1>;
> >        #size-cells = <0>;
> >        compatible = "aspeed,ast2600-i2c-bus";
> > -      reg = <0x40 0x40>;
> > +      reg = <0x80 0x80>, <0xc00 0x20>;
> 
> Not relevant to this patch. You just added this line in patch #1, so did
> you add incorrect code just to fix it right away?
> 
> No, fix your example when creating it.

Heh, and this was not even tested... you have warnings here (see
maintainer soc profiles).

Best regards,
Krzysztof


