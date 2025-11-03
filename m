Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43297CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+El+MDXdmfsNSaC/SCdwjn4AbXykYyugBqpJMifOazM=; b=eKSG3iIqgaluDpmTvE94oUKGr+
	q4F0CsqvGHLixlp8c2OUN4wKbcgWvwJwYzd7muMIAvkN67TofxnUn4uGURsH0xN6ZQxyxfJ9ms9bw
	8UbrN3BfXlvF5mS9aJ+ne5o4WJmfTpC34BQD3ZvUiFg1a6y1Fs+ATg8zHHEQMOS6G7ihWRHm9lASW
	Whl/KTMN21xpNRVF5hL7eZAqE5wSm8pQjimKfLRO0m+HnbxwmenAn5o96gVuyWl3RRZ2j62Kc2wN2
	O/kgaymOnmbrx3K0wUWbNmE1TktH7rkINXYxHw8QvnNmCXxW1HV6ZaHGIz5dlHciHiv0StWy8H3i8
	NuQ2H3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFplF-00000009QG9-1SQF;
	Mon, 03 Nov 2025 08:17:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFplE-00000009QG0-0Nc9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 08:17:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BB3760053;
	Mon,  3 Nov 2025 08:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDA0C4CEE7;
	Mon,  3 Nov 2025 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762157874;
	bh=e4eP8kIUbnxFkpE508lw7JjVKEVh23zzNZi3k04+VEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hPgHPj60n+mdv62mBOJGsVRWqHQ01Gjr7rTSTRIbj0hEjbXQsio7zNnampwXmqVfr
	 Sa91lh+8Xq11c2+0Eob2Mol7XBSQJj7zWPNQ5V/g6F1JDR4dqvCiIP9HT2K+AkNAcL
	 Getpo0YGj7SaTIBeEQrO9vLl8D1dpFVaLA9BHQJwYUBay5ujiO3DOp4ST9WOasWYrR
	 iEe9bbG/vX18ImVYbICTXGNw3rJ2W9y7N7ru3GyHbfFCGaO8tCGT+29JaOtPbGXYKS
	 2Tw6/LfHfQ+08W0UHnbz56r9V02UmWfUDrvk7LicyK7GpLoz5kyMept3/H2CWlbjR9
	 BFmCJrOBptHrg==
Date: Mon, 3 Nov 2025 09:17:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	jk@codeconstruct.com.au, Kevin Chen <kevin_chen@aspeedtech.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v6 1/1] dt-bindings: interrupt-controller:
 aspeed,ast2700: correct #interrupt-cells and interrupts count
Message-ID: <20251103-economic-lime-chupacabra-d7adec@kuoka>
References: <20251030060155.2342604-1-ryan_chen@aspeedtech.com>
 <20251030060155.2342604-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030060155.2342604-2-ryan_chen@aspeedtech.com>
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

On Thu, Oct 30, 2025 at 02:01:55PM +0800, Ryan Chen wrote:
> Update the AST2700 interrupt controller binding to match the actual
> hardware and the irq-aspeed-intc driver behavior.
> 
> - Interrupts:
>   First-level INTC banks request multiple interrupt lines to the root
>   GIC, with a maximum of 10 per bank. Second-level INTC banks request
>   only one interrupt line to their parent INTC-IC. Therefore, set the
>   interrupts property to allow a minimum of 1 and a maximum of 10
>   entries.
> 
> - #interrupt-cells:
>   Set '#interrupt-cells' to <1> since the irq-aspeed-intc.c driver does
>   not support specifying a trigger type; only the interrupt index is used.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../interrupt-controller/aspeed,ast2700-intc.yaml   | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


