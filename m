Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27871109C048
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX6Zt92Rl7zamMR40yxS1SAo7vg/tk+fp4b2fvllx30=; b=ZTEHkaDB2aYWGcstUmVIAdnBCh
	exh13yrh5bwyqPVodkgZEuiMmM/wCxOQ/4SCsf2hT23+Zd4GvIqsaJ8fd5gc9G1sor8l7vXknLp6i
	wSvzzcJmgqYAxW5utEJybnZ9bUugNzZ8WTPpULZ+82k8q9i0chSTGBl2mrYwXqhclj/sbJ+/cnCmv
	E7oxNfEzP+saNRQjfyTuEO2th6xsx+kcRLJq71CtIv7xsuaVynZi5cBgK36FY8bK2Td4LHcZYY57e
	8LhaJSY0Ndoj29beEQB3BR1tS31jz+kBAi+wQzw5jH2H2mPc5QrTFScAozxr0Jk1WEuoNEUR+Tpae
	Piq8Q8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RTB-00000003wVb-25Xb;
	Wed, 25 Mar 2026 16:52:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RT8-00000003wVC-3WUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C16744557;
	Wed, 25 Mar 2026 16:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F026DC4CEF7;
	Wed, 25 Mar 2026 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774457554;
	bh=pWOqtv6jmpKLYd9pPWq7muuvSWKqfEOPOAHMJ6IkXEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eANHokosIVd5KD95xp+HQHRfvXeuEHK7Eo6rbRCk32CsXyhlZFVFE2ezxytgD44zU
	 ZjYbNSKo/8j6WtbSSI3hYpj9HcFPD5hrfB/Y9thx8togWdftQf8QN2swMcN+5jdHWl
	 PZiiqM95vlHF3pO+VaVFD2HUUvhksmVKV1AcKQsFftLkZ8RvQQ2FO5ikayoqBf+3OG
	 /LkA3oXJTWAM4YYUJLWe3nCCg7XqPkqfD4nBpNDjw/lV08H7YZHYkgLYtdg3MHBic4
	 OqG/BVzr/uCUsDzNpOUrXND7FnQuVkffbmLkBWeDf/5GhrdHVuwN1gWHBoM4kvKgZE
	 J2shInOqyYJsw==
Date: Wed, 25 Mar 2026 11:52:33 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v27 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
Message-ID: <20260325165233.GA3782899-robh@kernel.org>
References: <20260324-upstream_i2c-v27-0-f19b511c8c28@aspeedtech.com>
 <20260324-upstream_i2c-v27-2-f19b511c8c28@aspeedtech.com>
 <405f6b1b4081ffb379a21bcdb5d2a8e81d2e2e3e.camel@codeconstruct.com.au>
 <TY2PPF5CB9A1BE6F0B9087048F46ABD72A6F249A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY2PPF5CB9A1BE6F0B9087048F46ABD72A6F249A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_095234_902899_E650F58C 
X-CRM114-Status: GOOD (  20.73  )
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

On Wed, Mar 25, 2026 at 08:11:54AM +0000, Ryan Chen wrote:
> Hello Jeremy,
> 	Thanks the review.
> 
> > Subject: Re: [PATCH v27 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add global-regs
> > and transfer-mode properties
> > 
> > Hi Ryan,
> > 
> > > The AST2600 I2C controller supports three transfer modes (byte,
> > > buffer, DMA). Add "aspeed,transfer-mode" so DT can select the
> > > preferred transfer method per controller instance.
> > 
> > This patch does not add an aspeed,transfer-mode property.
> Will update use aspeed,enable-dma

[...]

> > > +  aspeed,enable-dma:
> > > +    type: boolean
> > > +    description: |
> > > +      I2C bus enable dma mode transfer.
> > > +
> > > +      ASPEED ast2600 platform equipped with 16 I2C controllers that
> > > +share a
> > > +      single DMA engine. DTS files can specify the data transfer mode
> > > +to/from
> > > +      the device, either DMA or programmed I/O.
> > 
> > As we had discussed: this does not define the transfer mode, only whether
> > DMA is available to the peripheral.
> > 
> > Why mention the 16 i2c controllers here?
> > 
> > Please keep this description simple and relevant to the specific purpose of the
> > property.
> 
> Will update with following.
> description: Enable DMA for transfers on this I2C bus.

You still don't understand the distinction. It's not enable, but that 
the h/w instance *has* DMA capability or not. It is still up to the OS 
what to do with that information.

Rob

