Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E2DFC9EF5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXuyckBYLtwIY7dFkWyl9sWSGd1W5P+XTpcE5D1/nWs=; b=J1j0KSJKwYALDkvteuE/trOjfx
	AlL4Xj5+yZQVviSbSSmUZ3dFu1V7wrjG7ebgb5gN6vhw2nDcjAKJ0o/6YYRRXbt/sYlQ1x/kXpc4e
	c5r+t41B5++uV7QRN4Kpf9dbfLQpIUGQD1to365bYioupX+XorGqSD9auzfNZ/0pBLXx8wTHy3bna
	7Zz7dgYDtAGVU9xTSdP9sZIdvXRRXQyrYOyoNGRO9rs3L+zbojnuqv9FnXeVNGPx7MroIvnmYqCGu
	DlQF19XUpqXIn8RSiLCMz8/5P3105nFdt+LN/WOGmHEEobIVfBbYNAujXz/cCDXF5vABttZ0vvU6e
	9kGSWXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypAV-000000056xb-3ipB;
	Sat, 07 Mar 2026 10:45:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypAU-000000056xT-0St2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2497A60018;
	Sat,  7 Mar 2026 10:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4530EC19422;
	Sat,  7 Mar 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880356;
	bh=DdRhW/Ebu6ObLgaVXVQOgiAe0HAEyztDCaZQo72MRmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u6nmCR95KNIU0YfUVfVzt1d+1ZQjl5pVhYcgMjKgohKJHpjb9WFjWanAK5qtZ7ZqG
	 JAUCPGRvJuleUn82VWHgAFg25omEtmz2BBpK1AxLe1h7sK6TmygsY7SwES1hREY7YC
	 EhDXMJTNqC7EHd1VfYve4FtCGkvANhJJbYaF6l8e65/eXeklpF/g67ZV795i4Z0N/2
	 /oDO3aDgR3xgB169FQGWRnywm7yMlf3DBOkRlJM+ju3C/aDnbqNPWtdv01onOZOvxM
	 dHmoze+vlwLGbnUOmvZJTs6a2Qa82+xqt6/Wpb03E9M05nfNKe80zePYqQlH2m7TK3
	 TzosQHpKI+YSw==
Date: Sat, 7 Mar 2026 11:45:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 AST2700 SoC0 pinctrl
Message-ID: <20260307-dexterous-resolute-camel-cbae39@quoll>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-upstream_pinctrl-v4-1-ad4e8ab8b489@aspeedtech.com>
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

On Fri, Mar 06, 2026 at 08:40:25PM +0800, Billy Tsai wrote:
> The AST2700 SoC integrates two interconnected SoC instances, each
> managed by its own System Control Unit (SCU).
> 
> Allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU by extending the compatible strings accepted by
> the SCU binding.
> 
> There are no functional changes to the SCU binding beyond permitting
> the AST2700 SoC0 pinctrl compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


