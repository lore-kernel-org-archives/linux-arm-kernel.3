Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2BBFC9EF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPjCzpZwhzvEIRjxFR+lnnsQkRJjsbFMQyF1ixNeFiI=; b=JTqR503V9WYp0m9Ful2vwhSRWk
	m7X7EyRWMG7S6iVA9whecWXtANei8Ljl/1/+Ovqb7sxxaum0iQa+CTPL9NhS3rSGyNWr//z2zsl2q
	3XMeg2Hl/68DA5kz6gRxdzEFZeGdHiXLLy10+X76FJE6kbZbLDCEJ9nVqAnbZCl6V50Pxn6g0qae0
	axZ0nsXryWuKCST4SbJC2j7ku8fgmG/+PBsGqoweZlsiZnt3df3MPCcU1AueB1kjNPhPxgj2NgHmk
	kTjHPfHB69RErkZ4oAYfUZTqwMxa5+kJeM0iWRGEBCREheqUl9CAXWxf5Xx9AjoJQY81zWnXo/0dv
	ohnKQBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypJp-000000057aJ-2JLB;
	Sat, 07 Mar 2026 10:55:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vypJm-000000057Zo-1flJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:55:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A88014095C;
	Sat,  7 Mar 2026 10:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC4DC19422;
	Sat,  7 Mar 2026 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772880933;
	bh=0owm4mKObWbnUeGHMN4y2SQdPXnXIhv9skTRR518J/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gBwF1jyaAvo+N9jckDoGQIt0wrQcCufpP7DMH9TRanNgHbvOTlB96BFmvXNJL2fQz
	 eTm/ZClYSUzv5tAxOhY1lKB+Wqxr8/XAPSofHt7JHe3VMZs2UTSzqmD+aaLvp9b4TU
	 JwmwqQrBFm1rTXolEfdIeDvaenB8Lo0XGpK8/2doz9If0QCrrityNU9A2wSdM9wbUc
	 SvWF92XmE5YttrtY/S+gGPj5ksxJ+QsPG4Fhp+OHBftrI0nmV0AUHUDnsH8w8lIaZJ
	 WbWdogZaLuawLZ/n7metr92eUMxo4zfwA6lB/LXyaCyCFO1pkzsPHHTuen2Zu0SPe3
	 vUVl6OT8W6B7Q==
Date: Sat, 7 Mar 2026 11:55:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260307-weightless-quirky-spoonbill-dacd89@quoll>
References: <20260306-upstream_pinctrl-v4-0-ad4e8ab8b489@aspeedtech.com>
 <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-upstream_pinctrl-v4-2-ad4e8ab8b489@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_025534_461037_29FAF54A 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 06, 2026 at 08:40:26PM +0800, Billy Tsai wrote:
> +          - USB2BDBP
> +          - USB2BH
> +          - USB2BHBP
> +          - USB3A
> +          - USB3AAP
> +          - USB3ABP
> +          - USB3B
> +          - USB3BAP
> +          - USB3BBP
> +          - VB0
> +          - VB1
> +          - VGADDC
> +
> +required:
> +  - compatible
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +additionalProperties: false

I guess the mess with examples is partially my fault of imprecise
feedback. Rob asked you to add the example to main MFD device, but:
1. maybe he assumed there will be separate binding for parent device?
2. you added it in wrong patch (pinctrl patch changing MFD!),
3. it was also incomplete that time.

The example - if you tested your v3 - was needed to actually validate
and point errors. My bad I asked to drop it.

So now you have a mess - incorrect, non-validated (example-less) and
maybe even incomplete binding.

Please post complete ast2700 SCU binding - what children do you have? If
none of ones mentioned in the binding apply, then why the binding
mentions them? why do you allow p2a if 2700 does not have it? And
smp-ram?

And if 2700 has silicon-id, interrupt controller, pinctrl etc, then why
none of them were present in the example you added?

But more importantly, none of this was actually built tested/checked
against DTS thus I cannot accept it. We are back to basics... post your
COMPLETE DTS somewhere and provide link to it.

Best regards,
Krzysztof


