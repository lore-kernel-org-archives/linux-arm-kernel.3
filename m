Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6681076377
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftHoyVmvZnIVA+sb7/p5Y71g5eMx8Lig/YeiQ+8uuTM=; b=k6Jn2ytDrG8GDCoejT98hQBmnU
	i7quptsrZPXI89ZxWbjzz53l3SuYoqs75/rzLSI7i9iDtwp+qXWhygUdQr87KwNg52OBel8Wel8Xt
	sUZS6bVocM/HtkfPVfPetsoM9EZTLItHLorWPnL65DDHi5ABiyEvugNgsAZfNd03zD37FvFVkpAJ7
	M4cf7++iflAJJ7TtNCK7txejIKD3YxF9nnTttshPFMgBDe6JqyKkDSZWi+ZmqaRgCD45caHlUHZmS
	i1aBTTn0fqx+Vt73ebvasEl6S2jExHwAE77HedOA+ISmJjIHLWPIOXwDArMdarA2Cg8P38fBnGyt5
	kXbOIBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pC4-0000000E7S3-48w0;
	Wed, 01 Apr 2026 06:36:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pC3-0000000E7Rl-3DLL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 06:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7AEE60120;
	Wed,  1 Apr 2026 06:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA7CC4CEF7;
	Wed,  1 Apr 2026 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775025406;
	bh=+DFyPkJ1QSfX7H4m+XwGecn09bxaPGHmqQ4ZAuy0BBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WclfYtAfA+jn1T5q2pKAdFGdE/1Z56hq/WPtVIjGLF1grcmjCmdcco2N+sVAvb8zP
	 11+2vjA3wehcpSNIcPibPfNkLImDnpjVozhHCpKjb1N12x1NYrPxFX6gik0brUwBs6
	 ozM8AkmjzU2MrTEXEx5Gzdkpf63/Qkc19d7K2YtrsNXPyzNDcLYd3SCI48+ypDoQ1+
	 sm3PxF7fNJPClSpGQ5sD4jZ+D4pjn4HQ5wYwHB8sa9zAQIPLkmvM2mEBN8QwEZbJHw
	 QVcgh+WUtH7DYHzOEgy9F1rTOznu5Jz4Da3ZrhmFPppNfx2UjUZrfGJr/mb9qEf6ax
	 /gUpVa6CGMt6Q==
Date: Wed, 1 Apr 2026 08:36:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
Message-ID: <20260401-adept-zebra-of-bloom-5bb68b@quoll>
References: <20260331-upstream_pinctrl-v5-0-8994f59ff367@aspeedtech.com>
 <20260331-upstream_pinctrl-v5-2-8994f59ff367@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331-upstream_pinctrl-v5-2-8994f59ff367@aspeedtech.com>
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

On Tue, Mar 31, 2026 at 03:31:17PM +0800, Billy Tsai wrote:
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
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml           | 117 +++++++++++++++++++++
>  1 file changed, 117 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> index a87f31fce019..86d51389689c 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> @@ -46,6 +46,9 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  memory-region: true
> +  memory-region-names: true

Missing constraints. From where did you take such syntax (so I can fix
it)?

Best regards,
Krzysztof


