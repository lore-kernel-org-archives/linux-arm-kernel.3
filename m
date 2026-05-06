Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1A1CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5DW3jTO9eA2U0B2B7EG/QgJNumeWedc8beO5QJcqXg=; b=NxWd2ZDOGGZ6WJ0/0sjuThlogs
	ITvxHh1y1WUvrGt12AM+q4iqZC3Hasd6j8+ZP39GdDKJtCOTCSysvdoJ5JYV/Vcmyn46KnrANOUOx
	6uJzU0niclyE4bTIQiqLXvpqnwEIwMYvJfnhR1huaXFlbTfetHWtsqyFhcWmjSGSem/yKXusRYrYn
	r9wxP+jk6U8MLrnrNQCKMd1Lkl/qP9qJ9U3JcwW7695AfyXVGmLRB3gdqkXaVjCbFlKa2IoYUNOaF
	I2eFxKWQ/PVPZFKClVQ6KIPA8t9nyT8FsXxYK9jKOt09IpOQ9SV/GqVZobLXAOAPbtHXrnMHfX38l
	yVaieNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR6j-00000000PYs-0mrz;
	Wed, 06 May 2026 01:31:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKR6i-00000000PYj-1dZm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 01:31:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66FD460123;
	Wed,  6 May 2026 01:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7982C2BCB4;
	Wed,  6 May 2026 01:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778031083;
	bh=o2yy2Ww9i8w4gC0U+2YoW4VSEUxmrqIBx+Xo75LoX1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=epU1cA3klIDMZmbe9hL+8MnWKyObxZIooq0sRL5JIKYas2TmzTa13g2/yv9VuZORh
	 XrHPPoRbcsnHfg4TqGwOgeCFlTeURJINvzMu2iCR2/YvAzu/GWB4k3bPYWJlGd57V2
	 4lu5djbXVU+F8w/WNmPawGsGNd3xbnUMQseazanwywzbZGsjjb/lWO/y7aAGXgFO7Y
	 ry+7LBHj2eJf2Dxs0v3HVCA5uzHLHS0ffezdvR08F2//BiYMEAw5ISIBm22osmymHT
	 mdSYe+cipA7QnicXft2QLiHe6IUR2ugzpVw+AmVHdnwVYw3WbNZ3+S2GXaZ+VCzx6I
	 V2dWtoXGE99Rw==
Date: Tue, 5 May 2026 20:31:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <177803108003.262903.4940784340519563848.robh@kernel.org>
References: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
 <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
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


On Tue, 28 Apr 2026 17:49:46 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
> 
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


