Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FD4CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icJYeFTllag3ffxTCN1vDadbyqQb3GOCEYSw5I6Hk1s=; b=Bupn9zkoarouvw8UJGq0ywN/Hk
	uVKOhxuYADJwqsbPmf0RhFKrMYMh1jJFyWAGPKWive5DFYFwIfokUQrgtDKyaQNxK4frPmmArXQi+
	t7Uq0n7776w7ibyX1+/d+kPxmobeZn7MXal+xsg0WdGuCRfjAU36r34wqrL8/izXTfmckBW681oCl
	PDHK6n2duFwEoBoA4+cppjBHOwlksDDvCssb0qZxTsdyUPeHyKzI/h4fiSy7VyQVg9jDlE5KM/0UJ
	3RYSYTlBuYAW2MK5VPcNi9M+Nv84Jykc/j454eB0kbsWoRWhTTceujyUutD854w6vwFA7F40ilWgP
	pl28z89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND1R-00000003Ifw-3uDW;
	Wed, 13 May 2026 17:05:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wND1R-00000003IfT-08yN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:05:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 804D960126;
	Wed, 13 May 2026 17:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB7BC19425;
	Wed, 13 May 2026 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778691924;
	bh=B+Lh2COB90j5rStyv1o/M72otL7lieSerd5T2ErAozg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j86+vXxlfjczGFOX+pw2QWVO1pf7gG8Ju7jVRxZImVlHVOOmieIPBv8VtlTlUwy5n
	 gDZpvo7NyLdRH4IErvy6qc+UU5lujjiqdj/vGO0eFEkM63ttPt3OG94BV806Y8/VOu
	 jVNFhKC5UCoNC44JizcJAPLx0nLutrMdbwaRBbIx6zUf8H6J1fcYajOd9DCA5fXXof
	 76ZRDXkzXOJhed34Y6tGycA8tcZCQ4q+76SYASz5PP0MbYM/U5uW76Ta5e3ZU4XKNb
	 A3j11fRn+cVfE12gfrklOiJNfb2lRbNV15GCWecFNWTNcHKXUijb9k58ZkoTRGQ64w
	 F//GpFcw4fqvw==
Date: Wed, 13 May 2026 12:05:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	jk@codeconstruct.com.au, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rayn Chen <rayn_chen@aspeedtech.com>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH RESEND v29 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs properties
Message-ID: <177869192135.1318285.16876434297246564335.robh@kernel.org>
References: <20260513-upstream_i2c-v29-0-fe9926964d55@aspeedtech.com>
 <20260513-upstream_i2c-v29-2-fe9926964d55@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513-upstream_i2c-v29-2-fe9926964d55@aspeedtech.com>
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


On Wed, 13 May 2026 13:32:01 +0800, Ryan Chen wrote:
> Add the aspeed,global-regs phandle to reference the AST2600 global
> registers syscon node, containing the SoC-common I2C register set.
> 
> These properties apply only to the AST2600 binding. Legacy DTs remain
> unchanged.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> Changes in v29:
> - remove aspeed,enable-dma properties.
> 
> Changes in v28:
> - update commit message correspond with aspeed,enable-dma.
> - remove aspeed,transfer-mode and add aspeed,enable-dma property and
>   description.
> - Fix aspeed,enable-dma description to reflect hardware capability rather
>   than software behavior
> 
> Changes in v27:
> - change aspeed,transfer-mode to aspeed,enable-dma.
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,ast2600-i2c.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


